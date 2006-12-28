From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 28 Dec 2006 00:49:56 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20061228084956.61FE1485CA@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-28 00:49:55 -0800 (Thu, 28 Dec 2006)
New Revision: 17099

Log:
- I'm pretty sure that i don't want LFS support on the gcc-4_2-branch
  Leave the rest as is. *shrug*


Modified:
   trunk/buildroot/toolchain/gcc/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/gcc/Config.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Config.in	2006-12-28 08:48:31 UTC (rev 17098)
+++ trunk/buildroot/toolchain/gcc/Config.in	2006-12-28 08:49:55 UTC (rev 17099)
@@ -110,7 +110,8 @@
 config BR2_INSTALL_LIBSTDCPP
 	bool "Build/install c++ compiler and libstdc++?"
 	default n
-	select BR2_LARGEFILE
+	# huh? why so? select BR2_LARGEFILE
+	select BR2_LARGEFILE if !BR2_GCC_VERSION_4_2
 	help
 	    Build/install c++ compiler and libstdc++?
 
