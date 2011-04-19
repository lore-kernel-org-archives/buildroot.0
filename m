From: Philippe Reynes <tremyfr@yahoo.fr>
Date: Tue, 19 Apr 2011 23:55:32 +0200
Subject: [Buildroot] [PATCH] Add pandaboard support
Message-ID: <1303250132-14596-1-git-send-email-tremyfr@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Philippe Reynes <tremyfr@yahoo.fr>
---
 .../u-boot-2010.12-fix-tty-on-pandaboard.patch     |   13 +++++++++++++
 configs/omap4_panda_config                         |   14 ++++++++++++++
 2 files changed, 27 insertions(+), 0 deletions(-)
 create mode 100644 board/arm/pandaboard/u-boot-patches/u-boot-2010.12-fix-tty-on-pandaboard.patch
 create mode 100644 configs/omap4_panda_config

diff --git a/board/arm/pandaboard/u-boot-patches/u-boot-2010.12-fix-tty-on-pandaboard.patch b/board/arm/pandaboard/u-boot-patches/u-boot-2010.12-fix-tty-on-pandaboard.patch
new file mode 100644
index 0000000..0233460
--- /dev/null
+++ b/board/arm/pandaboard/u-boot-patches/u-boot-2010.12-fix-tty-on-pandaboard.patch
@@ -0,0 +1,13 @@
+Index: u-boot-2010.12/include/configs/omap4_panda.h
+===================================================================
+--- u-boot-2010.12.orig/include/configs/omap4_panda.h	2010-12-22 20:22:14.000000000 +0100
++++ u-boot-2010.12/include/configs/omap4_panda.h	2011-04-16 15:51:07.000000000 +0200
+@@ -148,7 +148,7 @@
+ 
+ #define CONFIG_EXTRA_ENV_SETTINGS \
+ 	"loadaddr=0x82000000\0" \
+-	"console=ttyS2,115200n8\0" \
++	"console=ttyO2,115200n8\0" \
+ 	"usbtty=cdc_acm\0" \
+ 	"vram=16M\0" \
+ 	"mmcdev=0\0" \
diff --git a/configs/omap4_panda_config b/configs/omap4_panda_config
new file mode 100644
index 0000000..c7f4210
--- /dev/null
+++ b/configs/omap4_panda_config
@@ -0,0 +1,14 @@
+BR2_arm=y
+BR2_SOURCEFORGE_MIRROR="easynews"
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TARGET_GENERIC_GETTY=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyO2"
+BR2_PACKAGE_UDEV=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="omap4_panda"
+BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR="board/arm/pandaboard/u-boot-patches/"
+# BR2_TARGET_UBOOT_NETWORK is not set
+BR2_TARGET_XLOADER=y
+BR2_TARGET_XLOADER_BOARDNAME="omap4430panda"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
-- 
1.7.1
