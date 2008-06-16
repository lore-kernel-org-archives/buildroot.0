From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 16 Jun 2008 05:22:46 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/external-toolchain
Message-ID: <20080616122246.C821B3C987@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-16 05:22:45 -0700 (Mon, 16 Jun 2008)
New Revision: 22378

Log:
toolchain: more sensible uclibc defaults for external toolchain


Modified:
   trunk/buildroot/toolchain/external-toolchain/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/external-toolchain/Config.in
===================================================================
--- trunk/buildroot/toolchain/external-toolchain/Config.in	2008-06-16 11:42:19 UTC (rev 22377)
+++ trunk/buildroot/toolchain/external-toolchain/Config.in	2008-06-16 12:22:45 UTC (rev 22378)
@@ -6,7 +6,7 @@
 
 config BR2_TOOLCHAIN_EXTERNAL_LIB_C
 	string "The core C library from the external toolchain"
-	default "libc.so.6"
+	default "libc.so.0"
 	help
 	  Specify the core C shared library found in the external
 	  toolchain. This is required in addition to any other
@@ -14,7 +14,7 @@
 
 config BR2_TOOLCHAIN_EXTERNAL_LIBS
 	string "Libraries to copy from the external toolchain"
-	default ""
+	default "ld-uClibc.so.0 libcrypt.so.0 libdl.so.0 libgcc_s.so libm.so.0 libnsl.so.0 libpthread.so.0 libresolv.so.0 librt.so.0 libutil.so.0"
 	help
 	  A space separated list of the shared libraries to be copied
 	  from the external toolchain into the root filesystem. Only
@@ -34,13 +34,13 @@
 
 config BR2_TOOLCHAIN_EXTERNAL_PATH
 	string "External toolchain path"
-	default ""
+	default "/path/to/staging_dir/usr"
 	help
 	  Path to where the external toolchain is installed.
 
 config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	string "External toolchain prefix"
-	default ""
+	default "$(ARCH)-linux"
 	help
 	  This the the external toolchain prefix. For example:
 	    armeb-unknown-linux-gnu, mipsel-unknown-linux-gnu, etc.
