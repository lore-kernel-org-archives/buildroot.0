From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 19 Oct 2013 23:19:48 +0200
Subject: [Buildroot] [git commit] configs/p1010rdb: bump to the latest and
	greatest versions
Message-ID: <20131019212051.7052D9BA67@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=813ce18de92e2dd79d20b4d315124846017ab171
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../{linux-3.10.config => linux-3.11.config}       |    0
 configs/freescale_p1010rdb_defconfig               |   11 ++++++-----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/board/freescale/p1010rdb/linux-3.10.config b/board/freescale/p1010rdb/linux-3.11.config
similarity index 100%
rename from board/freescale/p1010rdb/linux-3.10.config
rename to board/freescale/p1010rdb/linux-3.11.config
diff --git a/configs/freescale_p1010rdb_defconfig b/configs/freescale_p1010rdb_defconfig
index 21554d5..76a0be2 100644
--- a/configs/freescale_p1010rdb_defconfig
+++ b/configs/freescale_p1010rdb_defconfig
@@ -9,15 +9,16 @@ BR2_TARGET_ROOTFS_JFFS2_CUSTOM=y
 BR2_TARGET_ROOTFS_JFFS2_CUSTOM_PAGESIZE=0x20
 BR2_TARGET_ROOTFS_JFFS2_CUSTOM_EBSIZE=0x20000
 
-# Lock to 3.8 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_3_8=y
+# Lock headers version to match and avoid breakage
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="3.11.5"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.10.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.11.5"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/freescale/p1010rdb/linux-3.10.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/freescale/p1010rdb/linux-3.11.config"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="p1010rdb"
@@ -30,4 +31,4 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="P1010RDB_NOR"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2013.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2013.10"
