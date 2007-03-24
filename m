From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat, 24 Mar 2007 13:49:08 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/binutils:
	2.17.50.0.14
Message-ID: <20070324204908.3165D48614@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-03-24 13:49:07 -0700 (Sat, 24 Mar 2007)
New Revision: 18233

Log:
- bump version to 2.17.50.0.14


Added:
   trunk/buildroot/toolchain/binutils/2.17.50.0.14/

Modified:
   trunk/buildroot/toolchain/binutils/2.17.50.0.14/100-uclibc-conf.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.14/110-arm-eabi-conf.patch
   trunk/buildroot/toolchain/binutils/Config.in


Changeset:
Copied: trunk/buildroot/toolchain/binutils/2.17.50.0.14 (from rev 18214, trunk/buildroot/toolchain/binutils/2.17.50.0.10)

Modified: trunk/buildroot/toolchain/binutils/2.17.50.0.14/100-uclibc-conf.patch
===================================================================
--- trunk/buildroot/toolchain/binutils/2.17.50.0.10/100-uclibc-conf.patch	2007-03-23 13:26:51 UTC (rev 18214)
+++ trunk/buildroot/toolchain/binutils/2.17.50.0.14/100-uclibc-conf.patch	2007-03-24 20:49:07 UTC (rev 18233)
@@ -40,8 +40,8 @@
      case "${host}" in
        i[3456789]86-*-vsta) ;; # don't add gprof back in
        i[3456789]86-*-go32*) ;; # don't add gprof back in
---- binutils-2.16.91.0.7/configure.in
-+++ binutils-2.16.91.0.7/configure.in
+--- binutils-2.16.91.0.7/configure.ac
++++ binutils-2.16.91.0.7/configure.ac
 @@ -468,7 +468,7 @@
    am33_2.0-*-linux*)
      noconfigdirs="$noconfigdirs ${libgcj} target-newlib target-libgloss"

Modified: trunk/buildroot/toolchain/binutils/2.17.50.0.14/110-arm-eabi-conf.patch
===================================================================
--- trunk/buildroot/toolchain/binutils/2.17.50.0.10/110-arm-eabi-conf.patch	2007-03-23 13:26:51 UTC (rev 18214)
+++ trunk/buildroot/toolchain/binutils/2.17.50.0.14/110-arm-eabi-conf.patch	2007-03-24 20:49:07 UTC (rev 18233)
@@ -10,9 +10,9 @@
      noconfigdirs="$noconfigdirs target-libffi target-qthreads"
      noconfigdirs="$noconfigdirs target-libjava target-libobjc"
      ;;
-diff -urN binutils-2.16.91.0.7.orig/configure.in binutils-2.16.91.0.7/configure.in
---- binutils-2.16.91.0.7.orig/configure.in	2006-05-31 14:54:24.000000000 +0300
-+++ binutils-2.16.91.0.7/configure.in	2006-05-31 14:55:53.000000000 +0300
+diff -urN binutils-2.16.91.0.7.orig/configure.ac binutils-2.16.91.0.7/configure.ac
+--- binutils-2.16.91.0.7.orig/configure.ac	2006-05-31 14:54:24.000000000 +0300
++++ binutils-2.16.91.0.7/configure.ac	2006-05-31 14:55:53.000000000 +0300
 @@ -497,7 +497,7 @@
    arm-*-elf* | strongarm-*-elf* | xscale-*-elf* | arm*-*-eabi* )
      noconfigdirs="$noconfigdirs target-libffi target-qthreads"

Modified: trunk/buildroot/toolchain/binutils/Config.in
===================================================================
--- trunk/buildroot/toolchain/binutils/Config.in	2007-03-24 19:29:06 UTC (rev 18232)
+++ trunk/buildroot/toolchain/binutils/Config.in	2007-03-24 20:49:07 UTC (rev 18233)
@@ -4,7 +4,7 @@
 
 choice
 	prompt "Binutils Version"
-	default BR2_BINUTILS_VERSION_2_16_91_0_7
+	default BR2_BINUTILS_VERSION_2_17
 	help
 	  Select the version of binutils you wish to use.
 
@@ -80,6 +80,9 @@
 		depends !BR2_nios2
 		bool "binutils 2.17.50.0.10"
 
+	config BR2_BINUTILS_VERSION_2_17_50_0_14
+		depends !BR2_nios2
+		bool "binutils 2.17.50.0.14"
 endchoice
 
 config BR2_BINUTILS_VERSION
@@ -102,6 +105,7 @@
 	default "2.17.50.0.8"     if BR2_BINUTILS_VERSION_2_17_50_0_8
 	default "2.17.50.0.9"     if BR2_BINUTILS_VERSION_2_17_50_0_9
 	default "2.17.50.0.10"    if BR2_BINUTILS_VERSION_2_17_50_0_10
+	default "2.17.50.0.14"    if BR2_BINUTILS_VERSION_2_17_50_0_14
 
 config BR2_EXTRA_BINUTILS_CONFIG_OPTIONS
 	string "Additional binutils options"
