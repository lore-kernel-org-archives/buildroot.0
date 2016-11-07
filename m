From: Francois Perrad <fperrad@gmail.com>
Date: Tue,  8 Nov 2016 00:09:35 +0100
Subject: [Buildroot] [PATCH next 1/2] olimex_imx233_olinuxino: bump version
Message-ID: <1478560176-29807-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../imx233_olinuxino/genimage-imx233_olinuxino.cfg |   1 +
 board/olimex/imx233_olinuxino/linux-3.18.config    | 152 ---------------------
 board/olimex/imx233_olinuxino/post-image.sh        |   3 -
 configs/olimex_imx233_olinuxino_defconfig          |  16 ++-
 4 files changed, 10 insertions(+), 162 deletions(-)
 delete mode 100644 board/olimex/imx233_olinuxino/linux-3.18.config

diff --git a/board/olimex/imx233_olinuxino/genimage-imx233_olinuxino.cfg b/board/olimex/imx233_olinuxino/genimage-imx233_olinuxino.cfg
index 78979dc..751fe86 100644
--- a/board/olimex/imx233_olinuxino/genimage-imx233_olinuxino.cfg
+++ b/board/olimex/imx233_olinuxino/genimage-imx233_olinuxino.cfg
@@ -1,6 +1,7 @@
 image kernel.vfat {
   vfat {
     files = {
+      "imx23-olinuxino.dtb",
       "uImage"
     }
   }
diff --git a/board/olimex/imx233_olinuxino/linux-3.18.config b/board/olimex/imx233_olinuxino/linux-3.18.config
deleted file mode 100644
index d46d4d5..0000000
--- a/board/olimex/imx233_olinuxino/linux-3.18.config
+++ /dev/null
@@ -1,152 +0,0 @@
-CONFIG_SYSVIPC=y
-CONFIG_NO_HZ=y
-CONFIG_HIGH_RES_TIMERS=y
-CONFIG_PERF_EVENTS=y
-# CONFIG_COMPAT_BRK is not set
-CONFIG_MODULES=y
-CONFIG_MODULE_FORCE_LOAD=y
-CONFIG_MODULE_UNLOAD=y
-CONFIG_MODULE_FORCE_UNLOAD=y
-CONFIG_MODVERSIONS=y
-CONFIG_BLK_DEV_INTEGRITY=y
-# CONFIG_ARCH_MULTI_V7 is not set
-CONFIG_ARCH_MXS=y
-# CONFIG_ARM_THUMB is not set
-CONFIG_PREEMPT_VOLUNTARY=y
-CONFIG_AEABI=y
-CONFIG_ARM_APPENDED_DTB=y
-CONFIG_ARM_ATAG_DTB_COMPAT=y
-CONFIG_CMDLINE="console=ttyAMA0,115200 root=/dev/mmcblk0p2 rw rootwait"
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-CONFIG_IP_PNP=y
-CONFIG_IP_PNP_DHCP=y
-CONFIG_SYN_COOKIES=y
-CONFIG_CFG80211=y
-CONFIG_CFG80211_WEXT=y
-CONFIG_MAC80211=y
-CONFIG_DEVTMPFS=y
-CONFIG_DEVTMPFS_MOUNT=y
-# CONFIG_FIRMWARE_IN_KERNEL is not set
-CONFIG_MTD=y
-CONFIG_MTD_CMDLINE_PARTS=y
-CONFIG_MTD_BLOCK=y
-CONFIG_MTD_DATAFLASH=y
-CONFIG_MTD_SST25L=y
-CONFIG_MTD_NAND=y
-CONFIG_MTD_NAND_GPMI_NAND=y
-CONFIG_MTD_UBI=y
-# CONFIG_BLK_DEV is not set
-CONFIG_EEPROM_AT24=y
-CONFIG_EEPROM_93CX6=y
-CONFIG_SCSI=y
-CONFIG_BLK_DEV_SD=y
-CONFIG_NETDEVICES=y
-# CONFIG_ETHERNET is not set
-CONFIG_USB_USBNET=y
-CONFIG_USB_NET_SMSC95XX=y
-CONFIG_RTL8187=m
-CONFIG_ATH_CARDS=m
-CONFIG_ATH9K_HTC=m
-CONFIG_RT2X00=m
-CONFIG_RT73USB=m
-CONFIG_RT2800USB=m
-CONFIG_RT2800USB_RT53XX=y
-CONFIG_RT2800USB_RT55XX=y
-CONFIG_RT2800USB_UNKNOWN=y
-CONFIG_RTL_CARDS=m
-CONFIG_RTL8192CU=m
-# CONFIG_RTLWIFI_DEBUG is not set
-CONFIG_ZD1211RW=m
-# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
-CONFIG_INPUT_EVDEV=y
-# CONFIG_INPUT_KEYBOARD is not set
-# CONFIG_INPUT_MOUSE is not set
-# CONFIG_SERIO is not set
-CONFIG_DEVPTS_MULTIPLE_INSTANCES=y
-# CONFIG_LEGACY_PTYS is not set
-# CONFIG_DEVKMEM is not set
-CONFIG_SERIAL_AMBA_PL011=y
-CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
-CONFIG_SERIAL_MXS_AUART=y
-# CONFIG_HW_RANDOM is not set
-CONFIG_I2C=y
-# CONFIG_I2C_COMPAT is not set
-CONFIG_I2C_CHARDEV=y
-CONFIG_I2C_MXS=y
-CONFIG_SPI=y
-CONFIG_SPI_GPIO=m
-CONFIG_SPI_MXS=y
-CONFIG_PTP_1588_CLOCK=y
-CONFIG_GPIO_SYSFS=y
-# CONFIG_HWMON is not set
-CONFIG_WATCHDOG=y
-CONFIG_STMP3XXX_RTC_WATCHDOG=y
-CONFIG_REGULATOR=y
-CONFIG_REGULATOR_FIXED_VOLTAGE=y
-CONFIG_FB=y
-CONFIG_FB_MXS=y
-CONFIG_BACKLIGHT_LCD_SUPPORT=y
-CONFIG_LCD_CLASS_DEVICE=y
-CONFIG_BACKLIGHT_CLASS_DEVICE=y
-CONFIG_BACKLIGHT_PWM=y
-CONFIG_FRAMEBUFFER_CONSOLE=y
-CONFIG_LOGO=y
-CONFIG_SOUND=y
-CONFIG_SND=y
-CONFIG_SND_HRTIMER=y
-# CONFIG_SND_SUPPORT_OLD_API is not set
-# CONFIG_SND_VERBOSE_PROCFS is not set
-# CONFIG_SND_DRIVERS is not set
-# CONFIG_SND_ARM is not set
-# CONFIG_SND_SPI is not set
-# CONFIG_SND_USB is not set
-CONFIG_SND_SOC=y
-CONFIG_USB=y
-CONFIG_USB_EHCI_HCD=y
-CONFIG_USB_STORAGE=y
-CONFIG_USB_CHIPIDEA=y
-CONFIG_USB_CHIPIDEA_HOST=y
-CONFIG_USB_MXS_PHY=y
-CONFIG_MMC=y
-CONFIG_MMC_MXS=y
-CONFIG_LEDS_CLASS=y
-CONFIG_LEDS_GPIO=y
-CONFIG_LEDS_TRIGGER_TIMER=y
-CONFIG_LEDS_TRIGGER_ONESHOT=y
-CONFIG_LEDS_TRIGGER_HEARTBEAT=y
-CONFIG_LEDS_TRIGGER_BACKLIGHT=y
-CONFIG_LEDS_TRIGGER_GPIO=y
-CONFIG_LEDS_TRIGGER_DEFAULT_ON=y
-CONFIG_RTC_CLASS=y
-CONFIG_RTC_DRV_STMP=y
-CONFIG_DMADEVICES=y
-CONFIG_MXS_DMA=y
-CONFIG_STAGING=y
-CONFIG_MXS_LRADC=y
-CONFIG_IIO=y
-CONFIG_IIO_SYSFS_TRIGGER=y
-CONFIG_PWM=y
-CONFIG_PWM_MXS=y
-CONFIG_EXT4_FS=y
-CONFIG_TMPFS=y
-CONFIG_TMPFS_POSIX_ACL=y
-# CONFIG_MISC_FILESYSTEMS is not set
-# CONFIG_NETWORK_FILESYSTEMS is not set
-CONFIG_PRINTK_TIME=y
-CONFIG_FRAME_WARN=2048
-CONFIG_UNUSED_SYMBOLS=y
-CONFIG_DEBUG_FS=y
-CONFIG_STRICT_DEVMEM=y
-CONFIG_DEBUG_USER=y
-CONFIG_KEYS=y
-CONFIG_CRYPTO_DEFLATE=y
-CONFIG_CRYPTO_LZO=y
-# CONFIG_CRYPTO_ANSI_CPRNG is not set
-CONFIG_CRYPTO_DEV_MXS_DCP=y
-CONFIG_CRC_CCITT=y
-CONFIG_CRC_ITU_T=y
-CONFIG_CRC7=m
-CONFIG_FONTS=y
diff --git a/board/olimex/imx233_olinuxino/post-image.sh b/board/olimex/imx233_olinuxino/post-image.sh
index 703cbe7..948d770 100755
--- a/board/olimex/imx233_olinuxino/post-image.sh
+++ b/board/olimex/imx233_olinuxino/post-image.sh
@@ -5,9 +5,6 @@ BOARD_NAME="$(basename ${BOARD_DIR})"
 GENIMAGE_CFG="${BOARD_DIR}/genimage-${BOARD_NAME}.cfg"
 GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
 
-# Create symlink to "rename" kernel image
-ln -sf uImage.imx23-olinuxino ${BINARIES_DIR}/uImage
-
 rm -rf "${GENIMAGE_TMP}"
 
 genimage                           \
diff --git a/configs/olimex_imx233_olinuxino_defconfig b/configs/olimex_imx233_olinuxino_defconfig
index f74f422..e0a7b08 100644
--- a/configs/olimex_imx233_olinuxino_defconfig
+++ b/configs/olimex_imx233_olinuxino_defconfig
@@ -2,6 +2,9 @@
 BR2_arm=y
 BR2_arm926t=y
 
+# Linux headers same as kernel, a 4.8 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
+
 # System
 BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 
@@ -9,15 +12,14 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 
 # Kernel
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18.2"
-BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/olimex/imx233_olinuxino/linux-3.18.config"
-BR2_LINUX_KERNEL_APPENDED_UIMAGE=y
-BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x42000000"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.6"
+BR2_LINUX_KERNEL_DEFCONFIG="mxs"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx23-olinuxino"
+BR2_LINUX_KERNEL_UIMAGE=y
+BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x42000000"
 
 # Firmware for WiFi
 BR2_PACKAGE_LINUX_FIRMWARE=y
@@ -36,7 +38,7 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.09.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="mx23_olinuxino"
 BR2_TARGET_UBOOT_FORMAT_SD=y
  
-- 
2.7.4
