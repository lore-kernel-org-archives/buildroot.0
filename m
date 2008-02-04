From: lethal at uclibc.org <lethal@uclibc.org>
Date: Sun,  3 Feb 2008 23:54:34 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
Message-ID: <20080204075434.982A312C69F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: lethal
Date: 2008-02-03 23:54:32 -0800 (Sun, 03 Feb 2008)
New Revision: 20941

Log:
Add support for 2.6.24 headers.



Modified:
   trunk/buildroot/toolchain/kernel-headers/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/kernel-headers/Config.in
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/Config.in	2008-02-04 00:30:06 UTC (rev 20940)
+++ trunk/buildroot/toolchain/kernel-headers/Config.in	2008-02-04 07:54:32 UTC (rev 20941)
@@ -51,7 +51,7 @@
 
 	config BR2_KERNEL_HEADERS_2_6_20
 		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
-		bool "Latest Linux 2.6.20.x kernel headers"
+		bool "Linux 2.6.20.x kernel headers"
 
 	config BR2_KERNEL_HEADERS_2_6_21_5
 		depends !BR2_avr32 && !BR2_nios2
@@ -59,7 +59,7 @@
 
 	config BR2_KERNEL_HEADERS_2_6_21
 		depends !BR2_avr32 && !BR2_nios2
-		bool "Latest Linux 2.6.21.x kernel headers"
+		bool "Linux 2.6.21.x kernel headers"
 
 	config BR2_KERNEL_HEADERS_2_6_22_1
 		depends !BR2_avr32 && !BR2_nios2
@@ -71,12 +71,16 @@
 
 	config BR2_KERNEL_HEADERS_2_6_22
 		depends !BR2_avr32 && !BR2_nios2
-		bool "Latest Linux 2.6.22.x kernel headers"
+		bool "Linux 2.6.22.x kernel headers"
 
 	config BR2_KERNEL_HEADERS_2_6_23
 		depends !BR2_avr32
-		bool "Latest Linux 2.6.23.x kernel headers"
+		bool "Linux 2.6.23.x kernel headers"
 
+	config BR2_KERNEL_HEADERS_2_6_24
+		depends on !BR2_avr32
+		bool "Linux 2.6.24.x kernel headers"
+
 	config BR2_KERNEL_HEADERS_SNAP
 		bool "Linux 2.6 snapshot"
 		depends !BR2_avr32
@@ -131,5 +135,6 @@
 	default "2.6.22.10"	if BR2_KERNEL_HEADERS_2_6_22_10
 	default "2.6.22.10"	if BR2_KERNEL_HEADERS_2_6_22
 	default "2.6.23"	if BR2_KERNEL_HEADERS_2_6_23
+	default "2.6.24"	if BR2_KERNEL_HEADERS_2_6_24
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 
