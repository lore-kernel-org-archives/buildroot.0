From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 8 Jul 2018 00:32:06 +0200
Subject: [Buildroot] [git commit] configs/raspberrypi3_defconfig: increase
 filesystem size
Message-ID: <20180708095419.3E23987FF1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e26a71d1a96aefcc6a63051207b26ea4282afb10
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Increase the filesystem size for raspberrypi3 by setting
BR2_TARGET_ROOTFS_EXT2_SIZE to "120M". The filesystem for
raspberrypi3_64 has the same size. The size is so large because the
kernel config enables many many modules.

Fixes:
Copying files into the device: __populate_fs: Could not allocate block in ext2 filesystem while writing file "services"
mkfs.ext4: Could not allocate block in ext2 filesystem while populating file system

This error is not reproducible, it seems to depend on e.g. directory
ordering.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 configs/raspberrypi3_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/raspberrypi3_defconfig b/configs/raspberrypi3_defconfig
index 856f321433..0ef9afeecf 100644
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
