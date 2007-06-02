From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat,  2 Jun 2007 09:36:44 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20070602163644.643CB485C6@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-02 09:36:43 -0700 (Sat, 02 Jun 2007)
New Revision: 18733

Log:
- improve wording of BR2_PREFER_STATIC_LIB


Modified:
   trunk/buildroot/Config.in


Changeset:
Modified: trunk/buildroot/Config.in
===================================================================
--- trunk/buildroot/Config.in	2007-06-02 13:13:56 UTC (rev 18732)
+++ trunk/buildroot/Config.in	2007-06-02 16:36:43 UTC (rev 18733)
@@ -169,8 +169,29 @@
 	bool "i586"
 config BR2_x86_i686
 	bool "i686"
+config BR2_x86_pentium4
+	bool "pentium4"
+config BR2_x86_nocona
+	bool "nocona"
+config BR2_x86_core2
+	bool "core2"
 endchoice
 
+choice
+	prompt "Target Architecture Variant"
+	depends BR2_x86_64
+	default BR2_x86_64_core2
+	help
+	  Specific CPU variant to use
+
+config BR2_x86_64_opteron
+	bool "opteron"
+config BR2_x86_64_nocona
+	bool "nocona"
+config BR2_x86_64_core2
+	bool "core2"
+endchoice
+
 config BR2_ARCH
 	string
 	default "alpha"		if BR2_alpha
@@ -182,6 +203,9 @@
 	default "i486"		if BR2_x86_i486
 	default "i586"		if BR2_x86_i586
 	default "i686"		if BR2_x86_i686
+	default "i686"		if BR2_x86_pentium4
+	default "i686"		if BR2_x86_nocona
+	default "i686"		if BR2_x86_core2
 	default "m68k"		if BR2_m68k
 	default "mips"		if BR2_mips
 	default "mipsel"	if BR2_mipsel
@@ -196,6 +220,9 @@
 	default "sh64"		if BR2_sh64
 	default "sparc"		if BR2_sparc
 	default "x86_64"	if BR2_x86_64
+	default "x86_64"	if BR2_x86_64_nocona
+	default "x86_64"	if BR2_x86_64_core2
+	default "x86_64"	if BR2_x86_64_opteron
 
 config BR2_ENDIAN
 	string
@@ -377,13 +404,12 @@
 	bool "prefer static libraries"
 	default n
 	help
-	  Where possible, use static libraries.
-	  This increases your code size a lot and should only be
-	  used with a good reason why not use the default, which
-	  is dynamic libraries.
+	  Where possible, build and use static libraries for the target.
+	  This potentially increases your code size and should only be
+	  used if you know what you do.
+	  The default is to build dynamic libraries and use those on
+	  the target filesystem.
 
-	  If unsure, say No.
-
 	  WARNING: This is highly experimental at the moment.
 
 endmenu
