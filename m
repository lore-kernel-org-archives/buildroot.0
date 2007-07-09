From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon,  9 Jul 2007 10:59:25 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/gnuconfig: CVS
	patches testsuite testsuite/CVS
Message-ID: <20070709175925.B54653006C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-09 10:59:19 -0700 (Mon, 09 Jul 2007)
New Revision: 19055

Log:
- pull from upstream


Modified:
   trunk/buildroot/package/gnuconfig/CVS/Entries
   trunk/buildroot/package/gnuconfig/ChangeLog
   trunk/buildroot/package/gnuconfig/config.guess
   trunk/buildroot/package/gnuconfig/config.sub
   trunk/buildroot/package/gnuconfig/patches/config.guess.uclibc.patch
   trunk/buildroot/package/gnuconfig/patches/config.sub.ps2.patch
   trunk/buildroot/package/gnuconfig/patches/config.sub.sh.patch
   trunk/buildroot/package/gnuconfig/testsuite/CVS/Entries
   trunk/buildroot/package/gnuconfig/testsuite/config-guess.data
   trunk/buildroot/package/gnuconfig/testsuite/config-sub.data
   trunk/buildroot/package/gnuconfig/uname


Changeset:
Modified: trunk/buildroot/package/gnuconfig/CVS/Entries
===================================================================
--- trunk/buildroot/package/gnuconfig/CVS/Entries	2007-07-09 08:30:38 UTC (rev 19054)
+++ trunk/buildroot/package/gnuconfig/CVS/Entries	2007-07-09 17:59:19 UTC (rev 19055)
@@ -7,8 +7,8 @@
 D/src////
 D/tests////
 D/testsuite////
-/Makefile/1.6/Thu Aug  4 14:15:16 2005//
-/uname/1.4/Thu Aug  4 14:15:16 2005//
-/ChangeLog/1.355/Thu Mar  2 06:17:14 2006//
-/config.guess/1.349/Thu Mar  2 06:17:33 2006//
-/config.sub/1.340/Thu Mar  2 06:17:43 2006//
+/ChangeLog/1.384/Mon Jul  9 16:57:20 2007//
+/Makefile/1.6/Mon Sep 26 07:33:33 2005//
+/config.guess/1.366/Mon Jul  9 16:57:20 2007//
+/config.sub/1.356/Mon Jul  9 16:57:20 2007//
+/uname/1.5/Mon Jul  9 16:57:20 2007//

