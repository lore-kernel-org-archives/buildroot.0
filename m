From: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
Date: Sat,  8 Oct 2011 12:23:26 +0200
Subject: [Buildroot] [PATCH] dejavu-fonts: add new package
Message-ID: <1318069406-21518-1-git-send-email-schwarzkopf@sensortherm.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add new package dejavu-fonts. The DejaVu fonts are a font family
based on the Vera Fonts. http://dejavu-fonts.org/wiki/Main_Page

Signed-off-by: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
---
 package/Config.in                    |    1 +
 package/dejavu-fonts/Config.in       |    7 +++++++
 package/dejavu-fonts/dejavu-fonts.mk |   16 ++++++++++++++++
 3 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 package/dejavu-fonts/Config.in
 create mode 100644 package/dejavu-fonts/dejavu-fonts.mk

diff --git a/package/Config.in b/package/Config.in
index 7112e05..3dac85c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -276,6 +276,7 @@ source "package/cairo/Config.in"
 source "package/fltk/Config.in"
 source "package/fontconfig/Config.in"
 source "package/freetype/Config.in"
+source "package/dejavu-fonts/Config.in"
 source "package/gtk2-engines/Config.in"
 source "package/gtk2-themes/Config.in"
 source "package/jpeg/Config.in"
diff --git a/package/dejavu-fonts/Config.in b/package/dejavu-fonts/Config.in
new file mode 100644
index 0000000..a9de9b5
--- /dev/null
+++ b/package/dejavu-fonts/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_DEJAVU_FONTS
+	bool "dejavu fonts"
+	help
+		The DejaVu fonts are a font family 
+		based on the Vera Fonts.
+
+	  	http://dejavu-fonts.org/wiki/Main_Page
diff --git a/package/dejavu-fonts/dejavu-fonts.mk b/package/dejavu-fonts/dejavu-fonts.mk
new file mode 100644
index 0000000..7998199
--- /dev/null
+++ b/package/dejavu-fonts/dejavu-fonts.mk
@@ -0,0 +1,16 @@
+#############################################################
+#
+# dejavu fonts
+#
+#############################################################
+
+DEJAVU_FONTS_VERSION:=2.33
+DEJAVU_FONTS_SOURCE:=dejavu-fonts-ttf-$(DEJAVU_FONTS_VERSION).tar.bz2
+DEJAVU_FONTS_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/dejavu/dejavu/$(DEJAVU_FONTS_VERSION)/
+
+define DEJAVU_FONTS_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/usr/lib/fonts
+	cp -a $(@D)/ttf/*.ttf $(TARGET_DIR)/usr/lib/fonts
+endef
+
+$(eval $(call GENTARGETS,package,dejavu-fonts))
-- 
1.7.0.4
