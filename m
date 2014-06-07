From: Peter Seiderer <ps.report@gmx.net>
Date: Sun,  8 Jun 2014 00:47:15 +0200
Subject: [Buildroot] [PATCH] ghostscript-fonts: new package
Message-ID: <1402181235-25810-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/Config.in                              |  1 +
 package/ghostscript-fonts/Config.in            |  8 ++++++++
 package/ghostscript-fonts/ghostscript-fonts.mk | 21 +++++++++++++++++++++
 3 files changed, 30 insertions(+)
 create mode 100644 package/ghostscript-fonts/Config.in
 create mode 100644 package/ghostscript-fonts/ghostscript-fonts.mk

diff --git a/package/Config.in b/package/Config.in
index 89b0ef4..08bea0c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -246,6 +246,7 @@ source "package/xvkbd/Config.in"
 
 comment "X libraries and helper libraries"
 source "package/dejavu/Config.in"
+source "package/ghostscript-fonts/Config.in"
 source "package/liberation/Config.in"
 source "package/libsexy/Config.in"
 source "package/x11r7/xkeyboard-config/Config.in"
diff --git a/package/ghostscript-fonts/Config.in b/package/ghostscript-fonts/Config.in
new file mode 100644
index 0000000..80bfbd0
--- /dev/null
+++ b/package/ghostscript-fonts/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_GHOSTSCRIPT_FONTS
+	bool "ghostscript-fonts"
+	help
+	  Fonts and font metrics customarily distributed with Ghostscript.
+	  Currently includes the 35 standard PostScript fonts and a
+	  grab-bag of others.
+
+	  http://sourceforge.net/projects/gs-fonts
diff --git a/package/ghostscript-fonts/ghostscript-fonts.mk b/package/ghostscript-fonts/ghostscript-fonts.mk
new file mode 100644
index 0000000..fa5c4b7
--- /dev/null
+++ b/package/ghostscript-fonts/ghostscript-fonts.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# ghostscript-fonts
+#
+################################################################################
+
+GHOSTSCRIPT_FONTS_VERSION = 8.11
+GHOSTSCRIPT_FONTS_SITE = http://downloads.sourceforge.net/project/gs-fonts/gs-fonts/8.11%20%28base%2035%2C%20GPL%29
+GHOSTSCRIPT_FONTS_SOURCE = ghostscript-fonts-std-$(GHOSTSCRIPT_FONTS_VERSION).tar.gz
+GHOSTSCRIPT_FONTS_LICENSE = GPLv2
+GHOSTSCRIPT_FONTS_LICENSE_FILES = COPYING
+
+GHOSTSCRIPT_FONTS_TARGET_DIR = $(TARGET_DIR)/usr/share/fonts/gs
+
+define GHOSTSCRIPT_FONTS_INSTALL_TARGET_CMDS
+	mkdir -p $(GHOSTSCRIPT_FONTS_TARGET_DIR)
+	$(INSTALL) -m 644 $(@D)/*.afm $(GHOSTSCRIPT_FONTS_TARGET_DIR)
+	$(INSTALL) -m 644 $(@D)/*.pfb $(GHOSTSCRIPT_FONTS_TARGET_DIR)
+endef
+
+$(eval $(generic-package))
-- 
1.8.1.4