Modified: trunk/buildroot/package/gnuconfig/ChangeLog
===================================================================
--- trunk/buildroot/package/gnuconfig/ChangeLog	2007-07-09 08:30:38 UTC (rev 19054)
+++ trunk/buildroot/package/gnuconfig/ChangeLog	2007-07-09 17:59:19 UTC (rev 19055)
@@ -1,3 +1,171 @@
+2007-06-28  Ben Elliston  <bje@gnu.org>
+
+	From M R Swami Reddy <MR.Swami.Reddy@nsc.com>:
+	* config.sub: Rename cr16c to cr16.
+
+2007-05-17  Ben Elliston  <bje@gnu.org>
+
+	From Luke Mewburn <luke@mewburn.net>:
+	* config.guess (i86xen:SunOS:5.*:*): New.
+	* testsuite/config-guess.data: Add test case.
+
+2007-04-29  Ben Elliston  <bje@gnu.org>
+
+	From Pedro Alves <pedro_alves@portugalmail.pt>:
+	* config.sub (mingw32ce): New.
+	* testsuite/config-sub.data: Add test cases.
+
+2007-03-06  Ben Elliston  <bje@gnu.org>
+
+	* config.guess (*:Interix*:[3456]*): Consolidate all machine
+	possibilities into a single entry with a case statement that
+	examines ${UNAME_MACHINE}. Suggested by <jerker.back@telia.com>.
+
+2007-01-18  Ben Elliston  <bje@gnu.org>
+
+	* testsuite/config-sub.data: Add MeP test cases.
+
+	From Dave Brolley  <brolley@redhat.com>
+	2001-03-19  Ben Elliston  <bje@redhat.com>
+
+	* config.sub (mep, mep-*): Add.
+
+2007-01-15  Ben Elliston  <bje@gnu.org>
+
+	* config.guess (SX-8R:SUPER-UX:*:*): New.
+	* testsuite/config-guess.data: Add a test case.
+
+2007-01-04  Ben Elliston  <bje@gnu.org>
+
+	From Alexander Boettcher <alex@kaffe.org> via Dalibor Topic:
+	* config.sub: Recognise -drops*.
+	* testsuite/config-sub.data: Add a test.
+
+2006-12-22  Ben Elliston  <bje@gnu.org>
+
+	* config.guess (i*:MINGW:*:*): Rename from this ..
+	(*:MINGW:*:*): .. to this.
+	* testsuite/config-guess.data: Add test cases.
+
+2006-12-08  Bob Wilson  <bob.wilson@acm.org>
+
+	* config.guess (xtensa:Linux:*:*): New.
+	* testsuite/config-guess.data: Add test case.
+	* testsuite/config-sub.data: Add xtensa-elf and xtensa-linux.
+
+2006-12-08  Kazu Hirata  <kazu@codesourcery.com>
+	    Ben Elliston  <bje@gnu.org>
+
+	* config.sub: Recognize fido and fido-*.
+	* testsuite/config-sub.data: Add test cases.
+
+2006-11-30  Ben Elliston  <bje@gnu.org>
+
+	* config.guess (SX-7:SUPER-UX:*:*): New.
+	* testsuite/config-guess.data: Add test case.
+
+2006-11-15  Ben Elliston  <bje@gnu.org>
+
+	From Josselin Mouette <joss@debian.org>:
+	* config.guess (SX-8:SUPER-UX:*:*): New.
+	* testsuite/config-guess.data: Add test case.
+
+2006-11-08  Ben Elliston  <bje@gnu.org>
+
+	* config.guess (authenticamd:Interix*:[3456]*): Another AMD64.
+	* testsuite/config-guess.data: Add test case.
+
+2006-11-07  Steve Woodford  <scw@NetBSD.org>
+	    Ben Elliston  <bje@gnu.org>
+
+	* config.guess (*:NetBSD:*:*): Handle sh5el arch.
+	* config.sub (sh5el): New basic_machine.
+	* testsuite/config-sub.data: Add test cases.
+
+2006-09-20  Ben Elliston  <bje@gnu.org>
+
+	* config.sub (score, score-*): New.
+	* testsuite/config-sub.data: Add test cases.
+
+2006-08-14  Thiemo Seufer  <ths@mips.com>
+	    Nigel Stephens  <nigel@mips.com>
+	    David Ung  <davidu@mips.com>
+
+	* config.sub (sde): New.
+	* testsuite/config-sub.data: Add test cases.
+
+2006-08-14  Vijay K. Munjal <vijaykumarm1@KPITCummins.com>
+
+	* config.sub (xc16x, xc16x-*): New.
+	* testsuite/config-sub.data: Add test cases.
+
+2006-07-02  Masaki MURANAKA  <monaka@monami-software.com>
+
+	* config.sub (toppers-*): New.
+	* testsuite/config-sub.data: Add test case.
+
+2006-07-02  Ben Elliston  <bje@gnu.org>
+
+	* config.guess (macppc:MirBSD:*:*): Fix typo.
+	* testsuite/config-guess.data: Add test case.
+
+2006-07-02  Ben Elliston  <bje@gnu.org>
+
+	* config.guess: Handle Interix 6.
+	* testsuite/config-guess.data: Add test case.
+
+2006-06-06  Ben Elliston  <bje@gnu.org>
+
+	From H??vard Skinnemoen <hskinnemoen@atmel.com>:
+	* config.guess (avr32*:Linux:*:*): New.
+	* config.sub (avr32, avr32-*): Likewise.
+	* testsuite/config-guess.data: Add test case.
+	* testsuite/config-sub.data: Likewise.
+
+2006-05-13  Ben Elliston  <bje@gnu.org>
+
+	* config.sub: Specify -elf as the default OS for spu.
+	(c4x-* | tic4x-*): Tidy formatting.
+	* testsuite/config-sub.data: Update tests.
+
+2006-05-13  Bruno Haible  <bruno@clisp.org>
+
+	* config.guess: Change support for Sun C/C++ 5.9 on Linux/x86 to
+	use compiler-specific predefines other than __sun.
+
+2006-05-12  Ben Elliston  <bje@gnu.org>
+
+	* config.sub (spu): New.
+	* testsuite/config-sub.data: Add test case.
+
+2006-05-12  Ben Elliston  <bje@gnu.org>
+
+	* config.sub (m32c, m32c-*): Fold into the standard case.
+
+2006-04-26  Bruno Haible  <bruno@clisp.org>
+	    Ben Elliston  <bje@gnu.org>
+
+	* config.guess (amd64:FreeBSD:*:*) Detect as x86_64.
+	* testsuite/config-guess.data: Add test case.
+
+2006-03-13  Ben Elliston  <bje@gnu.org>
+
+	Revert these patches at Earnie Boyd's request:
+
+	* testsuite/config-guess.data: Tweak MSYS_NT-5.1 test.
+
+	* config.guess: Handle i*:MSYS_NT-*:*:* for MSYS/Mingw.
+	* testsuite/config-guess.data: Add test case.
+
+2006-03-07  Mike Frysinger  <vapier@gentoo.org>
+
+        * config.sub (sheb, sheb-*): Handle these in addition to shbe.
+        * testsuite/config-sub.data: Add test case.
+
+2006-03-06  Ben Elliston  <bje@gnu.org>
+
+	* uname: Exit with exit code 0.
+
 2006-02-27  David S. Miller  <davem@sunset.davemloft.net>
 	    Ben Elliston  <bje@gnu.org>
 

