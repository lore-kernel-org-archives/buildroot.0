From: Viktar Palstsiuk <viktar.palstsiuk@promwad.com>
Date: Tue, 26 Nov 2019 12:03:52 +0300
Subject: [Buildroot] [PATCH 1/1] configs/nanopi_neo: deterine roofs
 partition size automatically
Message-ID: <20191126090352.11728-1-viktar.palstsiuk@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Let genimage determine rootfs partition size based on the filesystem image size

Signed-off-by: Viktar Palstsiuk <viktar.palstsiuk@promwad.com>
---
 board/friendlyarm/nanopi-neo/genimage.cfg | 1 -
 configs/nanopi_neo_defconfig              | 2 --
 2 files changed, 3 deletions(-)

diff --git a/board/friendlyarm/nanopi-neo/genimage.cfg b/board/friendlyarm/nanopi-neo/genimage.cfg
index ad43d31049..f6adc4af3e 100644
--- a/board/friendlyarm/nanopi-neo/genimage.cfg
+++ b/board/friendlyarm/nanopi-neo/genimage.cfg
@@ -29,6 +29,5 @@ image sdcard.img {
 	partition rootfs {
 		partition-type = 0x83
 		image = "rootfs.ext4"
-		size = 32M
 	}
 }
diff --git a/configs/nanopi_neo_defconfig b/configs/nanopi_neo_defconfig
index aa464917b5..838f4edad5 100644
--- a/configs/nanopi_neo_defconfig
+++ b/configs/nanopi_neo_defconfig
@@ -31,8 +31,6 @@ BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
 # Build an sdcard image
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
-BR2_TARGET_ROOTFS_EXT2_INODES=8192
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.17.1
