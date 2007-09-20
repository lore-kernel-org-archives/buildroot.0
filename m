From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 20 Sep 2007 09:52:00 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/gnuconfig: CVS
	testsuite testsuite/CVS
Message-ID: <20070920165200.BE5313004B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-20 09:51:59 -0700 (Thu, 20 Sep 2007)
New Revision: 19915

Log:
- pull POSIX compliance fixes from upstream


Modified:
   trunk/buildroot/package/gnuconfig/CVS/Entries
   trunk/buildroot/package/gnuconfig/ChangeLog
   trunk/buildroot/package/gnuconfig/config.guess
   trunk/buildroot/package/gnuconfig/testsuite/CVS/Entries
   trunk/buildroot/package/gnuconfig/testsuite/config-guess.data
   trunk/buildroot/package/gnuconfig/testsuite/config-guess.sh
   trunk/buildroot/package/gnuconfig/testsuite/config-sub.sh


Changeset:
Modified: trunk/buildroot/package/gnuconfig/CVS/Entries
===================================================================
--- trunk/buildroot/package/gnuconfig/CVS/Entries	2007-09-20 16:47:22 UTC (rev 19914)
+++ trunk/buildroot/package/gnuconfig/CVS/Entries	2007-09-20 16:51:59 UTC (rev 19915)
@@ -7,8 +7,8 @@
 D/src////
 D/tests////
 D/testsuite////
-/ChangeLog/1.384/Mon Jul  9 16:57:20 2007//
 /Makefile/1.6/Mon Sep 26 07:33:33 2005//
-/config.guess/1.366/Mon Jul  9 16:57:20 2007//
-/config.sub/1.356/Mon Jul  9 16:57:20 2007//
-/uname/1.5/Mon Jul  9 16:57:20 2007//
+/ChangeLog/1.387/Thu Sep 20 16:47:12 2007//
+/config.guess/1.368/Thu Sep 20 16:47:12 2007//
+/config.sub/1.356/Thu Sep 20 16:47:05 2007//
+/uname/1.5/Tue Aug 21 18:37:34 2007//

Modified: trunk/buildroot/package/gnuconfig/ChangeLog
===================================================================
--- trunk/buildroot/package/gnuconfig/ChangeLog	2007-09-20 16:47:22 UTC (rev 19914)
+++ trunk/buildroot/package/gnuconfig/ChangeLog	2007-09-20 16:51:59 UTC (rev 19915)
@@ -1,3 +1,18 @@
+2007-07-25  Mike Frysinger  <vapier@gentoo.org>
+
+	* testsuite/config-guess.sh (run_config_guess): Do not prefix with
+	"function" as this is not permitted by POSIX.
+	* testsuite/config-sub.sh (run_config_sub): Likewise.
+
+2007-07-24  Ben Elliston  <bje@gnu.org>
+
+	* config.guess: Remove trailing whitespace.
+
+2007-07-22  Ben Elliston  <bje@gnu.org>
+
+	Reported by Luke Mewburn <luke@mewburn.net>:
+	* config.guess: Fix typo ix86xen -> i86xen.
+
 2007-06-28  Ben Elliston  <bje@gnu.org>
 
 	From M R Swami Reddy <MR.Swami.Reddy@nsc.com>:

Modified: trunk/buildroot/package/gnuconfig/config.guess
===================================================================
--- trunk/buildroot/package/gnuconfig/config.guess	2007-09-20 16:47:22 UTC (rev 19914)
+++ trunk/buildroot/package/gnuconfig/config.guess	2007-09-20 16:51:59 UTC (rev 19915)
@@ -4,7 +4,7 @@
 #   2000, 2001, 2002, 2003, 2004, 2005, 2006 Free Software Foundation,
 #   Inc.
 
-timestamp='2007-05-17'
+timestamp='2007-07-22'
 
 # This file is free software; you can redistribute it and/or modify it
 # under the terms of the GNU General Public License as published by
@@ -347,7 +347,7 @@
     sun4*:SunOS:5.*:* | tadpole*:SunOS:5.*:*)
 	echo sparc-sun-solaris2`echo ${UNAME_RELEASE}|sed -e 's/[^.]*//'`
 	exit ;;
