From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 10 Oct 2008 01:25:02 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
Message-ID: <20081010082502.892E83C91E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-10-10 01:25:02 -0700 (Fri, 10 Oct 2008)
New Revision: 23648

Log:
kernel-headers: add 2.6.27

And mark 2.6.26 as recent, 2.6.25 as deprecated while we're at it.

Modified:
   trunk/buildroot/toolchain/kernel-headers/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/kernel-headers/Config.in
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/Config.in	2008-10-10 07:53:52 UTC (rev 23647)
+++ trunk/buildroot/toolchain/kernel-headers/Config.in	2008-10-10 08:25:02 UTC (rev 23648)
@@ -6,7 +6,7 @@
 
 choice
 	prompt "Kernel Headers"
-	default BR2_KERNEL_HEADERS_2_6_26
+	default BR2_KERNEL_HEADERS_2_6_27
 
 	help
 	  Select the version of kernel header files you wish to use.
@@ -57,12 +57,17 @@
 		bool "Linux 2.6.24.x kernel headers"
 
 	config BR2_KERNEL_HEADERS_2_6_25
-		depends on BR2_RECENT
+		depends on BR2_DEPRECATED
 		bool "Linux 2.6.25.x kernel headers"
 
 	config BR2_KERNEL_HEADERS_2_6_26
+		depends on BR2_RECENT
 		bool "Linux 2.6.26.x kernel headers"
 
+	config BR2_KERNEL_HEADERS_2_6_27
+		depends on BR2_RECENT
+		bool "Linux 2.6.27.x kernel headers"
+
 	config BR2_KERNEL_HEADERS_SNAP
 		bool "Linux 2.6 snapshot"
 
@@ -109,5 +114,6 @@
 	default "2.6.24.7"	if BR2_KERNEL_HEADERS_2_6_24
 	default "2.6.25.15"	if BR2_KERNEL_HEADERS_2_6_25
 	default "2.6.26.2"	if BR2_KERNEL_HEADERS_2_6_26
+	default "2.6.27"	if BR2_KERNEL_HEADERS_2_6_27
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 
