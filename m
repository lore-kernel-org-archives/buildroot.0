From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 13 Aug 2007 14:30:03 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/tinyx
Message-ID: <20070813213003.BFA87A6837@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-13 14:30:02 -0700 (Mon, 13 Aug 2007)
New Revision: 19496

Log:
Avoid circular dependency

Modified:
   trunk/buildroot/package/tinyx/Config.in


Changeset:
Modified: trunk/buildroot/package/tinyx/Config.in
===================================================================
--- trunk/buildroot/package/tinyx/Config.in	2007-08-13 20:49:58 UTC (rev 19495)
+++ trunk/buildroot/package/tinyx/Config.in	2007-08-13 21:30:02 UTC (rev 19496)
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_TINYX
 	bool "tinyx"
 	default y if BR2_PACKAGE_XSERVER_tinyx
-	depends on BR2_USE_WCHAR
-	depends on BR2_ENABLE_LOCALE
+	select BR2_USE_WCHAR
+	select BR2_ENABLE_LOCALE
 	help
 	  A tiny X server.  Also known as 'Xfbdev' and 'kdrive'.
 
