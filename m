From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Jul 2018 20:03:30 +0200
Subject: [Buildroot] [git commit branch/2018.02.x]
 configs/raspberrypi3_defconfig: increase filesystem size
Message-ID: <20180719180713.A1B6A88F81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4bb95c720170d8e388f3c72e35ac8023ebef2f04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

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
(cherry picked from commit e26a71d1a96aefcc6a63051207b26ea4282afb10)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/raspberrypi3_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/raspberrypi3_defconfig b/configs/raspberrypi3_defconfig
index 9304f0cb74..359d549b70 100644
--- a/configs/raspberrypi3_defconfig
+++ b/configs/raspberrypi3_defconfig
@@ -29,6 +29,7 @@ BR2_PACKAGE_HOST_MTOOLS=y
 # Filesystem / image
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3/post-image.sh"
