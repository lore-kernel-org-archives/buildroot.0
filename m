From: Eugen.Hristev at microchip.com <Eugen.Hristev@microchip.com>
Date: Mon, 16 Dec 2019 12:46:21 +0000
Subject: [Buildroot] [PATCH 1/3] configs/atmel: fix at91bootstrap custom
 tarball call function
Message-ID: <1576500357-21964-1-git-send-email-eugen.hristev@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Eugen Hristev <eugen.hristev@microchip.com>

The function was wrong, missing '$'. Also aligned with tar.gz. name rule in
hash file.

Fixes: 806409533202 ("configs/atmel: use tarballs to fetch U-Boot and at91bootstrap")
Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig | 2 +-
 configs/atmel_sama5d2_xplained_mmc_defconfig     | 2 +-
 configs/atmel_sama5d2_xplained_mmc_dev_defconfig | 2 +-
 configs/atmel_sama5d3_xplained_defconfig         | 2 +-
 configs/atmel_sama5d3_xplained_dev_defconfig     | 2 +-
 configs/atmel_sama5d3_xplained_mmc_defconfig     | 2 +-
 configs/atmel_sama5d3_xplained_mmc_dev_defconfig | 2 +-
 configs/atmel_sama5d3xek_defconfig               | 2 +-
 configs/atmel_sama5d4_xplained_defconfig         | 2 +-
 configs/atmel_sama5d4_xplained_dev_defconfig     | 2 +-
 configs/atmel_sama5d4_xplained_mmc_defconfig     | 2 +-
 configs/atmel_sama5d4_xplained_mmc_dev_defconfig | 2 +-
 12 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig b/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