Modified: trunk/buildroot/package/gnuconfig/config.guess
===================================================================
--- trunk/buildroot/package/gnuconfig/config.guess	2007-07-09 08:30:38 UTC (rev 19054)
+++ trunk/buildroot/package/gnuconfig/config.guess	2007-07-09 17:59:19 UTC (rev 19055)
@@ -4,7 +4,7 @@
 #   2000, 2001, 2002, 2003, 2004, 2005, 2006 Free Software Foundation,
 #   Inc.
 
-timestamp='2006-02-27'
+timestamp='2007-05-17'
 
 # This file is free software; you can redistribute it and/or modify it
 # under the terms of the GNU General Public License as published by
@@ -178,6 +178,7 @@
 	    arm*) machine=arm-unknown ;;
 	    sh3el) machine=shl-unknown ;;
 	    sh3eb) machine=sh-unknown ;;
+	    sh5el) machine=sh5le-unknown ;;
 	    *) machine=${UNAME_MACHINE_ARCH}-unknown ;;
 	esac
 	# The Operating System including object format, if it has switched
@@ -228,7 +229,7 @@
 	echo ${UNAME_MACHINE}-unknown-solidbsd${UNAME_RELEASE}
 	exit ;;
     macppc:MirBSD:*:*)
-	echo powerppc-unknown-mirbsd${UNAME_RELEASE}
+	echo powerpc-unknown-mirbsd${UNAME_RELEASE}
 	exit ;;
     *:MirBSD:*:*)
 	echo ${UNAME_MACHINE}-unknown-mirbsd${UNAME_RELEASE}
@@ -346,7 +347,7 @@
     sun4*:SunOS:5.*:* | tadpole*:SunOS:5.*:*)
 	echo sparc-sun-solaris2`echo ${UNAME_RELEASE}|sed -e 's/[^.]*//'`
 	exit ;;
-    i86pc:SunOS:5.*:*)
+    i86pc:SunOS:5.*:* | ix86xen:SunOS:5.*:*)
 	echo i386-pc-solaris2`echo ${UNAME_RELEASE}|sed -e 's/[^.]*//'`
 	exit ;;
     sun4*:SunOS:6*:*)
@@ -788,6 +789,8 @@
 	case ${UNAME_MACHINE} in
 	    pc98)
 		echo i386-unknown-freebsd`echo ${UNAME_RELEASE}|sed -e 's/[-(].*//'` ;;
+	    amd64)
+		echo x86_64-unknown-freebsd`echo ${UNAME_RELEASE}|sed -e 's/[-(].*//'` ;;
 	    *)
 		echo ${UNAME_MACHINE}-unknown-freebsd`echo ${UNAME_RELEASE}|sed -e 's/[-(].*//'` ;;
 	esac
@@ -795,12 +798,9 @@
     i*:CYGWIN*:*)
 	echo ${UNAME_MACHINE}-pc-cygwin
 	exit ;;
-    i*:MINGW*:*)
+    *:MINGW*:*)
 	echo ${UNAME_MACHINE}-pc-mingw32
 	exit ;;
-    i*:MSYS_NT-*:*:*)
-	echo ${UNAME_MACHINE}-pc-mingw32
-	exit ;;
     i*:windows32*:*)
     	# uname -m includes "-pc" on this system.
     	echo ${UNAME_MACHINE}-mingw32
@@ -808,12 +808,15 @@
     i*:PW*:*)
 	echo ${UNAME_MACHINE}-pc-pw32
 	exit ;;
-    x86:Interix*:[345]*)
-	echo i586-pc-interix${UNAME_RELEASE}
-	exit ;;
-    EM64T:Interix*:[345]*)
-	echo x86_64-unknown-interix${UNAME_RELEASE}
-	exit ;;
+    *:Interix*:[3456]*)
+    	case ${UNAME_MACHINE} in
+	    x86) 
+		echo i586-pc-interix${UNAME_RELEASE}
+		exit ;;
+	    EM64T | authenticamd)
+		echo x86_64-unknown-interix${UNAME_RELEASE}
+		exit ;;
+	esac ;;
     [345]86:Windows_95:* | [345]86:Windows_98:* | [345]86:Windows_NT:*)
 	echo i${UNAME_MACHINE}-pc-mks
 	exit ;;
@@ -849,6 +852,9 @@
     arm*:Linux:*:*)
 	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
 	exit ;;
+    avr32*:Linux:*:*)
+	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
+	exit ;;
     cris:Linux:*:*)
 	echo cris-axis-linux-${LIBC}
 	exit ;;
@@ -965,6 +971,9 @@
     x86_64:Linux:*:*)
 	echo x86_64-unknown-linux-${LIBC}
 	exit ;;
+    xtensa:Linux:*:*)
+    	echo xtensa-unknown-linux-${LIBC}
+	exit ;;
     i*86:Linux:*:*)
 	# The BFD linker knows what the default object file format is, so
 	# first see if it will tell us. cd to the root directory to prevent
@@ -1009,7 +1018,7 @@
 	LIBC=gnulibc1
 	# endif
 	#else
