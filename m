From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Jan 2018 15:39:31 +0100
Subject: [Buildroot] [git commit] configs: freescale_imx*: bump to version
 4.9.x_1.0.0_ga
Message-ID: <20180107144906.73558802F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8d5d083ed6b2324aa8ef7042856b027afe71d848
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also switch repository from old freescale site to codeaurora:
https://source.codeaurora.org/external/imx/

Cc: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...x6qsabre_common-boot-Linux-to-init-in-mfgtools-mode.patch |  4 ++--
 configs/freescale_imx31_3stack_defconfig                     |  8 ++++----
 configs/freescale_imx6dlsabreauto_defconfig                  | 12 ++++++------
 configs/freescale_imx6dlsabresd_defconfig                    | 12 ++++++------
 configs/freescale_imx6qsabreauto_defconfig                   | 12 ++++++------
 configs/freescale_imx6qsabresd_defconfig                     | 12 ++++++------
 configs/freescale_imx6sololiteevk_defconfig                  | 12 ++++++------
 configs/freescale_imx6sxsabresd_defconfig                    | 12 ++++++------
 configs/freescale_imx6ulevk_defconfig                        | 12 ++++++------
 configs/freescale_imx7dsabresd_defconfig                     | 12 ++++++------
 10 files changed, 54 insertions(+), 54 deletions(-)

diff --git a/board/freescale/imx6sabre/patches/uboot/uboot-0001-mx6qsabre_common-boot-Linux-to-init-in-mfgtools-mode.patch b/board/freescale/imx6sabre/patches/uboot/uboot-0001-mx6qsabre_common-boot-Linux-to-init-in-mfgtools-mode.patch
index 9e2aebf..d57875f 100644
--- a/board/freescale/imx6sabre/patches/uboot/uboot-0001-mx6qsabre_common-boot-Linux-to-init-in-mfgtools-mode.patch
+++ b/board/freescale/imx6sabre/patches/uboot/uboot-0001-mx6qsabre_common-boot-Linux-to-init-in-mfgtools-mode.patch
@@ -22,10 +22,10 @@ diff --git a/include/configs/mx6sabre_common.h b/include/configs/mx6sabre_common
 index 93d4c4b..d2e7efd 100644
 --- a/include/configs/mx6sabre_common.h
 +++ b/include/configs/mx6sabre_common.h
-@@ -106,7 +106,7 @@
+@@ -52,7 +52,7 @@
  
  #define CONFIG_MFG_ENV_SETTINGS \
- 	"mfgtool_args=setenv bootargs console=" CONFIG_CONSOLE_DEV ",115200 " \
+ 	"mfgtool_args=setenv bootargs console=" CONSOLE_DEV ",115200 " \
 -		"rdinit=/linuxrc " \
 +		"rdinit=/init " \
  		"g_mass_storage.stall=0 g_mass_storage.removable=1 " \
diff --git a/configs/freescale_imx31_3stack_defconfig b/configs/freescale_imx31_3stack_defconfig
index 0476fc1..025f93f 100644
--- a/configs/freescale_imx31_3stack_defconfig
+++ b/configs/freescale_imx31_3stack_defconfig
@@ -3,8 +3,8 @@ BR2_arm=y
 BR2_arm1136jf_s=y
 BR2_ARM_EABIHF=y
 
-# Linux headers same as kernel, a 4.1 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+# Linux headers same as kernel, a 4.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
@@ -12,8 +12,8 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-imx.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.1.15_2.0.0_ga"
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/linux-imx.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.9.x_1.0.0_ga"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/freescale/imx31_3stack/linux.fragment"
 BR2_TARGET_ROOTFS_CPIO_GZIP=y
diff --git a/configs/freescale_imx6dlsabreauto_defconfig b/configs/freescale_imx6dlsabreauto_defconfig
index c946988..19c1cc2 100644
--- a/configs/freescale_imx6dlsabreauto_defconfig
+++ b/configs/freescale_imx6dlsabreauto_defconfig
@@ -8,8 +8,8 @@ BR2_ARM_FPU_VFPV3=y
 # patches
 BR2_GLOBAL_PATCH_DIR="board/freescale/imx6sabre/patches"
 
-# Linux headers same as kernel, a 4.1 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+# Linux headers same as kernel, a 4.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
@@ -17,8 +17,8 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-imx.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.1.15_2.0.0_ga"
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/linux-imx.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.9.x_1.0.0_ga"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-sabreauto"
@@ -38,5 +38,5 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6dlsabreauto"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.freescale.com/imx/uboot-imx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_4.1.15_2.0.0_ga"
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/uboot-imx.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_4.9.x_1.0.0_ga"
diff --git a/configs/freescale_imx6dlsabresd_defconfig b/configs/freescale_imx6dlsabresd_defconfig
index 18cef00..a5c0aa6 100644
--- a/configs/freescale_imx6dlsabresd_defconfig
+++ b/configs/freescale_imx6dlsabresd_defconfig
@@ -8,8 +8,8 @@ BR2_ARM_FPU_VFPV3=y
 # patches
 BR2_GLOBAL_PATCH_DIR="board/freescale/imx6sabre/patches"
 
-# Linux headers same as kernel, a 4.1 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+# Linux headers same as kernel, a 4.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
@@ -17,8 +17,8 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-imx.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.1.15_2.0.0_ga"
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/linux-imx.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.9.x_1.0.0_ga"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-sabresd"
@@ -37,5 +37,5 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6dlsabresd"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.freescale.com/imx/uboot-imx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_4.1.15_2.0.0_ga"
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/uboot-imx.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_4.9.x_1.0.0_ga"
diff --git a/configs/freescale_imx6qsabreauto_defconfig b/configs/freescale_imx6qsabreauto_defconfig
index 9e8e007..f03b710 100644
--- a/configs/freescale_imx6qsabreauto_defconfig
+++ b/configs/freescale_imx6qsabreauto_defconfig
@@ -8,8 +8,8 @@ BR2_ARM_FPU_VFPV3=y
 # patches
 BR2_GLOBAL_PATCH_DIR="board/freescale/imx6sabre/patches"
 
