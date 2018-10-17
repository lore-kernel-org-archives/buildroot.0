From: Alexey Brodkin <alexey.brodkin@synopsys.com>
Date: Wed, 17 Oct 2018 12:51:51 +0300
Subject: [Buildroot] [PATCH] configs/cubieboard2: Update kernel to 4.18.14
 and U-Boot to 2018.09
Message-ID: <20181017095151.15575-1-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The board is well supported in upstream projects so let's update kernel
and U-Boot to the latest and greatest versions.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Erico Nunes <nunes.erico@gmail.com>
---
 configs/cubieboard2_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/cubieboard2_defconfig b/configs/cubieboard2_defconfig
index a0d23990ac..fa86be3622 100644
--- a/configs/cubieboard2_defconfig
+++ b/configs/cubieboard2_defconfig
@@ -1,15 +1,15 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
-# Linux headers same as kernel, a 4.6 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
+# Linux headers same as kernel, a 4.18 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_18=y
 BR2_TARGET_GENERIC_HOSTNAME="Cubieboard2"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Cubieboard2!"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/cubietech/cubieboard2/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.18.14"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun7i-a20-cubieboard2"
@@ -18,7 +18,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.05"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.09"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Cubieboard2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_SPL=y
-- 
2.16.2
