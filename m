From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Feb 2016 10:59:15 +0100
Subject: [Buildroot] [git commit] defconfigs: all use the headers from the
	kernel
Message-ID: <20160206095926.F1710803FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=674e09967818bf49fd1b6bf1f986a4c0f917fa63
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For most defconfigs, it was trivial to deduce the kernel version, by
just reading the version string, which could be:
  - a standard upstream version string vX.Y.Z
  - a non-standard version string, but still containg the standard X.Y.Z

Those for which it was not so trivial were those hosted on git tree.
Since most were already using a custom linux-headers version, it could
be easily deduced from that. It was confirmed by browsing said git trees
and check the version there.

There are a few cases were there was a mismatch:

  - microzed:     uses a 3.18 kernel, but 3.8 headers; fixed.
  - xilinx_zc706: uses a 3.14 kernel, but 3.8 headers; fixed.
  - zedboard:     uses a 3.18 kernel, but 3.8 headers; fixed.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/acmesystems_aria_g25_128mb_defconfig     | 4 +---
 configs/acmesystems_aria_g25_256mb_defconfig     | 4 +---
 configs/altera_socdk_defconfig                   | 4 +---
 configs/altera_sockit_defconfig                  | 4 +---
 configs/arm_foundationv8_defconfig               | 3 +--
 configs/armadeus_apf27_defconfig                 | 4 +---
 configs/armadeus_apf28_defconfig                 | 4 +---
 configs/armadeus_apf51_defconfig                 | 4 +---
 configs/armadeus_apf9328_defconfig               | 5 +----
 configs/at91sam9260eknf_defconfig                | 4 +---
 configs/at91sam9g20dfc_defconfig                 | 4 +---
 configs/at91sam9g45m10ek_defconfig               | 3 +--
 configs/at91sam9rlek_defconfig                   | 3 +--
 configs/at91sam9x5ek_defconfig                   | 3 +--
 configs/atmel_sama5d3_xplained_defconfig         | 3 +--
 configs/atmel_sama5d3_xplained_mmc_defconfig     | 6 ++----
 configs/atmel_sama5d3xek_defconfig               | 3 +--
 configs/atmel_sama5d4_xplained_defconfig         | 3 +--
 configs/atmel_sama5d4ek_defconfig                | 3 +--
 configs/beaglebone_defconfig                     | 4 +---
 configs/calao_qil_a9260_defconfig                | 3 +--
 configs/calao_tny_a9g20_lpw_defconfig            | 4 +---
 configs/calao_usb_a9260_defconfig                | 2 ++
 configs/calao_usb_a9263_defconfig                | 2 ++
 configs/calao_usb_a9g20_lpw_defconfig            | 2 ++
 configs/ci20_defconfig                           | 6 +++---
 configs/cubieboard2_defconfig                    | 3 +--
 configs/cubieboard_defconfig                     | 4 ++--
 configs/freescale_imx28evk_defconfig             | 2 +-
 configs/freescale_imx31_3stack_defconfig         | 2 +-
 configs/freescale_imx6dlsabreauto_defconfig      | 4 +---
 configs/freescale_imx6dlsabresd_defconfig        | 4 +---
 configs/freescale_imx6qsabreauto_defconfig       | 4 +---
 configs/freescale_imx6qsabresd_defconfig         | 4 +---
 configs/freescale_imx6sololiteevk_defconfig      | 3 +++
 configs/freescale_imx6sxsabresd_defconfig        | 4 +---
 configs/freescale_imx6ulevk_defconfig            | 4 +---
 configs/freescale_mpc8315erdb_defconfig          | 4 +---
 configs/freescale_p1010rdb_pa_defconfig          | 4 +---
 configs/freescale_p2020ds_defconfig              | 4 +---
 configs/galileo_defconfig                        | 3 +--
 configs/kb9202_defconfig                         | 4 +---
 configs/lego_ev3_defconfig                       | 4 +---
 configs/microzed_defconfig                       | 5 ++---
 configs/mini2440_defconfig                       | 5 +----
 configs/minnowboard_defconfig                    | 4 +---
 configs/minnowboard_max_defconfig                | 4 +---
 configs/mx53loco_defconfig                       | 6 +++---
 configs/nitrogen6sx_defconfig                    | 4 +---
 configs/nitrogen6x_defconfig                     | 4 +---
 configs/olimex_a20_olinuxino_lime2_defconfig     | 2 ++
 configs/olimex_a20_olinuxino_lime_defconfig      | 4 +---
 configs/olimex_a20_olinuxino_lime_mali_defconfig | 4 +---
 configs/olimex_a20_olinuxino_micro_defconfig     | 4 +---
 configs/olimex_imx233_olinuxino_defconfig        | 4 +---
 configs/openblocks_a6_defconfig                  | 4 +---
 configs/orangepipc_defconfig                     | 2 ++
 configs/pandaboard_defconfig                     | 4 +---
 configs/qemu_aarch64_virt_defconfig              | 4 +---
 configs/qemu_arm_nuri_defconfig                  | 6 ++----
 configs/qemu_arm_versatile_defconfig             | 4 +---
 configs/qemu_arm_vexpress_defconfig              | 4 +---
 configs/qemu_microblazebe_mmu_defconfig          | 4 +---
 configs/qemu_microblazeel_mmu_defconfig          | 4 +---
 configs/qemu_mips64_malta_defconfig              | 4 +---
 configs/qemu_mips64el_malta_defconfig            | 4 +---
 configs/qemu_mips_malta_defconfig                | 4 +---
 configs/qemu_mipsel_malta_defconfig              | 4 +---
 configs/qemu_ppc64_pseries_defconfig             | 4 +---
 configs/qemu_ppc_g3beige_defconfig               | 4 +---
 configs/qemu_ppc_mpc8544ds_defconfig             | 4 +---
 configs/qemu_ppc_virtex_ml507_defconfig          | 4 +---
 configs/qemu_sh4_r2d_defconfig                   | 4 +---
 configs/qemu_sh4eb_r2d_defconfig                 | 4 +---
 configs/qemu_sparc64_sun4u_defconfig             | 4 +---
 configs/qemu_sparc_ss10_defconfig                | 4 +---
 configs/qemu_x86_64_defconfig                    | 4 +---
 configs/qemu_x86_defconfig                       | 4 +---
 configs/qemu_xtensa_lx60_defconfig               | 4 +---
 configs/qmx6_defconfig                           | 3 +--
 configs/raspberrypi2_defconfig                   | 5 +----
 configs/raspberrypi_defconfig                    | 5 +----
 configs/riotboard_defconfig                      | 4 +---
 configs/s6lx9_microboard_defconfig               | 2 ++
 configs/sheevaplug_defconfig                     | 4 +---
 configs/snps_aarch64_vdk_defconfig               | 3 ++-
 configs/snps_axs101_defconfig                    | 4 +---
 configs/snps_axs103_defconfig                    | 4 +---
 configs/snps_hs38_smp_vdk_defconfig              | 4 +---
 configs/snps_hs38_vdk_defconfig                  | 4 +---
 configs/telit_evk_pro3_defconfig                 | 4 +---
 configs/ts5x00_defconfig                         | 2 +-
 configs/udoo_quad_defconfig                      | 4 +---
 configs/via_imx6_vab820_defconfig                | 4 +---
 configs/wandboard_defconfig                      | 4 ++--
 configs/warpboard_defconfig                      | 4 +---
 configs/xilinx_zc706_defconfig                   | 5 ++---
 configs/zedboard_defconfig                       | 5 ++---
 98 files changed, 118 insertions(+), 257 deletions(-)

