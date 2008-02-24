From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 24 Feb 2008 12:17:56 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20080224201756.01F8B12C56E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-02-24 12:17:53 -0800 (Sun, 24 Feb 2008)
New Revision: 21101

Log:
buildroot: add BR2_XML_SUPPORT submenu

Group XML stuff under BR2_XML_SUPPORT submenu.


Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-02-24 19:22:25 UTC (rev 21100)
+++ trunk/buildroot/package/Config.in	2008-02-24 20:17:53 UTC (rev 21101)
@@ -46,7 +46,6 @@
 source "package/cvs/Config.in"
 source "package/distcc/Config.in"
 source "package/dmalloc/Config.in"
-source "package/expat/Config.in"
 source "package/fakeroot/Config.in"
 source "package/gettext/Config.in"
 source "package/gmp/Config.in"
@@ -57,7 +56,6 @@
 source "package/pkgconfig/Config.in"
 source "package/readline/Config.in"
 source "package/valgrind/Config.in"
-source "package/xerces/Config.in"
 
 comment "Other stuff"
 source "package/at/Config.in"
@@ -80,8 +78,6 @@
 source "package/libgpg-error/Config.in"
 source "package/liblockfile/Config.in"
 source "package/libsysfs/Config.in"
-source "package/libxml2/Config.in"
-source "package/libxslt/Config.in"
 source "package/lockfile-progs/Config.in"
 source "package/lsof/Config.in"
 source "package/ltp-testsuite/Config.in"
@@ -419,6 +415,19 @@
 source "package/php/Config.in"
 endif
 
+menuconfig BR2_XML_SUPPORT
+	bool "XML handling"
+	default y
+	help
+	  Support for XML handling
+
+if BR2_XML_SUPPORT
+source "package/expat/Config.in"
+source "package/libxml2/Config.in"
+source "package/libxslt/Config.in"
+source "package/xerces/Config.in"
+endif
+
 menuconfig BR2_GAMES
 	bool "Games"
 	default y