-	#if defined(__INTEL_COMPILER) || defined(__PGI) || defined(__sun)
+	#if defined(__INTEL_COMPILER) || defined(__PGI) || defined(__SUNPRO_C) || defined(__SUNPRO_CC)
 	LIBC=gnu
 	#else
 	LIBC=gnuaout
@@ -1225,6 +1234,15 @@
     SX-6:SUPER-UX:*:*)
 	echo sx6-nec-superux${UNAME_RELEASE}
 	exit ;;
+    SX-7:SUPER-UX:*:*)
+	echo sx7-nec-superux${UNAME_RELEASE}
+	exit ;;
+    SX-8:SUPER-UX:*:*)
+	echo sx8-nec-superux${UNAME_RELEASE}
+	exit ;;
+    SX-8R:SUPER-UX:*:*)
+	echo sx8r-nec-superux${UNAME_RELEASE}
+	exit ;;
     Power*:Rhapsody:*:*)
 	echo powerpc-apple-rhapsody${UNAME_RELEASE}
 	exit ;;

Modified: trunk/buildroot/package/gnuconfig/config.sub
===================================================================
--- trunk/buildroot/package/gnuconfig/config.sub	2007-07-09 08:30:38 UTC (rev 19054)
+++ trunk/buildroot/package/gnuconfig/config.sub	2007-07-09 17:59:19 UTC (rev 19055)
@@ -4,7 +4,7 @@
 #   2000, 2001, 2002, 2003, 2004, 2005, 2006 Free Software Foundation,
 #   Inc.
 
-timestamp='2006-02-27'
+timestamp='2007-06-28'
 
 # This file is (in principle) common to ALL GNU software.
 # The presence of a machine in this file suggests that SOME GNU software
@@ -245,11 +245,12 @@
 	| bfin \
 	| c4x | clipper \
 	| d10v | d30v | dlx | dsp16xx | dvp \
-	| fr30 | frv \
+	| fido | fr30 | frv \
 	| h8300 | h8500 | hppa | hppa1.[01] | hppa2.0 | hppa2.0[nw] | hppa64 \
 	| i370 | i860 | i960 | ia64 \
 	| ip2k | iq2000 \
-	| m32r | m32rle | m68000 | m68k | m88k | maxq | mb | microblaze | mcore \
+	| m32c | m32r | m32rle | m68000 | m68k | m88k \
+	| maxq | mb | microblaze | mcore | mep \
 	| mips | mipsbe | mipseb | mipsel | mipsle \
 	| mips16 \
 	| mips64 | mips64el \
@@ -275,21 +276,19 @@
 	| pdp10 | pdp11 | pj | pjl \
 	| powerpc | powerpc64 | powerpc64le | powerpcle | ppcbe \
 	| pyramid \
-	| sh | sh[1234] | sh[24]a | sh[24]a*eb | sh[23]e | sh[34]eb | shbe | sheb | shle | sh[1234]le | sh3ele \
+	| score \
+	| sh | sh[1234] | sh[24]a | sh[24]a*eb | sh[23]e | sh[34]eb | sheb | shbe | shle | sh[1234]le | sh3ele \
 	| sh64 | sh64le \
 	| sparc | sparc64 | sparc64b | sparc64v | sparc86x | sparclet | sparclite \
 	| sparcv8 | sparcv9 | sparcv9b | sparcv9v \
-	| strongarm \
+	| spu | strongarm \
 	| tahoe | thumb | tic4x | tic80 | tron \
 	| v850 | v850e \
 	| we32k \
-	| x86 | xscale | xscalee[bl] | xstormy16 | xtensa \
+	| x86 | xc16x | xscale | xscalee[bl] | xstormy16 | xtensa \
 	| z8k)
 		basic_machine=$basic_machine-unknown
 		;;
-	m32c)
-		basic_machine=$basic_machine-unknown
-		;;
 	m6811 | m68hc11 | m6812 | m68hc12)
 		# Motorola 68HC11/12.
 		basic_machine=$basic_machine-unknown
@@ -325,12 +324,12 @@
 	| clipper-* | craynv-* | cydra-* \
 	| d10v-* | d30v-* | dlx-* \
 	| elxsi-* \
-	| f30[01]-* | f700-* | fr30-* | frv-* | fx80-* \
+	| f30[01]-* | f700-* | fido-* | fr30-* | frv-* | fx80-* \
 	| h8300-* | h8500-* \
 	| hppa-* | hppa1.[01]-* | hppa2.0-* | hppa2.0[nw]-* | hppa64-* \
 	| i*86-* | i860-* | i960-* | ia64-* \
 	| ip2k-* | iq2000-* \
-	| m32r-* | m32rle-* \
+	| m32c-* | m32r-* | m32rle-* \
 	| m68000-* | m680[012346]0-* | m68360-* | m683?2-* | m68k-* \
 	| m88110-* | m88k-* | maxq-* | mcore-* \
 	| mips-* | mipsbe-* | mipseb-* | mipsel-* | mipsle-* \
