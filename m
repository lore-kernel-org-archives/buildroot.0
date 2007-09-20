From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 20 Sep 2007 02:25:57 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20070920092557.B108430060@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-20 02:25:57 -0700 (Thu, 20 Sep 2007)
New Revision: 19904

Log:
- fix typo. This is an lxdialog bug for "depends on !!CONFIG_SYMBOL" where the double negation produces an error that is not reported, from the looks..


Modified:
   trunk/buildroot/toolchain/gcc/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/gcc/Config.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Config.in	2007-09-20 07:19:52 UTC (rev 19903)
+++ trunk/buildroot/toolchain/gcc/Config.in	2007-09-20 09:25:57 UTC (rev 19904)
@@ -119,7 +119,7 @@
 
 config BR2_TOOLCHAIN_SYSROOT
 	bool "Enable toolchain with --sysroot support"
-	depends on !BR2_GCC_VERSION_3_3_5 && !BR2_GCC_VERSION_3_3_6 && !BR2_GCC_VERSION_3_4_2 && !BR2_GCC_VERSION_3_4_3 && !BR2_GCC_VERSION_3_4_4 && !BR2_GCC_VERSION_3_4_5 && !BR2_GCC_VERSION_3_4_6 && !BR2_GCC_VERSION_4_0_0 && !BR2_GCC_VERSION_4_0_1 && !BR2_GCC_VERSION_4_0_2 && !BR2_GCC_VERSION_4_0_3 && !BR2_GCC_VERSION_4_0_4 && !BR2_GCC_VERSION_4_1_0 && !BR2_GCC_VERSION_4_1_1 && !!BR2_GCC_VERSION_4_1_2
+	depends on !BR2_GCC_VERSION_3_3_5 && !BR2_GCC_VERSION_3_3_6 && !BR2_GCC_VERSION_3_4_2 && !BR2_GCC_VERSION_3_4_3 && !BR2_GCC_VERSION_3_4_4 && !BR2_GCC_VERSION_3_4_5 && !BR2_GCC_VERSION_3_4_6 && !BR2_GCC_VERSION_4_0_0 && !BR2_GCC_VERSION_4_0_1 && !BR2_GCC_VERSION_4_0_2 && !BR2_GCC_VERSION_4_0_3 && !BR2_GCC_VERSION_4_0_4 && !BR2_GCC_VERSION_4_1_0 && !BR2_GCC_VERSION_4_1_1 && !BR2_GCC_VERSION_4_1_2
 	default y
 	help
 	  Enables --sysroot=dir for binutils and gcc.
