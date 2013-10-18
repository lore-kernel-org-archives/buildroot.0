From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 18 Oct 2013 10:45:35 -0300
Subject: [Buildroot] [PATCH 2/2] configs/mpc8315erdb: bump to the latest and
	greatest versions
In-Reply-To: <1382103935-21473-1-git-send-email-gustavo@zacarias.com.ar>
References: <1382103935-21473-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1382103935-21473-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../mpc8315erdb/{linux-3.10.config => linux-3.11.config}      |  0
 configs/freescale_mpc8315erdb_defconfig                       | 11 ++++++-----
 2 files changed, 6 insertions(+), 5 deletions(-)
 rename board/freescale/mpc8315erdb/{linux-3.10.config => linux-3.11.config} (100%)

diff --git a/board/freescale/mpc8315erdb/linux-3.10.config b/board/freescale/mpc8315erdb/linux-3.11.config
similarity index 100%
rename from board/freescale/mpc8315erdb/linux-3.10.config
rename to board/freescale/mpc8315erdb/linux-3.11.config
diff --git a/configs/freescale_mpc8315erdb_defconfig b/configs/freescale_mpc8315erdb_defconfig
index 12bb70e..dc4c810 100644
--- a/configs/freescale_mpc8315erdb_defconfig
+++ b/configs/freescale_mpc8315erdb_defconfig
@@ -10,15 +10,16 @@ BR2_TARGET_ROOTFS_JFFS2_CUSTOM_PAGESIZE=0x200
 BR2_TARGET_ROOTFS_JFFS2_CUSTOM_EBSIZE=0x4000
 BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER=y
 
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
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/freescale/mpc8315erdb/linux-3.10.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/freescale/mpc8315erdb/linux-3.11.config"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="mpc8315erdb"
@@ -31,4 +32,4 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="MPC8315ERDB_NAND"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2013.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2013.10"
-- 
1.8.1.5
