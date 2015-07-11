From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jul 2015 13:16:15 +0200
Subject: [Buildroot] [git commit] freescale_imx6*_defconfig: bump version to
	3.10.53-1.1.0 GA
Message-ID: <20150711112619.E0EA07FC81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7b67d3714b484af4f5b9c8af6e2fb5d5e6c79ef4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ommon-boot-Linux-to-init-in-mfgtools-mode.patch |   16 ++++++++--------
 configs/freescale_imx6dlsabreauto_defconfig        |    6 +++---
 configs/freescale_imx6dlsabresd_defconfig          |    7 +++----
 configs/freescale_imx6qsabreauto_defconfig         |    6 +++---
 configs/freescale_imx6qsabresd_defconfig           |    7 +++----
 configs/freescale_imx6sololiteevk_defconfig        |    5 ++---
 6 files changed, 22 insertions(+), 25 deletions(-)

diff --git a/board/freescale/imx6sabre/patches/uboot/uboot-0001-mx6qsabre_common-boot-Linux-to-init-in-mfgtools-mode.patch b/board/freescale/imx6sabre/patches/uboot/uboot-0001-mx6qsabre_common-boot-Linux-to-init-in-mfgtools-mode.patch
index c01df4e..9e2aebf 100644
--- a/board/freescale/imx6sabre/patches/uboot/uboot-0001-mx6qsabre_common-boot-Linux-to-init-in-mfgtools-mode.patch
+++ b/board/freescale/imx6sabre/patches/uboot/uboot-0001-mx6qsabre_common-boot-Linux-to-init-in-mfgtools-mode.patch
@@ -1,4 +1,4 @@
-From 4a7cd7c5b165317dccf45cfc235da3e14bc339e8 Mon Sep 17 00:00:00 2001
+From 90ecc0ad14337898b75843efc6530fc4a34f7808 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@freescale.com>
 Date: Tue, 12 Aug 2014 10:17:31 +0200
 Subject: [PATCH] mx6qsabre_common: boot Linux to /init in mfgtools mode
@@ -15,14 +15,14 @@ buildroot system entirely through USB.
 
 Signed-off-by: Vincent Stehl?? <vincent.stehle@freescale.com>
 ---
- include/configs/mx6qsabre_common.h | 2 +-
+ include/configs/mx6sabre_common.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/include/configs/mx6qsabre_common.h b/include/configs/mx6qsabre_common.h
-index 69ff0df..ec7b665 100644
---- a/include/configs/mx6qsabre_common.h
-+++ b/include/configs/mx6qsabre_common.h
-@@ -129,7 +129,7 @@
+diff --git a/include/configs/mx6sabre_common.h b/include/configs/mx6sabre_common.h
+index 93d4c4b..d2e7efd 100644
+--- a/include/configs/mx6sabre_common.h
++++ b/include/configs/mx6sabre_common.h
+@@ -106,7 +106,7 @@
  
  #define CONFIG_MFG_ENV_SETTINGS \
  	"mfgtool_args=setenv bootargs console=" CONFIG_CONSOLE_DEV ",115200 " \
@@ -32,5 +32,5 @@ index 69ff0df..ec7b665 100644
  		"g_mass_storage.idVendor=0x066F g_mass_storage.idProduct=0x37FF "\
  		"g_mass_storage.iSerialNumber=\"\" "\
 -- 
-2.0.1
+2.1.4
 
diff --git a/configs/freescale_imx6dlsabreauto_defconfig b/configs/freescale_imx6dlsabreauto_defconfig
index f4fc48a..6a80712 100644
--- a/configs/freescale_imx6dlsabreauto_defconfig
+++ b/configs/freescale_imx6dlsabreauto_defconfig
@@ -7,7 +7,7 @@ BR2_GLOBAL_PATCH_DIR="board/freescale/imx6sabre/patches"
 
 # toolchain
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.10.17"
+BR2_DEFAULT_KERNEL_VERSION="3.10.53"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_10=y
 
 # system
