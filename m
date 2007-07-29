From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 29 Jul 2007 10:43:50 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20070729174350.EF22BA4508@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-29 10:43:50 -0700 (Sun, 29 Jul 2007)
New Revision: 19332

Log:
gcc target config for AVR32

Modified:
   trunk/buildroot/toolchain/gcc/Config.in.2


Changeset:
Modified: trunk/buildroot/toolchain/gcc/Config.in.2
===================================================================
--- trunk/buildroot/toolchain/gcc/Config.in.2	2007-07-29 17:40:42 UTC (rev 19331)
+++ trunk/buildroot/toolchain/gcc/Config.in.2	2007-07-29 17:43:50 UTC (rev 19332)
@@ -5,9 +5,20 @@
 	  If you want the target system to be able to run 
 	  binutils/gcc and compile native code, say Y here.
 
+config BR2_GCC_TARGET_AVR32_CONFIGURATION
+	bool "Enable default AVR32 GCC configuration"
+	default y
+	depends BR2_avr32 && BR2_PACKAGE_GCC_TARGET
+	help
+	  For the AVR32 platform there is some configuration which are not
+	  supported.
+
+	  Currently this will add "--disable-libmudflap" to configure.
+
 config BR2_EXTRA_TARGET_GCC_CONFIG_OPTIONS
 	string "Additional target gcc options"
 	default ""
+	depends BR2_PACKAGE_GCC_TARGET
 	help
 	  Any additional target gcc options you may want to include....
 	  Including, but not limited to --disable-checking etc.
