From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Date: Sun,  9 May 2021 12:01:41 +0200
Subject: [Buildroot] [PATCH] configs/wandboard: bump kernel and U-Boot
 versions
Message-ID: <20210509100141.22063-1-vincent.stehle@laposte.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Bump kernel to version 5.12.2.
- Bump U-Boot to version 2021.04.

While at it, switch U-Boot to the Kconfig build system and add some more
comments to the defconfig.

Signed-off-by: Vincent Stehl? <vincent.stehle@laposte.net>
Cc: Fabio Estevam <festevam@gmail.com>
---


Hi,

UART, SD card(s), USB, ethernet and HDMI work for me. More testers for e.g.
SATA and audio are welcome!

Fabio, if you do not like the additional comments in the defconfig please let
me know and I can re-submit without those.

Best regards,

Vincent.


 configs/wandboard_defconfig | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/configs/wandboard_defconfig b/configs/wandboard_defconfig
index 8f9e30a1a9..7915248cf1 100644
--- a/configs/wandboard_defconfig
+++ b/configs/wandboard_defconfig
@@ -1,32 +1,46 @@
+# Architecture
 BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_VFPV3=y
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+
+# Linux headers same as kernel, a 5.12 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_12=y
+
+# System
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
+
+# Image
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/wandboard/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/wandboard/genimage.cfg"
+
+# Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+
+# Bootloader
 BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="wandboard"
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.04"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="wandboard"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
+
+# Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.12.2"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-wandboard imx6dl-wandboard imx6q-wandboard-revb1 imx6dl-wandboard-revb1 imx6q-wandboard-revd1 imx6dl-wandboard-revd1 imx6qp-wandboard-revd1"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-# required tools to create the SD card image
+
+# Required tools to create the SD image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.30.2
