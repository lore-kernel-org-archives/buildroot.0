From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 17 Sep 2007 05:42:56 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/binutils
Message-ID: <20070917124256.F254C30064@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-17 05:42:56 -0700 (Mon, 17 Sep 2007)
New Revision: 19869

Log:
Don't break AVR32 toolchain by hiding binutils-2.17

Modified:
   trunk/buildroot/toolchain/binutils/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/binutils/Config.in
===================================================================
--- trunk/buildroot/toolchain/binutils/Config.in	2007-09-17 12:40:42 UTC (rev 19868)
+++ trunk/buildroot/toolchain/binutils/Config.in	2007-09-17 12:42:56 UTC (rev 19869)
@@ -41,7 +41,7 @@
 		bool "binutils 2.16.91.0.7"
 
 	config BR2_BINUTILS_VERSION_2_17
-		depends !BR2_nios2 && BR2_DEPRECATED
+		depends BR2_avr32 || !BR2_nios2 && BR2_DEPRECATED
 		bool "binutils 2.17"
 
 	config BR2_BINUTILS_VERSION_2_17_50_0_2