diff --git a/configs/acmesystems_aria_g25_128mb_defconfig b/configs/acmesystems_aria_g25_128mb_defconfig
index 91865f5..b619166 100644
--- a/configs/acmesystems_aria_g25_128mb_defconfig
+++ b/configs/acmesystems_aria_g25_128mb_defconfig
@@ -1,9 +1,7 @@
 # Architecture
 BR2_arm=y
 
-# Toolchain
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.1.1"
+# Linux headers same as kernel, a 4.1 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
 
 # Kernel
diff --git a/configs/acmesystems_aria_g25_256mb_defconfig b/configs/acmesystems_aria_g25_256mb_defconfig
index 936b4f4..584d8b4 100644
--- a/configs/acmesystems_aria_g25_256mb_defconfig
+++ b/configs/acmesystems_aria_g25_256mb_defconfig
@@ -1,9 +1,7 @@
 # Architecture
 BR2_arm=y
 
-# Toolchain
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.1.1"
+# Linux headers same as kernel, a 4.1 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
 
 # Kernel
diff --git a/configs/altera_socdk_defconfig b/configs/altera_socdk_defconfig
index 5a27a74..f1916df 100644
--- a/configs/altera_socdk_defconfig
+++ b/configs/altera_socdk_defconfig
@@ -6,9 +6,7 @@ BR2_ARM_ENABLE_NEON=y
 BR2_ARM_FPU_NEON=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
 
-# Lock to 3.13 headers
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.13.5"
+# Linux headers same as kernel, a 3.13 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_13=y
 
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/altera/post-image.sh"
diff --git a/configs/altera_sockit_defconfig b/configs/altera_sockit_defconfig
index dfb895e..d2f219f 100644
--- a/configs/altera_sockit_defconfig
+++ b/configs/altera_sockit_defconfig
@@ -6,9 +6,7 @@ BR2_ARM_ENABLE_NEON=y
 BR2_ARM_FPU_NEON=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
 
-# Lock to 3.13 headers
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.13.5"
+# Linux headers same as kernel, a 3.13 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_13=y
 
 BR2_TARGET_GENERIC_GETTY_BAUDRATE_57600=y
diff --git a/configs/arm_foundationv8_defconfig b/configs/arm_foundationv8_defconfig
index 2deb333..8968c77 100644
--- a/configs/arm_foundationv8_defconfig
+++ b/configs/arm_foundationv8_defconfig
@@ -1,6 +1,5 @@
 BR2_aarch64=y
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.13"
+# Linux headers same as kernel, a 3.13 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_13=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_LINUX_KERNEL=y
diff --git a/configs/armadeus_apf27_defconfig b/configs/armadeus_apf27_defconfig
index b779e6b..04a7cdc 100644
--- a/configs/armadeus_apf27_defconfig
+++ b/configs/armadeus_apf27_defconfig
@@ -2,9 +2,7 @@
 BR2_arm=y
 BR2_arm926t=y
 
-# Lock down headers to avoid breaking with new defaults
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.18.6"
+# Linux headers same as kernel, a 3.18 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
 
 # System
diff --git a/configs/armadeus_apf28_defconfig b/configs/armadeus_apf28_defconfig
index 95d56a5..cbaf5b7 100644
--- a/configs/armadeus_apf28_defconfig
+++ b/configs/armadeus_apf28_defconfig
@@ -2,9 +2,7 @@
 BR2_arm=y
 BR2_arm926t=y
 
-# Lock down headers to avoid breaking with new defaults
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.12.7"
+# Linux headers same as kernel, a 3.12 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_12=y
 
 # System
diff --git a/configs/armadeus_apf51_defconfig b/configs/armadeus_apf51_defconfig
index 7e932fb..ac01c1d 100644
--- a/configs/armadeus_apf51_defconfig
+++ b/configs/armadeus_apf51_defconfig
@@ -2,9 +2,7 @@
 BR2_arm=y
 BR2_cortex_a8=y
 
-# Lock down headers to avoid breaking with new defaults
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.12.6"
+# Linux headers same as kernel, a 3.12 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_12=y
 
 # System
diff --git a/configs/armadeus_apf9328_defconfig b/configs/armadeus_apf9328_defconfig
index d6388db..d1526a5 100644
--- a/configs/armadeus_apf9328_defconfig
+++ b/configs/armadeus_apf9328_defconfig
@@ -10,10 +10,7 @@ BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
 BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
-
-# Lock down headers to avoid breaking with new defaults
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.17"
+# Linux headers same as kernel, a 3.17 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_17=y
 
 # System
diff --git a/configs/at91sam9260eknf_defconfig b/configs/at91sam9260eknf_defconfig
index dba0cd5..d01cfeb 100644
--- a/configs/at91sam9260eknf_defconfig
+++ b/configs/at91sam9260eknf_defconfig
@@ -2,9 +2,7 @@
 BR2_arm=y
 BR2_arm926t=y
 
-# Toolchain
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.9.1"
+# Linux headers same as kernel, a 3.9 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_9=y
 
 # System
diff --git a/configs/at91sam9g20dfc_defconfig b/configs/at91sam9g20dfc_defconfig
index 1d346c2..4ed5a9b 100644
--- a/configs/at91sam9g20dfc_defconfig
+++ b/configs/at91sam9g20dfc_defconfig
@@ -2,9 +2,7 @@
 BR2_arm=y
 BR2_arm926t=y
 
-# Lock down headers to avoid breaking with new defaults
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.1.6"
+# Linux headers same as kernel, a 3.1 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_1=y
 
 # Host utilities
