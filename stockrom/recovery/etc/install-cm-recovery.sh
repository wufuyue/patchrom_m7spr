#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 10600448 9c17a3212ddf2c34a522acac999447a80c797781 6279168 66e6e6acce61e5c0c925a0b2fa73b70aedddcb5e
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:10600448:9c17a3212ddf2c34a522acac999447a80c797781; then
  log -t recovery "Installing new recovery image"
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:6279168:66e6e6acce61e5c0c925a0b2fa73b70aedddcb5e EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery 9c17a3212ddf2c34a522acac999447a80c797781 10600448 66e6e6acce61e5c0c925a0b2fa73b70aedddcb5e:/system/recovery-from-boot.p
else
  log -t recovery "Recovery image already installed"
fi
