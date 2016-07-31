From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 31 Jul 2016 14:43:10 +0900
Subject: [Buildroot] [PATCH 1/2] zynq: enable
	BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
In-Reply-To: <1469943791-4805-1-git-send-email-yamada.masahiro@socionext.com>
References: <1469943791-4805-1-git-send-email-yamada.masahiro@socionext.com>
Message-ID: <1469943791-4805-2-git-send-email-yamada.masahiro@socionext.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The recent U-Boot adopts Kconfig for its configuration system.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 board/zynq/readme.txt           | 4 ++--
 configs/zynq_microzed_defconfig | 3 ++-
 configs/zynq_zc706_defconfig    | 5 +++--
 configs/zynq_zed_defconfig      | 3 ++-
 4 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/board/zynq/readme.txt b/board/zynq/readme.txt
index 73f8bf3..51e28b6 100644
--- a/board/zynq/readme.txt
+++ b/board/zynq/readme.txt
@@ -11,11 +11,11 @@ board even if it is not listed above.  Major Zynq-based boards are supported by
 U-Boot, and their Device Trees are merged in Linux Kernel.  If your board is the
 case, booting the kernel is a piece of cake.  All you need to do is to change:
  - Kernel Device Tree file name (BR2_LINUX_KERNEL_INTREE_DTS_NAME)
- - U-Boot board defconfig (BR2_TARGET_UBOOT_BOARDNAME)
+ - U-Boot board defconfig (BR2_TARGET_UBOOT_BOARD_KCONFIG)
 
 Steps to create a working system for a Zynq board:
 
-1) Configuration (do one of the followings)
+1) Configuration (do one of the following)
     make zynq_zc706_defconfig     (ZC706)
     make zynq_zed_defconfig       (Zedboard)
     make zynq_microzed_defconfig  (MicroZed)
diff --git a/configs/zynq_microzed_defconfig b/configs/zynq_microzed_defconfig
index fa25857..5efc0d4 100644
--- a/configs/zynq_microzed_defconfig
+++ b/configs/zynq_microzed_defconfig
@@ -16,10 +16,11 @@ BR2_TARGET_ROOTFS_CPIO=y
 BR2_TARGET_ROOTFS_CPIO_GZIP=y
 BR2_TARGET_ROOTFS_CPIO_UIMAGE=y
 BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="zynq_microzed"
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/Xilinx/u-boot-xlnx.git"
 BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xilinx-v2016.2"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="zynq_microzed"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
diff --git a/configs/zynq_zc706_defconfig b/configs/zynq_zc706_defconfig
index 4ac2fe8..578f042 100644
--- a/configs/zynq_zc706_defconfig
+++ b/configs/zynq_zc706_defconfig
@@ -1,7 +1,7 @@
 BR2_arm=y
 BR2_cortex_a9=y
-BR2_ARM_ENABLE_VFP=y
 BR2_ARM_ENABLE_NEON=y
+BR2_ARM_ENABLE_VFP=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyPS0"
 BR2_LINUX_KERNEL=y
@@ -17,10 +17,11 @@ BR2_TARGET_ROOTFS_CPIO=y
 BR2_TARGET_ROOTFS_CPIO_GZIP=y
 BR2_TARGET_ROOTFS_CPIO_UIMAGE=y
 BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="zynq_zc706"
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/Xilinx/u-boot-xlnx.git"
 BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xilinx-v2016.2"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="zynq_zc706"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
diff --git a/configs/zynq_zed_defconfig b/configs/zynq_zed_defconfig
index 84859bb..7ce3365 100644
--- a/configs/zynq_zed_defconfig
+++ b/configs/zynq_zed_defconfig
@@ -16,10 +16,11 @@ BR2_TARGET_ROOTFS_CPIO=y
 BR2_TARGET_ROOTFS_CPIO_GZIP=y
 BR2_TARGET_ROOTFS_CPIO_UIMAGE=y
 BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="zynq_zed"
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/Xilinx/u-boot-xlnx.git"
 BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xilinx-v2016.2"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="zynq_zed"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
-- 
1.9.1
