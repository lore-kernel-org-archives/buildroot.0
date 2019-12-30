From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 30 Dec 2019 12:23:42 +0100
Subject: [Buildroot] [git commit] configs/raspberrypi3_qt5we: increase
 filesystem size
Message-ID: <20191230111421.7A4338E725@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a53fdc007c439a269ec3c18f45532da8f2a5025d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The build of raspberrypi3_qt5we_defconfig currently fails because the
filesystem image size is no longer large enough to contain everything:
the filesystem image size is 360 MB, but the total filesystem size
reported by "make graph-size" is 370 MB.

Let's increase the size to 400 MB for good measure.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/389451889

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 configs/raspberrypi3_qt5we_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/raspberrypi3_qt5we_defconfig b/configs/raspberrypi3_qt5we_defconfig
index 21c5d1dc4c..4e9d782c7c 100644
--- a/configs/raspberrypi3_qt5we_defconfig
+++ b/configs/raspberrypi3_qt5we_defconfig
@@ -43,7 +43,7 @@ BR2_PACKAGE_HOST_MTOOLS=y
 # Filesystem / image
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ROOTFS_EXT2_SIZE="360M"
+BR2_TARGET_ROOTFS_EXT2_SIZE="400M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3/post-build.sh"
