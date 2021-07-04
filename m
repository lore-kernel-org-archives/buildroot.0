From: Dario Binacchi <dariobin@libero.it>
Date: Sun,  4 Jul 2021 16:11:06 +0200
Subject: [Buildroot] [PATCH 2/2] configs/stm32f469_disco: add framebuffer
 test application
In-Reply-To: <20210704141106.1746-1-dariobin@libero.it>
References: <20210704141106.1746-1-dariobin@libero.it>
Message-ID: <20210704141106.1746-3-dariobin@libero.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's a test suite for Linux framebuffer. You can run, for example,
fb-test-rect that displays random rectangles on the screen. But first,
you need to enable the framebuffer:

~ # echo 0 0 > /sys/class/graphics/fb0/pan
~ # fb-test-rect

Signed-off-by: Dario Binacchi <dariobin@libero.it>
---
 configs/stm32f469_disco_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/stm32f469_disco_defconfig b/configs/stm32f469_disco_defconfig
index 1440aefd95..b6de6748a0 100644
--- a/configs/stm32f469_disco_defconfig
+++ b/configs/stm32f469_disco_defconfig
@@ -15,6 +15,7 @@ BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="zImage"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32f469-disco"
 BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
+BR2_PACKAGE_FB_TEST_APP=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
 # BR2_TARGET_ROOTFS_TAR is not set
-- 
2.17.1
