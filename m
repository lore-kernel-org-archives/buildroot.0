From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Jan 2014 15:38:58 +0100
Subject: [Buildroot] [git commit] configs/mpc8315erdb: bump to the latest
	and greatest versions
Message-ID: <20140121144059.5DC099BECE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ff5d6d9a06f1a0964dbab3df75a0a869276d7982
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../{linux-3.12.config => linux-3.13.config}       |   21 +++----------------
 board/freescale/mpc8315erdb/readme.txt             |    2 +-
 configs/freescale_mpc8315erdb_defconfig            |    9 ++++---
 3 files changed, 10 insertions(+), 22 deletions(-)

diff --git a/board/freescale/mpc8315erdb/linux-3.12.config b/board/freescale/mpc8315erdb/linux-3.13.config
similarity index 86%
rename from board/freescale/mpc8315erdb/linux-3.12.config
rename to board/freescale/mpc8315erdb/linux-3.13.config
index 120314c..84d76d1 100644
--- a/board/freescale/mpc8315erdb/linux-3.12.config
+++ b/board/freescale/mpc8315erdb/linux-3.13.config
@@ -1,20 +1,18 @@
-CONFIG_EXPERIMENTAL=y
 CONFIG_SYSVIPC=y
+CONFIG_NO_HZ=y
+CONFIG_HIGH_RES_TIMERS=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_BLK_DEV_INITRD=y
-# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
 CONFIG_EXPERT=y
 # CONFIG_KALLSYMS is not set
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
+CONFIG_PARTITION_ADVANCED=y
 # CONFIG_PPC_CHRP is not set
 # CONFIG_PPC_PMAC is not set
 CONFIG_PPC_83xx=y
 CONFIG_MPC831x_RDB=y
-CONFIG_NO_HZ=y
-CONFIG_HIGH_RES_TIMERS=y
-CONFIG_SPARSE_IRQ=y
 CONFIG_PCI=y
 CONFIG_NET=y
 CONFIG_PACKET=y
@@ -31,7 +29,6 @@ CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 # CONFIG_FW_LOADER is not set
 CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
-CONFIG_MTD_CHAR=y
 CONFIG_MTD_BLOCK=y
 CONFIG_MTD_CFI=y
 CONFIG_MTD_CFI_AMDSTD=y
@@ -52,10 +49,8 @@ CONFIG_MD_LINEAR=y
 CONFIG_MD_RAID0=y
 CONFIG_MD_RAID1=y
 CONFIG_NETDEVICES=y
-CONFIG_NET_ETHERNET=y
-CONFIG_NET_PCI=y
-CONFIG_E100=y
 CONFIG_GIANFAR=y
+CONFIG_E100=y
 # CONFIG_INPUT_MOUSEDEV is not set
 # CONFIG_INPUT_KEYBOARD is not set
 # CONFIG_INPUT_MOUSE is not set
@@ -73,7 +68,6 @@ CONFIG_WATCHDOG=y
 CONFIG_VIDEO_OUTPUT_CONTROL=m
 # CONFIG_USB_HID is not set
 CONFIG_USB=y
-CONFIG_USB_DEVICEFS=y
 CONFIG_USB_MON=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_EHCI_FSL=y
@@ -82,7 +76,6 @@ CONFIG_USB_OHCI_HCD_PPC_OF_BE=y
 CONFIG_USB_UHCI_HCD=y
 CONFIG_USB_STORAGE=y
 CONFIG_USB_GADGET=y
-CONFIG_USB_GADGET_NET2280=y
 CONFIG_USB_ETH=m
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_INTF_DEV_UIE_EMUL=y
@@ -90,18 +83,12 @@ CONFIG_RTC_DRV_DS1307=y
 CONFIG_EXT2_FS=y
 CONFIG_EXT3_FS=y
 # CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
-CONFIG_INOTIFY=y
 CONFIG_PROC_KCORE=y
 CONFIG_TMPFS=y
 CONFIG_JFFS2_FS=y
 CONFIG_NFS_FS=y
-CONFIG_NFS_V3=y
 CONFIG_NFS_V4=y
 CONFIG_ROOT_NFS=y
-CONFIG_PARTITION_ADVANCED=y
-CONFIG_DEBUG_KERNEL=y
 CONFIG_DETECT_HUNG_TASK=y
-# CONFIG_RCU_CPU_STALL_DETECTOR is not set
-CONFIG_SYSCTL_SYSCALL_CHECK=y
 CONFIG_CRYPTO_PCBC=m
 # CONFIG_CRYPTO_ANSI_CPRNG is not set
diff --git a/board/freescale/mpc8315erdb/readme.txt b/board/freescale/mpc8315erdb/readme.txt
index ed70795..2a4ee7b 100644
--- a/board/freescale/mpc8315erdb/readme.txt
+++ b/board/freescale/mpc8315erdb/readme.txt
@@ -6,7 +6,7 @@ It won't work for NOR and will brick that bootloader!
 Also don't go playing around with different U-boot versions or flash targets
 unless you've got the necessary hardware and/or know-how to unbrick your kit.
 
-2013.10 is known good for NAND.
+2014.01 is known good for NAND.
 ******************** WARNING ********************
 
 You'll need to program the files created by buildroot into the flash.
diff --git a/configs/freescale_mpc8315erdb_defconfig b/configs/freescale_mpc8315erdb_defconfig
index 11e64db..0b4979f 100644
--- a/configs/freescale_mpc8315erdb_defconfig
+++ b/configs/freescale_mpc8315erdb_defconfig
@@ -12,14 +12,14 @@ BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER=y
 
 # Lock headers version to match and avoid breakage
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.12"
+BR2_DEFAULT_KERNEL_VERSION="3.13"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.13"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/freescale/mpc8315erdb/linux-3.12.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/freescale/mpc8315erdb/linux-3.13.config"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="mpc8315erdb"
@@ -32,4 +32,5 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="MPC8315ERDB_NAND"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2013.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2014.01"
+BR2_TARGET_UBOOT_FORMAT_NAND_BIN=y
