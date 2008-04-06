From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun,  6 Apr 2008 03:10:31 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20080406101031.259663C3CA@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-04-06 03:10:30 -0700 (Sun, 06 Apr 2008)
New Revision: 21651

Log:
Make xconfig the default for Atmel targets

Modified:
   trunk/buildroot/target/linux/Config.in.advanced


Changeset:
Modified: trunk/buildroot/target/linux/Config.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Config.in.advanced	2008-04-06 10:02:53 UTC (rev 21650)
+++ trunk/buildroot/target/linux/Config.in.advanced	2008-04-06 10:10:30 UTC (rev 21651)
@@ -445,6 +445,7 @@
 
 choice
 	prompt "Preferred config tool"
+	default BR2_MAKE_XCONFIG IF BR2_TARGET_ATMEL
 	default BR2_MAKE_MENUCONFIG
 	help
 	  Define the preferred tool to invoke if a configuration is invalid
