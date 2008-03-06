From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 10:16:05 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  libsexy
Message-ID: <20080306181605.967C0120226@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 10:16:05 -0800 (Thu, 06 Mar 2008)
New Revision: 21207

Log:
added libsexy

Added:
   trunk/buildroot/package/libsexy/
   trunk/buildroot/package/libsexy/Config.in
   trunk/buildroot/package/libsexy/libsexy.mk


Changeset:
Added: trunk/buildroot/package/libsexy/Config.in
===================================================================
--- trunk/buildroot/package/libsexy/Config.in	                        (rev 0)
+++ trunk/buildroot/package/libsexy/Config.in	2008-03-06 18:16:05 UTC (rev 21207)
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBSEXY
+	bool "libsexy"
+	default n
+	help
+	  libsexy is a collection of GTK+ widgets that extend the functionality of such standard widgets as GtkEntry and GtkLabel by subclassing them and working around the limitations of the widgets.
+
+	  http://www.chipx86.com/wiki/Libsexy

Added: trunk/buildroot/package/libsexy/libsexy.mk
===================================================================
--- trunk/buildroot/package/libsexy/libsexy.mk	                        (rev 0)
+++ trunk/buildroot/package/libsexy/libsexy.mk	2008-03-06 18:16:05 UTC (rev 21207)
@@ -0,0 +1,15 @@
+################################################################################
+#
+# libsexy
+#
+################################################################################
+
+LIBSEXY_VERSION = 0.1.11
+LIBSEXY_SOURCE = libsexy-$(LIBSEXY_VERSION).tar.gz
+LIBSEXY_SITE = http://releases.chipx86.com/libsexy/libsexy/
+LIBSEXY_AUTORECONF = NO
+LIBSEXY_DEPENDENCIES = xlib_libX11 libgtk2
+LIBSEXY_INSTALL_TARGET = YES
+LIBSEXY_INSTALL_STAGING = YES
+
+$(eval $(call AUTOTARGETS,package/libsexy,libsexy))
