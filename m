From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 30 Jan 2009 10:35:55 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc/4.3.2
Message-ID: <20090130103556.08B22765E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-30 10:35:55 +0000 (Fri, 30 Jan 2009)
New Revision: 25161

Log:
toolchain/gcc/4.3.2: accept abi=aapcs-linux for EABI

From Bernhards' tree, thanks to Sven Neuman for noticing. See also
http://gcc.gnu.org/ml/gcc-patches/2008-09/msg01500.html

Added:
   trunk/buildroot/toolchain/gcc/4.3.2/999-4.3.2-armeabi-aapcs-linux.patch


Changeset:
Added: trunk/buildroot/toolchain/gcc/4.3.2/999-4.3.2-armeabi-aapcs-linux.patch
===================================================================
--- trunk/buildroot/toolchain/gcc/4.3.2/999-4.3.2-armeabi-aapcs-linux.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/gcc/4.3.2/999-4.3.2-armeabi-aapcs-linux.patch	2009-01-30 10:35:55 UTC (rev 25161)
@@ -0,0 +1,18 @@
+\\\\ followup of PR34205; trying to use aapcs-linux
+\\ gcc/ChangeLog
+\\
+\\ 2008-09-18  Bernhard Reutner-Fischer  <aldot@>
+\\
+\\ * config.gcc (arm*-*-*): Add aapcs-linux to supported ABIs.
+\\
+--- gcc-4.3.2.orig/gcc/config.gcc	2008-09-18 20:33:55.000000000 +0200
++++ gcc-4.3.2/gcc/config.gcc	2008-09-18 21:38:52.000000000 +0200
+@@ -2921,7 +2921,7 @@
+ 
+ 		case "$with_abi" in
+ 		"" \
+-		| apcs-gnu | atpcs | aapcs | iwmmxt )
++		| apcs-gnu | atpcs | aapcs | iwmmxt | aapcs-linux )
+ 			#OK
+ 			;;
+ 		*)
