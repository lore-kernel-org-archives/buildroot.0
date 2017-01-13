From: Lucas Bajolet <lucas.bajolet@savoirfairelinux.com>
Date: Fri, 13 Jan 2017 15:11:22 -0500
Subject: [Buildroot] [PATCH 1/4] configs/altera_sockit_defconfig: bump
	kernel version to 4.7 and u-boot to v2016.11-rc3
Message-ID: <1484338285-21161-1-git-send-email-lucas.bajolet@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The old SoCkit configuration was broken, as highlighted by this test report: https://travis-ci.org/buildroot/buildroot-defconfig-testing/jobs/185616884

This patch solves the issue by bumping the Kernel version to 4.7, making it compatible with GCC 5+.

The bootloader is also updated to a newer version since the board is now officially supported by Altera in their U-Boot repository.

Signed-off-by: Lucas Bajolet <lucas.bajolet@savoirfairelinux.com>
---
 configs/altera_sockit_defconfig | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/configs/altera_sockit_defconfig b/configs/altera_sockit_defconfig
index 0addbde..1c9a499 100644
--- a/configs/altera_sockit_defconfig
+++ b/configs/altera_sockit_defconfig
@@ -6,32 +6,29 @@ BR2_ARM_ENABLE_NEON=y
 BR2_ARM_FPU_NEON=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
 
-# Linux headers same as kernel, a 3.13 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_13=y
+# Linux headers same as kernel, a 4.7 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
 
-BR2_TARGET_GENERIC_GETTY_BAUDRATE_57600=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/altera/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_LINUX_KERNEL_INTREE_DTS_NAME)"
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="http://git.rocketboards.org/linux-socfpga.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_socfpga-3.13_14.02.02"
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/altera-opensource/linux-socfpga.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_socfpga-4.7_16.10.02_pr"
 BR2_LINUX_KERNEL_DEFCONFIG="socfpga"
-BR2_LINUX_KERNEL_UIMAGE=y
-BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="socfpga_cyclone5_sockit"
 
 BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_3=y
 
 BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="socfpga_cyclone5"
+BR2_TARGET_UBOOT_BOARDNAME="socfpga_sockit"
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="http://git.rocketboards.org/u-boot-socfpga.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_acds13.0sp1"
 BR2_TARGET_UBOOT_PATCH="board/altera/sockit"
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/altera-opensource/u-boot-socfpga"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="v2016.11-rc3"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl.bin"
+BR2_TARGET_UBOOT_ALTERA_SOCFPGA_IMAGE_CRC=y
-- 
2.7.4
