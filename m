From: Eugen.Hristev at microchip.com <Eugen.Hristev@microchip.com>
Date: Wed, 4 Dec 2019 10:16:45 +0000
Subject: [Buildroot] [PATCH v2] configs/atmel: update u-boot-at91 and
 bootstrap to tarballs
Message-ID: <1575454574-13667-1-git-send-email-eugen.hristev@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Eugen Hristev <eugen.hristev@microchip.com>

Use custom tarballs for U-boot-at91 and at91bootstrap instead
of cloning the repositories.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---

Changes in v2:
- Fixed change for sama5d3xek : it was wrongly done. do not update components
for this board (untested). just change to tarballs keeping the same version
(as intended for this commit ). Also remove custom version as requested
by Ludovic.

 configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig | 10 ++++------
 configs/atmel_sama5d2_xplained_mmc_defconfig     | 10 ++++------
 configs/atmel_sama5d2_xplained_mmc_dev_defconfig | 10 ++++------
 configs/atmel_sama5d3_xplained_defconfig         | 10 ++++------
 configs/atmel_sama5d3_xplained_dev_defconfig     | 10 ++++------
 configs/atmel_sama5d3_xplained_mmc_defconfig     | 10 ++++------
 configs/atmel_sama5d3_xplained_mmc_dev_defconfig | 10 ++++------
 configs/atmel_sama5d3xek_defconfig               | 10 ++++------
 configs/atmel_sama5d4_xplained_defconfig         | 10 ++++------
 configs/atmel_sama5d4_xplained_dev_defconfig     | 10 ++++------
 configs/atmel_sama5d4_xplained_mmc_defconfig     | 10 ++++------
 configs/atmel_sama5d4_xplained_mmc_dev_defconfig | 10 ++++------
 12 files changed, 48 insertions(+), 72 deletions(-)

diff --git a/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig b/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
index 1d16708..0653ae8 100644
--- a/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
+++ b/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
@@ -70,15 +70,13 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_AT91BOOTSTRAP3=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.9.0"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="(call github,linux4sam,at91bootstrap,v3.9.0)/at91bootstrap-v3.9.0.tar.gz"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d27_som1_eksd_uboot"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/linux4sam/u-boot-at91.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="linux4sam_6.2"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,u-boot-at91,linux4sam_6.2)/u-boot-at91-linux4sam_6.2.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sama5d27_som1_ek_mmc"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
diff --git a/configs/atmel_sama5d2_xplained_mmc_defconfig b/configs/atmel_sama5d2_xplained_mmc_defconfig
index b9a3724..4418ab0 100644
--- a/configs/atmel_sama5d2_xplained_mmc_defconfig
+++ b/configs/atmel_sama5d2_xplained_mmc_defconfig
@@ -16,15 +16,13 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_AT91BOOTSTRAP3=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.9.0"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="(call github,linux4sam,at91bootstrap,v3.9.0)/at91bootstrap-v3.9.0.tar.gz"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d2_xplainedsd_uboot"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/linux4sam/u-boot-at91.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="linux4sam_6.2"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,u-boot-at91,linux4sam_6.2)/u-boot-at91-linux4sam_6.2.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sama5d2_xplained_mmc"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
diff --git a/configs/atmel_sama5d2_xplained_mmc_dev_defconfig b/configs/atmel_sama5d2_xplained_mmc_dev_defconfig
index 8f5ffd9..4603244 100644
--- a/configs/atmel_sama5d2_xplained_mmc_dev_defconfig
+++ b/configs/atmel_sama5d2_xplained_mmc_dev_defconfig
@@ -87,15 +87,13 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 
 # Bootloaders
 BR2_TARGET_AT91BOOTSTRAP3=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.9.0"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="(call github,linux4sam,at91bootstrap,v3.9.0)/at91bootstrap-v3.9.0.tar.gz"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d2_xplainedsd_uboot"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/linux4sam/u-boot-at91.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="linux4sam_6.2"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,u-boot-at91,linux4sam_6.2)/u-boot-at91-linux4sam_6.2.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sama5d2_xplained_mmc"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 
