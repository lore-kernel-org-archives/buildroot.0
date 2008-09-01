From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  1 Sep 2008 03:51:31 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  libconfig
Message-ID: <20080901105131.B130B3C66E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-09-01 03:51:31 -0700 (Mon, 01 Sep 2008)
New Revision: 23291

Log:
package: add libconfig package

Added:
   trunk/buildroot/package/libconfig/
   trunk/buildroot/package/libconfig/Config.in
   trunk/buildroot/package/libconfig/libconfig.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-08-31 21:56:48 UTC (rev 23290)
+++ trunk/buildroot/package/Config.in	2008-09-01 10:51:31 UTC (rev 23291)
@@ -77,6 +77,7 @@
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/less/Config.in"
 endif
+source "package/libconfig/Config.in"
 source "package/libdaemon/Config.in"
 source "package/libelf/Config.in"
 source "package/libevent/Config.in"

Added: trunk/buildroot/package/libconfig/Config.in
===================================================================
--- trunk/buildroot/package/libconfig/Config.in	                        (rev 0)
+++ trunk/buildroot/package/libconfig/Config.in	2008-09-01 10:51:31 UTC (rev 23291)
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBCONFIG
+	bool "libconfig"
+	help
+	  Libconfig is a simple library for manipulating structured
+	  configuration files. The file format is more compact and more
+	  readable than XML. And unlike XML, it is type-aware, so it is
+	  not necessary to do string parsing in application code.
+
+	  http://www.hyperrealm.com/libconfig/

Added: trunk/buildroot/package/libconfig/libconfig.mk
===================================================================
--- trunk/buildroot/package/libconfig/libconfig.mk	                        (rev 0)
+++ trunk/buildroot/package/libconfig/libconfig.mk	2008-09-01 10:51:31 UTC (rev 23291)
@@ -0,0 +1,20 @@
+#############################################################
+#
+# libconfig
+#
+#############################################################
+LIBCONFIG_VERSION:=1.3
+LIBCONFIG_SOURCE:=libconfig-$(LIBCONFIG_VERSION).tar.gz
+LIBCONFIG_SITE:=http://www.hyperrealm.com/libconfig/
+LIBCONFIG_AUTORECONF:=NO
+LIBCONFIG_INSTALL_STAGING:=YES
+LIBCONFIG_INSTALL_TARGET:=YES
+LIBCONFIG_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) install-strip
+
+ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
+LIBCONFIG_CONF_OPT:=--disable-cxx
+endif
+
+LIBCONFIG_DEPENDENCIES = uclibc
+
+$(eval $(call AUTOTARGETS,package,libconfig))
