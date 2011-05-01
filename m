From: Philippe Reynes <tremyfr@yahoo.fr>
Date: Mon,  2 May 2011 00:16:44 +0200
Subject: [Buildroot] [PATCH] Add pandaboard support
Message-ID: <1304288204-30189-1-git-send-email-tremyfr@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Philippe Reynes <tremyfr@yahoo.fr>
---
 .../u-boot-2010.12-fix-tty-on-pandaboard.patch     |   21 ++++++++++++++++++++
 configs/omap4_panda_defconfig                      |   14 +++++++++++++
 2 files changed, 35 insertions(+), 0 deletions(-)
 create mode 100644 board/arm/pandaboard/u-boot-patches/u-boot-2010.12-fix-tty-on-pandaboard.patch
 create mode 100644 configs/omap4_panda_defconfig

diff --git a/board/arm/pandaboard/u-boot-patches/u-boot-2010.12-fix-tty-on-pandaboard.patch b/board/arm/pandaboard/u-boot-patches/u-boot-2010.12-fix-tty-on-pandaboard.patch
new file mode 100644
index 0000000..c80a9d3
--- /dev/null
+++ b/board/arm/pandaboard/u-boot-patches/u-boot-2010.12-fix-tty-on-pandaboard.patch
@@ -0,0 +1,21 @@
+commit bb4517fa4485c98be7474ceb87c031b17c82b3e8
+Author: Philippe Reynes <tremyfr@yahoo.fr>
+Date:   Sun May 1 16:04:46 2011 +0200
+
+    Fix tty on pandaboard
+    
+    Signed-off-by: Philippe Reynes <tremyfr@yahoo.fr>
+
+diff --git a/include/configs/omap4_panda.h b/include/configs/omap4_panda.h
+index 2b03b0f..8715ed7 100644
+--- a/include/configs/omap4_panda.h
++++ b/include/configs/omap4_panda.h
+@@ -148,7 +148,7 @@
+ 
+ #define CONFIG_EXTRA_ENV_SETTINGS \
+ 	"loadaddr=0x82000000\0" \
+-	"console=ttyS2,115200n8\0" \
++	"console=ttyO2,115200n8\0" \
+ 	"usbtty=cdc_acm\0" \
+ 	"vram=16M\0" \
+ 	"mmcdev=0\0" \
diff --git a/configs/omap4_panda_defconfig b/configs/omap4_panda_defconfig
new file mode 100644
index 0000000..f820eab
--- /dev/null
+++ b/configs/omap4_panda_defconfig
@@ -0,0 +1,14 @@
+BR2_arm=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TARGET_GENERIC_GETTY=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyO2"
+BR2_PACKAGE_UDEV=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="omap4_panda"
+BR2_TARGET_UBOOT_2010_12=y
+BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR="board/arm/pandaboard/u-boot-patches/"
+# BR2_TARGET_UBOOT_NETWORK is not set
+BR2_TARGET_XLOADER=y
+BR2_TARGET_XLOADER_BOARDNAME="omap4430panda"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
-- 
1.7.1