diff --git a/configs/at91sam9g45m10ek_defconfig b/configs/at91sam9g45m10ek_defconfig
index d03b453..ab6083e 100644
--- a/configs/at91sam9g45m10ek_defconfig
+++ b/configs/at91sam9g45m10ek_defconfig
@@ -1,7 +1,6 @@
 BR2_arm=y
 BR2_arm926t=y
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.18"
+# Linux headers same as kernel, a 3.18 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
diff --git a/configs/at91sam9rlek_defconfig b/configs/at91sam9rlek_defconfig
index 23f1ebd..1980e21 100644
--- a/configs/at91sam9rlek_defconfig
+++ b/configs/at91sam9rlek_defconfig
@@ -1,7 +1,6 @@
 BR2_arm=y
 BR2_arm926t=y
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.18"
+# Linux headers same as kernel, a 3.18 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
diff --git a/configs/at91sam9x5ek_defconfig b/configs/at91sam9x5ek_defconfig
index 98c5a3e..df7cff6 100644
--- a/configs/at91sam9x5ek_defconfig
+++ b/configs/at91sam9x5ek_defconfig
@@ -1,7 +1,6 @@
 BR2_arm=y
 BR2_arm926t=y
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.18"
+# Linux headers same as kernel, a 3.18 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
diff --git a/configs/atmel_sama5d3_xplained_defconfig b/configs/atmel_sama5d3_xplained_defconfig
index b8674ad..74f613c 100644
--- a/configs/atmel_sama5d3_xplained_defconfig
+++ b/configs/atmel_sama5d3_xplained_defconfig
@@ -3,8 +3,7 @@ BR2_cortex_a5=y
 BR2_ARM_EABIHF=y
 BR2_ARM_FPU_VFPV4D16=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.18"
+# Linux headers same as kernel, a 3.18 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
diff --git a/configs/atmel_sama5d3_xplained_mmc_defconfig b/configs/atmel_sama5d3_xplained_mmc_defconfig
index 087f4fa..a0c1329 100644
--- a/configs/atmel_sama5d3_xplained_mmc_defconfig
+++ b/configs/atmel_sama5d3_xplained_mmc_defconfig
@@ -1,11 +1,9 @@
 # Architecture
 BR2_arm=y
 BR2_cortex_a5=y
-
-# Toolchain configuration
 BR2_ARM_EABIHF=y
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.18.8"
+
+# Linux headers same as kernel, a 3.18 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
 
 # Kernel configuration
diff --git a/configs/atmel_sama5d3xek_defconfig b/configs/atmel_sama5d3xek_defconfig
index cc34bf9..64eabe8 100644
--- a/configs/atmel_sama5d3xek_defconfig
+++ b/configs/atmel_sama5d3xek_defconfig
@@ -3,8 +3,7 @@ BR2_cortex_a5=y
 BR2_ARM_EABIHF=y
 BR2_ARM_FPU_VFPV4D16=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.18"
+# Linux headers same as kernel, a 3.18 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
diff --git a/configs/atmel_sama5d4_xplained_defconfig b/configs/atmel_sama5d4_xplained_defconfig
index 84b6518..67e2eb2 100644
--- a/configs/atmel_sama5d4_xplained_defconfig
+++ b/configs/atmel_sama5d4_xplained_defconfig
@@ -4,8 +4,7 @@ BR2_ARM_EABIHF=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_FPU_VFPV4D16=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.18"
+# Linux headers same as kernel, a 3.18 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
diff --git a/configs/atmel_sama5d4ek_defconfig b/configs/atmel_sama5d4ek_defconfig
index 36b625b..73d0a18 100644
--- a/configs/atmel_sama5d4ek_defconfig
+++ b/configs/atmel_sama5d4ek_defconfig
@@ -4,8 +4,7 @@ BR2_ARM_EABIHF=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_FPU_VFPV4D16=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.18"
+# Linux headers same as kernel, a 3.18 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index ddb583c..c3f5276 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -15,9 +15,7 @@ BR2_PACKAGE_AM33X_CM3=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# lock down headers to avoid breaking with new defaults
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.12.10"
+# Linux headers same as kernel, a 3.12 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_12=y
 
 # bootloader
diff --git a/configs/calao_qil_a9260_defconfig b/configs/calao_qil_a9260_defconfig
index f18337f..271a034 100644
--- a/configs/calao_qil_a9260_defconfig
+++ b/configs/calao_qil_a9260_defconfig
@@ -2,8 +2,7 @@ BR2_arm=y
 BR2_arm926t=y
 BR2_GLOBAL_PATCH_DIR="board/calao/qil-a9260/patches/"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS1"
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.4"
+# Linux headers same as kernel, a 3.4 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_4=y
 BR2_PACKAGE_HOST_SAM_BA=y
 BR2_TARGET_ROOTFS_UBIFS=y
diff --git a/configs/calao_tny_a9g20_lpw_defconfig b/configs/calao_tny_a9g20_lpw_defconfig
index 6a71997..1b38092 100644
--- a/configs/calao_tny_a9g20_lpw_defconfig
+++ b/configs/calao_tny_a9g20_lpw_defconfig
@@ -9,9 +9,7 @@ BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y
 # filesystem
 BR2_TARGET_ROOTFS_UBIFS=y
 
-# lock down headers to avoid breaking with new defaults
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.9.4"
+# Linux headers same as kernel, a 3.9 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_9=y
 
 # bootloaders
diff --git a/configs/calao_usb_a9260_defconfig b/configs/calao_usb_a9260_defconfig
index 304dc50..fa1c51e 100644
--- a/configs/calao_usb_a9260_defconfig
+++ b/configs/calao_usb_a9260_defconfig
@@ -1,5 +1,7 @@
 BR2_arm=y
 BR2_arm926t=y
+# Linux headers same as kernel, a 3.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_10=y
 BR2_PACKAGE_MTD=y
 BR2_PACKAGE_HOST_SAM_BA=y
 BR2_TARGET_ROOTFS_UBIFS=y
diff --git a/configs/calao_usb_a9263_defconfig b/configs/calao_usb_a9263_defconfig
index 8dc948a..ab8f2d0 100644
--- a/configs/calao_usb_a9263_defconfig
+++ b/configs/calao_usb_a9263_defconfig
@@ -1,5 +1,7 @@
 BR2_arm=y
 BR2_arm926t=y
+# Linux headers same as kernel, a 3.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_10=y
 BR2_PACKAGE_HOST_SAM_BA=y
 BR2_TARGET_ROOTFS_UBIFS=y
 BR2_TARGET_AT91BOOTSTRAP=y
diff --git a/configs/calao_usb_a9g20_lpw_defconfig b/configs/calao_usb_a9g20_lpw_defconfig
index e9d0665..7cfa34c 100644
--- a/configs/calao_usb_a9g20_lpw_defconfig
+++ b/configs/calao_usb_a9g20_lpw_defconfig
@@ -1,5 +1,7 @@
 BR2_arm=y
 BR2_arm926t=y
+# Linux headers same as kernel, a 3.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_10=y
 BR2_GLOBAL_PATCH_DIR="board/calao/usb-a9g20-lpw/patches/"
 BR2_PACKAGE_HOST_SAM_BA=y
 BR2_TARGET_ROOTFS_UBIFS=y
diff --git a/configs/ci20_defconfig b/configs/ci20_defconfig
index e87181a..0455170 100644
--- a/configs/ci20_defconfig
+++ b/configs/ci20_defconfig
@@ -3,10 +3,10 @@ BR2_mipsel=y
 BR2_mips_32r2=y
 # BR2_MIPS_SOFT_FLOAT is not set
 
-# system
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.18"
+# Linux headers same as kernel, a 3.18 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
+
+# system
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS4"
 
 # kernel
