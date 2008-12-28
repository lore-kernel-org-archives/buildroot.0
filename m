From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 28 Dec 2008 20:54:41 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  gmpc
Message-ID: <20081228205441.B88A676D44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-28 20:54:40 +0000 (Sun, 28 Dec 2008)
New Revision: 24583

Log:
package: add gmpc (gtk musicpd client) package

Added:
   trunk/buildroot/package/gmpc/
   trunk/buildroot/package/gmpc/Config.in
   trunk/buildroot/package/gmpc/gmpc.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-12-28 20:07:50 UTC (rev 24582)
+++ trunk/buildroot/package/Config.in	2008-12-28 20:54:40 UTC (rev 24583)
@@ -372,6 +372,7 @@
 source "package/dillo/Config.in"
 source "package/docker/Config.in"
 source "package/gqview/Config.in"
+source "package/gmpc/Config.in"
 source "package/gtkperf/Config.in"
 source "package/leafpad/Config.in"
 source "package/midori/Config.in"

Added: trunk/buildroot/package/gmpc/Config.in
===================================================================
--- trunk/buildroot/package/gmpc/Config.in	                        (rev 0)
+++ trunk/buildroot/package/gmpc/Config.in	2008-12-28 20:54:40 UTC (rev 24583)
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_GMPC
+	bool "gmpc"
+	depends on BR2_PACKAGE_LIBGTK2
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_GETTEXT
+	select BR2_PACKAGE_LIBINTL
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_PKGCONFIG
+	select BR2_PACKAGE_LIBMPD
+	select BR2_PACKAGE_LIBCURL
+	help
+	  Gnome Music Player Client is a GNOME/GTK2.2 client for
+	  Music Player Daemon.
+
+	  http://gmpcwiki.sarine.nl/index.php?title=GMPC

Added: trunk/buildroot/package/gmpc/gmpc.mk
===================================================================
--- trunk/buildroot/package/gmpc/gmpc.mk	                        (rev 0)
+++ trunk/buildroot/package/gmpc/gmpc.mk	2008-12-28 20:54:40 UTC (rev 24583)
@@ -0,0 +1,17 @@
+#############################################################
+#
+# gmpc
+#
+#############################################################
+GMPC_VERSION = 0.17.0
+GMPC_SOURCE = gmpc-$(GMPC_VERSION).tar.gz
+GMPC_SITE = http://download.sarine.nl/download/Programs/gmpc/$(GMPC_VERSION)/
+GMPC_LIBTOOL_PATCH = NO
+GMPC_CONF_ENV = ac_cv_lib_curl_curl_global_init=yes
+GMPC_CONF_OPT = --disable-mmkeys $(DISABLE_NLS)
+
+
+GMPC_DEPENDENCIES = libglib2 libgtk2 libcurl libmpd
+
+
+$(eval $(call AUTOTARGETS,package,gmpc))
