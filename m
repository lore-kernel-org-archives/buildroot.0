From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 30 Jul 2007 11:24:54 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20070730182454.AFF21A4940@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-30 11:24:53 -0700 (Mon, 30 Jul 2007)
New Revision: 19350

Log:
Revert bad patch

Modified:
   trunk/buildroot/toolchain/gcc/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/gcc/Config.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Config.in	2007-07-30 18:23:47 UTC (rev 19349)
+++ trunk/buildroot/toolchain/gcc/Config.in	2007-07-30 18:24:53 UTC (rev 19350)
@@ -159,8 +159,9 @@
 config BR2_INSTALL_LIBSTDCPP
 	bool "Build/install c++ compiler and libstdc++?"
 	default n
+	# >= 4.2.0 work fine without LARGEFILE
 	# huh? why so? select BR2_LARGEFILE
-	select BR2_LARGEFILE if !BR2_GCC_VERSION_4_2_0 && !BR2_GCC_VERSION_4_3
+	select BR2_LARGEFILE if BR2_GCC_VERSION_3_3_5 || BR2_GCC_VERSION_3_3_6 || BR2_GCC_VERSION_3_4_2 || BR2_GCC_VERSION_3_4_3 || BR2_GCC_VERSION_3_4_4 || BR2_GCC_VERSION_3_4_5 || BR2_GCC_VERSION_3_4_6 || BR2_GCC_VERSION_4_0_0 || BR2_GCC_VERSION_4_0_1 || BR2_GCC_VERSION_4_0_2 || BR2_GCC_VERSION_4_0_3 || BR2_GCC_VERSION_4_0_4 || BR2_GCC_VERSION_4_1_0 || BR2_GCC_VERSION_4_1_1 || BR2_GCC_VERSION_4_1_2
 	help
 	  Build/install c++ compiler and libstdc++?
 
