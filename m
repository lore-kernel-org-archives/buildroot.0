From: Leon Anavi <leon.anavi@konsulko.com>
Date: Fri, 29 Jun 2018 12:23:10 +0300
Subject: [Buildroot] [PATCH] configs/raspberrypi3_defconfig: fix filesystem
 size
Message-ID: <1530264190-9535-1-git-send-email-leon.anavi@konsulko.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Increase the filesystem size for raspberrypi3 by setting
BR2_TARGET_ROOTFS_EXT2_SIZE to "120M". The filesystem for
raspberrypi3_64 has the same size.

Fixes:
Copying files into the device: __populate_fs: Could not allocate block in ext2 filesystem while writing file "services"
mkfs.ext4: Could not allocate block in ext2 filesystem while populating file system

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 configs/raspberrypi3_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/raspberrypi3_defconfig b/configs/raspberrypi3_defconfig
index 856f321..0ef9afe 100644
--- a/configs/raspberrypi3_defconfig
+++ b/configs/raspberrypi3_defconfig
@@ -28,6 +28,7 @@ BR2_PACKAGE_HOST_MTOOLS=y
 # Filesystem / image
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3/post-image.sh"
-- 
2.7.4
