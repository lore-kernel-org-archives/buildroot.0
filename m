From: Fabio Estevam <fabio.estevam@nxp.com>
Date: Thu, 3 Nov 2016 16:40:16 -0200
Subject: [Buildroot] [PATCH 1/2] configs: Remove udoo_quad_defconfig
Message-ID: <1478198417-12732-1-git-send-email-fabio.estevam@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

configs/mx6udoo_defconfig supports the quad and dual-lite variants,
so there is no need to keep udoo_quad_defconfig anymore.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 configs/udoo_quad_defconfig | 29 -----------------------------
 1 file changed, 29 deletions(-)
 delete mode 100644 configs/udoo_quad_defconfig

diff --git a/configs/udoo_quad_defconfig b/configs/udoo_quad_defconfig
deleted file mode 100644
index 5344446..0000000
--- a/configs/udoo_quad_defconfig
+++ /dev/null
@@ -1,29 +0,0 @@
-# Architceture
-BR2_arm=y
-BR2_cortex_a9=y
-BR2_ARM_ENABLE_VFP=y
-
-# Linux headers same as kernel, a 3.0 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_0=y
-
-# System
-BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
-
-# Kernel
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/UDOOboard/Kernel_Unico"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="8a6eb060a0d968048f88d5a94510fc6db2c37939"
-BR2_LINUX_KERNEL_PATCH="https://github.com/torvalds/linux/commit/455bd4c430b0c0a361f38e8658a0d6cb469942b5.patch https://github.com/torvalds/linux/commit/418df63adac56841ef6b0f1fcf435bc64d4ed177.patch"
-BR2_LINUX_KERNEL_DEFCONFIG="UDOO"
-BR2_LINUX_KERNEL_UIMAGE=y
-BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
-BR2_LINUX_KERNEL_INSTALL_TARGET=y
-
-# Bootloader
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="udoo_quad"
-BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/UDOOboard/U-Boot_Unico-2013"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="1b90fd4bafb1efe05f88eaded731d99a1428f497"
-BR2_TARGET_UBOOT_FORMAT_IMX=y
-- 
2.7.4
