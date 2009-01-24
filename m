From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat, 24 Jan 2009 06:44:14 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libsexy
Message-ID: <20090124064414.E9EDE769CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-24 06:44:13 +0000 (Sat, 24 Jan 2009)
New Revision: 24996

Log:
libsexy: unbreak build

libsexy doesn't depend on libX11, but it does need libxml2.

Modified:
   trunk/buildroot/package/libsexy/Config.in
   trunk/buildroot/package/libsexy/libsexy.mk


Changeset:
Modified: trunk/buildroot/package/libsexy/Config.in
===================================================================
--- trunk/buildroot/package/libsexy/Config.in	2009-01-24 06:44:04 UTC (rev 24995)
+++ trunk/buildroot/package/libsexy/Config.in	2009-01-24 06:44:13 UTC (rev 24996)
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBSEXY
 	bool "libsexy"
 	depends on BR2_PACKAGE_LIBGTK2
+	select BR2_PACKAGE_LIBXML2
 	help
 	  libsexy is a collection of GTK+ widgets that extend the
 	  functionality of such standard widgets as GtkEntry and
@@ -8,3 +9,4 @@
 	  limitations of the widgets.
 
 	  http://www.chipx86.com/wiki/Libsexy
+

Modified: trunk/buildroot/package/libsexy/libsexy.mk
===================================================================
--- trunk/buildroot/package/libsexy/libsexy.mk	2009-01-24 06:44:04 UTC (rev 24995)
+++ trunk/buildroot/package/libsexy/libsexy.mk	2009-01-24 06:44:13 UTC (rev 24996)
@@ -8,7 +8,7 @@
 LIBSEXY_SOURCE = libsexy-$(LIBSEXY_VERSION).tar.gz
 LIBSEXY_SITE = http://releases.chipx86.com/libsexy/libsexy/
 LIBSEXY_AUTORECONF = NO
-LIBSEXY_DEPENDENCIES = xlib_libX11 libgtk2
+LIBSEXY_DEPENDENCIES = libgtk2 libxml2
 LIBSEXY_INSTALL_TARGET = YES
 LIBSEXY_INSTALL_STAGING = YES
 