-    i86pc:SunOS:5.*:* | ix86xen:SunOS:5.*:*)
+    i86pc:SunOS:5.*:* | i86xen:SunOS:5.*:*)
 	echo i386-pc-solaris2`echo ${UNAME_RELEASE}|sed -e 's/[^.]*//'`
 	exit ;;
     sun4*:SunOS:6*:*)
@@ -810,7 +810,7 @@
 	exit ;;
     *:Interix*:[3456]*)
     	case ${UNAME_MACHINE} in
-	    x86) 
+	    x86)
 		echo i586-pc-interix${UNAME_RELEASE}
 		exit ;;
 	    EM64T | authenticamd)

Modified: trunk/buildroot/package/gnuconfig/testsuite/CVS/Entries
===================================================================
--- trunk/buildroot/package/gnuconfig/testsuite/CVS/Entries	2007-09-20 16:47:22 UTC (rev 19914)
+++ trunk/buildroot/package/gnuconfig/testsuite/CVS/Entries	2007-09-20 16:51:59 UTC (rev 19915)
@@ -1,7 +1,7 @@
 /.cvsignore/1.1/Mon Sep 26 07:33:33 2005//
-/config-guess.data/1.37/Mon Jul  9 16:57:20 2007//
-/config-guess.sh/1.4/Mon Sep 26 07:33:33 2005//
-/config-sub.data/1.47/Mon Jul  9 16:57:20 2007//
-/config-sub.sh/1.2/Mon Sep 26 07:33:33 2005//
 /uname.in/1.1/Mon Sep 26 07:33:33 2005//
+/config-guess.data/1.38/Thu Sep 20 16:47:13 2007//
+/config-guess.sh/1.5/Thu Sep 20 16:47:13 2007//
+/config-sub.data/1.47/Tue Aug 21 18:37:33 2007//
+/config-sub.sh/1.3/Thu Sep 20 16:47:13 2007//
 D

Modified: trunk/buildroot/package/gnuconfig/testsuite/config-guess.data
===================================================================
--- trunk/buildroot/package/gnuconfig/testsuite/config-guess.data	2007-09-20 16:47:22 UTC (rev 19914)
+++ trunk/buildroot/package/gnuconfig/testsuite/config-guess.data	2007-09-20 16:51:59 UTC (rev 19915)
@@ -31,4 +31,4 @@
 x86_64	1.0			MINGW		ignored	x86_64-pc-mingw32
 i386	1.0			MINGW		ignored	i386-pc-mingw32
 SX-8R	1.0			SUPER-UX	ignored	sx8r-nec-superux1.0
-ix86xen	5.6			SunOS		ignored	i386-pc-solaris2.6
+i86xen	5.6			SunOS		ignored	i386-pc-solaris2.6

Modified: trunk/buildroot/package/gnuconfig/testsuite/config-guess.sh
===================================================================
--- trunk/buildroot/package/gnuconfig/testsuite/config-guess.sh	2007-09-20 16:47:22 UTC (rev 19914)
+++ trunk/buildroot/package/gnuconfig/testsuite/config-guess.sh	2007-09-20 16:51:59 UTC (rev 19915)
@@ -10,7 +10,7 @@
 export PATH=`pwd`:$PATH
 IFS="	" # tab
 
-function run_config_guess ()
+run_config_guess ()
 {
     rc=0
     while read machine release system version triplet ; do

Modified: trunk/buildroot/package/gnuconfig/testsuite/config-sub.sh
===================================================================
--- trunk/buildroot/package/gnuconfig/testsuite/config-sub.sh	2007-09-20 16:47:22 UTC (rev 19914)
+++ trunk/buildroot/package/gnuconfig/testsuite/config-sub.sh	2007-09-20 16:51:59 UTC (rev 19915)
@@ -9,7 +9,7 @@
 
 verbose=false
 
-function run_config_sub ()
+run_config_sub ()
 {
     rc=0
     while read alias canonical ; do
