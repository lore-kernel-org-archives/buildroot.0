From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 25 Sep 2007 10:21:33 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20070925172133.BD853A60A6@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-25 10:21:33 -0700 (Tue, 25 Sep 2007)
New Revision: 20023

Log:
- fix typo


Modified:
   trunk/buildroot/toolchain/gcc/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/gcc/Config.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Config.in	2007-09-25 16:39:22 UTC (rev 20022)
+++ trunk/buildroot/toolchain/gcc/Config.in	2007-09-25 17:21:33 UTC (rev 20023)
@@ -115,7 +115,7 @@
 	bool "Build/install c++ compiler and libstdc++?"
 	default n
 	# >= 4.2.0 work fine without LARGEFILE
-	select BR2_LARGEFILE if BR2_GCC_SUPPORTS_SYSROOT
+	select BR2_LARGEFILE if !BR2_GCC_SUPPORTS_SYSROOT
 	select BR2_GCC_CROSS_CXX
 	help
 	  Build/install c++ compiler and libstdc++?
