From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu,  6 Mar 2008 14:56:54 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc/4.2.1
Message-ID: <20080306225654.2B0BE120183@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-03-06 14:56:50 -0800 (Thu, 06 Mar 2008)
New Revision: 21261

Log:
gcc 4.2.1: Don't change SUFFIX and bug report URL

SUFFIX and bug report URL shouldn't be set to something atmel specific
if you don't compile for AVR32.

The AVR32 patch should probably only get applied if compiling for AVR32.


Modified:
   trunk/buildroot/toolchain/gcc/4.2.1/900-avr32-atmel.1.3.2.patch


Changeset:
Modified: trunk/buildroot/toolchain/gcc/4.2.1/900-avr32-atmel.1.3.2.patch
===================================================================
--- trunk/buildroot/toolchain/gcc/4.2.1/900-avr32-atmel.1.3.2.patch	2008-03-06 20:11:00 UTC (rev 21260)
+++ trunk/buildroot/toolchain/gcc/4.2.1/900-avr32-atmel.1.3.2.patch	2008-03-06 22:56:50 UTC (rev 21261)
@@ -20505,27 +20505,6 @@
  
  // Bug: g++ was failing to destroy C<int>::a because it was using two
  // different sentry variables for construction and destruction.
-diff -Nrup gcc-4.2.1/gcc/version.c gcc-4.2.1.atmel.1.3.2/gcc/version.c
---- gcc-4.2.1/gcc/version.c	2005-03-16 07:04:10.000000000 +0100
-+++ gcc-4.2.1.atmel.1.3.2/gcc/version.c	2007-09-28 10:33:09.000000000 +0200
-@@ -8,7 +8,7 @@
-    in parentheses.  You may also wish to include a number indicating
-    the revision of your modified compiler.  */
- 
--#define VERSUFFIX ""
-+#define VERSUFFIX "-atmel.1.0.3"
- 
- /* This is the location of the online document giving instructions for
-    reporting bugs.  If you distribute a modified version of GCC,
-@@ -17,7 +17,7 @@
-    forward us bugs reported to you, if you determine that they are
-    not bugs in your modifications.)  */
- 
--const char bug_report_url[] = "<URL:http://gcc.gnu.org/bugs.html>";
-+const char bug_report_url[] = "<URL:http://www.atmel.com/avr32/>";
- 
- /* The complete version string, assembled from several pieces.
-    BASEVER, DATESTAMP, and DEVPHASE are defined by the Makefile.  */
 diff -Nrup gcc-4.2.1/LAST_UPDATED gcc-4.2.1.atmel.1.3.2/LAST_UPDATED
 --- gcc-4.2.1/LAST_UPDATED	2007-07-19 16:33:57.000000000 +0200
 +++ gcc-4.2.1.atmel.1.3.2/LAST_UPDATED	1970-01-01 01:00:00.000000000 +0100
