From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Wed, 17 Sep 2008 23:48:20 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  libupnp
Message-ID: <20080918064820.EBD403C666@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-09-17 23:48:20 -0700 (Wed, 17 Sep 2008)
New Revision: 23422

Log:
libupnp: add package libupnp

This patch adds libupnp package to Buildroot. libupnp provides developers
with an API that are compliant with version 1.0 of the Universal Plug and
Play Device Architecture Specification.

http://pupnp.sourceforge.net/

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>


Added:
   trunk/buildroot/package/libupnp/
   trunk/buildroot/package/libupnp/Config.in
   trunk/buildroot/package/libupnp/libupnp.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-09-18 04:38:14 UTC (rev 23421)
+++ trunk/buildroot/package/Config.in	2008-09-18 06:48:20 UTC (rev 23422)
@@ -163,6 +163,7 @@
 source "package/libeXosip2/Config.in"
 source "package/libosip2/Config.in"
 source "package/libpcap/Config.in"
+source "package/libupnp/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/lighttpd/Config.in"
 endif

Added: trunk/buildroot/package/libupnp/Config.in
===================================================================
--- trunk/buildroot/package/libupnp/Config.in	                        (rev 0)
+++ trunk/buildroot/package/libupnp/Config.in	2008-09-18 06:48:20 UTC (rev 23422)
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBUPNP
+	bool "libupnp"
+	help
+	  The portable SDK for UPnP(tm) Devices (libupnp) provides developers
+	  with an API and open source code for building control points,
+	  devices, and bridges that are compliant with Version 1.0 of the
+	  Universal Plug and Play Device Architecture Specification
+
+	  http://pupnp.sourceforge.net/

Added: trunk/buildroot/package/libupnp/libupnp.mk
===================================================================
--- trunk/buildroot/package/libupnp/libupnp.mk	                        (rev 0)
+++ trunk/buildroot/package/libupnp/libupnp.mk	2008-09-18 06:48:20 UTC (rev 23422)
@@ -0,0 +1,13 @@
+#############################################################
+#
+# libupnp
+#
+#############################################################
+LIBUPNP_VERSION:=1.6.6
+LIBUPNP_SOURCE:=libupnp-$(LIBUPNP_VERSION).tar.bz2
+LIBUPNP_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/pupnp
+
+LIBUPNP_INSTALL_STAGING:=YES
+LIBUPNP_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) install-strip
+
+$(eval $(call AUTOTARGETS,package,libupnp))
