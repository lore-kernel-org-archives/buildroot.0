From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 22 Dec 2006 02:39:56 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device:  x86
Message-ID: <20061222103956.0613848580@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-22 02:39:56 -0800 (Fri, 22 Dec 2006)
New Revision: 17042

Log:
- move setting the TARGET_DEVICE_DEPMOD up one level


Modified:
   trunk/buildroot/target/device/Makefile.in
   trunk/buildroot/target/device/x86/Makefile.in


Changeset:
Modified: trunk/buildroot/target/device/Makefile.in
===================================================================
--- trunk/buildroot/target/device/Makefile.in	2006-12-22 10:37:22 UTC (rev 17041)
+++ trunk/buildroot/target/device/Makefile.in	2006-12-22 10:39:56 UTC (rev 17042)
@@ -1 +1,3 @@
+TARGET_DEVICE_DEPMOD:=target/device/x86/depmod.pl
+
 -include target/device/*/Makefile.in

Modified: trunk/buildroot/target/device/x86/Makefile.in
===================================================================
--- trunk/buildroot/target/device/x86/Makefile.in	2006-12-22 10:37:22 UTC (rev 17041)
+++ trunk/buildroot/target/device/x86/Makefile.in	2006-12-22 10:39:56 UTC (rev 17042)
@@ -1,5 +1,3 @@
-TARGET_DEVICE_DEPMOD:=target/device/x86/depmod.pl
-
 ifeq ($(strip $(BR2_TARGET_X86_GENERIC)),y)
 include target/device/x86/i386/Makefile.in
 include target/device/x86/i386/*.mk