diff --git a/configs/atmel_sama5d3_xplained_defconfig b/configs/atmel_sama5d3_xplained_defconfig
index b24cc8b..9e53218 100644
--- a/configs/atmel_sama5d3_xplained_defconfig
+++ b/configs/atmel_sama5d3_xplained_defconfig
@@ -15,15 +15,13 @@ BR2_TARGET_ROOTFS_UBIFS_LEBSIZE=0x1f000
 BR2_TARGET_ROOTFS_UBI=y
 BR2_TARGET_ROOTFS_UBI_SUBSIZE=2048
 BR2_TARGET_AT91BOOTSTRAP3=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.9.0"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="(call github,linux4sam,at91bootstrap,v3.9.0)/at91bootstrap-v3.9.0.tar.gz"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d3_xplainednf_uboot"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/linux4sam/u-boot-at91.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="linux4sam_6.2"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,u-boot-at91,linux4sam_6.2)/u-boot-at91-linux4sam_6.2.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sama5d3_xplained_nandflash"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_PACKAGE_HOST_SAM_BA=y
diff --git a/configs/atmel_sama5d3_xplained_dev_defconfig b/configs/atmel_sama5d3_xplained_dev_defconfig
index a2b0303..2689f2a 100644
--- a/configs/atmel_sama5d3_xplained_dev_defconfig
+++ b/configs/atmel_sama5d3_xplained_dev_defconfig
@@ -84,15 +84,13 @@ BR2_TARGET_ROOTFS_UBI_SUBSIZE=2048
 
 # Bootloaders
 BR2_TARGET_AT91BOOTSTRAP3=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.9.0"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="(call github,linux4sam,at91bootstrap,v3.9.0)/at91bootstrap-v3.9.0.tar.gz"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d3_xplainednf_uboot"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/linux4sam/u-boot-at91.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="linux4sam_6.2"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,u-boot-at91,linux4sam_6.2)/u-boot-at91-linux4sam_6.2.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sama5d3_xplained_nandflash"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 
diff --git a/configs/atmel_sama5d3_xplained_mmc_defconfig b/configs/atmel_sama5d3_xplained_mmc_defconfig
index 259888e..0d34148 100644
--- a/configs/atmel_sama5d3_xplained_mmc_defconfig
+++ b/configs/atmel_sama5d3_xplained_mmc_defconfig
@@ -15,15 +15,13 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_AT91BOOTSTRAP3=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.9.0"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="(call github,linux4sam,at91bootstrap,v3.9.0)/at91bootstrap-v3.9.0.tar.gz"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d3_xplainedsd_uboot"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/linux4sam/u-boot-at91.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="linux4sam_6.2"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,u-boot-at91,linux4sam_6.2)/u-boot-at91-linux4sam_6.2.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sama5d3_xplained_mmc"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
diff --git a/configs/atmel_sama5d3_xplained_mmc_dev_defconfig b/configs/atmel_sama5d3_xplained_mmc_dev_defconfig
index ef47bb3..5172228 100644
--- a/configs/atmel_sama5d3_xplained_mmc_dev_defconfig
+++ b/configs/atmel_sama5d3_xplained_mmc_dev_defconfig
@@ -86,15 +86,13 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 
 # Bootloaders
 BR2_TARGET_AT91BOOTSTRAP3=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.9.0"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="(call github,linux4sam,at91bootstrap,v3.9.0)/at91bootstrap-v3.9.0.tar.gz"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d3_xplainedsd_uboot"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/linux4sam/u-boot-at91.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="linux4sam_6.2"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,u-boot-at91,linux4sam_6.2)/u-boot-at91-linux4sam_6.2.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sama5d3_xplained_mmc"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 
diff --git a/configs/atmel_sama5d3xek_defconfig b/configs/atmel_sama5d3xek_defconfig
index 95deb6f..338c23c 100644
--- a/configs/atmel_sama5d3xek_defconfig
+++ b/configs/atmel_sama5d3xek_defconfig
@@ -23,15 +23,13 @@ BR2_TARGET_ROOTFS_UBI_SUBSIZE=2048
 
 # Bootloaders
 BR2_TARGET_AT91BOOTSTRAP3=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.10"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="(call github,linux4sam,at91bootstrap,v3.9.0)/at91bootstrap-v3.8.10.tar.gz"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d3xeknf_uboot"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/linux4sam/u-boot-at91.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="linux4sam_5.8"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,u-boot-at91,linux4sam_6.2)/u-boot-at91-linux4sam_5.8.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sama5d3xek_nandflash"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_SPL=y
