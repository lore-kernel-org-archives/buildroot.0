From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 27 Nov 2014 15:14:06 -0300
Subject: [Buildroot] [PATCH] configs/p1010rdb: bump to kernel 3.17.4
Message-ID: <1417112046-11926-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../p1010rdb/{linux-3.13.config => linux-3.17.config}          |  3 ---
 board/freescale/p1010rdb/readme.txt                            |  2 +-
 configs/freescale_p1010rdb_pa_defconfig                        | 10 +++++-----
 3 files changed, 6 insertions(+), 9 deletions(-)
 rename board/freescale/p1010rdb/{linux-3.13.config => linux-3.17.config} (97%)

diff --git a/board/freescale/p1010rdb/linux-3.13.config b/board/freescale/p1010rdb/linux-3.17.config
similarity index 97%
rename from board/freescale/p1010rdb/linux-3.13.config
rename to board/freescale/p1010rdb/linux-3.17.config
index b91d312..c48c4fb 100644
--- a/board/freescale/p1010rdb/linux-3.13.config
+++ b/board/freescale/p1010rdb/linux-3.17.config
@@ -57,11 +57,9 @@ CONFIG_MTD_CFI=y
 CONFIG_MTD_CFI_INTELEXT=y
 CONFIG_MTD_CFI_AMDSTD=y
 CONFIG_MTD_PHYSMAP_OF=y
-CONFIG_MTD_M25P80=y
 CONFIG_MTD_NAND=y
 CONFIG_MTD_NAND_FSL_ELBC=y
 CONFIG_MTD_NAND_FSL_IFC=y
-CONFIG_PROC_DEVICETREE=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_NBD=y
 CONFIG_BLK_DEV_RAM=y
@@ -71,7 +69,6 @@ CONFIG_BLK_DEV_SD=y
 CONFIG_CHR_DEV_ST=y
 CONFIG_BLK_DEV_SR=y
 CONFIG_CHR_DEV_SG=y
-CONFIG_SCSI_MULTI_LUN=y
 CONFIG_SCSI_LOGGING=y
 CONFIG_ATA=y
 CONFIG_SATA_FSL=y
diff --git a/board/freescale/p1010rdb/readme.txt b/board/freescale/p1010rdb/readme.txt
index b73ef4d..b119f9a 100644
--- a/board/freescale/p1010rdb/readme.txt
+++ b/board/freescale/p1010rdb/readme.txt
@@ -45,7 +45,7 @@ your newly built U-Boot.
 
 2. Program the DTB to NOR flash
 
-    => tftp $loadaddr p1010rdb.dtb
+    => tftp $loadaddr p1010rdb-pa.dtb
     => erase 0xee000000 +$filesize
     => cp.b $loadaddr 0xee000000 $filesize
 
diff --git a/configs/freescale_p1010rdb_pa_defconfig b/configs/freescale_p1010rdb_pa_defconfig
index d3e0538..b784f39 100644
--- a/configs/freescale_p1010rdb_pa_defconfig
+++ b/configs/freescale_p1010rdb_pa_defconfig
@@ -11,18 +11,18 @@ BR2_TARGET_ROOTFS_JFFS2_CUSTOM_EBSIZE=0x20000
 
 # Lock headers version to match and avoid breakage
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.13.6"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_13=y
+BR2_DEFAULT_KERNEL_VERSION="3.17.4"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_17=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.13.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.17.4"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/freescale/p1010rdb/linux-3.13.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/freescale/p1010rdb/linux-3.17.config"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="p1010rdb"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="p1010rdb-pa"
 
 # Serial port config
 BR2_TARGET_GENERIC_GETTY=y
-- 
2.0.4
