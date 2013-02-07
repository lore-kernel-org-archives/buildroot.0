From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu,  7 Feb 2013 08:50:57 +0100
Subject: [Buildroot] [PATCH] Config.in: move BR2_DEFCONFIG to Build options
	menu.
Message-ID: <1360223457-28630-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

As suggested by gustavoz.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in |   24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/Config.in b/Config.in
index 4929a80..a2c305f 100644
--- a/Config.in
+++ b/Config.in
@@ -22,18 +22,6 @@ config BR2_HOSTARCH_NEEDS_IA32_LIBS
 
 source "arch/Config.in"
 
-config BR2_DEFCONFIG_FROM_ENV
-	string
-	option env="BR2_DEFCONFIG"
-
-config BR2_DEFCONFIG
-	string "Location to save buildroot config"
-	default BR2_DEFCONFIG_FROM_ENV if BR2_DEFCONFIG_FROM_ENV != ""
-	default "$(CONFIG_DIR)/defconfig"
-	help
-	  When running 'make savedefconfig', the defconfig file will be saved
-	  in this location.
-
 menu "Build options"
 
 menu "Commands"
@@ -107,6 +95,18 @@ config BR2_TAR_OPTIONS
 
 endmenu
 
+config BR2_DEFCONFIG_FROM_ENV
+	string
+	option env="BR2_DEFCONFIG"
+
+config BR2_DEFCONFIG
+	string "Location to save buildroot config"
+	default BR2_DEFCONFIG_FROM_ENV if BR2_DEFCONFIG_FROM_ENV != ""
+	default "$(CONFIG_DIR)/defconfig"
+	help
+	  When running 'make savedefconfig', the defconfig file will be saved
+	  in this location.
+
 config BR2_DL_DIR
 	string "Download dir"
 	default "$(TOPDIR)/dl"
-- 
1.7.10.4
