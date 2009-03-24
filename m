From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 24 Mar 2009 19:57:48 +0000 (UTC)
Subject: [Buildroot] svn commit: [25812] trunk/buildroot/target/device/x86
Message-ID: <20090324195749.1086177196@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-24 19:57:48 +0000 (Tue, 24 Mar 2009)
New Revision: 25812

Log:
target/device/x86: only include Makefile if BR2_TARGET_X86 is enabled

Fixes build breakage for !BR2_TARGET_X86 in kernel headers.

Modified:
   trunk/buildroot/target/device/x86/Makefile.in


Changeset:
Modified: trunk/buildroot/target/device/x86/Makefile.in
===================================================================
--- trunk/buildroot/target/device/x86/Makefile.in	2009-03-24 16:58:49 UTC (rev 25811)
+++ trunk/buildroot/target/device/x86/Makefile.in	2009-03-24 19:57:48 UTC (rev 25812)
@@ -1,4 +1,4 @@
-ifeq ($(BR2_i386),y)
+ifeq ($(BR2_TARGET_X86),y)
 include target/device/x86/*/Makefile.in
 endif
 
