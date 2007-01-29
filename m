From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 29 Jan 2007 15:01:43 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target:  device/x86
Message-ID: <20070129230143.187EC48569@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-29 15:01:42 -0800 (Mon, 29 Jan 2007)
New Revision: 17657

Log:
- fixup after self. Kernel for the x86 family is now built again


Modified:
   trunk/buildroot/target/Makefile.in
   trunk/buildroot/target/device/x86/Makefile.in


Changeset:
Modified: trunk/buildroot/target/Makefile.in
===================================================================
--- trunk/buildroot/target/Makefile.in	2007-01-29 22:51:58 UTC (rev 17656)
+++ trunk/buildroot/target/Makefile.in	2007-01-29 23:01:42 UTC (rev 17657)
@@ -6,3 +6,5 @@
 include target/powerpc/Makefile.in
 # and finally build the filesystems/tarballs
 include target/*/*.mk
+# kernel rules
+include target/linux*.mk

Modified: trunk/buildroot/target/device/x86/Makefile.in
===================================================================
--- trunk/buildroot/target/device/x86/Makefile.in	2007-01-29 22:51:58 UTC (rev 17656)
+++ trunk/buildroot/target/device/x86/Makefile.in	2007-01-29 23:01:42 UTC (rev 17657)
@@ -1,4 +1,3 @@
 ifeq ($(strip $(BR2_TARGET_X86_GENERIC)),y)
 include target/device/x86/i386/Makefile.in
-include target/device/x86/i386/*.mk
 endif
