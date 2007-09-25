From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 25 Sep 2007 04:38:21 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
Message-ID: <20070925113821.5F15D300DA@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-25 04:38:20 -0700 (Tue, 25 Sep 2007)
New Revision: 20007

Log:
- bump version


Modified:
   trunk/buildroot/toolchain/kernel-headers/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/kernel-headers/Config.in
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/Config.in	2007-09-25 11:37:31 UTC (rev 20006)
+++ trunk/buildroot/toolchain/kernel-headers/Config.in	2007-09-25 11:38:20 UTC (rev 20007)
@@ -6,12 +6,15 @@
 
 choice
 	prompt "Kernel Headers"
-	default BR2_KERNEL_HEADERS_2_6_22_1
+	default BR2_KERNEL_HEADERS_2_6_22
 	help
 	  Select the version of kernel header files you wish to use.
 	  You must select the correct set of header files to match
 	  the kernel you intend to use on your target system.
 
+	  For the snapshot, you have to provide the
+	  linux-2.6.tar.bz2 tarball in your download dir.
+
 	config BR2_KERNEL_HEADERS_2_4_25
 		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
 		bool "Linux 2.4.25 kernel headers"
@@ -64,6 +67,9 @@
 		depends !BR2_avr32 && !BR2_nios2
 		bool "Latest Linux 2.6.22.x kernel headers"
 
+	config BR2_KERNEL_HEADERS_SNAP
+		bool "Linux 2.6 snapshot"
+
 endchoice
 
 config BR2_KERNEL_HEADERS_IPMI
@@ -107,9 +113,10 @@
 	default "2.6.11"    if BR2_KERNEL_HEADERS_2_6_11
 	default "2.6.12"    if BR2_KERNEL_HEADERS_2_6_12
 	default "2.6.20.4"  if BR2_KERNEL_HEADERS_2_6_20_4
-	default "2.6.20.19"  if BR2_KERNEL_HEADERS_2_6_20
+	default "2.6.20.20" if BR2_KERNEL_HEADERS_2_6_20
 	default "2.6.21.5"  if BR2_KERNEL_HEADERS_2_6_21_5
 	default "2.6.21.7"  if BR2_KERNEL_HEADERS_2_6_21
 	default "2.6.22.1"  if BR2_KERNEL_HEADERS_2_6_22_1
-	default "2.6.22.7"  if BR2_KERNEL_HEADERS_2_6_22
+	default "2.6.22.8"  if BR2_KERNEL_HEADERS_2_6_22
+	default "2.6"       if BR2_KERNEL_HEADERS_SNAP
 