diff --git a/configs/atmel_sama5d4_xplained_defconfig b/configs/atmel_sama5d4_xplained_defconfig
index 0ecb6a1..f862d41 100644
--- a/configs/atmel_sama5d4_xplained_defconfig
+++ b/configs/atmel_sama5d4_xplained_defconfig
@@ -19,15 +19,13 @@ BR2_TARGET_ROOTFS_UBI=y
 BR2_TARGET_ROOTFS_UBI_PEBSIZE=0x40000
 BR2_TARGET_ROOTFS_UBI_SUBSIZE=0
 BR2_TARGET_AT91BOOTSTRAP3=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.9.0"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="(call github,linux4sam,at91bootstrap,v3.9.0)/at91bootstrap-v3.9.0.tar.gz"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d4_xplainednf_uboot_secure"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/linux4sam/u-boot-at91.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="linux4sam_6.2"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,u-boot-at91,linux4sam_6.2)/u-boot-at91-linux4sam_6.2.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sama5d4_xplained_nandflash"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_PACKAGE_HOST_SAM_BA=y
diff --git a/configs/atmel_sama5d4_xplained_dev_defconfig b/configs/atmel_sama5d4_xplained_dev_defconfig
index 8eb6f09..7a0966e 100644
--- a/configs/atmel_sama5d4_xplained_dev_defconfig
+++ b/configs/atmel_sama5d4_xplained_dev_defconfig
@@ -88,15 +88,13 @@ BR2_TARGET_ROOTFS_UBI_SUBSIZE=0
 
 # Bootloaders
 BR2_TARGET_AT91BOOTSTRAP3=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.9.0"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="(call github,linux4sam,at91bootstrap,v3.9.0)/at91bootstrap-v3.9.0.tar.gz"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d4_xplainednf_uboot_secure"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/linux4sam/u-boot-at91.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="linux4sam_6.2"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,u-boot-at91,linux4sam_6.2)/u-boot-at91-linux4sam_6.2.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sama5d4_xplained_nandflash"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 
diff --git a/configs/atmel_sama5d4_xplained_mmc_defconfig b/configs/atmel_sama5d4_xplained_mmc_defconfig
index 2753a7a..ee4b12d 100644
--- a/configs/atmel_sama5d4_xplained_mmc_defconfig
+++ b/configs/atmel_sama5d4_xplained_mmc_defconfig
@@ -16,15 +16,13 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_AT91BOOTSTRAP3=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.9.0"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="(call github,linux4sam,at91bootstrap,v3.9.0)/at91bootstrap-v3.9.0.tar.gz"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d4_xplainedsd_uboot_secure"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/linux4sam/u-boot-at91.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="linux4sam_6.2"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,u-boot-at91,linux4sam_6.2)/u-boot-at91-linux4sam_6.2.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sama5d4_xplained_mmc"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
diff --git a/configs/atmel_sama5d4_xplained_mmc_dev_defconfig b/configs/atmel_sama5d4_xplained_mmc_dev_defconfig
index d948cfa..6f0c298 100644
--- a/configs/atmel_sama5d4_xplained_mmc_dev_defconfig
+++ b/configs/atmel_sama5d4_xplained_mmc_dev_defconfig
@@ -87,15 +87,13 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 
 # Bootloaders
 BR2_TARGET_AT91BOOTSTRAP3=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.9.0"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="(call github,linux4sam,at91bootstrap,v3.9.0)/at91bootstrap-v3.9.0.tar.gz"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d4_xplainedsd_uboot_secure"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/linux4sam/u-boot-at91.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="linux4sam_6.2"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,u-boot-at91,linux4sam_6.2)/u-boot-at91-linux4sam_6.2.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sama5d4_xplained_mmc"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 
-- 
2.7.4
