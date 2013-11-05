From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  5 Nov 2013 09:03:29 -0300
Subject: [Buildroot] [PATCH 3/4] configs/mpc8315erdb: bump to the latest and
	greatest versions
In-Reply-To: <1383653010-10297-1-git-send-email-gustavo@zacarias.com.ar>
References: <1383653010-10297-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1383653010-10297-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../freescale/mpc8315erdb/{linux-3.11.config => linux-3.12.config}  | 0
 board/freescale/mpc8315erdb/readme.txt                              | 2 +-
 configs/freescale_mpc8315erdb_defconfig                             | 6 +++---
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename board/freescale/mpc8315erdb/{linux-3.11.config => linux-3.12.config} (100%)

diff --git a/board/freescale/mpc8315erdb/linux-3.11.config b/board/freescale/mpc8315erdb/linux-3.12.config
similarity index 100%
rename from board/freescale/mpc8315erdb/linux-3.11.config
rename to board/freescale/mpc8315erdb/linux-3.12.config
diff --git a/board/freescale/mpc8315erdb/readme.txt b/board/freescale/mpc8315erdb/readme.txt
index f7f9c94..ed70795 100644
--- a/board/freescale/mpc8315erdb/readme.txt
+++ b/board/freescale/mpc8315erdb/readme.txt
@@ -6,7 +6,7 @@ It won't work for NOR and will brick that bootloader!
 Also don't go playing around with different U-boot versions or flash targets
 unless you've got the necessary hardware and/or know-how to unbrick your kit.
 
-2013.04 is known good for NAND.
+2013.10 is known good for NAND.
 ******************** WARNING ********************
 
 You'll need to program the files created by buildroot into the flash.
diff --git a/configs/freescale_mpc8315erdb_defconfig b/configs/freescale_mpc8315erdb_defconfig
index dc4c810..11e64db 100644
--- a/configs/freescale_mpc8315erdb_defconfig
+++ b/configs/freescale_mpc8315erdb_defconfig
@@ -12,14 +12,14 @@ BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER=y
 
 # Lock headers version to match and avoid breakage
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.11.5"
+BR2_DEFAULT_KERNEL_VERSION="3.12"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.11.5"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/freescale/mpc8315erdb/linux-3.11.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/freescale/mpc8315erdb/linux-3.12.config"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="mpc8315erdb"
-- 
1.8.1.5
