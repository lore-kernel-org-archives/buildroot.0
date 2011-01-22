From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sat, 22 Jan 2011 17:59:15 +0100
Subject: [Buildroot] [PATCH 3/4] dejavu: add new package
In-Reply-To: <1295715556-7239-1-git-send-email-luca@lucaceresoli.net>
References: <1295715556-7239-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1295715556-7239-4-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/fonts/Config.in        |    1 +
 package/fonts/dejavu/Config.in |   76 ++++++++++++++++++++++++++++
 package/fonts/dejavu/dejavu.mk |  106 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 183 insertions(+), 0 deletions(-)
 create mode 100644 package/fonts/dejavu/Config.in
 create mode 100644 package/fonts/dejavu/dejavu.mk

diff --git a/package/fonts/Config.in b/package/fonts/Config.in
index 11497a5..f07d443 100644
--- a/package/fonts/Config.in
+++ b/package/fonts/Config.in
@@ -34,5 +34,6 @@ config BR2_FONT_LAYOUT_BASEDIR
 	  here or in a subdirectory for each family.
 
 source "package/fonts/liberation/Config.in"
+source "package/fonts/dejavu/Config.in"
 
 endmenu
diff --git a/package/fonts/dejavu/Config.in b/package/fonts/dejavu/Config.in
new file mode 100644
index 0000000..96f61b0
--- /dev/null
+++ b/package/fonts/dejavu/Config.in
@@ -0,0 +1,76 @@
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
diff --git a/package/fonts/dejavu/dejavu.mk b/package/fonts/dejavu/dejavu.mk
new file mode 100644
index 0000000..e40a74e
--- /dev/null
+++ b/package/fonts/dejavu/dejavu.mk
@@ -0,0 +1,106 @@
+#############################################################
+#
+# dejavu
+#
+#############################################################
+DEJAVU_VERSION = 2.32
+DEJAVU_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/dejavu
+DEJAVU_SOURCE = dejavu-fonts-ttf-$(DEJAVU_VERSION).tar.bz2
+
+DEJAVU_TARGET_DIR = $(TARGET_DIR)/$(call qstrip,$(BR2_FONT_LAYOUT_BASEDIR))
+
+ifeq ($(BR2_FONT_LAYOUT_SUBDIRS),y)
+DEJAVU_TARGET_DIR = $(DEJAVU_TARGET_DIR)/dejavu
+endif
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