@@ -17,7 +17,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-2.6-imx.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_3.10.17_1.0.0_ga"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_3.10.53_1.1.0_ga"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -32,4 +32,4 @@ BR2_TARGET_UBOOT_BOARDNAME="mx6dlsabreauto"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.freescale.com/imx/uboot-imx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_3.10.17_1.0.0_ga"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_3.10.53_1.1.0_ga"
diff --git a/configs/freescale_imx6dlsabresd_defconfig b/configs/freescale_imx6dlsabresd_defconfig
index dd17358..0aac2de 100644
--- a/configs/freescale_imx6dlsabresd_defconfig
+++ b/configs/freescale_imx6dlsabresd_defconfig
@@ -7,7 +7,7 @@ BR2_GLOBAL_PATCH_DIR="board/freescale/imx6sabre/patches"
 
 # toolchain
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.10.17"
+BR2_DEFAULT_KERNEL_VERSION="3.10.53"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_10=y
 
 # system
@@ -17,8 +17,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-2.6-imx.git"
-# Last version of branch imx_3.10.17_1.0.1_ga
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="dac46dcf913585956a0e7a838e6f4b7465f00f57"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_3.10.53_1.1.0_ga"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -33,4 +32,4 @@ BR2_TARGET_UBOOT_BOARDNAME="mx6dlsabresd"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.freescale.com/imx/uboot-imx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_3.10.17_1.0.0_ga"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_3.10.53_1.1.0_ga"
diff --git a/configs/freescale_imx6qsabreauto_defconfig b/configs/freescale_imx6qsabreauto_defconfig
index 0831d24..f0d6a5e 100644
--- a/configs/freescale_imx6qsabreauto_defconfig
+++ b/configs/freescale_imx6qsabreauto_defconfig
@@ -7,7 +7,7 @@ BR2_GLOBAL_PATCH_DIR="board/freescale/imx6sabre/patches"
 
 # toolchain
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.10.17"
+BR2_DEFAULT_KERNEL_VERSION="3.10.53"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_10=y
 
 # system
@@ -17,7 +17,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-2.6-imx.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_3.10.17_1.0.0_ga"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_3.10.53_1.1.0_ga"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -32,4 +32,4 @@ BR2_TARGET_UBOOT_BOARDNAME="mx6qsabreauto"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.freescale.com/imx/uboot-imx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_3.10.17_1.0.0_ga"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_3.10.53_1.1.0_ga"
diff --git a/configs/freescale_imx6qsabresd_defconfig b/configs/freescale_imx6qsabresd_defconfig
index 98ed7d4..a705534 100644
--- a/configs/freescale_imx6qsabresd_defconfig
+++ b/configs/freescale_imx6qsabresd_defconfig
@@ -7,7 +7,7 @@ BR2_GLOBAL_PATCH_DIR="board/freescale/imx6sabre/patches"
 
 # toolchain
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.10.17"
+BR2_DEFAULT_KERNEL_VERSION="3.10.53"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_10=y
 
 # system
@@ -17,8 +17,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-2.6-imx.git"
-# Last version of branch imx_3.10.17_1.0.1_ga
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="dac46dcf913585956a0e7a838e6f4b7465f00f57"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_3.10.53_1.1.0_ga"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -33,4 +32,4 @@ BR2_TARGET_UBOOT_BOARDNAME="mx6qsabresd"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.freescale.com/imx/uboot-imx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_3.10.17_1.0.0_ga"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_3.10.53_1.1.0_ga"
diff --git a/configs/freescale_imx6sololiteevk_defconfig b/configs/freescale_imx6sololiteevk_defconfig
index 93d842b..d4cca4e 100644
--- a/configs/freescale_imx6sololiteevk_defconfig
+++ b/configs/freescale_imx6sololiteevk_defconfig
@@ -9,8 +9,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-2.6-imx.git"
-# Last version of branch imx_3.10.17_1.0.1_ga
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="dac46dcf913585956a0e7a838e6f4b7465f00f57"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_3.10.53_1.1.0_ga"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x80008000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -25,4 +24,4 @@ BR2_TARGET_UBOOT_BOARDNAME="mx6slevk"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.freescale.com/imx/uboot-imx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_3.10.17_1.0.0_ga"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_3.10.53_1.1.0_ga"
