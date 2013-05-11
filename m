From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 11 May 2013 22:34:32 +0200
Subject: [Buildroot] [git commit] configs: add defconfig for Atmel
	AT91SAM9260-EK Nand Flash Boot
Message-ID: <20130511203549.D1D999A0BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=31002cb40323dcc2aa7b6a50b85e5a3c24b2a5d6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a configuration that provides a basic setup for generating
bootable nandflash images:
- at91bootstrap
- barebox
- kernel
- rootfs

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 board/atmel/at91sam9260ek/linux-3.9.config |   98 ++++++++++++++++++++++++++++
 configs/at91sam9260eknf_defconfig          |   32 +++++++++
 2 files changed, 130 insertions(+), 0 deletions(-)

diff --git a/board/atmel/at91sam9260ek/linux-3.9.config b/board/atmel/at91sam9260ek/linux-3.9.config
new file mode 100644
index 0000000..48dc656
--- /dev/null
+++ b/board/atmel/at91sam9260ek/linux-3.9.config
@@ -0,0 +1,98 @@
+CONFIG_EXPERIMENTAL=y
+# CONFIG_LOCALVERSION_AUTO is not set
+CONFIG_KERNEL_LZO=y
+# CONFIG_SWAP is not set
+CONFIG_SYSVIPC=y
+CONFIG_LOG_BUF_SHIFT=14
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_SLAB=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+# CONFIG_BLK_DEV_BSG is not set
+# CONFIG_IOSCHED_DEADLINE is not set
+# CONFIG_IOSCHED_CFQ is not set
+CONFIG_ARCH_AT91=y
+CONFIG_ARCH_AT91SAM9260=y
+CONFIG_ARCH_AT91SAM9260_SAM9XE=y
+CONFIG_MACH_AT91SAM9260EK=y
+CONFIG_MACH_CAM60=y
+CONFIG_MACH_SAM9_L9260=y
+CONFIG_MACH_AFEB9260=y
+CONFIG_MACH_USB_A9260=y
+CONFIG_MACH_QIL_A9260=y
+CONFIG_MACH_CPU9260=y
+CONFIG_MACH_FLEXIBITY=y
+CONFIG_MACH_SNAPPER_9260=y
+CONFIG_MACH_AT91SAM_DT=y
+CONFIG_AT91_PROGRAMMABLE_CLOCKS=y
+# CONFIG_ARM_THUMB is not set
+CONFIG_ZBOOT_ROM_TEXT=0x0
+CONFIG_ZBOOT_ROM_BSS=0x0
+CONFIG_ARM_APPENDED_DTB=y
+CONFIG_ARM_ATAG_DTB_COMPAT=y
+CONFIG_CMDLINE="mem=64M console=ttyS0,115200 initrd=0x21100000,3145728 root=/dev/ram0 rw"
+CONFIG_FPE_NWFPE=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_IP_PNP=y
+CONFIG_IP_PNP_BOOTP=y
+# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
+# CONFIG_INET_XFRM_MODE_TUNNEL is not set
+# CONFIG_INET_XFRM_MODE_BEET is not set
+# CONFIG_INET_LRO is not set
+# CONFIG_IPV6 is not set
+CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
+CONFIG_MTD=y
+CONFIG_MTD_CMDLINE_PARTS=y
+CONFIG_MTD_NAND=y
+CONFIG_MTD_NAND_ATMEL=y
+CONFIG_MTD_UBI=y
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_RAM_SIZE=8192
+CONFIG_SCSI=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_SCSI_MULTI_LUN=y
+CONFIG_NETDEVICES=y
+CONFIG_MII=y
+CONFIG_MACB=y
+# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
+# CONFIG_INPUT_KEYBOARD is not set
+# CONFIG_INPUT_MOUSE is not set
+# CONFIG_SERIO is not set
+CONFIG_SERIAL_ATMEL=y
+CONFIG_SERIAL_ATMEL_CONSOLE=y
+# CONFIG_HW_RANDOM is not set
+CONFIG_I2C=y
+CONFIG_I2C_CHARDEV=y
+CONFIG_I2C_GPIO=y
+# CONFIG_HWMON is not set
+CONFIG_WATCHDOG=y
+CONFIG_WATCHDOG_NOWAYOUT=y
+CONFIG_AT91SAM9X_WATCHDOG=y
+# CONFIG_USB_HID is not set
+CONFIG_USB=y
+CONFIG_USB_DEVICEFS=y
+CONFIG_USB_MON=y
+CONFIG_USB_OHCI_HCD=y
+CONFIG_USB_STORAGE=y
+CONFIG_USB_STORAGE_DEBUG=y
+CONFIG_USB_GADGET=y
+CONFIG_USB_ZERO=m
+CONFIG_USB_GADGETFS=m
+CONFIG_USB_MASS_STORAGE=m
+CONFIG_USB_G_SERIAL=m
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_AT91SAM9=y
+CONFIG_EXT2_FS=y
+CONFIG_VFAT_FS=y
+CONFIG_TMPFS=y
+CONFIG_UBIFS_FS=y
+CONFIG_CRAMFS=y
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_CODEPAGE_850=y
+CONFIG_NLS_ISO8859_1=y
+CONFIG_DEBUG_KERNEL=y
+CONFIG_DEBUG_USER=y
+CONFIG_DEBUG_LL=y
diff --git a/configs/at91sam9260eknf_defconfig b/configs/at91sam9260eknf_defconfig
new file mode 100644
index 0000000..895add1
--- /dev/null
+++ b/configs/at91sam9260eknf_defconfig
@@ -0,0 +1,32 @@
+# Architecture
+BR2_arm=y
+BR2_arm926t=y
+
+# Toolchain
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="3.9.1"
+
+# System
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y
+
+# Packages
+BR2_PACKAGE_HOST_SAM_BA=y
+
+# Filesystem
+BR2_TARGET_ROOTFS_UBIFS=y
+BR2_TARGET_ROOTFS_UBI=y
+
+# Bootloaders
+BR2_TARGET_AT91BOOTSTRAP=y
+BR2_TARGET_AT91BOOTSTRAP_BOARD="at91sam9260ek"
+BR2_TARGET_AT91BOOTSTRAP_NANDFLASH=y
+BR2_TARGET_BAREBOX=y
+BR2_TARGET_BAREBOX_BOARD_DEFCONFIG="at91sam9260ek"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.9.1"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/atmel/at91sam9260ek/linux-3.9.config"
+BR2_LINUX_KERNEL_ZIMAGE=y
