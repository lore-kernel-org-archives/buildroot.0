From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sat, 21 Sep 2019 18:00:07 +0300
Subject: [Buildroot] [PATCH 3/5] configs/solidrun_clearfog_gt_8k: bump
 versions of BSP components
In-Reply-To: <20190921150009.3267612-1-geomatsi@gmail.com>
References: <20190921150009.3267612-1-geomatsi@gmail.com>
Message-ID: <20190921150009.3267612-4-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump Linux to 5.2, U-Boot to 2019.07, and ATF to armada-18.12.2.

Updated ATF uses updated binaries-marvell package which now
provides common firmware supporting both A7K and A8K. So no
need to specify platform for binaries-marvell anymore.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 configs/solidrun_clearfog_gt_8k_defconfig | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/configs/solidrun_clearfog_gt_8k_defconfig b/configs/solidrun_clearfog_gt_8k_defconfig
index a44038e663..8804ce0473 100644
--- a/configs/solidrun_clearfog_gt_8k_defconfig
+++ b/configs/solidrun_clearfog_gt_8k_defconfig
@@ -1,5 +1,5 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_2=y
 BR2_TARGET_GENERIC_HOSTNAME="clearfog-gt-8k"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for SolidRun Clearfog GT-8K"
 
@@ -7,20 +7,19 @@ BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for SolidRun Clearfog GT-8K"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/MarvellEmbeddedProcessors/atf-marvell.git"
-# This commit corresponds to release armada-18.09.4
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="711ecd32afe465b38052b5ba374c825b158eea18"
+# This commit corresponds to release armada-18.12.2
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="9484123bfe29011ed44b717a23eb53a70b97ce3d"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="a80x0_mcbin"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="USE_COHERENT_MEM=0"
 BR2_TARGET_BINARIES_MARVELL=y
-BR2_TARGET_BINARIES_MARVELL_8040=y
 BR2_TARGET_MV_DDR_MARVELL=y
 
 # U-Boot
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.07"
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="clearfog_gt_8k"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/solidrun/clearfog_gt_8k/uboot-fragment.config"
@@ -28,7 +27,7 @@ BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/solidrun/clearfog_gt_8k/uboot-frag
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.1.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.2.14"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/solidrun/clearfog_gt_8k/linux-extras.config"
-- 
2.23.0
