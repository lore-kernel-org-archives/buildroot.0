From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Oct 2019 11:44:53 +0200
Subject: [Buildroot] [git commit branch/2019.08.x]
 configs/beaglebone_defconfig: use default console device
Message-ID: <20191001094144.9586E8644A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5381d693ef3ca582dc82fca4c4a62f62e8d3e74d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

OMAP kernels use 8250 driver by default. Hence the name of
the console device is not /dev/ttyO0 but /dev/ttyS0.
Use /dev/console in order to handle the console independently
of the selected driver.

Tested in BeagleBone Black board.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 68b5b79b2fb316fd7c6c40c12a7e9ddaeada837d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/beaglebone_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index b4f152fd69..fbb259f577 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -2,7 +2,6 @@ BR2_arm=y
 BR2_cortex_a8=y
 BR2_GLOBAL_PATCH_DIR="board/beaglebone/patches"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
-BR2_TARGET_GENERIC_GETTY_PORT="ttyO0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/beaglebone/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
