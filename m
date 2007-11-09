From: vanokuten at uclibc.org <vanokuten@uclibc.org>
Date: Fri,  9 Nov 2007 01:45:09 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/binutils:  2.15
Message-ID: <20071109094509.99F6530041@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: vanokuten
Date: 2007-11-09 01:45:08 -0800 (Fri, 09 Nov 2007)
New Revision: 20391

Log:
update binutils nios2 support, thanks atle

Added:
   trunk/buildroot/toolchain/binutils/2.15/701-nios2-gcc4-buildfix.patch

Modified:
   trunk/buildroot/toolchain/binutils/Config.in


Changeset:
Added: trunk/buildroot/toolchain/binutils/2.15/701-nios2-gcc4-buildfix.patch
===================================================================
--- trunk/buildroot/toolchain/binutils/2.15/701-nios2-gcc4-buildfix.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/binutils/2.15/701-nios2-gcc4-buildfix.patch	2007-11-09 09:45:08 UTC (rev 20391)
@@ -0,0 +1,20 @@
+--- binutils/gas/config/tc-nios2.c	2007/01/04 16:54:43	194
++++ binutils/gas/config/tc-nios2.c	2007/01/04 16:58:16	195
+@@ -1661,7 +1661,7 @@
+ 
+ 
+ 	  /* apply the rightshift */
+-	  (signed) fixup >>= howto->rightshift;
++	  fixup >>= howto->rightshift;
+ 
+ 	  /* truncate the fixup to right size */
+ 	  switch (fixP->fx_r_type)
+@@ -1706,7 +1706,7 @@
+ nios2_check_overflow (valueT fixup, reloc_howto_type * howto)
+ {
+   /* apply the rightshift before checking for overflow */
+-  (signed) fixup >>= howto->rightshift;
++  fixup >>= howto->rightshift;
+ 
+   /* check for overflow - return TRUE if overflow, FALSE if not */
+   switch (howto->complain_on_overflow)

Modified: trunk/buildroot/toolchain/binutils/Config.in
===================================================================
--- trunk/buildroot/toolchain/binutils/Config.in	2007-11-09 09:30:08 UTC (rev 20390)
+++ trunk/buildroot/toolchain/binutils/Config.in	2007-11-09 09:45:08 UTC (rev 20391)
@@ -28,6 +28,7 @@
 
 config BR2_BINUTILS_VERSION
 	string
+	default "2.15"		if BR2_nios2
 	default "2.17"		if BR2_BINUTILS_VERSION_2_17
 	default "2.17.50.0.17"	if BR2_BINUTILS_VERSION_2_17_50_0_17
 	default "2.18"		if BR2_BINUTILS_VERSION_2_18
