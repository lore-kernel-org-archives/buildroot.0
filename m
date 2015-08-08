From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:50 -0000
Subject: [Buildroot] [git commit branch/next] zedboard: Switch to U-Boot
	2015.07
Message-ID: <20150808105639.7FD4D81904@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1f640a4e7a42667a88101f6ceb787fbb118a6acf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The U-Boot v2015.07 is required for successful out-of-the-box
build for common Xilinx Zynq boards (including Zedboard).

Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/avnet/zedboard/readme.txt |    4 ++--
 configs/zedboard_defconfig      |    5 ++---
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