diff --git a/configs/cubieboard2_defconfig b/configs/cubieboard2_defconfig
index f277b72..9511cba 100644
--- a/configs/cubieboard2_defconfig
+++ b/configs/cubieboard2_defconfig
@@ -1,8 +1,7 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.3.3"
+# Linux headers same as kernel, a 4.3 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
 BR2_TARGET_GENERIC_HOSTNAME="Cubieboard2"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Cubieboard2!"
diff --git a/configs/cubieboard_defconfig b/configs/cubieboard_defconfig
index ef4e365..498999b 100644
--- a/configs/cubieboard_defconfig
+++ b/configs/cubieboard_defconfig
@@ -16,8 +16,8 @@ BR2_PACKAGE_SUNXI_TOOLS=y
 BR2_PACKAGE_SUNXI_BOARDS=y
 BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE="a10/cubieboard.fex"
 
-# Kernel headers
-BR2_KERNEL_HEADERS_3_4=y
+# Linux headers same as kernel, a 3.4 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_4=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
diff --git a/configs/freescale_imx28evk_defconfig b/configs/freescale_imx28evk_defconfig
index 3f2f9e7..8cb31dc 100644
--- a/configs/freescale_imx28evk_defconfig
+++ b/configs/freescale_imx28evk_defconfig
@@ -2,7 +2,7 @@
 BR2_arm=y
 BR2_arm926t=y
 
-# toolchain
+# Linux headers same as kernel, a 3.19 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_19=y
 
 # system
diff --git a/configs/freescale_imx31_3stack_defconfig b/configs/freescale_imx31_3stack_defconfig
index ded6563..df8c00d 100644
--- a/configs/freescale_imx31_3stack_defconfig
+++ b/configs/freescale_imx31_3stack_defconfig
@@ -3,7 +3,7 @@ BR2_arm=y
 BR2_arm1136jf_s_r0=y
 BR2_ARM_EABIHF=y
 
-# toolchain
+# Linux headers same as kernel, a 3.15 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_15=y
 
 # system
diff --git a/configs/freescale_imx6dlsabreauto_defconfig b/configs/freescale_imx6dlsabreauto_defconfig
index 0de8eea..c3abbe3 100644
--- a/configs/freescale_imx6dlsabreauto_defconfig
+++ b/configs/freescale_imx6dlsabreauto_defconfig
@@ -5,9 +5,7 @@ BR2_cortex_a9=y
 # patches
 BR2_GLOBAL_PATCH_DIR="board/freescale/imx6sabre/patches"
 
-# toolchain
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.14.28"
+# Linux headers same as kernel, a 3.14 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14=y
 
 # system
diff --git a/configs/freescale_imx6dlsabresd_defconfig b/configs/freescale_imx6dlsabresd_defconfig
index 3010d7d..f3db089 100644
--- a/configs/freescale_imx6dlsabresd_defconfig
+++ b/configs/freescale_imx6dlsabresd_defconfig
@@ -5,9 +5,7 @@ BR2_cortex_a9=y
 # patches
 BR2_GLOBAL_PATCH_DIR="board/freescale/imx6sabre/patches"
 
-# toolchain
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.14.28"
+# Linux headers same as kernel, a 3.14 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14=y
 
 # system
diff --git a/configs/freescale_imx6qsabreauto_defconfig b/configs/freescale_imx6qsabreauto_defconfig
index 70367a7..e94e114 100644
--- a/configs/freescale_imx6qsabreauto_defconfig
+++ b/configs/freescale_imx6qsabreauto_defconfig
@@ -5,9 +5,7 @@ BR2_cortex_a9=y
 # patches
 BR2_GLOBAL_PATCH_DIR="board/freescale/imx6sabre/patches"
 
-# toolchain
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.14.28"
+# Linux headers same as kernel, a 3.14 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14=y
 
 # system
diff --git a/configs/freescale_imx6qsabresd_defconfig b/configs/freescale_imx6qsabresd_defconfig
index 3fad77a..17ad1b5 100644
--- a/configs/freescale_imx6qsabresd_defconfig
+++ b/configs/freescale_imx6qsabresd_defconfig
@@ -5,9 +5,7 @@ BR2_cortex_a9=y
 # patches
 BR2_GLOBAL_PATCH_DIR="board/freescale/imx6sabre/patches"
 
-# toolchain
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.14.28"
+# Linux headers same as kernel, a 3.14 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14=y
 
 # system
diff --git a/configs/freescale_imx6sololiteevk_defconfig b/configs/freescale_imx6sololiteevk_defconfig
index 5d98e9a..4f7d91d 100644
--- a/configs/freescale_imx6sololiteevk_defconfig
+++ b/configs/freescale_imx6sololiteevk_defconfig
@@ -2,6 +2,9 @@
 BR2_arm=y
 BR2_cortex_a9=y
 
+# Linux headers same as kernel, a 3.14 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14=y
+
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 
diff --git a/configs/freescale_imx6sxsabresd_defconfig b/configs/freescale_imx6sxsabresd_defconfig
index bd0d6cc..7d8e815 100644
--- a/configs/freescale_imx6sxsabresd_defconfig
+++ b/configs/freescale_imx6sxsabresd_defconfig
@@ -5,9 +5,7 @@ BR2_cortex_a9=y
 # patches
 BR2_GLOBAL_PATCH_DIR="board/freescale/imx6sabre/patches"
 
-# toolchain
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.10.53"
+# Linux headers same as kernel, a 3.10 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_10=y
 
 # system
diff --git a/configs/freescale_imx6ulevk_defconfig b/configs/freescale_imx6ulevk_defconfig
index b739ff4..8359206 100644
--- a/configs/freescale_imx6ulevk_defconfig
+++ b/configs/freescale_imx6ulevk_defconfig
@@ -2,9 +2,7 @@
 BR2_arm=y
 BR2_cortex_a7=y
 
-# toolchain
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.14.28"
+# Linux headers same as kernel, a 3.14 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14=y
 
 # system
diff --git a/configs/freescale_mpc8315erdb_defconfig b/configs/freescale_mpc8315erdb_defconfig
index 9ffef82..457736e 100644
--- a/configs/freescale_mpc8315erdb_defconfig
+++ b/configs/freescale_mpc8315erdb_defconfig
@@ -10,9 +10,7 @@ BR2_TARGET_ROOTFS_JFFS2_CUSTOM_PAGESIZE=0x200
 BR2_TARGET_ROOTFS_JFFS2_CUSTOM_EBSIZE=0x4000
 BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER=y
 
-# Lock headers version to match and avoid breakage
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.2.5"
+# Linux headers same as kernel, a 4.2 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
 
 # Kernel
diff --git a/configs/freescale_p1010rdb_pa_defconfig b/configs/freescale_p1010rdb_pa_defconfig
index 699df2d..93096de 100644
--- a/configs/freescale_p1010rdb_pa_defconfig
+++ b/configs/freescale_p1010rdb_pa_defconfig
@@ -9,9 +9,7 @@ BR2_TARGET_ROOTFS_JFFS2_CUSTOM=y
 BR2_TARGET_ROOTFS_JFFS2_CUSTOM_PAGESIZE=0x20
 BR2_TARGET_ROOTFS_JFFS2_CUSTOM_EBSIZE=0x20000
 
