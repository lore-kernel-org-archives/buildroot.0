From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 10:11:21 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  gqview
Message-ID: <20080306181121.012F61201EC@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 10:11:21 -0800 (Thu, 06 Mar 2008)
New Revision: 21196

Log:
added gqview

Added:
   trunk/buildroot/package/gqview/
   trunk/buildroot/package/gqview/Config.in
   trunk/buildroot/package/gqview/gqview-2.1.5-make.patch
   trunk/buildroot/package/gqview/gqview.mk


Changeset:
Added: trunk/buildroot/package/gqview/Config.in
===================================================================
--- trunk/buildroot/package/gqview/Config.in	                        (rev 0)
+++ trunk/buildroot/package/gqview/Config.in	2008-03-06 18:11:21 UTC (rev 21196)
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_GQVIEW
+	bool "gqview"
+	default n
+	help
+	  GQview is an image viewer for Unix operating systems (developed on Linux).
+
+	  http://prdownloads.sourceforge.net/gqview

Added: trunk/buildroot/package/gqview/gqview-2.1.5-make.patch
===================================================================
--- trunk/buildroot/package/gqview/gqview-2.1.5-make.patch	                        (rev 0)
+++ trunk/buildroot/package/gqview/gqview-2.1.5-make.patch	2008-03-06 18:11:21 UTC (rev 21196)
@@ -0,0 +1,11 @@
+--- a/src/Makefile.in	2006-12-02 20:41:25.000000000 -0500
++++ b/src/Makefile.in	2008-02-13 14:00:25.000000000 -0500
+@@ -200,7 +200,7 @@ SUBDIRS = icons
+ DIST_SUBDIRS = icons
+ INCLUDES = -I$(srcdir) -I$(builddir)    \
+ 	-I$(top_srcdir) -I$(top_builddir)       \
+-	-I$(includedir) $(GTK_CFLAGS)
++	$(GTK_CFLAGS)
+ 
+ module_SLIK = \
+ 	intl.h		\

Added: trunk/buildroot/package/gqview/gqview.mk
===================================================================
--- trunk/buildroot/package/gqview/gqview.mk	                        (rev 0)
+++ trunk/buildroot/package/gqview/gqview.mk	2008-03-06 18:11:21 UTC (rev 21196)
@@ -0,0 +1,18 @@
+#############################################################
+#
+# gqview
+#
+#############################################################
+GQVIEW_VERSION = 2.1.5
+GQVIEW_SOURCE = gqview-$(GQVIEW_VERSION).tar.gz
+GQVIEW_SITE = http://prdownloads.sourceforge.net/gqview
+GQVIEW_AUTORECONF = NO
+GQVIEW_INSTALL_STAGING = NO
+GQVIEW_INSTALL_TARGET = YES
+
+GQVIEW_CONF_OPT = PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig
+
+GQVIEW_DEPENDENCIES = uclibc libgtk2
+
+$(eval $(call AUTOTARGETS,package,gqview))
+
