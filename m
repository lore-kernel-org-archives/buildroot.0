From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  1 Apr 2015 05:56:24 -0300
Subject: [Buildroot] [PATCH] package/gtk2-themes: remove
Message-ID: <1427878584-20001-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The category just contains gtk2-theme-hicolor... which is a duplicate of
hicolor-icon-theme, d'oh!
Remove it and select the only one via legacy.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 Config.in.legacy                                           |  7 +++++++
 package/Config.in                                          |  1 -
 package/gtk2-themes/Config.in                              |  6 ------
 package/gtk2-themes/gtk2-theme-hicolor/Config.in           |  2 --
 .../gtk2-themes/gtk2-theme-hicolor/gtk2-theme-hicolor.mk   | 14 --------------
 package/gtk2-themes/gtk2-themes.mk                         |  1 -
 6 files changed, 7 insertions(+), 24 deletions(-)
 delete mode 100644 package/gtk2-themes/Config.in
 delete mode 100644 package/gtk2-themes/gtk2-theme-hicolor/Config.in
 delete mode 100644 package/gtk2-themes/gtk2-theme-hicolor/gtk2-theme-hicolor.mk
 delete mode 100644 package/gtk2-themes/gtk2-themes.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 1f57671..445cab7 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -101,6 +101,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2015.05"
 
+config BR2_PACKAGE_GTK2_THEME_HICOLOR
+	bool "hicolor (default theme) is a duplicate"
+	select BR2_LEGACY
+	select BR2_PACKAGE_HICOLOR_ICON_THEME
+	help
+	  The option was just a duplicate of hicolor icon theme.
+
 config BR2_PACKAGE_VALGRIND_PTRCHECK
 	bool "valgrind's PTRCheck was renamed to SGCheck"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 85e2704..9d9fb71 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -709,7 +709,6 @@ menu "Graphics"
 	source "package/giblib/Config.in"
 	source "package/giflib/Config.in"
 	source "package/gtk2-engines/Config.in"
-	source "package/gtk2-themes/Config.in"
 	source "package/harfbuzz/Config.in"
 	source "package/hicolor-icon-theme/Config.in"
 	source "package/imlib2/Config.in"
diff --git a/package/gtk2-themes/Config.in b/package/gtk2-themes/Config.in
deleted file mode 100644
index ac212b8..0000000
--- a/package/gtk2-themes/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-menu "GTK Themes"
-depends on BR2_PACKAGE_LIBGTK2
-
-source "package/gtk2-themes/gtk2-theme-hicolor/Config.in"
-
-endmenu
diff --git a/package/gtk2-themes/gtk2-theme-hicolor/Config.in b/package/gtk2-themes/gtk2-theme-hicolor/Config.in
deleted file mode 100644
index 144f1d8..0000000
--- a/package/gtk2-themes/gtk2-theme-hicolor/Config.in
+++ /dev/null
@@ -1,2 +0,0 @@
-config BR2_PACKAGE_GTK2_THEME_HICOLOR
-	bool "hicolor (default theme)"
diff --git a/package/gtk2-themes/gtk2-theme-hicolor/gtk2-theme-hicolor.mk b/package/gtk2-themes/gtk2-theme-hicolor/gtk2-theme-hicolor.mk
deleted file mode 100644
index 84df23f..0000000
--- a/package/gtk2-themes/gtk2-theme-hicolor/gtk2-theme-hicolor.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# gtk2-theme-hicolor
-#
-################################################################################
-
-GTK2_THEME_HICOLOR_VERSION = 0.10
-GTK2_THEME_HICOLOR_SOURCE = hicolor-icon-theme-$(GTK2_THEME_HICOLOR_VERSION).tar.gz
-GTK2_THEME_HICOLOR_SITE = http://icon-theme.freedesktop.org/releases
-GTK2_THEME_HICOLOR_DEPENDENCIES = libgtk2
-GTK2_THEME_HICOLOR_LICENSE = GPLv2
-GTK2_THEME_HICOLOR_LICENSE_FILES = COPYING
-
-$(eval $(autotools-package))
diff --git a/package/gtk2-themes/gtk2-themes.mk b/package/gtk2-themes/gtk2-themes.mk
deleted file mode 100644
index fc66698..0000000
--- a/package/gtk2-themes/gtk2-themes.mk
+++ /dev/null
@@ -1 +0,0 @@
-include $(sort $(wildcard package/gtk2-themes/*/*.mk))
-- 
2.0.5
