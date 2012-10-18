From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 18 Oct 2012 23:20:26 +0200
Subject: [Buildroot] [git commit] beaglebone_defconfig: use mainline u-boot
Message-ID: <20121019125511.D2E8E99841@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=177444c2e0ba4da70f00d7cd20194a6606b5d637
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Board is now supported in mainline.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ....h-Specify-ext2-and-ro-for-booting-rootfs.patch |   31 --------------------
 configs/beaglebone_defconfig                       |    5 +--
 2 files changed, 1 insertions(+), 35 deletions(-)

diff --git a/board/beaglebone/uboot-v2011.09_AM335xPSP_04.06.00.06-0001-am335x_evm.h-Specify-ext2-and-ro-for-booting-rootfs.patch b/board/beaglebone/uboot-v2011.09_AM335xPSP_04.06.00.06-0001-am335x_evm.h-Specify-ext2-and-ro-for-booting-rootfs.patch
deleted file mode 100644
index dfbccf5..0000000
--- a/board/beaglebone/uboot-v2011.09_AM335xPSP_04.06.00.06-0001-am335x_evm.h-Specify-ext2-and-ro-for-booting-rootfs.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From c8aae8c96494132759319b0eab6cd2a51d1d4889 Mon Sep 17 00:00:00 2001
-From: Frank Hunleth <fhunleth@troodon-software.com>
-Date: Tue, 6 Mar 2012 07:20:26 -0800
-Subject: [PATCH] am335x_evm.h: Specify ext2 and ro for booting rootfs
-
-Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
----
- include/configs/am335x_evm.h |    4 ++--
- 1 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/include/configs/am335x_evm.h b/include/configs/am335x_evm.h
-index e0ac494..b45c306 100755
---- a/include/configs/am335x_evm.h
-+++ b/include/configs/am335x_evm.h
-@@ -53,11 +53,11 @@
- 	"script_addr=0x81900000\0" \
- 	"console=ttyO0,115200n8\0" \
- 	"mmc_dev=0\0" \
--	"mmc_root=/dev/mmcblk0p2 rw\0" \
-+	"mmc_root=/dev/mmcblk0p2 ro\0" \
- 	"nand_root=ubi0:rootfs rw ubi.mtd=7,2048\0" \
- 	"spi_root=/dev/mtdblock4 rw\0" \
- 	"nor_root=/dev/mtdblock3 rw\0" \
--	"mmc_root_fs_type=ext3 rootwait\0" \
-+	"mmc_root_fs_type=ext2 rootwait\0" \
- 	"nand_root_fs_type=ubifs rootwait=1\0" \
- 	"spi_root_fs_type=jffs2\0" \
- 	"nor_root_fs_type=jffs2\0" \
--- 
-1.7.4.1
-
diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index 4670bd4..f78a400 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -10,10 +10,7 @@ BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="am335x_evm"
-BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR="board/beaglebone"
-BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL="git://arago-project.org/git/projects/u-boot-am33x.git"
-BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION="v2011.09_AM335xPSP_04.06.00.06"
+BR2_TARGET_UBOOT_2012_10=y
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="MLO"