@@ -359,7 +358,7 @@
 	| powerpc-* | powerpc64-* | powerpc64le-* | powerpcle-* | ppcbe-* \
 	| pyramid-* \
 	| romp-* | rs6000-* \
-	| sh-* | sh[1234]-* | sh[24]a-* | sh[23]e-* | sh[34]eb-* | shbe-* \
+	| sh-* | sh[1234]-* | sh[24]a-* | sh[24]a*eb-* | sh[23]e-* | sh[34]eb-* | sheb-* | shbe-* \
 	| shle-* | sh[1234]le-* | sh3ele-* | sh64-* | sh64le-* \
 	| sparc-* | sparc64-* | sparc64b-* | sparc64v-* | sparc86x-* | sparclet-* \
 	| sparclite-* \
@@ -369,13 +368,11 @@
 	| tron-* \
 	| v850-* | v850e-* | vax-* \
 	| we32k-* \
-	| x86-* | x86_64-* | xps100-* | xscale-* | xscalee[bl]-* \
+	| x86-* | x86_64-* | xc16x-* | xps100-* | xscale-* | xscalee[bl]-* \
 	| xstormy16-* | xtensa-* \
 	| ymp-* \
 	| z8k-*)
 		;;
-	m32c-*)
-		;;
 	# Recognize the various machine names and aliases which stand
 	# for a CPU type and a company and sometimes even an OS.
 	386bsd)
@@ -478,8 +475,8 @@
 		basic_machine=craynv-cray
 		os=-unicosmp
 		;;
-	cr16c)
-		basic_machine=cr16c-unknown
+	cr16)
+		basic_machine=cr16-unknown
 		os=-elf
 		;;
 	crds | unos)
@@ -686,6 +683,10 @@
 		basic_machine=i386-pc
 		os=-mingw32
 		;;
+	mingw32ce)
+		basic_machine=arm-unknown
+		os=-mingw32ce
+		;;
 	miniframe)
 		basic_machine=m68000-convergent
 		;;
@@ -931,6 +932,10 @@
 	sb1el)
 		basic_machine=mipsisa64sb1el-unknown
 		;;
+	sde)
+		basic_machine=mipsisa32-sde
+		os=-elf
+		;;
 	sei)
 		basic_machine=mips-sei
 		os=-seiux
@@ -942,6 +947,9 @@
 		basic_machine=sh-hitachi
 		os=-hms
 		;;
+	sh5el)
+		basic_machine=sh5le-unknown
+		;;
 	sh64)
 		basic_machine=sh64-unknown
 		;;
@@ -1236,7 +1244,7 @@
 	      | -os2* | -vos* | -palmos* | -uclinux* | -nucleus* \
 	      | -morphos* | -superux* | -rtmk* | -rtmk-nova* | -windiss* \
 	      | -powermax* | -dnix* | -nx6 | -nx7 | -sei* | -dragonfly* \
-	      | -skyos* | -haiku* | -rdos* | -irx*)
+	      | -skyos* | -haiku* | -rdos* | -toppers* | -drops* | -irx*)
 	# Remember, each alternative MUST END IN *, to match a version number.
 		;;
 	-qnx*)
@@ -1388,6 +1396,12 @@
 # system, and we'll never get to this point.
 
 case $basic_machine in
+        score-*)
+		os=-elf
+		;;
+        spu-*)
+		os=-elf
+		;;
 	*-acorn)
 		os=-riscix1.2
 		;;
@@ -1397,9 +1411,9 @@
 	arm*-semi)
 		os=-aout
 		;;
-    c4x-* | tic4x-*)
-        os=-coff
-        ;;
+        c4x-* | tic4x-*)
+        	os=-coff
+		;;
 	# This must come before the *-dec entry.
 	pdp10-*)
 		os=-tops20
@@ -1425,6 +1439,9 @@
 	m68*-cisco)
 		os=-aout
 		;;
+        mep-*)
+		os=-elf
+		;;
 	mips*-cisco)
 		os=-elf
 		;;

Modified: trunk/buildroot/package/gnuconfig/patches/config.guess.uclibc.patch
===================================================================
--- trunk/buildroot/package/gnuconfig/patches/config.guess.uclibc.patch	2007-07-09 08:30:38 UTC (rev 19054)
+++ trunk/buildroot/package/gnuconfig/patches/config.guess.uclibc.patch	2007-07-09 17:59:19 UTC (rev 19055)
@@ -1,11 +1,11 @@
 Index: config.guess
 ===================================================================
 RCS file: /cvsroot/config/config/config.guess,v
-retrieving revision 1.349
-diff -u -p -r1.349 config.guess
---- config.guess	26 Feb 2006 23:11:20 -0000	1.349
-+++ config.guess	2 Mar 2006 06:15:33 -0000
-@@ -139,6 +139,23 @@ UNAME_RELEASE=`(uname -r) 2>/dev/null` |
+retrieving revision 1.366
+diff -u -r1.366 config.guess
+--- config.guess	17 May 2007 06:28:53 -0000	1.366
++++ config.guess	9 Jul 2007 17:32:18 -0000
+@@ -139,6 +139,23 @@
  UNAME_SYSTEM=`(uname -s) 2>/dev/null`  || UNAME_SYSTEM=unknown
  UNAME_VERSION=`(uname -v) 2>/dev/null` || UNAME_VERSION=unknown
  
