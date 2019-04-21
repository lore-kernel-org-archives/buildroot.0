From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 21 Apr 2019 15:26:43 +0200
Subject: [Buildroot] [git commit] configs/raspberrypi: increase ext4 image
 size
Message-ID: <20190421142159.CA1DF815E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b5bbb470d565f068d726e753f14f2f9a55abb2b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the bump to Linux 4.19 in commit
ed02414e9cd271c0b0db26b8d5db1bf40ff416d3, the number of kernel modules
built has increased significantly, to the point where the default of
60 MB for the ext4 image is no longer sufficient, so let's increase to
120 MB.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/199339561

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/raspberrypi_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index 1ebcee6cab..e6c42a837a 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -31,6 +31,7 @@ BR2_PACKAGE_HOST_MTOOLS=y
 # Filesystem / image
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi/post-image.sh"
