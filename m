From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 18 Jun 2008 08:42:52 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20080618154253.7A97E3C744@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-18 08:42:50 -0700 (Wed, 18 Jun 2008)
New Revision: 22428

Log:
toolchain/gcc: use depends on instead of depends


Modified:
   trunk/buildroot/toolchain/gcc/Config.in
   trunk/buildroot/toolchain/gcc/Config.in.2


Changeset:
Modified: trunk/buildroot/toolchain/gcc/Config.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Config.in	2008-06-18 15:40:43 UTC (rev 22427)
+++ trunk/buildroot/toolchain/gcc/Config.in	2008-06-18 15:42:50 UTC (rev 22428)
@@ -14,37 +14,36 @@
 		bool "gcc 3.4.6"
 
 	config BR2_GCC_VERSION_4_0_4
-		depends !BR2_avr32 && !BR2_nios2
-		depends BR2_DEPRECATED
+		depends on !BR2_avr32 && !BR2_nios2
+		depends on BR2_DEPRECATED
 		bool "gcc 4.0.4"
 
 	config BR2_GCC_VERSION_4_1_2
-		depends !BR2_nios2
-		depends BR2_EXT_GCC_VERSION_4_1_2
+		depends on !BR2_nios2
+		depends on BR2_EXT_GCC_VERSION_4_1_2
 		bool "gcc 4.1.2"
 
 	config BR2_GCC_VERSION_4_2_1
-		depends !BR2_nios2
-		depends BR2_EXT_GCC_VERSION_4_2_1
+		depends on !BR2_nios2
+		depends on BR2_EXT_GCC_VERSION_4_2_1
 		bool "gcc 4.2.1"
 
 	config BR2_GCC_VERSION_4_2_3
-		depends !BR2_nios2 && !BR2_avr32
+		depends on !BR2_avr32 && !BR2_nios2
 		bool "gcc 4.2.3"
 
 	config BR2_GCC_VERSION_4_2_4
-		depends !BR2_nios2 && !BR2_avr32
+		depends on !BR2_avr32 && !BR2_nios2
 		bool "gcc 4.2.4"
 
 #	config BR2_GCC_VERSION_4_3
 #		depends !BR2_avr32 && !BR2_nios2
 #		select BR2_GCC_IS_SNAP
 #		bool "gcc 4.3"
-
 endchoice
 
 config BR2_GCC_IS_SNAP
-	depends !BR2_avr32
+	depends on !BR2_avr32
 	bool
 	default n
 
@@ -61,7 +60,7 @@
 config BR2_GCC_SNAP_DATE
 	string "GCC snapshot date"
 	default "20070921"
-	depends BR2_GCC_IS_SNAP
+	depends on BR2_GCC_IS_SNAP
 	help
 	  Enter snapshot date to use for gcc.  Format is:
 	  YYYYMMDD

Modified: trunk/buildroot/toolchain/gcc/Config.in.2
===================================================================
--- trunk/buildroot/toolchain/gcc/Config.in.2	2008-06-18 15:40:43 UTC (rev 22427)
+++ trunk/buildroot/toolchain/gcc/Config.in.2	2008-06-18 15:42:50 UTC (rev 22428)
@@ -8,7 +8,7 @@
 config BR2_EXTRA_TARGET_GCC_CONFIG_OPTIONS
 	string "Additional target gcc options"
 	default ""
-	depends BR2_PACKAGE_GCC_TARGET
+	depends on BR2_PACKAGE_GCC_TARGET
 	help
 	  Any additional target gcc options you may want to include....
 	  Including, but not limited to --disable-checking etc.