@@ -29,13 +29,17 @@
  # Note: order is significant - the case branches are not exclusive.
  
  case "${UNAME_MACHINE}:${UNAME_SYSTEM}:${UNAME_RELEASE}:${UNAME_VERSION}" in
-@@ -830,25 +847,25 @@ EOF
+@@ -833,28 +850,28 @@
  	echo ${UNAME_MACHINE}-pc-minix
  	exit ;;
      arm*:Linux:*:*)
 -	echo ${UNAME_MACHINE}-unknown-linux-gnu
 +	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
  	exit ;;
+     avr32*:Linux:*:*)
+-	echo ${UNAME_MACHINE}-unknown-linux-gnu
++	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
+ 	exit ;;
      cris:Linux:*:*)
 -	echo cris-axis-linux-gnu
 +	echo cris-axis-linux-${LIBC}
@@ -62,7 +66,7 @@
  	exit ;;
      mips:Linux:*:*)
  	eval $set_cc_for_build
-@@ -871,7 +888,7 @@ EOF
+@@ -877,7 +894,7 @@
  		s: ::g
  		p
  	    }'`"
@@ -71,7 +75,7 @@
  	;;
      mips64:Linux:*:*)
  	eval $set_cc_for_build
-@@ -894,16 +911,16 @@ EOF
+@@ -900,16 +917,16 @@
  		s: ::g
  		p
  	    }'`"
@@ -92,7 +96,7 @@
  	exit ;;
      alpha:Linux:*:*)
  	case `sed -n '/^cpu model/s/^.*: \(.*\)/\1/p' < /proc/cpuinfo` in
-@@ -916,37 +933,37 @@ EOF
+@@ -922,40 +939,40 @@
  	  EV68*) UNAME_MACHINE=alphaev68 ;;
          esac
  	objdump --private-headers /bin/sh | grep ld.so.1 >/dev/null
@@ -139,9 +143,13 @@
 -	echo x86_64-unknown-linux-gnu
 +	echo x86_64-unknown-linux-${LIBC}
  	exit ;;
+     xtensa:Linux:*:*)
+-    	echo xtensa-unknown-linux-gnu
++    	echo xtensa-unknown-linux-${LIBC}
+ 	exit ;;
      i*86:Linux:*:*)
  	# The BFD linker knows what the default object file format is, so
-@@ -961,20 +978,22 @@ EOF
+@@ -970,20 +987,22 @@
  				    p'`
          case "$ld_supported_targets" in
  	  elf32-i386)

Modified: trunk/buildroot/package/gnuconfig/patches/config.sub.ps2.patch
===================================================================
--- trunk/buildroot/package/gnuconfig/patches/config.sub.ps2.patch	2007-07-09 08:30:38 UTC (rev 19054)
+++ trunk/buildroot/package/gnuconfig/patches/config.sub.ps2.patch	2007-07-09 17:59:19 UTC (rev 19055)
@@ -1,20 +1,20 @@
 Index: config.sub
 ===================================================================
 RCS file: /cvsroot/config/config/config.sub,v
-retrieving revision 1.340
-diff -u -p -r1.340 config.sub
---- config.sub
-+++ config.sub
-@@ -244,7 +244,7 @@ case $basic_machine in
- 	| arc | arm | arm[bl]e | arme[lb] | armv[2345] | armv[345][lb] | avr \
+retrieving revision 1.356
+diff -u -r1.356 config.sub
+--- config.sub	28 Jun 2007 06:56:43 -0000	1.356
++++ config.sub	9 Jul 2007 17:43:32 -0000
+@@ -244,7 +244,7 @@
+ 	| arc | arm | arm[bl]e | arme[lb] | armv[2345] | armv[345][lb] | avr | avr32 \
  	| bfin \
  	| c4x | clipper \
 -	| d10v | d30v | dlx | dsp16xx \
 +	| d10v | d30v | dlx | dsp16xx | dvp \
- 	| fr30 | frv \
+ 	| fido | fr30 | frv \
  	| h8300 | h8500 | hppa | hppa1.[01] | hppa2.0 | hppa2.0[nw] | hppa64 \
  	| i370 | i860 | i960 | ia64 \
-@@ -693,6 +693,24 @@ case $basic_machine in
+@@ -694,6 +694,24 @@
  		basic_machine=m68k-atari
  		os=-mint
  		;;
@@ -39,12 +39,12 @@
  	mips3*-*)
  		basic_machine=`echo $basic_machine | sed -e 's/mips3/mips64/'`
  		;;
