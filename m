From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  6 Jan 2015 14:49:33 -0300
Subject: [Buildroot] [PATCH] configs/mpc8315erdb: bump to the latest and
	greatest versions
Message-ID: <1420566573-25805-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../mpc8315erdb/{linux-3.13.config => linux-3.18.config}       |  2 --
 board/freescale/mpc8315erdb/readme.txt                         |  2 +-
 configs/freescale_mpc8315erdb_defconfig                        | 10 +++++-----
 3 files changed, 6 insertions(+), 8 deletions(-)
 rename board/freescale/mpc8315erdb/{linux-3.13.config => linux-3.18.config} (97%)

diff --git a/board/freescale/mpc8315erdb/linux-3.13.config b/board/freescale/mpc8315erdb/linux-3.18.config
similarity index 97%
rename from board/freescale/mpc8315erdb/linux-3.13.config
rename to board/freescale/mpc8315erdb/linux-3.18.config
index 84d76d1..a994706 100644
--- a/board/freescale/mpc8315erdb/linux-3.13.config
+++ b/board/freescale/mpc8315erdb/linux-3.18.config
@@ -35,7 +35,6 @@ CONFIG_MTD_CFI_AMDSTD=y
 CONFIG_MTD_PHYSMAP_OF=y
 CONFIG_MTD_NAND=y
 CONFIG_MTD_NAND_FSL_ELBC=y
-CONFIG_PROC_DEVICETREE=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
 CONFIG_BLK_DEV_RAM_SIZE=32768
@@ -65,7 +64,6 @@ CONFIG_I2C_MPC=y
 CONFIG_SPI=y
 CONFIG_SPI_BITBANG=y
 CONFIG_WATCHDOG=y
-CONFIG_VIDEO_OUTPUT_CONTROL=m
 # CONFIG_USB_HID is not set
 CONFIG_USB=y
 CONFIG_USB_MON=y
diff --git a/board/freescale/mpc8315erdb/readme.txt b/board/freescale/mpc8315erdb/readme.txt
index 2a4ee7b..446bd39 100644
--- a/board/freescale/mpc8315erdb/readme.txt
+++ b/board/freescale/mpc8315erdb/readme.txt
@@ -6,7 +6,7 @@ It won't work for NOR and will brick that bootloader!
 Also don't go playing around with different U-boot versions or flash targets
 unless you've got the necessary hardware and/or know-how to unbrick your kit.
 
-2014.01 is known good for NAND.
+2014.04 is known good for NAND.
 ******************** WARNING ********************
 
 You'll need to program the files created by buildroot into the flash.
diff --git a/configs/freescale_mpc8315erdb_defconfig b/configs/freescale_mpc8315erdb_defconfig
index 3cc5c5a..85417e5 100644
--- a/configs/freescale_mpc8315erdb_defconfig
+++ b/configs/freescale_mpc8315erdb_defconfig
@@ -12,15 +12,15 @@ BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER=y
 
 # Lock headers version to match and avoid breakage
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.13.6"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_13=y
+BR2_DEFAULT_KERNEL_VERSION="3.18.1"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.13.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/freescale/mpc8315erdb/linux-3.13.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/freescale/mpc8315erdb/linux-3.18.config"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="mpc8315erdb"
@@ -33,5 +33,5 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="MPC8315ERDB_NAND"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2014.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2014.04"
 BR2_TARGET_UBOOT_FORMAT_NAND_BIN=y
-- 
2.0.5
