From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 15 Jan 2007 07:55:45 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
Message-ID: <20070115155545.5CED74856A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-15 07:55:43 -0800 (Mon, 15 Jan 2007)
New Revision: 17311

Log:
- bump version to 2.6.19.2


Modified:
   trunk/buildroot/toolchain/kernel-headers/Config.in
   trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile


Changeset:
Modified: trunk/buildroot/toolchain/kernel-headers/Config.in
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/Config.in	2007-01-14 23:27:26 UTC (rev 17310)
+++ trunk/buildroot/toolchain/kernel-headers/Config.in	2007-01-15 15:55:43 UTC (rev 17311)
@@ -38,9 +38,9 @@
 		depends !BR2_nios2
 		bool "Linux 2.6.12 kernel headers"
 
-	config BR2_KERNEL_HEADERS_2_6_19_1
+	config BR2_KERNEL_HEADERS_2_6_19_2
 		depends !BR2_nios2
-		bool "Linux 2.6.19.1 kernel headers"
+		bool "Linux 2.6.19.2 kernel headers"
 
 endchoice
 
@@ -53,4 +53,4 @@
 	default "2.6.9"     if BR2_KERNEL_HEADERS_2_6_9
 	default "2.6.11"    if BR2_KERNEL_HEADERS_2_6_11
 	default "2.6.12"    if BR2_KERNEL_HEADERS_2_6_12
-	default "2.6.19.1"  if BR2_KERNEL_HEADERS_2_6_19_1
+	default "2.6.19.2"  if BR2_KERNEL_HEADERS_2_6_19_2

Modified: trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile	2007-01-14 23:27:26 UTC (rev 17310)
+++ trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile	2007-01-15 15:55:43 UTC (rev 17311)
@@ -4,11 +4,11 @@
 #
 #############################################################
 
-ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.6.19.1")
+ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.6.19.2")
 VERSION:=2
 PATCHLEVEL:=6
 SUBLEVEL:=19
-EXTRAVERSION:=.1
+EXTRAVERSION:=.2
 LOCALVERSION:=
 LINUX_HEADERS_VERSION:=$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
 LINUX_HEADERS_SITE:=http://www.kernel.org/pub/linux/kernel/v2.6/
