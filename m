From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 19 Aug 2007 15:30:47 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20070819223047.8BDD0A6110@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-19 15:30:47 -0700 (Sun, 19 Aug 2007)
New Revision: 19578

Log:
Remove target specific things from Linux config

Modified:
   trunk/buildroot/target/linux/Config.in


Changeset:
Modified: trunk/buildroot/target/linux/Config.in
===================================================================
--- trunk/buildroot/target/linux/Config.in	2007-08-19 22:28:51 UTC (rev 19577)
+++ trunk/buildroot/target/linux/Config.in	2007-08-19 22:30:47 UTC (rev 19578)
@@ -191,14 +191,7 @@
 	depends on BR2_PACKAGE_LINUX
 
 config BR2_LINUX_BSP_PATCH
-	string	"Additional Atmel patch to apply"
-	default "linux-2.6.20.4-atmel.patch.bz2"	if	BR2_TARGET_AVR32 
-	default "linux-2.6.20.4-atmel.patch.bz2"	if	BR2_TARGET_AT91
-	
-
-config BR2_LINUX_BSP_PATCH
-	string	"Additional patch to apply"
-	depends on ! (BR2_TARGET_AVR32 || BR2_TARGET_AT91)
+	string	"Additional patch to apply (supply full path)"
 	default ""
 
 endmenu
