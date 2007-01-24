From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 24 Jan 2007 06:50:22 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain
Message-ID: <20070124145022.3B89C48598@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-24 06:50:21 -0800 (Wed, 24 Jan 2007)
New Revision: 17498

Log:
- reformat help text to fit default width better


Modified:
   trunk/buildroot/toolchain/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/Config.in
===================================================================
--- trunk/buildroot/toolchain/Config.in	2007-01-24 14:49:49 UTC (rev 17497)
+++ trunk/buildroot/toolchain/Config.in	2007-01-24 14:50:21 UTC (rev 17498)
@@ -36,11 +36,15 @@
 	help
 	  If your target CPU does not have a Floating Point Unit (FPU) or a
 	  kernel FPU emulator, but you still wish to support floating point
-	  functions, then everything will need to be compiled with soft floating
-	  point support (-msoft-float).
+	  functions, then everything will need to be compiled with soft
+	  floating point support (-msoft-float).
 
 	  Most people will answer N.
 
+#config BR2_SOFT_FLOAT_FP
+#	bool "Use softfp"
+#	default n
+
 config BR2_TARGET_OPTIMIZATION
 	string "Target Optimizations"
 	default "-Os -pipe"
@@ -51,12 +55,13 @@
 	bool "Include target utils in cross toolchain"
 	default y
 	help
-	  When using buildroot to build a deployable cross toolchain, it is handy
-	  to include certain target apps with that toolchain as a convenience.
+	  When using buildroot to build a deployable cross toolchain,
+	  it is handy to include certain target apps with that toolchain
+	  as a convenience.
 	  Examples include ldd, gdbserver, and strace.
 
-	  Answer Y if you want these apps (if built) copied into the cross toolchain
-	  dir under <arch>-linux-uclibc/target_utils/.
+	  Answer Y if you want these apps (if built) copied into the
+	  cross toolchain dir under <arch>-linux-uclibc/target_utils/.
 
 endmenu
 
