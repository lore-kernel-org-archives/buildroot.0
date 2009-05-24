From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 May 2009 21:21:21 +0200
Subject: [Buildroot] [git commit] strace: fix build for arm eabi
Message-ID: <20090524193000.2B1B877862@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ff01f2d29bc2fb37fca565b945fd3c4d57ec2c27
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Based on patch from gentoo bug 241168: http://bugs.gentoo.org/241168

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/strace/strace-arm-eabi-fix.patch |   27 +++++++++++++++++++++++++++
 1 files changed, 27 insertions(+), 0 deletions(-)
 create mode 100644 package/strace/strace-arm-eabi-fix.patch

diff --git a/package/strace/strace-arm-eabi-fix.patch b/package/strace/strace-arm-eabi-fix.patch
new file mode 100644
index 0000000..30e9d71
--- /dev/null
+++ b/package/strace/strace-arm-eabi-fix.patch
@@ -0,0 +1,27 @@
+From f5da8d0c38ea0eb660cb17de7aa62cda6899eb75 Mon Sep 17 00:00:00 2001
+From: ldv <ldv>
+Date: Thu, 1 Jan 2009 23:20:38 +0000
+Subject: [PATCH] 2008-11-13  Kirill A. Shutemov  <kirill@shutemov.name>
+
+	* linux/arm/syscallent.h: Fix build on ARM EABI which does not
+	provide syscalls socketcall and ipc.
+
+diff --git a/linux/arm/syscallent.h b/linux/arm/syscallent.h
+index 5ccef2f..edc3641 100644
+--- a/linux/arm/syscallent.h
++++ b/linux/arm/syscallent.h
+@@ -431,6 +431,7 @@
+ 	{ 5,	0,	printargs,		"SYS_398"	}, /* 398 */
+ 	{ 5,	0,	printargs,		"SYS_399"	}, /* 399 */
+ 
++#ifndef __ARM_EABI__
+ #if SYS_socket_subcall != 400
+  #error fix me
+ #endif
+@@ -481,3 +482,4 @@
+ 	{ 4,	TI,	sys_shmdt,		"shmdt"		}, /* 440 */
+ 	{ 4,	TI,	sys_shmget,		"shmget"	}, /* 441 */
+ 	{ 4,	TI,	sys_shmctl,		"shmctl"	}, /* 442 */
++#endif
+-- 
+1.6.1.3
-- 
1.6.0.6
