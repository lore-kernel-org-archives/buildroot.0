From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 7 Feb 2013 13:48:27 +0100
Subject: [Buildroot] [git commit] Config.in: move BR2_DEFCONFIG to Build
	options menu.
Message-ID: <20130207125214.6A08C9A9F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4e0170d66da0b83604d497e717dbbe1052759b65
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As suggested by gustavoz.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Config.in |   24 ++++++++++++------------
 1 files changed, 12 insertions(+), 12 deletions(-)

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
