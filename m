From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 11 Mar 2008 01:49:47 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target
Message-ID: <20080311084947.4030012011A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-03-11 01:49:45 -0700 (Tue, 11 Mar 2008)
New Revision: 21287

Log:
buildroot: fix missing ARCH for some x86 variants

Patch by Nigel Kukard.


Modified:
   trunk/buildroot/target/Config.in.arch


Changeset:
Modified: trunk/buildroot/target/Config.in.arch
===================================================================
--- trunk/buildroot/target/Config.in.arch	2008-03-11 08:17:17 UTC (rev 21286)
+++ trunk/buildroot/target/Config.in.arch	2008-03-11 08:49:45 UTC (rev 21287)
@@ -476,8 +476,13 @@
 	default "i386"		if BR2_x86_i386
 	default "i486"		if BR2_x86_i486
 	default "i586"		if BR2_x86_i586
+	default "i586"		if BR2_x86_pentium_mmx
 	default "i686"		if BR2_x86_i686
+	default "i686"		if BR2_x86_pentium2
+	default "i686"		if BR2_x86_pentium3
 	default "i686"		if BR2_x86_pentium4
+	default "i686"		if BR2_x86_pentium_m
+	default "i686"		if BR2_x86_pentiumpro
 	default "i686"		if BR2_x86_nocona
 	default "i686"		if BR2_x86_core2
 	default "ia64"		if BR2_ia64