-# Lock headers version to match and avoid breakage
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.1.4"
+# Linux headers same as kernel, a 4.1 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
 
 # Kernel
diff --git a/configs/freescale_p2020ds_defconfig b/configs/freescale_p2020ds_defconfig
index 387cf58..6661acb 100644
--- a/configs/freescale_p2020ds_defconfig
+++ b/configs/freescale_p2020ds_defconfig
@@ -6,9 +6,7 @@ BR2_powerpc_8548=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_JFFS2=y
 
-# Lock to 3.12 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.12.33"
+# Linux headers same as kernel, a 3.12 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_12=y
 
 # Kernel
diff --git a/configs/galileo_defconfig b/configs/galileo_defconfig
index 95ddfc1..ba8f62f 100644
--- a/configs/galileo_defconfig
+++ b/configs/galileo_defconfig
@@ -1,6 +1,5 @@
 BR2_x86_x1000=y
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.8"
+# Linux headers same as kernel, a 3.8 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_8=y
 # Binutils 2.25 is required as this enables stripping the LOCK prefix
 BR2_BINUTILS_VERSION_2_25_X=y
diff --git a/configs/kb9202_defconfig b/configs/kb9202_defconfig
index 1d01a22..c38adbf 100644
--- a/configs/kb9202_defconfig
+++ b/configs/kb9202_defconfig
@@ -5,9 +5,7 @@ BR2_arm920t=y
 # Filesystem
 BR2_TARGET_ROOTFS_TAR=y
 
-# Lock down headers to avoid breaking with new defaults
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="2.6.38.8"
+# Linux headers same as kernel, a 2.6 series (so, no option selected)
 
 # Kernel
 BR2_LINUX_KERNEL=y
diff --git a/configs/lego_ev3_defconfig b/configs/lego_ev3_defconfig
index e4c7fac..d49fa06 100644
--- a/configs/lego_ev3_defconfig
+++ b/configs/lego_ev3_defconfig
@@ -10,9 +10,7 @@ BR2_GCC_VERSION_4_7_X=y
 BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS1"
 
-# Lock to 3.3 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.3"
+# Linux headers same as kernel, a 3.3 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_3=y
 
 # Kernel
diff --git a/configs/microzed_defconfig b/configs/microzed_defconfig
index 989170c..c73fae5 100644
--- a/configs/microzed_defconfig
+++ b/configs/microzed_defconfig
@@ -1,9 +1,8 @@
 BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.8"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_8=y
+# Linux headers same as kernel, a 3.18 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyPS0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
diff --git a/configs/mini2440_defconfig b/configs/mini2440_defconfig
index e8b55cd..2891d10 100644
--- a/configs/mini2440_defconfig
+++ b/configs/mini2440_defconfig
@@ -15,10 +15,7 @@ BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER=y
 BR2_TARGET_ROOTFS_JFFS2_LE=y
 BR2_TARGET_ROOTFS_TAR=y
 
-
-# Lock down headers to avoid breaking with new defaults
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.0.4"
+# Linux headers same as kernel, a 3.0 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_0=y
 
 # Bootloader
diff --git a/configs/minnowboard_defconfig b/configs/minnowboard_defconfig
index e6f1a55..3091957 100644
--- a/configs/minnowboard_defconfig
+++ b/configs/minnowboard_defconfig
@@ -6,9 +6,7 @@ BR2_x86_atom=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyPCH0"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/minnowboard/post-build.sh"
 
-# Lock to 3.8 headers
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.8"
+# Linux headers same as kernel, a 3.8 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_8=y
 
 # Linux kernel
diff --git a/configs/minnowboard_max_defconfig b/configs/minnowboard_max_defconfig
index 5603aa9..98996db 100644
--- a/configs/minnowboard_max_defconfig
+++ b/configs/minnowboard_max_defconfig
@@ -6,9 +6,7 @@ BR2_x86_atom=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/minnowboard-max/post-build.sh"
 
-# Lock to 4.4 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.4"
+# Linux headers same as kernel, a 4.4 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
 
 # Needed for ethernet
diff --git a/configs/mx53loco_defconfig b/configs/mx53loco_defconfig
index 942dedf..bc09bd2 100644
--- a/configs/mx53loco_defconfig
+++ b/configs/mx53loco_defconfig
@@ -2,15 +2,15 @@
 BR2_arm=y
 BR2_cortex_a8=y
 
+# Linux headers same as kernel, a 2.6 series (so, no option selected)
+
 # System
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="2.6.35"
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 
-#??Bootloader
+# Bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx53loco"
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
diff --git a/configs/nitrogen6sx_defconfig b/configs/nitrogen6sx_defconfig
index 5155afe..e69fafc 100644
--- a/configs/nitrogen6sx_defconfig
+++ b/configs/nitrogen6sx_defconfig
@@ -14,9 +14,7 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 
-# Lock headers to match kernel
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.14.28"
+# Linux headers same as kernel, a 3.14 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14=y
 
 # bootloader
diff --git a/configs/nitrogen6x_defconfig b/configs/nitrogen6x_defconfig
index 62a3007..d8da188 100644
--- a/configs/nitrogen6x_defconfig
+++ b/configs/nitrogen6x_defconfig
@@ -14,9 +14,7 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 
-# Lock headers to match kernel
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.14.28"
+# Linux headers same as kernel, a 3.14 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14=y
 
 # bootloader
diff --git a/configs/olimex_a20_olinuxino_lime2_defconfig b/configs/olimex_a20_olinuxino_lime2_defconfig
index 7580ce0..1a2bb45 100644
--- a/configs/olimex_a20_olinuxino_lime2_defconfig
+++ b/configs/olimex_a20_olinuxino_lime2_defconfig
@@ -1,6 +1,8 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_EABIHF=y
+# Linux headers same as kernel, a 4.1 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
 BR2_TARGET_GENERIC_HOSTNAME="a20-olinuxino"
 BR2_TARGET_GENERIC_ISSUE="Welcome to OLinuXino!"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
diff --git a/configs/olimex_a20_olinuxino_lime_defconfig b/configs/olimex_a20_olinuxino_lime_defconfig
index 241518a..e6c33c8 100644
--- a/configs/olimex_a20_olinuxino_lime_defconfig
+++ b/configs/olimex_a20_olinuxino_lime_defconfig
@@ -3,9 +3,7 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_EABIHF=y
 
-# Lock to 4.4 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.4"
+# Linux headers same as kernel, a 4.4 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
 
 # System configuration
diff --git a/configs/olimex_a20_olinuxino_lime_mali_defconfig b/configs/olimex_a20_olinuxino_lime_mali_defconfig
index 2a9fa2b..ca71b55 100644
--- a/configs/olimex_a20_olinuxino_lime_mali_defconfig
+++ b/configs/olimex_a20_olinuxino_lime_mali_defconfig
@@ -3,9 +3,7 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_EABIHF=y
 
