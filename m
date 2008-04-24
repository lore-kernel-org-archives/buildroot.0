From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu, 24 Apr 2008 09:56:06 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  pcre
Message-ID: <20080424165606.555523C7F7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-04-24 09:56:06 -0700 (Thu, 24 Apr 2008)
New Revision: 21848

Log:
add pcre

Added:
   trunk/buildroot/package/pcre/
   trunk/buildroot/package/pcre/Config.in
   trunk/buildroot/package/pcre/pcre.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-04-24 16:54:29 UTC (rev 21847)
+++ trunk/buildroot/package/Config.in	2008-04-24 16:56:06 UTC (rev 21848)
@@ -56,6 +56,7 @@
 source "package/pkgconfig/Config.in"
 source "package/readline/Config.in"
 source "package/valgrind/Config.in"
+source "package/pcre/Config.in"
 
 comment "Other stuff"
 source "package/at/Config.in"

Added: trunk/buildroot/package/pcre/Config.in
===================================================================
--- trunk/buildroot/package/pcre/Config.in	                        (rev 0)
+++ trunk/buildroot/package/pcre/Config.in	2008-04-24 16:56:06 UTC (rev 21848)
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_PCRE
+	bool "pcre"
+	default n
+	help
+	  Perl Compatible Regular Expressions

Added: trunk/buildroot/package/pcre/pcre.mk
===================================================================
--- trunk/buildroot/package/pcre/pcre.mk	                        (rev 0)
+++ trunk/buildroot/package/pcre/pcre.mk	2008-04-24 16:56:06 UTC (rev 21848)
@@ -0,0 +1,18 @@
+#############################################################
+#
+# PCRE
+#
+#############################################################
+PCRE_VERSION = 7.6
+PCRE_SOURCE = pcre-$(PCRE_VERSION).tar.bz2
+PCRE_SITE = ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre
+PCRE_INSTALL_STAGING = YES
+PCRE_INSTALL_TARGET = YES
+
+PCRE_CONF_OPT = --target=$(GNU_TARGET_NAME) --host=$(GNU_TARGET_NAME) \
+        --build=$(GNU_HOST_NAME) --prefix=/usr \
+        --includedir=/usr/include
+
+PCRE_DEPENDENCIES = uclibc
+
+$(eval $(call AUTOTARGETS,package,pcre))
