From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 31 Jan 2007 09:36:44 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device: x86 x86/i386
Message-ID: <20070131173644.64C964856E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-31 09:36:43 -0800 (Wed, 31 Jan 2007)
New Revision: 17687

Log:
- reenable linux26


Modified:
   trunk/buildroot/target/device/Config.in
   trunk/buildroot/target/device/Makefile.in
   trunk/buildroot/target/device/x86/Makefile.in
   trunk/buildroot/target/device/x86/i386/Makefile.in


Changeset:
Modified: trunk/buildroot/target/device/Config.in
===================================================================
--- trunk/buildroot/target/device/Config.in	2007-01-31 15:09:26 UTC (rev 17686)
+++ trunk/buildroot/target/device/Config.in	2007-01-31 17:36:43 UTC (rev 17687)
@@ -1,17 +1,9 @@
 menu "Board Support Options"
 
-config BR2_TARGET_GENERIC
+config BR2_PACKAGE_LINUX
 	bool "linux kernel"
 	default n
-	select BR2_PACKAGE_LINUX
 	help
-	  Architecture or board dependant linux kernel.
-
-config BR2_PACKAGE_LINUX
-	bool "linux"
-	default n
-	depends BR2_TARGET_GENERIC
-	help
 	  The Linux kernel.
 	  http://www.kernel.org/
 

Modified: trunk/buildroot/target/device/Makefile.in
===================================================================
--- trunk/buildroot/target/device/Makefile.in	2007-01-31 15:09:26 UTC (rev 17686)
+++ trunk/buildroot/target/device/Makefile.in	2007-01-31 17:36:43 UTC (rev 17687)
@@ -1,3 +1,6 @@
 TARGET_DEVICE_DEPMOD:=target/device/x86/depmod.pl
 
 -include target/device/*/Makefile.in
+ifeq ($(BR2_PACKAGE_LINUX),y)
+TARGETS+=linux26
+endif

Modified: trunk/buildroot/target/device/x86/Makefile.in
===================================================================
--- trunk/buildroot/target/device/x86/Makefile.in	2007-01-31 15:09:26 UTC (rev 17686)
+++ trunk/buildroot/target/device/x86/Makefile.in	2007-01-31 17:36:43 UTC (rev 17687)
@@ -1,5 +1,3 @@
-ifeq ($(strip $(BR2_TARGET_GENERIC)),y)
 ifeq ($(strip $(BR2_i386)),y)
 include target/device/x86/i386/Makefile.in
 endif
-endif

Modified: trunk/buildroot/target/device/x86/i386/Makefile.in
===================================================================
--- trunk/buildroot/target/device/x86/i386/Makefile.in	2007-01-31 15:09:26 UTC (rev 17686)
+++ trunk/buildroot/target/device/x86/i386/Makefile.in	2007-01-31 17:36:43 UTC (rev 17687)
@@ -5,4 +5,3 @@
 endif
 LINUX26_FORMAT=bzImage
 
-TARGETS+=linux26
