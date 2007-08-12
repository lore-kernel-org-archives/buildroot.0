From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 11 Aug 2007 17:37:01 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mpatrol
Message-ID: <20070812003701.7068CA65F2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-11 17:37:01 -0700 (Sat, 11 Aug 2007)
New Revision: 19455

Log:
Highlight dependencies for mpatrol

Modified:
   trunk/buildroot/package/mpatrol/Config.in


Changeset:
Modified: trunk/buildroot/package/mpatrol/Config.in
===================================================================
--- trunk/buildroot/package/mpatrol/Config.in	2007-08-12 00:21:22 UTC (rev 19454)
+++ trunk/buildroot/package/mpatrol/Config.in	2007-08-12 00:37:01 UTC (rev 19455)
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_MPATROL
 	bool "mpatrol"
 	default n
+	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_GCC_TARGET || BR2_PACKAGE_LIBELF
+
 	help
 	  A debugging tool that attempts to diagnose run-time errors that are
 	  caused by the wrong use of dynamically allocated memory. It acts as
