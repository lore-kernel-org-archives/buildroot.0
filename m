From: Florian La Roche <florian.laroche@googlemail.com>
Date: Mon,  7 May 2018 22:22:38 +0200
Subject: [Buildroot] [PATCH 1/1] socrates_cyclone5_defconfig: adjust to
 current kernel and u-boot
Message-ID: <20180507202238.2499-1-Florian.LaRoche@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Adjust socrates_cyclone5_defconfig to current Altera/upstream sources.


Signed-off-by: Florian La Roche <Florian.LaRoche@googlemail.com>
---
 configs/socrates_cyclone5_defconfig | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/configs/socrates_cyclone5_defconfig b/configs/socrates_cyclone5_defconfig
index 7995f9acfb..e79a8e9129 100644
--- a/configs/socrates_cyclone5_defconfig
+++ b/configs/socrates_cyclone5_defconfig
@@ -3,12 +3,14 @@ BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_NEON=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/altera/socrates_cyclone5/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,altera-opensource,linux-socfpga,rel_socfpga-4.1.33-ltsi_17.07.02_pr)/linux-rel_socfpga-4.1.33-ltsi_17.07.02_pr.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,altera-opensource,linux-socfpga,socfpga-4.16)/linux-socfpga_socfpga-4.16.tar.gz"
+# BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+# BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
 BR2_LINUX_KERNEL_DEFCONFIG="socfpga"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="socfpga_cyclone5_socrates"
@@ -16,9 +18,11 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/altera-opensource/u-boot-socfpga.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="v2017.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.03"
+# BR2_TARGET_UBOOT_CUSTOM_GIT=y
+# BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/altera-opensource/u-boot-socfpga.git"
+# BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="socfpga_v2017.09"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="socfpga_socrates"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_FORMAT_IMG=y
-- 
2.11.0
