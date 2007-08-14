From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 13 Aug 2007 23:18:03 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20070814061803.56D0AA683A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-13 23:18:02 -0700 (Mon, 13 Aug 2007)
New Revision: 19498

Log:
Remove cirular dependencies

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-08-14 06:16:08 UTC (rev 19497)
+++ trunk/buildroot/package/Config.in	2007-08-14 06:18:02 UTC (rev 19498)
@@ -315,8 +315,6 @@
 	bool "xorg"
 config BR2_PACKAGE_XSERVER_tinyx
 	bool "tinyx"
-	depends on BR2_USE_WCHAR
-	depends on BR2_ENABLE_LOCALE
 endchoice
 if BR2_PACKAGE_XSERVER_x11r7
 source "package/x11r7/Config.in"
