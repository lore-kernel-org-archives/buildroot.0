From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 15 Apr 2009 13:41:55 +0000 (UTC)
Subject: [Buildroot] svn commit: [26110] trunk/buildroot/toolchain/gcc
Message-ID: <20090415134155.90A0D7767F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-04-15 13:41:55 +0000 (Wed, 15 Apr 2009)
New Revision: 26110

Log:
toolchain/gcc: shared libgcc broken for sparc, so disable it

Modified:
   trunk/buildroot/toolchain/gcc/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/gcc/Config.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Config.in	2009-04-15 13:04:52 UTC (rev 26109)
+++ trunk/buildroot/toolchain/gcc/Config.in	2009-04-15 13:41:55 UTC (rev 26110)
@@ -161,6 +161,7 @@
 config BR2_GCC_SHARED_LIBGCC
 	bool "Build/install a shared libgcc?"
 	default y
+	depends on !BR2_sparc && !BR2_sparc64
 	help
 	  Build/install a shared libgcc library
 
