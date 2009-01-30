From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 30 Jan 2009 11:35:04 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target
Message-ID: <20090130113504.70551765E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-30 11:35:04 +0000 (Fri, 30 Jan 2009)
New Revision: 25164

Log:
target/Config.in.arch: fix ARM abi setting

Reported by Sven Neumann and based on 7f7aac5d3 in Bernhard's tree.

Modified:
   trunk/buildroot/target/Config.in.arch


Changeset:
Modified: trunk/buildroot/target/Config.in.arch
===================================================================
--- trunk/buildroot/target/Config.in.arch	2009-01-30 11:30:21 UTC (rev 25163)
+++ trunk/buildroot/target/Config.in.arch	2009-01-30 11:35:04 UTC (rev 25164)
@@ -670,11 +670,10 @@
 
 config BR2_GCC_TARGET_ABI
 	string
-	default apcs-gnu	if BR2_arm_dunno
+	default apcs-gnu	if BR2_ARM_OABI
 	default atpcs		if BR2_arm_dunno
 	default aapcs		if BR2_arm_dunno
-	default aapcs-linux	if BR2_arm_dunno
-	default iwmmxt		if BR2_iwmmxt
+	default aapcs-linux	if BR2_ARM_EABI
 	default 32		if BR2_MIPS_OABI32
 	default n32		if BR2_MIPS_ABI32
 	default eabi		if BR2_MIPS_EABI