-# Lock to 3.4 headers as the sunxi kernel is based off the 3.4 branch
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.4.108"
+# Linux headers same as kernel, a 3.4 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_4=y
 
 # System configuration
diff --git a/configs/olimex_a20_olinuxino_micro_defconfig b/configs/olimex_a20_olinuxino_micro_defconfig
index 23dd0f0..da2fd8a 100644
--- a/configs/olimex_a20_olinuxino_micro_defconfig
+++ b/configs/olimex_a20_olinuxino_micro_defconfig
@@ -4,9 +4,7 @@ BR2_cortex_a7=y
 BR2_ARM_EABIHF=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
-# Lock to 4.0 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.0.5"
+# Linux headers same as kernel, a 4.0 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_0=y
 
 # System configuration
diff --git a/configs/olimex_imx233_olinuxino_defconfig b/configs/olimex_imx233_olinuxino_defconfig
index 49a9f0f..2184ad8 100644
--- a/configs/olimex_imx233_olinuxino_defconfig
+++ b/configs/olimex_imx233_olinuxino_defconfig
@@ -13,9 +13,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock headers version to match and avoid breakage
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.18.2"
+# Linux headers same as kernel, a 3.18 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
 
 # Bootloader
diff --git a/configs/openblocks_a6_defconfig b/configs/openblocks_a6_defconfig
index 5147785..c0d529c 100644
--- a/configs/openblocks_a6_defconfig
+++ b/configs/openblocks_a6_defconfig
@@ -11,9 +11,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_TARGET_ROOTFS_JFFS2=y
 BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_128K=y
 
-# Lock to 3.18 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.18.1"
+# Linux headers same as kernel, a 3.18 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
 
 # kernel
diff --git a/configs/orangepipc_defconfig b/configs/orangepipc_defconfig
index fcff599..3f1aaac 100644
--- a/configs/orangepipc_defconfig
+++ b/configs/orangepipc_defconfig
@@ -1,6 +1,8 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_VFPV4=y
+# Kernel is a pre-release of 4.5, so we do not yet have a _CUSTOM_4_5
+# option for the headers. Thus, we stick with the 4.4 headers for now.
 BR2_KERNEL_HEADERS_VERSION=y
 BR2_DEFAULT_KERNEL_VERSION="4.4"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
diff --git a/configs/pandaboard_defconfig b/configs/pandaboard_defconfig
index 50c3714..93ec1b0 100644
--- a/configs/pandaboard_defconfig
+++ b/configs/pandaboard_defconfig
@@ -11,9 +11,7 @@ BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.12 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.12.2"
+# Linux headers same as kernel, a 3.12 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_12=y
 
 # Kernel
diff --git a/configs/qemu_aarch64_virt_defconfig b/configs/qemu_aarch64_virt_defconfig
index a695afb..e63cb13 100644
--- a/configs/qemu_aarch64_virt_defconfig
+++ b/configs/qemu_aarch64_virt_defconfig
@@ -9,9 +9,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Lock to 4.3 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.3"
+# Linux headers same as kernel, a 4.3 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
 
 # Kernel
diff --git a/configs/qemu_arm_nuri_defconfig b/configs/qemu_arm_nuri_defconfig
index 222f325..ef221a5 100644
--- a/configs/qemu_arm_nuri_defconfig
+++ b/configs/qemu_arm_nuri_defconfig
@@ -12,15 +12,13 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttySAC1"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Lock to 3.10 headers to avoid breaking with newer kernels
-# Stuck at 3.10.x because there's no Nuri DTS
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.10.92"
+# Linux headers same as kernel, a 4.4 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_10=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+# Stuck at 3.10.x because there's no Nuri DTS
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.10.92"
 BR2_LINUX_KERNEL_DEFCONFIG="exynos4"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
index 1ac59fd..1803ef0 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -10,9 +10,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 4.3 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.3"
+# Linux headers same as kernel, a 4.3 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
 
 # Kernel
diff --git a/configs/qemu_arm_vexpress_defconfig b/configs/qemu_arm_vexpress_defconfig
index e1808e9..051c68d 100644
--- a/configs/qemu_arm_vexpress_defconfig
+++ b/configs/qemu_arm_vexpress_defconfig
@@ -13,9 +13,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 4.3 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.3"
+# Linux headers same as kernel, a 4.3 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
 
 # Kernel
diff --git a/configs/qemu_microblazebe_mmu_defconfig b/configs/qemu_microblazebe_mmu_defconfig
index e8fcaec..16f35ff 100644
--- a/configs/qemu_microblazebe_mmu_defconfig
+++ b/configs/qemu_microblazebe_mmu_defconfig
@@ -10,9 +10,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyUL0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Lock to 4.3 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.3"
+# Linux headers same as kernel, a 4.3 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
 
 # Kernel
diff --git a/configs/qemu_microblazeel_mmu_defconfig b/configs/qemu_microblazeel_mmu_defconfig
index 01a423b..72b0d8b 100644
--- a/configs/qemu_microblazeel_mmu_defconfig
+++ b/configs/qemu_microblazeel_mmu_defconfig
@@ -10,9 +10,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyUL0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Lock to 4.3 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.3"
+# Linux headers same as kernel, a 4.3 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
 
 # Kernel
diff --git a/configs/qemu_mips64_malta_defconfig b/configs/qemu_mips64_malta_defconfig
index 736ca70..e753d05 100644
--- a/configs/qemu_mips64_malta_defconfig
+++ b/configs/qemu_mips64_malta_defconfig
@@ -9,9 +9,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 4.3 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.3"
+# Linux headers same as kernel, a 4.3 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
 
 # Kernel
diff --git a/configs/qemu_mips64el_malta_defconfig b/configs/qemu_mips64el_malta_defconfig
index 4c29ed5..1bf40c0 100644
--- a/configs/qemu_mips64el_malta_defconfig
+++ b/configs/qemu_mips64el_malta_defconfig
@@ -9,9 +9,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 4.3 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.3"
+# Linux headers same as kernel, a 4.3 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
 
 # Kernel
diff --git a/configs/qemu_mips_malta_defconfig b/configs/qemu_mips_malta_defconfig
index 4913490..758ddf7 100644
--- a/configs/qemu_mips_malta_defconfig
+++ b/configs/qemu_mips_malta_defconfig
@@ -9,9 +9,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 4.3 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.3"
+# Linux headers same as kernel, a 4.3 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
 
 # Kernel
diff --git a/configs/qemu_mipsel_malta_defconfig b/configs/qemu_mipsel_malta_defconfig
index f3f513b..9ae2dda 100644
--- a/configs/qemu_mipsel_malta_defconfig
+++ b/configs/qemu_mipsel_malta_defconfig
@@ -9,9 +9,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 4.3 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.3"
+# Linux headers same as kernel, a 4.3 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
 
 # Kernel
