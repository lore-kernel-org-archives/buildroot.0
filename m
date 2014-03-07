From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  8 Mar 2014 00:25:06 +0100
Subject: [Buildroot] [PATCH] defconfigs: add the _AT_LEAST_X_Y headers
	options
Message-ID: <1394234706-10155-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Since commit 2a5cf5e (check kernel headers version), we also need to
specify the series of the custom kernel headers version.

The defconfigs file that define such a custom kernel headers version
now fail to build.

Add the required _AT_LEAST_X_Y options to those config files. Done with
this (convoluted but very fast, uch faster ythan manual editing!) rule:

    for f in $( git grep -l BR2_DEFAULT_KERNEL_VERSION=\"3 ); do
        grep -E '^BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_' "${f}" >/dev/null && continue
        sed -r -e '/^(BR2_DEFAULT_KERNEL_VERSION="3\.([[:digit:]]+).*")$/s//\1\nBR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_\2=y/' "${f}"
    done

Only kernels >= 3.0 need those options in the defconfig, since the
default for 2.6.x kernels is correct (selects _AT_LEAST_2_6), and
the default is not saved in a defconfig.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 configs/armadeus_apf27_defconfig      | 1 +
 configs/armadeus_apf28_defconfig      | 1 +
 configs/armadeus_apf51_defconfig      | 1 +
 configs/armadeus_apf9328_defconfig    | 1 +
 configs/at91sam9260eknf_defconfig     | 1 +
 configs/at91sam9g20dfc_defconfig      | 1 +
 configs/atngw100_defconfig            | 1 +
 configs/atstk100x_defconfig           | 1 +
 configs/beaglebone_defconfig          | 1 +
 configs/calao_tny_a9g20_lpw_defconfig | 1 +
 configs/gnublin_defconfig             | 1 +
 configs/mini2440_defconfig            | 1 +
 configs/minnowboard_defconfig         | 1 +
 configs/pandaboard_defconfig          | 1 +
 configs/raspberrypi_defconfig         | 1 +
 configs/sheevaplug_defconfig          | 1 +
 configs/telit_evk_pro3_defconfig      | 1 +
 configs/zedboard_defconfig            | 1 +
 18 files changed, 18 insertions(+)

diff --git a/configs/armadeus_apf27_defconfig b/configs/armadeus_apf27_defconfig
index 26f313e..7e33a41 100644
--- a/configs/armadeus_apf27_defconfig
+++ b/configs/armadeus_apf27_defconfig
@@ -5,6 +5,7 @@ BR2_arm926t=y
 # Lock down headers to avoid breaking with new defaults
 BR2_KERNEL_HEADERS_VERSION=y
 BR2_DEFAULT_KERNEL_VERSION="3.13.2"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_13=y
 
 # System
 BR2_TARGET_GENERIC_HOSTNAME="apf27"
diff --git a/configs/armadeus_apf28_defconfig b/configs/armadeus_apf28_defconfig
index 06a6e76..95d56a5 100644
--- a/configs/armadeus_apf28_defconfig
+++ b/configs/armadeus_apf28_defconfig
@@ -5,6 +5,7 @@ BR2_arm926t=y
 # Lock down headers to avoid breaking with new defaults
 BR2_KERNEL_HEADERS_VERSION=y
 BR2_DEFAULT_KERNEL_VERSION="3.12.7"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_12=y
 
 # System
 BR2_TARGET_GENERIC_HOSTNAME="apf28"
diff --git a/configs/armadeus_apf51_defconfig b/configs/armadeus_apf51_defconfig
index 0a0de6f..7e932fb 100644
--- a/configs/armadeus_apf51_defconfig
+++ b/configs/armadeus_apf51_defconfig
@@ -5,6 +5,7 @@ BR2_cortex_a8=y
 # Lock down headers to avoid breaking with new defaults
 BR2_KERNEL_HEADERS_VERSION=y
 BR2_DEFAULT_KERNEL_VERSION="3.12.6"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_12=y
 
 # System
 BR2_TARGET_GENERIC_HOSTNAME="apf51"
diff --git a/configs/armadeus_apf9328_defconfig b/configs/armadeus_apf9328_defconfig
index 33e9a76..b42f757 100644
--- a/configs/armadeus_apf9328_defconfig
+++ b/configs/armadeus_apf9328_defconfig
@@ -18,6 +18,7 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 # Lock down headers to avoid breaking with new defaults
 BR2_KERNEL_HEADERS_VERSION=y
 BR2_DEFAULT_KERNEL_VERSION="3.1.1"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_1=y
 
 # System
 BR2_TARGET_GENERIC_HOSTNAME="apf9328"
diff --git a/configs/at91sam9260eknf_defconfig b/configs/at91sam9260eknf_defconfig
index 895add1..dba0cd5 100644
--- a/configs/at91sam9260eknf_defconfig
+++ b/configs/at91sam9260eknf_defconfig
@@ -5,6 +5,7 @@ BR2_arm926t=y
 # Toolchain
 BR2_KERNEL_HEADERS_VERSION=y
 BR2_DEFAULT_KERNEL_VERSION="3.9.1"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_9=y
 
 # System
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y
diff --git a/configs/at91sam9g20dfc_defconfig b/configs/at91sam9g20dfc_defconfig
index 60764e6..1d346c2 100644
--- a/configs/at91sam9g20dfc_defconfig
+++ b/configs/at91sam9g20dfc_defconfig
@@ -5,6 +5,7 @@ BR2_arm926t=y
 # Lock down headers to avoid breaking with new defaults
 BR2_KERNEL_HEADERS_VERSION=y
 BR2_DEFAULT_KERNEL_VERSION="3.1.6"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_1=y
 
 # Host utilities
 #
diff --git a/configs/atngw100_defconfig b/configs/atngw100_defconfig
index 5490241..cf727f9 100644
--- a/configs/atngw100_defconfig
+++ b/configs/atngw100_defconfig
@@ -5,6 +5,7 @@ BR2_avr32=y
 # below.
 BR2_KERNEL_HEADERS_VERSION=y
 BR2_DEFAULT_KERNEL_VERSION="3.9.11"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_9=y
 
 # Filesystems
 BR2_TARGET_ROOTFS_JFFS2=y
diff --git a/configs/atstk100x_defconfig b/configs/atstk100x_defconfig
index f73497c..6a77b41 100644
--- a/configs/atstk100x_defconfig
+++ b/configs/atstk100x_defconfig
@@ -4,6 +4,7 @@ BR2_avr32=y
 # Lock to same version as kernel
 BR2_KERNEL_HEADERS_VERSION=y
 BR2_DEFAULT_KERNEL_VERSION="3.9.11"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_9=y
 
 # U-Boot
 BR2_TARGET_UBOOT=y
diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index 15220ed..3181c66 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -17,6 +17,7 @@ BR2_TARGET_ROOTFS_EXT2=y
 # lock down headers to avoid breaking with new defaults
 BR2_KERNEL_HEADERS_VERSION=y
 BR2_DEFAULT_KERNEL_VERSION="3.12.10"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_12=y
 
 # bootloader
 BR2_TARGET_UBOOT=y
diff --git a/configs/calao_tny_a9g20_lpw_defconfig b/configs/calao_tny_a9g20_lpw_defconfig
index c8c341a..6a71997 100644
--- a/configs/calao_tny_a9g20_lpw_defconfig
+++ b/configs/calao_tny_a9g20_lpw_defconfig
@@ -12,6 +12,7 @@ BR2_TARGET_ROOTFS_UBIFS=y
 # lock down headers to avoid breaking with new defaults
 BR2_KERNEL_HEADERS_VERSION=y
 BR2_DEFAULT_KERNEL_VERSION="3.9.4"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_9=y
 
 # bootloaders
 BR2_TARGET_AT91BOOTSTRAP=y
diff --git a/configs/gnublin_defconfig b/configs/gnublin_defconfig
index acb4551..369c9da 100644
--- a/configs/gnublin_defconfig
+++ b/configs/gnublin_defconfig
@@ -5,6 +5,7 @@ BR2_arm926t=y
 # System
 BR2_KERNEL_HEADERS_VERSION=y
 BR2_DEFAULT_KERNEL_VERSION="3.7"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_7=y
 BR2_TARGET_GENERIC_ISSUE="Welcome to Gnublin"
 
 # Filesystem
diff --git a/configs/mini2440_defconfig b/configs/mini2440_defconfig
index 6adcea0..d7d9ab1 100644
--- a/configs/mini2440_defconfig
+++ b/configs/mini2440_defconfig
@@ -19,6 +19,7 @@ BR2_TARGET_ROOTFS_TAR=y
 # Lock down headers to avoid breaking with new defaults
 BR2_KERNEL_HEADERS_VERSION=y
 BR2_DEFAULT_KERNEL_VERSION="3.0.4"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_0=y
 
 # Bootloader
 BR2_TARGET_UBOOT=y
diff --git a/configs/minnowboard_defconfig b/configs/minnowboard_defconfig
index 5fdfd43..e6f1a55 100644
--- a/configs/minnowboard_defconfig
+++ b/configs/minnowboard_defconfig
@@ -9,6 +9,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/minnowboard/post-build.sh"
 # Lock to 3.8 headers
 BR2_KERNEL_HEADERS_VERSION=y
 BR2_DEFAULT_KERNEL_VERSION="3.8"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_8=y
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
diff --git a/configs/pandaboard_defconfig b/configs/pandaboard_defconfig
index 09f25e1..401a602 100644
--- a/configs/pandaboard_defconfig
+++ b/configs/pandaboard_defconfig
@@ -14,6 +14,7 @@ BR2_TARGET_ROOTFS_EXT2=y
 # Lock to 3.12 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
 BR2_DEFAULT_KERNEL_VERSION="3.12.2"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_12=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index 90ca906..dec1ce0 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -11,6 +11,7 @@ BR2_PACKAGE_RPI_FIRMWARE=y
 # Lock to 3.10 headers as the RPi kernel is based off the 3.10 branch
 BR2_KERNEL_HEADERS_VERSION=y
 BR2_DEFAULT_KERNEL_VERSION="3.10.25"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_10=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
diff --git a/configs/sheevaplug_defconfig b/configs/sheevaplug_defconfig
index 4161766..d036622 100644
--- a/configs/sheevaplug_defconfig
+++ b/configs/sheevaplug_defconfig
@@ -14,6 +14,7 @@ BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_2K_128K=y
 # Lock down headers to avoid breaking with new defaults
 BR2_KERNEL_HEADERS_VERSION=y
 BR2_DEFAULT_KERNEL_VERSION="3.11.8"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_11=y
 
 # bootloader
 BR2_TARGET_UBOOT=y
diff --git a/configs/telit_evk_pro3_defconfig b/configs/telit_evk_pro3_defconfig
index fa9f898..29a8d2a 100644
--- a/configs/telit_evk_pro3_defconfig
+++ b/configs/telit_evk_pro3_defconfig
@@ -5,6 +5,7 @@ BR2_arm926t=y
 # Toolchain
 BR2_KERNEL_HEADERS_VERSION=y
 BR2_DEFAULT_KERNEL_VERSION="3.9.1"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_9=y
 
 # System
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y
diff --git a/configs/zedboard_defconfig b/configs/zedboard_defconfig
index 2a67fdd..071ff65 100644
--- a/configs/zedboard_defconfig
+++ b/configs/zedboard_defconfig
@@ -5,6 +5,7 @@ BR2_ARM_ENABLE_NEON=y
 # Lock to 3.8 headers as the kernel is based off 3.8
 BR2_KERNEL_HEADERS_VERSION=y
 BR2_DEFAULT_KERNEL_VERSION="3.8"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_8=y
 
 BR2_TARGET_GENERIC_GETTY_PORT="ttyPS0"
 
-- 
1.8.3.2
