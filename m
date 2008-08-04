From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  4 Aug 2008 12:07:27 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
Message-ID: <20080804190727.3A24A3C878@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-04 12:07:26 -0700 (Mon, 04 Aug 2008)
New Revision: 23020

Log:
kernel-headers: remove ancient versions

Modified:
   trunk/buildroot/toolchain/kernel-headers/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/kernel-headers/Config.in
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/Config.in	2008-08-04 19:07:24 UTC (rev 23019)
+++ trunk/buildroot/toolchain/kernel-headers/Config.in	2008-08-04 19:07:26 UTC (rev 23020)
@@ -16,34 +16,10 @@
 	  For the snapshot, you have to provide the
 	  linux-2.6.tar.bz2 tarball in your download dir.
 
-	config BR2_KERNEL_HEADERS_2_4_25
-		depends on !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
-		bool "Linux 2.4.25 kernel headers"
-
-	config BR2_KERNEL_HEADERS_2_4_27
-		depends on !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
-		bool "Linux 2.4.27 kernel headers"
-
-	config BR2_KERNEL_HEADERS_2_4_29
-		depends on !BR2_avr32 && !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
-		bool "Linux 2.4.29 kernel headers"
-
 	config BR2_KERNEL_HEADERS_2_4_31
 		depends on !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
 		bool "Linux 2.4.31 kernel headers"
 
-	config BR2_KERNEL_HEADERS_2_6_9
-		depends on !BR2_avr32 && BR2_DEPRECATED
-		bool "Linux 2.6.9 kernel headers"
-
-	config BR2_KERNEL_HEADERS_2_6_11
-		depends on !BR2_avr32 && BR2_DEPRECATED
-		bool "Linux 2.6.11 kernel headers"
-
-	config BR2_KERNEL_HEADERS_2_6_12
-		depends on !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
-		bool "Linux 2.6.12 kernel headers"
-
 	config BR2_KERNEL_HEADERS_2_6_20_4
 		depends on !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
 		bool "Linux 2.6.20.4 kernel headers"
@@ -121,13 +97,7 @@
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "2.4.25"	if BR2_KERNEL_HEADERS_2_4_25
-	default "2.4.27"	if BR2_KERNEL_HEADERS_2_4_27
-	default "2.4.29"	if BR2_KERNEL_HEADERS_2_4_29
 	default "2.4.31"	if BR2_KERNEL_HEADERS_2_4_31
-	default "2.6.9"		if BR2_KERNEL_HEADERS_2_6_9
-	default "2.6.11"	if BR2_KERNEL_HEADERS_2_6_11
-	default "2.6.12"	if BR2_KERNEL_HEADERS_2_6_12
 	default "2.6.20.4"	if BR2_KERNEL_HEADERS_2_6_20_4
 	default "2.6.20.20"	if BR2_KERNEL_HEADERS_2_6_20
 	default "2.6.21.5"	if BR2_KERNEL_HEADERS_2_6_21_5