diff --git a/configs/qemu_ppc64_pseries_defconfig b/configs/qemu_ppc64_pseries_defconfig
index 08d6cbb..cd28139 100644
--- a/configs/qemu_ppc64_pseries_defconfig
+++ b/configs/qemu_ppc64_pseries_defconfig
@@ -10,9 +10,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="hvc0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 4.3 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.3"
+# Linux headers same as kernel, a 4.3 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
 
 # Kernel
diff --git a/configs/qemu_ppc_g3beige_defconfig b/configs/qemu_ppc_g3beige_defconfig
index a344f53..fb6fb11 100644
--- a/configs/qemu_ppc_g3beige_defconfig
+++ b/configs/qemu_ppc_g3beige_defconfig
@@ -9,9 +9,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 4.3 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.3"
+# Linux headers same as kernel, a 4.3 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
 
 # Kernel
diff --git a/configs/qemu_ppc_mpc8544ds_defconfig b/configs/qemu_ppc_mpc8544ds_defconfig
index f89fcca..8ebc2a6 100644
--- a/configs/qemu_ppc_mpc8544ds_defconfig
+++ b/configs/qemu_ppc_mpc8544ds_defconfig
@@ -9,9 +9,7 @@ BR2_SYSTEM_DHCP="eth0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Lock to 4.3 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.3"
+# Linux headers same as kernel, a 4.3 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
 
 # Kernel
diff --git a/configs/qemu_ppc_virtex_ml507_defconfig b/configs/qemu_ppc_virtex_ml507_defconfig
index 71f1492..b05ffb0 100644
--- a/configs/qemu_ppc_virtex_ml507_defconfig
+++ b/configs/qemu_ppc_virtex_ml507_defconfig
@@ -6,9 +6,7 @@ BR2_powerpc_440=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Lock to 4.3 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.3"
+# Linux headers same as kernel, a 4.3 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
 
 # Use soft float
diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
index 8197738..7b9932b 100644
--- a/configs/qemu_sh4_r2d_defconfig
+++ b/configs/qemu_sh4_r2d_defconfig
@@ -10,9 +10,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttySC1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 4.3 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.3"
+# Linux headers same as kernel, a 4.3 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
 
 # Linux kernel
diff --git a/configs/qemu_sh4eb_r2d_defconfig b/configs/qemu_sh4eb_r2d_defconfig
index 1417699..4839644 100644
--- a/configs/qemu_sh4eb_r2d_defconfig
+++ b/configs/qemu_sh4eb_r2d_defconfig
@@ -9,9 +9,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttySC1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 4.3 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.3"
+# Linux headers same as kernel, a 4.3 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
 
 # Linux kernel
diff --git a/configs/qemu_sparc64_sun4u_defconfig b/configs/qemu_sparc64_sun4u_defconfig
index 00ceb89..66e7ef8 100644
--- a/configs/qemu_sparc64_sun4u_defconfig
+++ b/configs/qemu_sparc64_sun4u_defconfig
@@ -9,9 +9,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 4.3 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.3"
+# Linux headers same as kernel, a 4.3 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
 
 # Linux kernel
diff --git a/configs/qemu_sparc_ss10_defconfig b/configs/qemu_sparc_ss10_defconfig
index 6bb1c81..edc770c 100644
--- a/configs/qemu_sparc_ss10_defconfig
+++ b/configs/qemu_sparc_ss10_defconfig
@@ -9,9 +9,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 4.3 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.3"
+# Linux headers same as kernel, a 4.3 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
 
 # Linux kernel
diff --git a/configs/qemu_x86_64_defconfig b/configs/qemu_x86_64_defconfig
index 22983bf..5ac67f4 100644
--- a/configs/qemu_x86_64_defconfig
+++ b/configs/qemu_x86_64_defconfig
@@ -9,9 +9,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 4.3 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.3"
+# Linux headers same as kernel, a 4.3 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
 
 # Kernel
diff --git a/configs/qemu_x86_defconfig b/configs/qemu_x86_defconfig
index 0e1316d..17de5d1 100644
--- a/configs/qemu_x86_defconfig
+++ b/configs/qemu_x86_defconfig
@@ -10,9 +10,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 4.3 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.3"
+# Linux headers same as kernel, a 4.3 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
 
 # Kernel
diff --git a/configs/qemu_xtensa_lx60_defconfig b/configs/qemu_xtensa_lx60_defconfig
index 42b844c..8c21357 100644
--- a/configs/qemu_xtensa_lx60_defconfig
+++ b/configs/qemu_xtensa_lx60_defconfig
@@ -16,9 +16,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Lock to 4.3 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.3"
+# Linux headers same as kernel, a 4.3 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
 
 # Kernel
diff --git a/configs/qmx6_defconfig b/configs/qmx6_defconfig
index a829b4c..49c39bc 100644
--- a/configs/qmx6_defconfig
+++ b/configs/qmx6_defconfig
@@ -1,7 +1,6 @@
 BR2_arm=y
 BR2_cortex_a9=y
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.14.28"
+# Linux headers same as kernel, a 3.14 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
 
diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
index 8e9aa66..ce41ee3 100644
--- a/configs/raspberrypi2_defconfig
+++ b/configs/raspberrypi2_defconfig
@@ -7,10 +7,7 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 
-# Lock to 4.1 headers as the RPi kernel stable tree is
-# based off the 4.1 branch
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.1.15"
+# Linux headers same as kernel, a 4.1 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
 
 BR2_LINUX_KERNEL=y
diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index a6db191..3b3cc50 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -4,10 +4,7 @@ BR2_ARM_EABIHF=y
 
 BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 
-# Lock to 4.1 headers as the RPi kernel stable tree is
-# based off the 4.1 branch
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.1.15"
+# Linux headers same as kernel, a 4.1 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
 
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
diff --git a/configs/riotboard_defconfig b/configs/riotboard_defconfig
index 8a3f6b7..b6d69a8 100644
--- a/configs/riotboard_defconfig
+++ b/configs/riotboard_defconfig
@@ -19,9 +19,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2015.10"
 BR2_TARGET_UBOOT_BOARDNAME="riotboard"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 
-# kernel headers
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.2.6"
+# Linux headers same as kernel, a 4.2 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
 
 # kernel
diff --git a/configs/s6lx9_microboard_defconfig b/configs/s6lx9_microboard_defconfig
index c54f3f4..06a3ed3 100644
--- a/configs/s6lx9_microboard_defconfig
+++ b/configs/s6lx9_microboard_defconfig
@@ -1,5 +1,7 @@
 BR2_microblaze=y
 BR2_microblazeel=y
+# Linux headers same as kernel, a 4.4 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyUL0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
diff --git a/configs/sheevaplug_defconfig b/configs/sheevaplug_defconfig
index d6fd3e0..b10e48e 100644
--- a/configs/sheevaplug_defconfig
+++ b/configs/sheevaplug_defconfig
@@ -10,9 +10,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_TARGET_ROOTFS_JFFS2=y
 BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_128K=y
 
