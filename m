From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 30 Jan 2007 09:36:52 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/x86
Message-ID: <20070130173652.3824148562@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-30 09:36:51 -0800 (Tue, 30 Jan 2007)
New Revision: 17673

Log:
- make sure to check against ia32


Modified:
   trunk/buildroot/target/device/x86/Makefile.in


Changeset:
Modified: trunk/buildroot/target/device/x86/Makefile.in
===================================================================
--- trunk/buildroot/target/device/x86/Makefile.in	2007-01-30 17:33:53 UTC (rev 17672)
+++ trunk/buildroot/target/device/x86/Makefile.in	2007-01-30 17:36:51 UTC (rev 17673)
@@ -1,3 +1,5 @@
 ifeq ($(strip $(BR2_TARGET_GENERIC)),y)
+ifeq ($(strip $(BR2_i386)),y)
 include target/device/x86/i386/Makefile.in
 endif
+endif