-# Linux headers same as kernel, a 4.1 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+# Linux headers same as kernel, a 4.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
@@ -17,8 +17,8 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-imx.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.1.15_2.0.0_ga"
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/linux-imx.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.9.x_1.0.0_ga"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabreauto"
@@ -38,5 +38,5 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6qsabreauto"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.freescale.com/imx/uboot-imx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_4.1.15_2.0.0_ga"
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/uboot-imx.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_4.9.x_1.0.0_ga"
diff --git a/configs/freescale_imx6qsabresd_defconfig b/configs/freescale_imx6qsabresd_defconfig
index 824e128..613b48a 100644
--- a/configs/freescale_imx6qsabresd_defconfig
+++ b/configs/freescale_imx6qsabresd_defconfig
@@ -8,8 +8,8 @@ BR2_ARM_FPU_VFPV3=y
 # patches
 BR2_GLOBAL_PATCH_DIR="board/freescale/imx6sabre/patches"
 
-# Linux headers same as kernel, a 4.1 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+# Linux headers same as kernel, a 4.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
@@ -17,8 +17,8 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-imx.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.1.15_2.0.0_ga"
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/linux-imx.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.9.x_1.0.0_ga"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabresd"
@@ -38,5 +38,5 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6qsabresd"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.freescale.com/imx/uboot-imx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_4.1.15_2.0.0_ga"
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/uboot-imx.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_4.9.x_1.0.0_ga"
diff --git a/configs/freescale_imx6sololiteevk_defconfig b/configs/freescale_imx6sololiteevk_defconfig
index 0e81b2b..1b35462 100644
--- a/configs/freescale_imx6sololiteevk_defconfig
+++ b/configs/freescale_imx6sololiteevk_defconfig
@@ -5,8 +5,8 @@ BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_VFPV3=y
 
-# Linux headers same as kernel, a 4.1 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+# Linux headers same as kernel, a 4.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
@@ -14,8 +14,8 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-imx.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.1.15_2.0.0_ga"
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/linux-imx.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.9.x_1.0.0_ga"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6sl-evk"
@@ -34,5 +34,5 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6slevk"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.freescale.com/imx/uboot-imx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_4.1.15_2.0.0_ga"
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/uboot-imx.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_4.9.x_1.0.0_ga"
diff --git a/configs/freescale_imx6sxsabresd_defconfig b/configs/freescale_imx6sxsabresd_defconfig
index 4a40c26..01e1314 100644
--- a/configs/freescale_imx6sxsabresd_defconfig
+++ b/configs/freescale_imx6sxsabresd_defconfig
@@ -8,8 +8,8 @@ BR2_ARM_FPU_VFPV3=y
 # patches
 BR2_GLOBAL_PATCH_DIR="board/freescale/imx6sabre/patches"
 
-# Linux headers same as kernel, a 4.1 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+# Linux headers same as kernel, a 4.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
@@ -17,8 +17,8 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-imx.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.1.15_2.0.0_ga"
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/linux-imx.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.9.x_1.0.0_ga"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6sx-sdb"
@@ -36,6 +36,6 @@ BR2_PACKAGE_HOST_MTOOLS=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6sxsabresd"
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.freescale.com/imx/uboot-imx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_4.1.15_2.0.0_ga"
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/uboot-imx.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_4.9.x_1.0.0_ga"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
diff --git a/configs/freescale_imx6ulevk_defconfig b/configs/freescale_imx6ulevk_defconfig
index 3c5a909..76ad101 100644
--- a/configs/freescale_imx6ulevk_defconfig
+++ b/configs/freescale_imx6ulevk_defconfig
@@ -2,8 +2,8 @@
 BR2_arm=y
 BR2_cortex_a7=y
 
-# Linux headers same as kernel, a 4.1 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+# Linux headers same as kernel, a 4.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
@@ -11,8 +11,8 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-imx.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.1.15_2.0.0_ga"
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/linux-imx.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.9.x_1.0.0_ga"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6ul-14x14-evk"
@@ -21,8 +21,8 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6ul-14x14-evk"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6ul_14x14_evk"
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.freescale.com/imx/uboot-imx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_4.1.15_2.0.0_ga"
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/uboot-imx.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_4.9.x_1.0.0_ga"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 
 # required tools to create the microSD image
diff --git a/configs/freescale_imx7dsabresd_defconfig b/configs/freescale_imx7dsabresd_defconfig
index 97d3cde..844b547 100644
--- a/configs/freescale_imx7dsabresd_defconfig
+++ b/configs/freescale_imx7dsabresd_defconfig
@@ -2,8 +2,8 @@
 BR2_arm=y
 BR2_cortex_a7=y
 
-# Linux headers same as kernel, a 4.1 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+# Linux headers same as kernel, a 4.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
@@ -11,8 +11,8 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-imx.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.1.15_2.0.0_ga"
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/linux-imx.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.9.x_1.0.0_ga"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx7d-sdb"
@@ -25,8 +25,8 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx7dsabresd"
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.freescale.com/imx/uboot-imx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_4.1.15_2.0.0_ga"
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/uboot-imx.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_4.9.x_1.0.0_ga"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 
 # required tools to create the microSD image
