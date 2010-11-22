From: luca at lucaceresoli.net <luca@lucaceresoli.net>
Date: Mon, 22 Nov 2010 23:21:07 +0100
Subject: [Buildroot] [PATCH] dejavu: add new package
Message-ID: <1290464467-2320-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Luca Ceresoli <luca@lucaceresoli.net>

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/Config.in        |    1 +
 package/dejavu/Config.in |   82 +++++++++++++++++++++++++++++++++++++
 package/dejavu/dejavu.mk |  102 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 185 insertions(+), 0 deletions(-)
 create mode 100644 package/dejavu/Config.in
 create mode 100644 package/dejavu/dejavu.mk

diff --git a/package/Config.in b/package/Config.in
index 03e580a..9ecc7a0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -115,6 +115,7 @@ source "package/qt/Config.in"
 source "package/x11r7/Config.in"
 
 comment "X libraries and helper libraries"
+source "package/dejavu/Config.in"
 source "package/liberation/Config.in"
 source "package/libsexy/Config.in"
 
diff --git a/package/dejavu/Config.in b/package/dejavu/Config.in
new file mode 100644
index 0000000..e0a9b1f
--- /dev/null
+++ b/package/dejavu/Config.in
@@ -0,0 +1,82 @@
+menuconfig BR2_PACKAGE_DEJAVU
+	bool "DejaVu (Free fonts)"
+	help
+	  The DejaVu fonts are a font family based on the Vera Fonts.
+	  Its purpose is to provide a wider range of characters while
+	  maintaining the original look and feel through the process of
+	  collaborative development (see authors), under a Free license.
+
+	  http://dejavu-fonts.org/
+
+if BR2_PACKAGE_DEJAVU
+
+config BR2_PACKAGE_DEJAVU_INSTALL_DIR
+	string "Install directory"
+	default "/usr/share/fonts/dejavu"
+	help
+	  Target directory where fonts must be installed
+
+config BR2_PACKAGE_DEJAVU_SANS
+	bool "Install DejaVuSans.ttf"
+
+config BR2_PACKAGE_DEJAVU_SANS_BOLD
+	bool "Install DejaVuSans-Bold.ttf"
+
+config BR2_PACKAGE_DEJAVU_SANS_OBLIQUE
+	bool "Install DejaVuSans-Oblique.ttf"
+
+config BR2_PACKAGE_DEJAVU_SANS_BOLDOBLIQUE
+	bool "Install DejaVuSans-BoldOblique.ttf"
+
+config BR2_PACKAGE_DEJAVU_SANS_EXTRALIGHT
+	bool "Install DejaVuSans-ExtraLight.ttf"
+
+config BR2_PACKAGE_DEJAVU_SANSCONDENSED
+	bool "Install DejaVuSansCondensed.ttf"
+
+config BR2_PACKAGE_DEJAVU_SANSCONDENSED_BOLD
+	bool "Install DejaVuSansCondensed-Bold.ttf"
+
+config BR2_PACKAGE_DEJAVU_SANSCONDENSED_OBLIQUE
+	bool "Install DejaVuSansCondensed-Oblique.ttf"
+
+config BR2_PACKAGE_DEJAVU_SANSCONDENSED_BOLDOBLIQUE
+	bool "Install DejaVuSansCondensed-BoldOblique.ttf"
+
+config BR2_PACKAGE_DEJAVU_SANSMONO
+	bool "Install DejaVuSansMono.ttf"
+
+config BR2_PACKAGE_DEJAVU_SANSMONO_BOLD
+	bool "Install DejaVuSansMono-Bold.ttf"
+
+config BR2_PACKAGE_DEJAVU_SANSMONO_OBLIQUE
+	bool "Install DejaVuSansMono-Oblique.ttf"
+
+config BR2_PACKAGE_DEJAVU_SANSMONO_BOLDOBLIQUE
+	bool "Install DejaVuSansMono-BoldOblique.ttf"
+
+config BR2_PACKAGE_DEJAVU_SERIF
+	bool "Install DejaVuSerif.ttf"
+
+config BR2_PACKAGE_DEJAVU_SERIF_BOLD
+	bool "Install DejaVuSerif-Bold.ttf"
+
+config BR2_PACKAGE_DEJAVU_SERIF_ITALIC
+	bool "Install DejaVuSerif-Italic.ttf"
+
+config BR2_PACKAGE_DEJAVU_SERIF_BOLDITALIC
+	bool "Install DejaVuSerif-BoldItalic.ttf"
+
+config BR2_PACKAGE_DEJAVU_SERIFCONDENSED
+	bool "Install DejaVuSerifCondensed.ttf"
+
+config BR2_PACKAGE_DEJAVU_SERIFCONDENSED_BOLD
+	bool "Install DejaVuSerifCondensed-Bold.ttf"
+
+config BR2_PACKAGE_DEJAVU_SERIFCONDENSED_ITALIC
+	bool "Install DejaVuSerifCondensed-Italic.ttf"
+
+config BR2_PACKAGE_DEJAVU_SERIFCONDENSED_BOLDITALIC
+	bool "Install DejaVuSerifCondensed-BoldItalic.ttf"
+
+endif
diff --git a/package/dejavu/dejavu.mk b/package/dejavu/dejavu.mk
new file mode 100644
index 0000000..276b1e0
--- /dev/null
+++ b/package/dejavu/dejavu.mk
@@ -0,0 +1,102 @@
+#############################################################
+#
+# dejavu
+#
+#############################################################
+DEJAVU_VERSION = 2.32
+DEJAVU_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/dejavu
+DEJAVU_SOURCE = dejavu-fonts-ttf-$(DEJAVU_VERSION).tar.bz2
+
+DEJAVU_TARGET_DIR = $(TARGET_DIR)/$(call qstrip,$(BR2_PACKAGE_DEJAVU_INSTALL_DIR))
+
+ifeq ($(BR2_PACKAGE_DEJAVU_SANS),y)
+DEJAVU_ENABLED_FONTS += DejaVuSans.ttf
+endif
+
+ifeq ($(BR2_PACKAGE_DEJAVU_SANS_BOLD),y)
+DEJAVU_ENABLED_FONTS += DejaVuSans-Bold.ttf
+endif
+
+ifeq ($(BR2_PACKAGE_DEJAVU_SANS_OBLIQUE),y)
+DEJAVU_ENABLED_FONTS += DejaVuSans-Oblique.ttf
+endif
+
+ifeq ($(BR2_PACKAGE_DEJAVU_SANS_BOLDOBLIQUE),y)
+DEJAVU_ENABLED_FONTS += DejaVuSans-BoldOblique.ttf
+endif
+
+ifeq ($(BR2_PACKAGE_DEJAVU_SANS_EXTRALIGHT),y)
+DEJAVU_ENABLED_FONTS += DejaVuSans-ExtraLight.ttf
+endif
+
+ifeq ($(BR2_PACKAGE_DEJAVU_SANSCONDENSED),y)
+DEJAVU_ENABLED_FONTS += DejaVuSansCondensed.ttf
+endif
+
+ifeq ($(BR2_PACKAGE_DEJAVU_SANSCONDENSED_BOLD),y)
+DEJAVU_ENABLED_FONTS += DejaVuSansCondensed-Bold.ttf
+endif
+
+ifeq ($(BR2_PACKAGE_DEJAVU_SANSCONDENSED_OBLIQUE),y)
+DEJAVU_ENABLED_FONTS += DejaVuSansCondensed-Oblique.ttf
+endif
+
+ifeq ($(BR2_PACKAGE_DEJAVU_SANSCONDENSED_BOLDOBLIQUE),y)
+DEJAVU_ENABLED_FONTS += DejaVuSansCondensed-BoldOblique.ttf
+endif
+
+ifeq ($(BR2_PACKAGE_DEJAVU_SANSMONO),y)
+DEJAVU_ENABLED_FONTS += DejaVuSansMono.ttf
+endif
+
+ifeq ($(BR2_PACKAGE_DEJAVU_SANSMONO_BOLD),y)
+DEJAVU_ENABLED_FONTS += DejaVuSansMono-Bold.ttf
+endif
+
+ifeq ($(BR2_PACKAGE_DEJAVU_SANSMONO_OBLIQUE),y)
+DEJAVU_ENABLED_FONTS += DejaVuSansMono-Oblique.ttf
+endif
+
+ifeq ($(BR2_PACKAGE_DEJAVU_SANSMONO_BOLDOBLIQUE),y)
+DEJAVU_ENABLED_FONTS += DejaVuSansMono-BoldOblique.ttf
+endif
+
+ifeq ($(BR2_PACKAGE_DEJAVU_SERIF),y)
+DEJAVU_ENABLED_FONTS += DejaVuSerif.ttf
+endif
+
+ifeq ($(BR2_PACKAGE_DEJAVU_SERIF_BOLD),y)
+DEJAVU_ENABLED_FONTS += DejaVuSerif-Bold.ttf
+endif
+
+ifeq ($(BR2_PACKAGE_DEJAVU_SERIF_ITALIC),y)
+DEJAVU_ENABLED_FONTS += DejaVuSerif-Italic.ttf
+endif
+
+ifeq ($(BR2_PACKAGE_DEJAVU_SERIF_BOLDITALIC),y)
+DEJAVU_ENABLED_FONTS += DejaVuSerif-BoldItalic.ttf
+endif
+
+ifeq ($(BR2_PACKAGE_DEJAVU_SERIFCONDENSED),y)
+DEJAVU_ENABLED_FONTS += DejaVuSerifCondensed.ttf
+endif
+
+ifeq ($(BR2_PACKAGE_DEJAVU_SERIFCONDENSED_BOLD),y)
+DEJAVU_ENABLED_FONTS += DejaVuSerifCondensed-Bold.ttf
+endif
+
+ifeq ($(BR2_PACKAGE_DEJAVU_SERIFCONDENSED_ITALIC),y)
+DEJAVU_ENABLED_FONTS += DejaVuSerifCondensed-Italic.ttf
+endif
+
+ifeq ($(BR2_PACKAGE_DEJAVU_SERIFCONDENSED_BOLDITALIC),y)
+DEJAVU_ENABLED_FONTS += DejaVuSerifCondensed-BoldItalic.ttf
+endif
+
+define DEJAVU_INSTALL_TARGET_CMDS
+	mkdir -p $(DEJAVU_TARGET_DIR)
+	$(INSTALL) -m 644 $(addprefix $(@D)/ttf/,$(DEJAVU_ENABLED_FONTS)) \
+	           $(DEJAVU_TARGET_DIR)
+endef
+
+$(eval $(call GENTARGETS,package,dejavu))
-- 
1.7.1
