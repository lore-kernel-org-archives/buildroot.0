From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sun, 10 Jan 2021 17:16:26 +0300
Subject: [Buildroot] [PATCH 1/4] configs/solidrun_macchiatobin: bump BSP
 components
In-Reply-To: <20210110141629.1510597-1-geomatsi@gmail.com>
References: <20210110141629.1510597-1-geomatsi@gmail.com>
Message-ID: <20210110141629.1510597-2-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump U-Boot and Linux kernel versions. Fix recent build failures caused
by mv-ddr-marvell package update. Marvell ATF does not provide a version
compatible with up-to-date mv-ddr-marvell. According to commit log,
Marvell developers are now contributing directly to upstream ATF. So
switch to upstream ATF instead of using older Marvell ATF versions.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/938922500

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 configs/solidrun_macchiatobin_defconfig | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/configs/solidrun_macchiatobin_defconfig b/configs/solidrun_macchiatobin_defconfig
index f1ca7764b1..7d06313b03 100644
--- a/configs/solidrun_macchiatobin_defconfig
+++ b/configs/solidrun_macchiatobin_defconfig
@@ -1,17 +1,16 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 BR2_TARGET_GENERIC_HOSTNAME="mcbin"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for Marvell MacchiatoBin"
 
 # Firmware
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/MarvellEmbeddedProcessors/atf-marvell.git"
-# This commit corresponds to release armada-18.12.2
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="9484123bfe29011ed44b717a23eb53a70b97ce3d"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.4"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="a80x0_mcbin"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_TARGETS="mrvl_flash"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="USE_COHERENT_MEM=0"
 BR2_TARGET_BINARIES_MARVELL=y
 BR2_TARGET_MV_DDR_MARVELL=y
@@ -19,7 +18,7 @@ BR2_TARGET_MV_DDR_MARVELL=y
 # U-Boot
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.10"
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_USE_DEFCONFIG=y
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="mvebu_mcbin-88f8040"
@@ -28,7 +27,7 @@ BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/solidrun/macchiatobin/uboot-fragme
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.6.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.5"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="marvell/armada-8040-mcbin"
-- 
2.30.0
