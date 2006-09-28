From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 28 Sep 2006 03:30:29 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc/4.2
Message-ID: <20060928103029.D9A7E48582@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-09-28 03:30:29 -0700 (Thu, 28 Sep 2006)
New Revision: 16246

Log:
- rediff against current trunk


Modified:
   trunk/buildroot/toolchain/gcc/4.2/800-arm-bigendian.patch


Changeset:
Modified: trunk/buildroot/toolchain/gcc/4.2/800-arm-bigendian.patch
===================================================================
--- trunk/buildroot/toolchain/gcc/4.2/800-arm-bigendian.patch	2006-09-28 10:19:43 UTC (rev 16245)
+++ trunk/buildroot/toolchain/gcc/4.2/800-arm-bigendian.patch	2006-09-28 10:30:29 UTC (rev 16246)
@@ -51,17 +51,17 @@
     SUBTARGET_EXTRA_LINK_SPEC
  
  #undef  LINK_SPEC
---- gcc-4.2.0/gcc/config.gcc
-+++ gcc-4.2.0/gcc/config.gcc
-@@ -694,6 +694,11 @@
- 	;;
- arm*-*-linux*)			# ARM GNU/Linux with ELF
- 	tm_file="dbxelf.h elfos.h linux.h arm/elf.h arm/linux-gas.h arm/linux-elf.h" 
-+	case $target in
+--- gcc-4.2.0/gcc/config.gcc.orig	2006-09-22 14:53:41.000000000 +0200
++++ gcc-4.2.0/gcc/config.gcc	2006-09-25 10:45:21.000000000 +0200
+@@ -696,6 +696,11 @@
+ 	tm_file="dbxelf.h elfos.h linux.h arm/elf.h arm/linux-gas.h arm/linux-elf.h"
+ 	tmake_file="${tmake_file} t-linux arm/t-arm"
+ 	case ${target} in
 +	arm*b-*)
 +		tm_defines="${tm_defines} TARGET_BIG_ENDIAN_DEFAULT=1"
 +		;;
 +	esac
- 	tmake_file="${tmake_file} t-linux arm/t-arm"
- 	case ${target} in
++	case ${target} in
  	arm*-*-linux-*eabi)
+ 	    tm_file="$tm_file arm/bpabi.h arm/linux-eabi.h"
+ 	    tmake_file="$tmake_file arm/t-arm-elf arm/t-bpabi arm/t-linux-eabi"
