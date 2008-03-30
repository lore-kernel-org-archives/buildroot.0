From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 30 Mar 2008 14:49:16 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20080330214917.064FA3C52C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-03-30 14:49:16 -0700 (Sun, 30 Mar 2008)
New Revision: 21589

Log:
Do not allow optimizations which breaks linux build

Modified:
   trunk/buildroot/Config.in


Changeset:
Modified: trunk/buildroot/Config.in
===================================================================
--- trunk/buildroot/Config.in	2008-03-30 20:52:33 UTC (rev 21588)
+++ trunk/buildroot/Config.in	2008-03-30 21:49:16 UTC (rev 21589)
@@ -259,11 +259,13 @@
 
 config BR2_OPTIMIZE_0
 	bool "optimization level 0"
+	depends on !BR2_PACKAGE_LINUX
 	help
 	  Do not optimize. This is the default. 
 
 config BR2_OPTIMIZE_1
 	bool "optimization level 1"
+	depends on !BR2_PACKAGE_LINUX
 	help
 	  Optimize. Optimizing compilation takes somewhat more time, 
 	  and a lot more memory for a large function. With -O, the 
