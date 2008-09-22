From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 22 Sep 2008 01:11:05 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  libconfuse
Message-ID: <20080922081105.960D6F8008@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-09-22 01:11:05 -0700 (Mon, 22 Sep 2008)
New Revision: 23452

Log:
package: add libconfuse - A library for parsing configuration files

Added:
   trunk/buildroot/package/libconfuse/
   trunk/buildroot/package/libconfuse/Config.in
   trunk/buildroot/package/libconfuse/libconfuse.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-09-22 08:11:02 UTC (rev 23451)
+++ trunk/buildroot/package/Config.in	2008-09-22 08:11:05 UTC (rev 23452)
@@ -78,6 +78,7 @@
 source "package/less/Config.in"
 endif
 source "package/libconfig/Config.in"
+source "package/libconfuse/Config.in"
 source "package/libdaemon/Config.in"
 source "package/libelf/Config.in"
 source "package/libevent/Config.in"

Added: trunk/buildroot/package/libconfuse/Config.in
===================================================================
--- trunk/buildroot/package/libconfuse/Config.in	                        (rev 0)
+++ trunk/buildroot/package/libconfuse/Config.in	2008-09-22 08:11:05 UTC (rev 23452)
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBCONFUSE
+	bool "libconfuse"
+	help
+	  LibConfuse is a configuration file parser library written in
+	  C. It supports sections and (lists of) values (strings,
+	  integers, floats, booleans or other sections), as well as some
+	  other features (such as single/double-quoted strings,
+	  environment variable expansion, functions and nested include
+	  statements.
+
+	  http://www.nongnu.org/confuse/

Added: trunk/buildroot/package/libconfuse/libconfuse.mk
===================================================================
--- trunk/buildroot/package/libconfuse/libconfuse.mk	                        (rev 0)
+++ trunk/buildroot/package/libconfuse/libconfuse.mk	2008-09-22 08:11:05 UTC (rev 23452)
@@ -0,0 +1,18 @@
+#############################################################
+#
+# libconfuse
+#
+#############################################################
+LIBCONFUSE_VERSION:=2.6
+LIBCONFUSE_SOURCE:=confuse-$(LIBCONFUSE_VERSION).tar.gz
+LIBCONFUSE_SITE:=http://bzero.se/confuse/
+LIBCONFUSE_AUTORECONF:=NO
+LIBCONFUSE_INSTALL_STAGING:=YES
+LIBCONFUSE_INSTALL_TARGET:=YES
+LIBCONFUSE_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) install-strip
+
+LIBCONFUSE_CONF_OPT:=--enable-shared --disable-rpath $(DISABLE_NLS)
+
+LIBCONFUSE_DEPENDENCIES = uclibc
+
+$(eval $(call AUTOTARGETS,package,libconfuse))
