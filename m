From: nkukard at uclibc.org <nkukard@uclibc.org>
Date: Thu,  1 Jan 2009 17:48:07 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target
Message-ID: <20090101174807.82A0376C21@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: nkukard
Date: 2009-01-01 17:48:06 +0000 (Thu, 01 Jan 2009)
New Revision: 24636

Log:
* Added "generic" option to x86_64 target
- Default to generic and not core2


Modified:
   trunk/buildroot/target/Config.in.arch


Changeset:
Modified: trunk/buildroot/target/Config.in.arch
===================================================================
--- trunk/buildroot/target/Config.in.arch	2009-01-01 17:28:51 UTC (rev 24635)
+++ trunk/buildroot/target/Config.in.arch	2009-01-01 17:48:06 UTC (rev 24636)
@@ -269,10 +269,12 @@
 choice
 	prompt "Target Architecture Variant"
 	depends on BR2_x86_64
-	default BR2_x86_64_core2
+	default BR2_x86_64_generic
 	help
 	  Specific CPU variant to use
 
+config BR2_x86_64_generic
+	bool "generic"
 config BR2_x86_64_barcelona
 	bool "barcelona"
 config BR2_x86_64_opteron_sse3
@@ -507,6 +509,7 @@
 	default "sparc"		if BR2_sparc
 	default "sparc64"	if BR2_sparc64
 	default "x86_64"	if BR2_x86_64
+	default "x86_64"	if BR2_x86_64_generic
 	default "x86_64"	if BR2_x86_64_nocona
 	default "x86_64"	if BR2_x86_64_core2
 	default "x86_64"	if BR2_x86_64_opteron
@@ -549,6 +552,7 @@
 	default winchip2	if BR2_x86_winchip2
 	default c3		if BR2_x86_c3
 	default geode		if BR2_x86_geode
+	default generic		if BR2_x86_64_generic
 	default nocona		if BR2_x86_64_nocona
 	default core2		if BR2_x86_64_core2
 	default k8		if BR2_x86_64_opteron
