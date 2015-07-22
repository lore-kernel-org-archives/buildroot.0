From: Jan Viktorin <viktorin@rehivetech.com>
Date: Wed, 22 Jul 2015 12:23:53 +0200
Subject: [Buildroot] [PATCH v1] zedboard: Switch to U-Boot 2015.07
Message-ID: <20150722122353.11c933fc@pcviktorin.fit.vutbr.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The U-Boot v2015.07 is required for successful out-of-the-box
build for common Xilinx Zynq boards (including Zedboard).

Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>
---
 board/avnet/zedboard/readme.txt | 4 ++--
 configs/zedboard_defconfig      | 5 ++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/board/avnet/zedboard/readme.txt b/board/avnet/zedboard/readme.txt
index e0ce024..0f72d0d 100644
--- a/board/avnet/zedboard/readme.txt
+++ b/board/avnet/zedboard/readme.txt
@@ -15,14 +15,14 @@ Steps to create a working system for Zedboard:
 
 The expected output:
 
- U-Boot SPL 2015.07-rc2 (Jun 18 2015 - 16:42:58)
+ U-Boot SPL 2015.07 (Jul 22 2015 - 12:01:55)
  mmc boot
  reading system.dtb
  spl_load_image_fat_os: error reading image system.dtb, err - -1
  reading u-boot-dtb.img
  reading u-boot-dtb.img
 
- U-Boot 2015.07-rc2 (Jun 18 2015 - 16:42:58 +0200)
+ U-Boot 2015.07 (Jul 22 2015 - 12:01:55 +0200)
 
  Model: Zynq ZED Board
  I2C:   ready
diff --git a/configs/zedboard_defconfig b/configs/zedboard_defconfig
index 99720db..761e32f 100644
--- a/configs/zedboard_defconfig
+++ b/configs/zedboard_defconfig
@@ -18,9 +18,8 @@ BR2_TARGET_ROOTFS_CPIO_GZIP=y
 BR2_TARGET_ROOTFS_CPIO_UIMAGE=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="zynq_zed"
-BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.denx.de/u-boot.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="v2015.07-rc2"
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2015.07"
 BR2_TARGET_UBOOT_PATCH="$(TOPDIR)/board/avnet/zedboard/uboot"
 BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
 BR2_TARGET_UBOOT_SPL=y
-- 
2.4.5
