From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 25 Sep 2007 15:04:41 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device
Message-ID: <20070925220441.CE64FA681D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-25 15:04:39 -0700 (Tue, 25 Sep 2007)
New Revision: 20029

Log:
- comment out bad logic


Modified:
   trunk/buildroot/target/device/Toolchain.in


Changeset:
Modified: trunk/buildroot/target/device/Toolchain.in
===================================================================
--- trunk/buildroot/target/device/Toolchain.in	2007-09-25 22:03:18 UTC (rev 20028)
+++ trunk/buildroot/target/device/Toolchain.in	2007-09-25 22:04:39 UTC (rev 20029)
@@ -1,7 +1,7 @@
 if BR2_TOOLCHAIN_EXTERNAL_SOURCE
 choice
 	prompt "Source location:"
-	default BR2_TOOLCHAIN_ATMEL_AVR32 if BR2_avr32
+#	default BR2_TOOLCHAIN_ATMEL_AVR32 if BR2_avr32
 	help
 	  Select whether to use the toolchain built by the buildroot
 	  system or an external pre-built toolchain.
@@ -9,10 +9,10 @@
 config BR2_TOOLCHAIN_ATMEL_AVR32
 	bool "Use prepatched source for AVR32 toolchain"
 	depends on BR2_avr32
-	depends on BR2_GCC_VERSION_4_1_2
-	depends on BR2_GDB_VERSION_6_4 || !BR2_PACKAGE_GDB
-	depends on BR2_BINUTILS_VERSION_2_17
-	depends on BR2_UCLIBC_VERSION_0_9_28_3
+#	depends on BR2_GCC_VERSION_4_1_2
+#	depends on BR2_GDB_VERSION_6_4 || !BR2_PACKAGE_GDB
+#	depends on BR2_BINUTILS_VERSION_2_17
+#	depends on BR2_UCLIBC_VERSION_0_9_28_3
 
 endchoice
 
