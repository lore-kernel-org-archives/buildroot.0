From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 10:12:20 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  gtk2-themes
Message-ID: <20080306181220.A2CA2120207@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 10:12:20 -0800 (Thu, 06 Mar 2008)
New Revision: 21198

Log:
added gtk2 themes

Added:
   trunk/buildroot/package/gtk2-themes/
   trunk/buildroot/package/gtk2-themes/Config.in
   trunk/buildroot/package/gtk2-themes/gtk2_themes.mk


Changeset:
Added: trunk/buildroot/package/gtk2-themes/Config.in
===================================================================
--- trunk/buildroot/package/gtk2-themes/Config.in	                        (rev 0)
+++ trunk/buildroot/package/gtk2-themes/Config.in	2008-03-06 18:12:20 UTC (rev 21198)
@@ -0,0 +1,9 @@
+menu "GTK Themes"
+depends BR2_PACKAGE_LIBGTK2
+
+config BR2_PACKAGE_GTK2_THEME_HICOLOR
+	bool "hicolor (defaut theme)"
+	default n
+	depends BR2_PACKAGE_LIBGTK2
+
+endmenu

Added: trunk/buildroot/package/gtk2-themes/gtk2_themes.mk
===================================================================
--- trunk/buildroot/package/gtk2-themes/gtk2_themes.mk	                        (rev 0)
+++ trunk/buildroot/package/gtk2-themes/gtk2_themes.mk	2008-03-06 18:12:20 UTC (rev 21198)
@@ -0,0 +1,19 @@
+#############################################################
+#
+# GTK Theme - Hicolour
+#
+#############################################################
+GTK2_THEME_HICOLOR_VERSION = 0.10
+GTK2_THEME_HICOLOR_SOURCE = hicolor-icon-theme-$(GTK2_THEME_HICOLOR_VERSION).tar.gz
+GTK2_THEME_HICOLOR_SITE = http://icon-theme.freedesktop.org/releases/
+GTK2_THEME_HICOLOR_INSTALL_STAGING = NO
+GTK2_THEME_HICOLOR_INSTALL_TARGET = YES
+GTK2_THEME_HICOLOR_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
+
+GTK2_THEME_HICOLOR_CONF_OPT = --target=$(GNU_TARGET_NAME) --host=$(GNU_TARGET_NAME) \
+        --build=$(GNU_HOST_NAME) --prefix=/usr \
+        --includedir=/usr/include
+
+GTK2_THEME_HICOLOR_DEPENDENCIES = libgtk2
+
+$(eval $(call AUTOTARGETS,package,gtk2_theme_hicolor))
