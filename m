From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 29 Nov 2007 05:01:45 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/asterisk
Message-ID: <20071129130145.210C130048@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-11-29 05:01:45 -0800 (Thu, 29 Nov 2007)
New Revision: 20582

Log:
Make asterisk depend on packets, instead of selecting them

Modified:
   trunk/buildroot/package/asterisk/Config.in


Changeset:
Modified: trunk/buildroot/package/asterisk/Config.in
===================================================================
--- trunk/buildroot/package/asterisk/Config.in	2007-11-29 13:01:23 UTC (rev 20581)
+++ trunk/buildroot/package/asterisk/Config.in	2007-11-29 13:01:45 UTC (rev 20582)
@@ -3,8 +3,11 @@
 	default n
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_ZLIB
-	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_MPG123
+	depends BR2_PACKAGE_OPENSSL
+	depends BR2_PACKAGE_MPG123
 	help
 		Asterisk - the Open Source PBX
 
+comment "asterisk	- disabled (required openssl and mpg123)"
+	depends !BR2_PACKAGE_OPENSSL || ! BR2_PACKAGE_MPG123
+