-# Lock down headers to avoid breaking with new defaults
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.4"
+# Linux headers same as kernel, a 4.4 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
 
 # bootloader
diff --git a/configs/snps_aarch64_vdk_defconfig b/configs/snps_aarch64_vdk_defconfig
index 88060fd..f165a9a 100644
--- a/configs/snps_aarch64_vdk_defconfig
+++ b/configs/snps_aarch64_vdk_defconfig
@@ -1,5 +1,6 @@
 BR2_aarch64=y
-BR2_KERNEL_HEADERS_3_18=y
+# Linux headers same as kernel, a 3.18 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
 BR2_TARGET_GENERIC_HOSTNAME="vdk-buildroot"
 BR2_TARGET_GENERIC_ISSUE="Welcome to SNPS VDK by Buildroot"
 BR2_LINUX_KERNEL=y
diff --git a/configs/snps_axs101_defconfig b/configs/snps_axs101_defconfig
index 1dee93b..08def3e 100644
--- a/configs/snps_axs101_defconfig
+++ b/configs/snps_axs101_defconfig
@@ -8,9 +8,7 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_OVERLAY="board/synopsys/axs10x/fs-overlay"
 
-# Headers
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.2.4"
+# Linux headers same as kernel, a 4.2 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
 
 # Kernel
diff --git a/configs/snps_axs103_defconfig b/configs/snps_axs103_defconfig
index d1b03f7..d997508 100644
--- a/configs/snps_axs103_defconfig
+++ b/configs/snps_axs103_defconfig
@@ -9,9 +9,7 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_OVERLAY="board/synopsys/axs10x/fs-overlay"
 
-# Headers
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.2.4"
+# Linux headers same as kernel, a 4.2 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
 
 # Kernel
diff --git a/configs/snps_hs38_smp_vdk_defconfig b/configs/snps_hs38_smp_vdk_defconfig
index b38cb1e..9236a13 100644
--- a/configs/snps_hs38_smp_vdk_defconfig
+++ b/configs/snps_hs38_smp_vdk_defconfig
@@ -8,9 +8,7 @@ BR2_TARGET_GENERIC_ISSUE="Welcome to the HS38 VDK Software Development Platform"
 BR2_ROOTFS_OVERLAY="board/synopsys/axs10x/fs-overlay"
 BR2_TARGET_ROOTFS_EXT2=y
 
-# Headers
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.2"
+# Linux headers same as kernel, a 4.2 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
 
 # Kernel
diff --git a/configs/snps_hs38_vdk_defconfig b/configs/snps_hs38_vdk_defconfig
index 49ad496..de91df0 100644
--- a/configs/snps_hs38_vdk_defconfig
+++ b/configs/snps_hs38_vdk_defconfig
@@ -8,9 +8,7 @@ BR2_TARGET_GENERIC_ISSUE="Welcome to the HS38 VDK Software Development Platform"
 BR2_ROOTFS_OVERLAY="board/synopsys/axs10x/fs-overlay"
 BR2_TARGET_ROOTFS_EXT2=y
 
-# Headers
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.2"
+# Linux headers same as kernel, a 4.2 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
 
 # Kernel
diff --git a/configs/telit_evk_pro3_defconfig b/configs/telit_evk_pro3_defconfig
index 29a8d2a..195f36a 100644
--- a/configs/telit_evk_pro3_defconfig
+++ b/configs/telit_evk_pro3_defconfig
@@ -2,9 +2,7 @@
 BR2_arm=y
 BR2_arm926t=y
 
-# Toolchain
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.9.1"
+# Linux headers same as kernel, a 3.9 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_9=y
 
 # System
diff --git a/configs/ts5x00_defconfig b/configs/ts5x00_defconfig
index 6f140e6..655704f 100644
--- a/configs/ts5x00_defconfig
+++ b/configs/ts5x00_defconfig
@@ -2,7 +2,7 @@
 BR2_i386=y
 BR2_x86_i586=y
 
-# toolchain
+# Linux headers same as kernel, a 3.17 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_17=y
 
 # system
diff --git a/configs/udoo_quad_defconfig b/configs/udoo_quad_defconfig
index 82e160a..bcc1923 100644
--- a/configs/udoo_quad_defconfig
+++ b/configs/udoo_quad_defconfig
@@ -4,9 +4,7 @@ BR2_cortex_a9=y
 BR2_ARM_EABIHF=y
 BR2_ARM_FPU_VFPV3=y
 
-# Toolchain
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.0.35"
+# Linux headers same as kernel, a 3.0 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_0=y
 
 # System
diff --git a/configs/via_imx6_vab820_defconfig b/configs/via_imx6_vab820_defconfig
index 8880bd5..268b96e 100644
--- a/configs/via_imx6_vab820_defconfig
+++ b/configs/via_imx6_vab820_defconfig
@@ -4,9 +4,7 @@ BR2_cortex_a9=y
 BR2_ARM_EABIHF=y
 BR2_ARM_FPU_VFPV3=y
 
-# Toolchain
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.10.17"
+# Linux headers same as kernel, a 3.10 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_10=y
 
 # Kernel
diff --git a/configs/wandboard_defconfig b/configs/wandboard_defconfig
index 1875db0..e7ec9b3 100644
--- a/configs/wandboard_defconfig
+++ b/configs/wandboard_defconfig
@@ -1,7 +1,7 @@
 BR2_arm=y
 BR2_cortex_a9=y
-BR2_KERNEL_HEADERS_3_14=y
-BR2_DEFAULT_KERNEL_HEADERS="3.14.54"
+# Linux headers same as kernel, a 3.14 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/wandboard/post-image.sh"
diff --git a/configs/warpboard_defconfig b/configs/warpboard_defconfig
index 13e90cd..4cfeb28 100644
--- a/configs/warpboard_defconfig
+++ b/configs/warpboard_defconfig
@@ -5,9 +5,7 @@ BR2_cortex_a9=y
 # patches
 BR2_GLOBAL_PATCH_DIR="board/freescale/warpboard/patches/"
 
-# lock to 4.0 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.0"
+# Linux headers same as kernel, a 4.0 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_0=y
 
 # system
diff --git a/configs/xilinx_zc706_defconfig b/configs/xilinx_zc706_defconfig
index f7600b1..5563dc8 100644
--- a/configs/xilinx_zc706_defconfig
+++ b/configs/xilinx_zc706_defconfig
@@ -2,9 +2,8 @@ BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_EABIHF=y
 BR2_ARM_ENABLE_NEON=y
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.8"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_8=y
+# Linux headers same as kernel, a 3.14 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyPS0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
diff --git a/configs/zedboard_defconfig b/configs/zedboard_defconfig
index 92e7c59..1330be4 100644
--- a/configs/zedboard_defconfig
+++ b/configs/zedboard_defconfig
@@ -1,9 +1,8 @@
 BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.8"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_8=y
+# Linux headers same as kernel, a 3.18 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyPS0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
