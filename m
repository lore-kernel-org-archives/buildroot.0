From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 24 Mar 2009 09:18:09 +0000 (UTC)
Subject: [Buildroot] svn commit: [25809]
	trunk/buildroot/toolchain/kernel-headers
Message-ID: <20090324091809.89DFC77192@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-24 09:18:09 +0000 (Tue, 24 Mar 2009)
New Revision: 25809

Log:
kernel-headers: add 2.6.29.x, remove 2.6.22.x

Modified:
   trunk/buildroot/toolchain/kernel-headers/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/kernel-headers/Config.in
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/Config.in	2009-03-24 09:17:49 UTC (rev 25808)
+++ trunk/buildroot/toolchain/kernel-headers/Config.in	2009-03-24 09:18:09 UTC (rev 25809)
@@ -6,7 +6,7 @@
 
 choice
 	prompt "Kernel Headers"
-	default BR2_KERNEL_HEADERS_2_6_28
+	default BR2_KERNEL_HEADERS_2_6_29
 
 	help
 	  Select the version of kernel header files you wish to use.
@@ -16,10 +16,6 @@
 	  For the snapshot, you have to provide the
 	  linux-2.6.tar.bz2 tarball in your download dir.
 
-	config BR2_KERNEL_HEADERS_2_6_22
-		depends on BR2_DEPRECATED
-		bool "Linux 2.6.22.x kernel headers"
-
 	config BR2_KERNEL_HEADERS_2_6_23
 		depends on BR2_DEPRECATED
 		bool "Linux 2.6.23.x kernel headers"
@@ -37,12 +33,16 @@
 		bool "Linux 2.6.26.x kernel headers"
 
 	config BR2_KERNEL_HEADERS_2_6_27
-		depends on BR2_DEPRECATED || BR2_RECENT
+		depends on BR2_DEPRECATED
 		bool "Linux 2.6.27.x kernel headers"
 
 	config BR2_KERNEL_HEADERS_2_6_28
 		bool "Linux 2.6.28.x kernel headers"
+		depends on BR2_DEPRECATED || BR2_RECENT
 
+	config BR2_KERNEL_HEADERS_2_6_29
+		bool "Linux 2.6.29.x kernel headers"
+
 	config BR2_KERNEL_HEADERS_SNAP
 		bool "Linux 2.6 snapshot"
 
@@ -56,12 +56,12 @@
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "2.6.22.10"	if BR2_KERNEL_HEADERS_2_6_22
 	default "2.6.23"	if BR2_KERNEL_HEADERS_2_6_23
 	default "2.6.24.7"	if BR2_KERNEL_HEADERS_2_6_24
 	default "2.6.25.19"	if BR2_KERNEL_HEADERS_2_6_25
 	default "2.6.26.8"	if BR2_KERNEL_HEADERS_2_6_26
 	default "2.6.27.21"	if BR2_KERNEL_HEADERS_2_6_27
 	default "2.6.28.9"	if BR2_KERNEL_HEADERS_2_6_28
+	default "2.6.29"	if BR2_KERNEL_HEADERS_2_6_29
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 
