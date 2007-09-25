From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 25 Sep 2007 09:39:23 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20070925163923.6954BA65A8@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-25 09:39:22 -0700 (Tue, 25 Sep 2007)
New Revision: 20022

Log:
- build a cross c++ compiler if we're asked to build libstdc++


Modified:
   trunk/buildroot/toolchain/gcc/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/gcc/Config.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Config.in	2007-09-25 14:45:26 UTC (rev 20021)
+++ trunk/buildroot/toolchain/gcc/Config.in	2007-09-25 16:39:22 UTC (rev 20022)
@@ -115,8 +115,8 @@
 	bool "Build/install c++ compiler and libstdc++?"
 	default n
 	# >= 4.2.0 work fine without LARGEFILE
-	# huh? why so? select BR2_LARGEFILE
 	select BR2_LARGEFILE if BR2_GCC_SUPPORTS_SYSROOT
+	select BR2_GCC_CROSS_CXX
 	help
 	  Build/install c++ compiler and libstdc++?
 
