From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 14 Aug 2007 01:44:30 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/rxvt
Message-ID: <20070814084430.0F332A65D2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-14 01:44:28 -0700 (Tue, 14 Aug 2007)
New Revision: 19503

Log:
rxvt hardwired for X11R6, so ensure dependency is OK

Modified:
   trunk/buildroot/package/rxvt/Config.in


Changeset:
Modified: trunk/buildroot/package/rxvt/Config.in
===================================================================
--- trunk/buildroot/package/rxvt/Config.in	2007-08-14 07:45:01 UTC (rev 19502)
+++ trunk/buildroot/package/rxvt/Config.in	2007-08-14 08:44:28 UTC (rev 19503)
@@ -1,7 +1,10 @@
 config BR2_PACKAGE_RXVT
 	bool "rxvt"
 	default n
+	depends BR2_PACKAGE_XSERVER_xorg || BR2_PACKAGE_XSERVER_tinyx
+
 	help
 	  A nice small colour vt102 X terminal emulator.
+	  Does not build for X11R7 yet.
 
 	  http://www.rxvt.org/
