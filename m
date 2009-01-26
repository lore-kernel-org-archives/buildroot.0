From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 26 Jan 2009 06:28:04 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/multimedia/asterisk
Message-ID: <20090126062805.30F7377458@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-26 06:28:03 +0000 (Mon, 26 Jan 2009)
New Revision: 25044

Log:
asterisk: mark as BROKEN and remove obsolete patch

Asterisk seems to have moved to a auto* build system, so the .mk has to be
more or less completely rewritten.

Removed:
   trunk/buildroot/package/multimedia/asterisk/asterisk_no_res_ninit.patch

Modified:
   trunk/buildroot/package/multimedia/asterisk/Config.in


Changeset:
Modified: trunk/buildroot/package/multimedia/asterisk/Config.in
===================================================================
--- trunk/buildroot/package/multimedia/asterisk/Config.in	2009-01-26 06:13:06 UTC (rev 25043)
+++ trunk/buildroot/package/multimedia/asterisk/Config.in	2009-01-26 06:28:03 UTC (rev 25044)
@@ -1,8 +1,6 @@
-comment "asterisk	- is currently broken due to a bad patch"
-	depends on BR2_PACKAGE_ASTERISK
-
 config BR2_PACKAGE_ASTERISK
 	bool "asterisk"
+	depends on BROKEN
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_ZLIB
 	depends on BR2_PACKAGE_OPENSSL

Deleted: trunk/buildroot/package/multimedia/asterisk/asterisk_no_res_ninit.patch
===================================================================
--- trunk/buildroot/package/multimedia/asterisk/asterisk_no_res_ninit.patch	2009-01-26 06:13:06 UTC (rev 25043)
+++ trunk/buildroot/package/multimedia/asterisk/asterisk_no_res_ninit.patch	2009-01-26 06:28:03 UTC (rev 25044)
@@ -1,12 +0,0 @@
-diff -ur /tmp/asterisk-1.2.0-beta1/dns.c asterisk-1.2.0-beta1/dns.c
---- /tmp/asterisk-1.2.0-beta1/dns.c	2005-08-14 04:23:33.000000000 +0200
-+++ asterisk-1.2.0-beta1/dns.c	2005-08-31 09:42:36.000000000 +0200
-@@ -157,7 +157,7 @@
- 	return 0;
- }
- 
--#if defined(res_ninit)
-+#if (defined(res_ninit) && !defined(__UCLIBC__))
- #define HAS_RES_NINIT
- #else
- AST_MUTEX_DEFINE_STATIC(res_lock);