-@@ -1218,7 +1236,7 @@ case $os in
+@@ -1226,7 +1244,7 @@
  	      | -os2* | -vos* | -palmos* | -uclinux* | -nucleus* \
  	      | -morphos* | -superux* | -rtmk* | -rtmk-nova* | -windiss* \
  	      | -powermax* | -dnix* | -nx6 | -nx7 | -sei* | -dragonfly* \
--	      | -skyos* | -haiku* | -rdos*)
-+	      | -skyos* | -haiku* | -rdos* | -irx*)
+-	      | -skyos* | -haiku* | -rdos* | -toppers* | -drops*)
++	      | -skyos* | -haiku* | -rdos* | -toppers* | -drops* | -irx*)
  	# Remember, each alternative MUST END IN *, to match a version number.
  		;;
  	-qnx*)

Modified: trunk/buildroot/package/gnuconfig/patches/config.sub.sh.patch
===================================================================
--- trunk/buildroot/package/gnuconfig/patches/config.sub.sh.patch	2007-07-09 08:30:38 UTC (rev 19054)
+++ trunk/buildroot/package/gnuconfig/patches/config.sub.sh.patch	2007-07-09 17:59:19 UTC (rev 19055)
@@ -15,25 +15,25 @@
 Index: config.sub
 ===================================================================
 RCS file: /cvsroot/config/config/config.sub,v
-retrieving revision 1.340
-diff -u -p -r1.340 config.sub
---- config.sub	26 Feb 2006 23:33:46 -0000	1.340
-+++ config.sub	2 Mar 2006 06:22:01 -0000
-@@ -275,7 +275,7 @@ case $basic_machine in
- 	| pdp10 | pdp11 | pj | pjl \
+retrieving revision 1.356
+diff -u -r1.356 config.sub
+--- config.sub	28 Jun 2007 06:56:43 -0000	1.356
++++ config.sub	9 Jul 2007 17:38:48 -0000
+@@ -277,7 +277,7 @@
  	| powerpc | powerpc64 | powerpc64le | powerpcle | ppcbe \
  	| pyramid \
--	| sh | sh[1234] | sh[24]a | sh[23]e | sh[34]eb | shbe | shle | sh[1234]le | sh3ele \
-+	| sh | sh[1234] | sh[24]a | sh[24]a*eb | sh[23]e | sh[34]eb | shbe | sheb | shle | sh[1234]le | sh3ele \
+ 	| score \
+-	| sh | sh[1234] | sh[24]a | sh[23]e | sh[34]eb | sheb | shbe | shle | sh[1234]le | sh3ele \
++	| sh | sh[1234] | sh[24]a | sh[24]a*eb | sh[23]e | sh[34]eb | sheb | shbe | shle | sh[1234]le | sh3ele \
  	| sh64 | sh64le \
  	| sparc | sparc64 | sparc64b | sparc64v | sparc86x | sparclet | sparclite \
  	| sparcv8 | sparcv9 | sparcv9b | sparcv9v \
-@@ -359,7 +359,7 @@ case $basic_machine in
+@@ -358,7 +358,7 @@
  	| powerpc-* | powerpc64-* | powerpc64le-* | powerpcle-* | ppcbe-* \
  	| pyramid-* \
  	| romp-* | rs6000-* \
--	| sh-* | sh[1234]-* | sh[24]a-* | sh[23]e-* | sh[34]eb-* | shbe-* \
-+	| sh-* | sh[1234]-* | sh[24]a-* | sh[24]a*eb-* | sh[23]e-* | sh[34]eb-* | shbe-* | sheb-* \
+-	| sh-* | sh[1234]-* | sh[24]a-* | sh[23]e-* | sh[34]eb-* | sheb-* | shbe-* \
++	| sh-* | sh[1234]-* | sh[24]a-* | sh[24]a*eb-* | sh[23]e-* | sh[34]eb-* | sheb-* | shbe-* \
  	| shle-* | sh[1234]le-* | sh3ele-* | sh64-* | sh64le-* \
  	| sparc-* | sparc64-* | sparc64b-* | sparc64v-* | sparc86x-* | sparclet-* \
  	| sparclite-* \

Modified: trunk/buildroot/package/gnuconfig/testsuite/CVS/Entries
===================================================================
--- trunk/buildroot/package/gnuconfig/testsuite/CVS/Entries	2007-07-09 08:30:38 UTC (rev 19054)
+++ trunk/buildroot/package/gnuconfig/testsuite/CVS/Entries	2007-07-09 17:59:19 UTC (rev 19055)
@@ -1,7 +1,7 @@
-/.cvsignore/1.1/Thu Aug  4 22:41:55 2005//
-/config-guess.sh/1.4/Thu Aug  4 14:15:16 2005//
-/config-sub.sh/1.2/Thu Aug  4 14:15:16 2005//
-/uname.in/1.1/Thu Aug  4 14:15:16 2005//
-/config-guess.data/1.25/Thu Mar  2 06:17:14 2006//
-/config-sub.data/1.33/Thu Mar  2 06:17:14 2006//
+/.cvsignore/1.1/Mon Sep 26 07:33:33 2005//
+/config-guess.data/1.37/Mon Jul  9 16:57:20 2007//
+/config-guess.sh/1.4/Mon Sep 26 07:33:33 2005//
+/config-sub.data/1.47/Mon Jul  9 16:57:20 2007//
+/config-sub.sh/1.2/Mon Sep 26 07:33:33 2005//
+/uname.in/1.1/Mon Sep 26 07:33:33 2005//
 D

