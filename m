From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 30 Sep 2019 08:04:47 +0200
Subject: [Buildroot] [PATCH] configs/beaglebone_defconfig: use default
 console device
Message-ID: <20190930060447.7377-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

OMAP kernels use 8250 driver by default. Hence the name of
the console device is not /dev/ttyO0 but /dev/ttyS0.
Use /dev/console in order to handle the console independently
of the selected driver.

Tested in BeagleBone Black board.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
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
-- 
2.17.0
