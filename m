From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu,  9 Apr 2009 09:46:54 +0000 (UTC)
Subject: [Buildroot] svn commit: [26041] trunk/buildroot/package:  lzop
Message-ID: <20090409094654.B36F3769D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-04-09 09:46:54 +0000 (Thu, 09 Apr 2009)
New Revision: 26041

Log:
lzop: new package

Patch by Olaf Rempel <razzor@kopf-tisch.de>, closes #245.

lzop is a file compressor which is very similar to gzip.
lzop uses the LZO data compression library for compression services.
http://www.lzop.org/

Added:
   trunk/buildroot/package/lzop/
   trunk/buildroot/package/lzop/Config.in
   trunk/buildroot/package/lzop/lzop.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2009-04-09 09:46:48 UTC (rev 26040)
+++ trunk/buildroot/package/Config.in	2009-04-09 09:46:54 UTC (rev 26041)
@@ -404,6 +404,7 @@
 source "package/gzip/Config.in"
 endif
 source "package/lzo/Config.in"
+source "package/lzop/Config.in"
 source "package/lzma/Config.in"
 source "package/zlib/Config.in"
 endmenu

Added: trunk/buildroot/package/lzop/Config.in
===================================================================
--- trunk/buildroot/package/lzop/Config.in	                        (rev 0)
+++ trunk/buildroot/package/lzop/Config.in	2009-04-09 09:46:54 UTC (rev 26041)
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LZOP
+	bool "lzop"
+	select BR2_PACKAGE_LZO
+	help
+	  lzop is a file compressor which is very similar to gzip.
+	  lzop uses the LZO data compression library for compression services.
+
+	  http://www.lzop.org/

Added: trunk/buildroot/package/lzop/lzop.mk
===================================================================
--- trunk/buildroot/package/lzop/lzop.mk	                        (rev 0)
+++ trunk/buildroot/package/lzop/lzop.mk	2009-04-09 09:46:54 UTC (rev 26041)
@@ -0,0 +1,12 @@
+#############################################################
+#
+# lzop
+#
+#############################################################
+LZOP_VERSION:=1.02rc1
+LZOP_SOURCE:=lzop-$(LZOP_VERSION).tar.gz
+LZOP_SITE:=http://www.lzop.org/download/
+LZOP_CONF_OPT:=--program-prefix=""
+LZOP_DEPENDENCIES:=lzo
+
+$(eval $(call AUTOTARGETS,package,lzop))