Modified: trunk/buildroot/package/gnuconfig/testsuite/config-guess.data
===================================================================
--- trunk/buildroot/package/gnuconfig/testsuite/config-guess.data	2007-07-09 08:30:38 UTC (rev 19054)
+++ trunk/buildroot/package/gnuconfig/testsuite/config-guess.data	2007-07-09 17:59:19 UTC (rev 19055)
@@ -19,5 +19,16 @@
 pc98	7.0			FreeBSD		ignored	i386-unknown-freebsd7.0
 i586	1.0			SolidBSD	ignored	i586-unknown-solidbsd1.0
 i686	5.4-1-686		GNU/kFreeBSD	ignored	i686-unknown-kfreebsd5.4-gnu
-i686	1.0.10(0.46/3/2)	MSYS_NT-5.1	ignored	i686-pc-mingw32
 EM64T	5.2			Interix		ignored	x86_64-unknown-interix5.2
+amd64	5.2			FreeBSD		ignored	x86_64-unknown-freebsd5.2
+avr32	2.6.15			Linux		ignored	avr32-unknown-linux-gnu
+x86	6.0			Interix		ignored	i586-pc-interix6.0
+macppc	1.0			MirBSD		ignored	powerpc-unknown-mirbsd1.0
+authenticamd	6.0		Interix		ignored	x86_64-unknown-interix6.0
+SX-8	1.0			SUPER-UX	ignored	sx8-nec-superux1.0
+SX-7	1.0			SUPER-UX	ignored	sx7-nec-superux1.0
+xtensa	2.6.15			Linux		ignored	xtensa-unknown-linux-gnu
+x86_64	1.0			MINGW		ignored	x86_64-pc-mingw32
+i386	1.0			MINGW		ignored	i386-pc-mingw32
+SX-8R	1.0			SUPER-UX	ignored	sx8r-nec-superux1.0
+ix86xen	5.6			SunOS		ignored	i386-pc-solaris2.6

Modified: trunk/buildroot/package/gnuconfig/testsuite/config-sub.data
===================================================================
--- trunk/buildroot/package/gnuconfig/testsuite/config-sub.data	2007-07-09 08:30:38 UTC (rev 19054)
+++ trunk/buildroot/package/gnuconfig/testsuite/config-sub.data	2007-07-09 17:59:19 UTC (rev 19055)
@@ -61,6 +61,7 @@
 sh3e-elf			sh3e-unknown-elf
 sh3eb-elf			sh3eb-unknown-elf
 sh4eb-elf			sh4eb-unknown-elf
+sheb-elf			sheb-unknown-elf
 shbe-elf			shbe-unknown-elf
 shle-elf			shle-unknown-elf
 sh1le-elf			sh1le-unknown-elf
@@ -90,3 +91,26 @@
 sparc64v-elf			sparc64v-unknown-elf
 sparcv9v-solaris2.9		sparcv9v-unknown-solaris2.9
 sparc64v-solaris2.9		sparc64v-unknown-solaris2.9
+sh-toppers			sh-unknown-toppers
+spu				spu-unknown-elf
+spu-elf				spu-unknown-elf
+spu-linux			spu-unknown-linux-gnu
+avr32				avr32-unknown-none
+avr32-linux			avr32-unknown-linux-gnu
+xc16x				xc16x-unknown-none
+xc16x-elf			xc16x-unknown-elf
+sde-elf				mipsisa32-sde-elf
+mips-sde-elf			mips-sde-elf
+score				score-unknown-elf
+score-elf			score-unknown-elf
+sh5el-elf			sh5le-unknown-elf
+sh5el-netbsd			sh5le-unknown-netbsd
+fido-elf			fido-unknown-elf
+fido				fido-unknown-none
+xtensa-elf			xtensa-unknown-elf
+xtensa-linux			xtensa-unknown-linux-gnu
+i386-drops1.0			i386-pc-drops1.0
+mep				mep-unknown-elf
+mep-elf				mep-unknown-elf
+mingw32ce			arm-unknown-mingw32ce	
+arm-mingw32ce			arm-unknown-mingw32ce

Modified: trunk/buildroot/package/gnuconfig/uname
===================================================================
--- trunk/buildroot/package/gnuconfig/uname	2007-07-09 08:30:38 UTC (rev 19054)
+++ trunk/buildroot/package/gnuconfig/uname	2007-07-09 17:59:19 UTC (rev 19055)
@@ -7,3 +7,5 @@
 [ $1 = -s ] && echo iainfo2
 [ $1 = -v ] && echo 3.0
 [ $1 = -p ] && echo "Pentium III(TM)-ISA/PCI"
+
+exit 0
