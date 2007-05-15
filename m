From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 15 May 2007 04:28:59 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/binutils
Message-ID: <20070515112859.22A6F48026@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-05-15 04:28:58 -0700 (Tue, 15 May 2007)
New Revision: 18624

Log:
- add 2.17.50.0.16


Added:
   trunk/buildroot/toolchain/binutils/2.17.50.0.16/

Modified:
   trunk/buildroot/toolchain/binutils/Config.in


Changeset:
Copied: trunk/buildroot/toolchain/binutils/2.17.50.0.16 (from rev 18611, trunk/buildroot/toolchain/binutils/2.17.50.0.14)

Modified: trunk/buildroot/toolchain/binutils/Config.in
===================================================================
--- trunk/buildroot/toolchain/binutils/Config.in	2007-05-15 11:25:41 UTC (rev 18623)
+++ trunk/buildroot/toolchain/binutils/Config.in	2007-05-15 11:28:58 UTC (rev 18624)
@@ -77,7 +77,7 @@
 		bool "binutils 2.17.50.0.9"
 
 	config BR2_BINUTILS_VERSION_2_17_50_0_10
-		depends !BR2_nios2
+		depends !BR2_nios2 && BR2_DEPRECATED
 		bool "binutils 2.17.50.0.10"
 
 	config BR2_BINUTILS_VERSION_2_17_50_0_12
@@ -85,8 +85,12 @@
 		bool "binutils 2.17.50.0.12"
 
 	config BR2_BINUTILS_VERSION_2_17_50_0_14
+		depends !BR2_nios2 && BR2_DEPRECATED
+		bool "binutils 2.17.50.0.14"
+
+	config BR2_BINUTILS_VERSION_2_17_50_0_16
 		depends !BR2_nios2
-		bool "binutils 2.17.50.0.14"
+		bool "binutils 2.17.50.0.16"
 endchoice
 
 config BR2_BINUTILS_VERSION
@@ -111,6 +115,7 @@
 	default "2.17.50.0.10"    if BR2_BINUTILS_VERSION_2_17_50_0_10
 	default "2.17.50.0.12"    if BR2_BINUTILS_VERSION_2_17_50_0_12
 	default "2.17.50.0.14"    if BR2_BINUTILS_VERSION_2_17_50_0_14
+	default "2.17.50.0.16"    if BR2_BINUTILS_VERSION_2_17_50_0_16
 
 config BR2_EXTRA_BINUTILS_CONFIG_OPTIONS
 	string "Additional binutils options"
