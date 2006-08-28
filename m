From: lethal at uclibc.org <lethal@uclibc.org>
Date: Sun, 27 Aug 2006 23:52:44 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20060828065244.0DA4C48695@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: lethal
Date: 2006-08-27 23:52:43 -0700 (Sun, 27 Aug 2006)
New Revision: 15997

Log:
Add an sh64 target to buildroot.



Modified:
   trunk/buildroot/Config.in


Changeset:
Modified: trunk/buildroot/Config.in
===================================================================
--- trunk/buildroot/Config.in	2006-08-25 04:59:43 UTC (rev 15996)
+++ trunk/buildroot/Config.in	2006-08-28 06:52:43 UTC (rev 15997)
@@ -33,7 +33,9 @@
 config BR2_powerpc
 	bool "powerpc"
 config BR2_sh
-	bool "sh"
+	bool "superh"
+config BR2_sh64
+	bool "superh64"
 config BR2_sparc
 	bool "sparc"
 config BR2_x86_64
@@ -155,13 +157,15 @@
 	default "sh3eb"		if BR2_sh3eb
 	default "sh4"		if BR2_sh4
 	default "sh4eb"		if BR2_sh4eb
+	default "sh64"		if BR2_sh64
 	default "sparc"		if BR2_sparc
 	default "x86_64"	if BR2_x86_64
 
 config BR2_ENDIAN
 	string
 	default "LITTLE" if BR2_arm || BR2_cris || BR2_i386 || BR2_mipsel || \
-	                    BR2_sh3 || BR2_sh4 || BR2_x86_64 || BR2_nios2
+	                    BR2_sh3 || BR2_sh4 || BR2_x86_64 || BR2_nios2 || \
+			    BR2_sh64
 	default "BIG"    if BR2_alpha || BR2_armeb || BR2_m68k || BR2_mips || \
 	                    BR2_powerpc || BR2_sh2a_nofpueb || BR2_sh2eb || \
 	                    BR2_sh3eb || BR2_sh4eb || BR2_sparc
