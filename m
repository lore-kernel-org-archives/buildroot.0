From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 31 Jul 2007 23:17:36 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
Message-ID: <20070801061736.53C0BA4659@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-31 23:17:34 -0700 (Tue, 31 Jul 2007)
New Revision: 19374

Log:
Allow use of 2.6.22.1 kernel headers

Modified:
   trunk/buildroot/toolchain/kernel-headers/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/kernel-headers/Config.in
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/Config.in	2007-07-31 23:28:22 UTC (rev 19373)
+++ trunk/buildroot/toolchain/kernel-headers/Config.in	2007-08-01 06:17:34 UTC (rev 19374)
@@ -13,45 +13,49 @@
 	  the kernel you intend to use on your target system.
 
 	config BR2_KERNEL_HEADERS_2_4_25
-		depends !BR2_nios2 && BR2_DEPRECATED
+		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
 		bool "Linux 2.4.25 kernel headers"
 
 	config BR2_KERNEL_HEADERS_2_4_27
-		depends !BR2_nios2 && BR2_DEPRECATED
+		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
 		bool "Linux 2.4.27 kernel headers"
 
 	config BR2_KERNEL_HEADERS_2_4_29
-		depends !BR2_nios2 && BR2_DEPRECATED
+		depends !BR2_avr32 && !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
 		bool "Linux 2.4.29 kernel headers"
 
 	config BR2_KERNEL_HEADERS_2_4_31
-		depends !BR2_nios2 && BR2_DEPRECATED
+		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
 		bool "Linux 2.4.31 kernel headers"
 
 	config BR2_KERNEL_HEADERS_2_6_9
-		depends BR2_DEPRECATED
+		depends !BR2_avr32 && BR2_DEPRECATED
 		bool "Linux 2.6.9 kernel headers"
 
 	config BR2_KERNEL_HEADERS_2_6_11
-		depends BR2_DEPRECATED
+		depends !BR2_avr32 && BR2_DEPRECATED
 		bool "Linux 2.6.11 kernel headers"
 
 	config BR2_KERNEL_HEADERS_2_6_12
-		depends !BR2_nios2 && BR2_DEPRECATED
+		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
 		bool "Linux 2.6.12 kernel headers"
 
 	config BR2_KERNEL_HEADERS_2_6_19_2
-		depends !BR2_nios2 && BR2_DEPRECATED
+		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
 		bool "Linux 2.6.19.2 kernel headers"
 
 	config BR2_KERNEL_HEADERS_2_6_20
-		depends !BR2_nios2 && BR2_DEPRECATED
+		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
 		bool "Linux 2.6.20 kernel headers"
 
 	config BR2_KERNEL_HEADERS_2_6_21
-		depends !BR2_nios2
+		depends !BR2_avr32 && !BR2_nios2
 		bool "Linux 2.6.21.x kernel headers"
 
+	config BR2_KERNEL_HEADERS_2_6_22
+		depends !BR2_nios2
+		bool "Linux 2.6.22.x kernel headers"
+
 endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
@@ -66,3 +70,4 @@
 	default "2.6.19.2"  if BR2_KERNEL_HEADERS_2_6_19_2
 	default "2.6.20.4"  if BR2_KERNEL_HEADERS_2_6_20
 	default "2.6.21.5"  if BR2_KERNEL_HEADERS_2_6_21
+	default "2.6.22.1"  if BR2_KERNEL_HEADERS_2_6_22