index 0653ae8f5c..c1f39ba2ee 100644
--- a/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
+++ b/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
@@ -71,7 +71,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="(call github,linux4sam,at91bootstrap,v3.9.0)/at91bootstrap-v3.9.0.tar.gz"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v3.9.0)/at91bootstrap3-v3.9.0.tar.gz"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d27_som1_eksd_uboot"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
diff --git a/configs/atmel_sama5d2_xplained_mmc_defconfig b/configs/atmel_sama5d2_xplained_mmc_defconfig
index 4418ab0d07..2c73cc4c27 100644
--- a/configs/atmel_sama5d2_xplained_mmc_defconfig
+++ b/configs/atmel_sama5d2_xplained_mmc_defconfig
@@ -17,7 +17,7 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="(call github,linux4sam,at91bootstrap,v3.9.0)/at91bootstrap-v3.9.0.tar.gz"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v3.9.0)/at91bootstrap3-v3.9.0.tar.gz"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d2_xplainedsd_uboot"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
diff --git a/configs/atmel_sama5d2_xplained_mmc_dev_defconfig b/configs/atmel_sama5d2_xplained_mmc_dev_defconfig
index 4603244a82..057a86eab7 100644
--- a/configs/atmel_sama5d2_xplained_mmc_dev_defconfig
+++ b/configs/atmel_sama5d2_xplained_mmc_dev_defconfig
@@ -88,7 +88,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # Bootloaders
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="(call github,linux4sam,at91bootstrap,v3.9.0)/at91bootstrap-v3.9.0.tar.gz"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v3.9.0)/at91bootstrap3-v3.9.0.tar.gz"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d2_xplainedsd_uboot"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
diff --git a/configs/atmel_sama5d3_xplained_defconfig b/configs/atmel_sama5d3_xplained_defconfig
index 9e53218370..65304a2e42 100644
--- a/configs/atmel_sama5d3_xplained_defconfig
+++ b/configs/atmel_sama5d3_xplained_defconfig
@@ -16,7 +16,7 @@ BR2_TARGET_ROOTFS_UBI=y
 BR2_TARGET_ROOTFS_UBI_SUBSIZE=2048
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="(call github,linux4sam,at91bootstrap,v3.9.0)/at91bootstrap-v3.9.0.tar.gz"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v3.9.0)/at91bootstrap3-v3.9.0.tar.gz"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d3_xplainednf_uboot"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
diff --git a/configs/atmel_sama5d3_xplained_dev_defconfig b/configs/atmel_sama5d3_xplained_dev_defconfig
index 2689f2a40d..0d9a541d09 100644
--- a/configs/atmel_sama5d3_xplained_dev_defconfig
+++ b/configs/atmel_sama5d3_xplained_dev_defconfig
@@ -85,7 +85,7 @@ BR2_TARGET_ROOTFS_UBI_SUBSIZE=2048
 # Bootloaders
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="(call github,linux4sam,at91bootstrap,v3.9.0)/at91bootstrap-v3.9.0.tar.gz"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v3.9.0)/at91bootstrap3-v3.9.0.tar.gz"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d3_xplainednf_uboot"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
diff --git a/configs/atmel_sama5d3_xplained_mmc_defconfig b/configs/atmel_sama5d3_xplained_mmc_defconfig
index 0d341482a1..3fd5f1dde0 100644
--- a/configs/atmel_sama5d3_xplained_mmc_defconfig
+++ b/configs/atmel_sama5d3_xplained_mmc_defconfig
@@ -16,7 +16,7 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="(call github,linux4sam,at91bootstrap,v3.9.0)/at91bootstrap-v3.9.0.tar.gz"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v3.9.0)/at91bootstrap3-v3.9.0.tar.gz"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d3_xplainedsd_uboot"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
diff --git a/configs/atmel_sama5d3_xplained_mmc_dev_defconfig b/configs/atmel_sama5d3_xplained_mmc_dev_defconfig
index 517222824d..97d2d6477c 100644
--- a/configs/atmel_sama5d3_xplained_mmc_dev_defconfig
+++ b/configs/atmel_sama5d3_xplained_mmc_dev_defconfig
@@ -87,7 +87,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # Bootloaders
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="(call github,linux4sam,at91bootstrap,v3.9.0)/at91bootstrap-v3.9.0.tar.gz"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v3.9.0)/at91bootstrap3-v3.9.0.tar.gz"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d3_xplainedsd_uboot"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
diff --git a/configs/atmel_sama5d3xek_defconfig b/configs/atmel_sama5d3xek_defconfig
index db3fe7b93a..63417eae7c 100644
--- a/configs/atmel_sama5d3xek_defconfig
+++ b/configs/atmel_sama5d3xek_defconfig
@@ -24,7 +24,7 @@ BR2_TARGET_ROOTFS_UBI_SUBSIZE=2048
 # Bootloaders
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="(call github,linux4sam,at91bootstrap,v3.8.10)/at91bootstrap-v3.8.10.tar.gz"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v3.8.10)/at91bootstrap3-v3.8.10.tar.gz"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d3xeknf_uboot"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
diff --git a/configs/atmel_sama5d4_xplained_defconfig b/configs/atmel_sama5d4_xplained_defconfig
index f862d41b1e..319f31956d 100644
--- a/configs/atmel_sama5d4_xplained_defconfig
+++ b/configs/atmel_sama5d4_xplained_defconfig
@@ -20,7 +20,7 @@ BR2_TARGET_ROOTFS_UBI_PEBSIZE=0x40000
 BR2_TARGET_ROOTFS_UBI_SUBSIZE=0
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="(call github,linux4sam,at91bootstrap,v3.9.0)/at91bootstrap-v3.9.0.tar.gz"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v3.9.0)/at91bootstrap3-v3.9.0.tar.gz"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d4_xplainednf_uboot_secure"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
diff --git a/configs/atmel_sama5d4_xplained_dev_defconfig b/configs/atmel_sama5d4_xplained_dev_defconfig
index 7a0966ecd3..41c24fe9be 100644
--- a/configs/atmel_sama5d4_xplained_dev_defconfig
+++ b/configs/atmel_sama5d4_xplained_dev_defconfig
@@ -89,7 +89,7 @@ BR2_TARGET_ROOTFS_UBI_SUBSIZE=0
 # Bootloaders
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="(call github,linux4sam,at91bootstrap,v3.9.0)/at91bootstrap-v3.9.0.tar.gz"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v3.9.0)/at91bootstrap3-v3.9.0.tar.gz"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d4_xplainednf_uboot_secure"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
diff --git a/configs/atmel_sama5d4_xplained_mmc_defconfig b/configs/atmel_sama5d4_xplained_mmc_defconfig
index ee4b12d79b..ed294c35a1 100644
--- a/configs/atmel_sama5d4_xplained_mmc_defconfig
+++ b/configs/atmel_sama5d4_xplained_mmc_defconfig
@@ -17,7 +17,7 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="(call github,linux4sam,at91bootstrap,v3.9.0)/at91bootstrap-v3.9.0.tar.gz"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v3.9.0)/at91bootstrap3-v3.9.0.tar.gz"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d4_xplainedsd_uboot_secure"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
diff --git a/configs/atmel_sama5d4_xplained_mmc_dev_defconfig b/configs/atmel_sama5d4_xplained_mmc_dev_defconfig
index 6f0c298a8f..09c9de5fbd 100644
--- a/configs/atmel_sama5d4_xplained_mmc_dev_defconfig
+++ b/configs/atmel_sama5d4_xplained_mmc_dev_defconfig
@@ -88,7 +88,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # Bootloaders
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="(call github,linux4sam,at91bootstrap,v3.9.0)/at91bootstrap-v3.9.0.tar.gz"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v3.9.0)/at91bootstrap3-v3.9.0.tar.gz"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d4_xplainedsd_uboot_secure"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-- 
2.17.1
