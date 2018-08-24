From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 24 Aug 2018 10:23:08 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] configs/raspberrypi2:
 increase ext4 filesystem size
Message-ID: <20180824081526.7A39A8E598@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f60ff3a59f43b2c0d5c99977800ce4e53e110868
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

The default size of the ext4 filesystem is no longer sufficient to
hold all the kernel modules built by the RPi Linux kernel
configuration. Let's increase to 120 MB, like we did for
raspberrypi3_defconfig.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/88314938

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 272bf797c9c4d67154316619ff6fcadb63d38511)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/raspberrypi2_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
index bbb3900e41..ce8cce1620 100644
--- a/configs/raspberrypi2_defconfig
+++ b/configs/raspberrypi2_defconfig
@@ -30,6 +30,7 @@ BR2_PACKAGE_HOST_MTOOLS=y
 # Filesystem / image
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi2/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi2/post-image.sh"
