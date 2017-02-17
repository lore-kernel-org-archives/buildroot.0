From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 17 Feb 2017 22:48:49 +0100
Subject: [Buildroot] [PATCH] uclibc: define struct ucontext for or1k
Message-ID: <20170217214849.GA29072@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add missing define for struct ucontext for OpenRISC.

Fixes:
  http://autobuild.buildroot.net/results/d8715a2b3783d877edf91bb14a80d36eac749b36

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 ...3-or1k-add-missing-definition-of-ucontext.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/uclibc/0003-or1k-add-missing-definition-of-ucontext.patch

diff --git a/package/uclibc/0003-or1k-add-missing-definition-of-ucontext.patch b/package/uclibc/0003-or1k-add-missing-definition-of-ucontext.patch
new file mode 100644
index 0000000..7c60228
--- /dev/null
+++ b/package/uclibc/0003-or1k-add-missing-definition-of-ucontext.patch
@@ -0,0 +1,33 @@
+From 228d03bf0032e5799e9bf04810170c0653ca846d Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Fri, 17 Feb 2017 22:33:49 +0100
+Subject: [PATCH] or1k: add missing definition of ucontext
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+---
+ libc/sysdeps/linux/or1k/sys/ucontext.h | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/libc/sysdeps/linux/or1k/sys/ucontext.h b/libc/sysdeps/linux/or1k/sys/ucontext.h
+index b11928e..dd97b60 100644
+--- a/libc/sysdeps/linux/or1k/sys/ucontext.h
++++ b/libc/sysdeps/linux/or1k/sys/ucontext.h
+@@ -20,6 +20,14 @@
+ 
+ #include <features.h>
+ #include <signal.h>
+-#include <asm/ucontext.h>
++#include <bits/sigcontext.h>
++
++typedef struct ucontext {
++	unsigned long	  uc_flags;
++	struct ucontext  *uc_link;
++	stack_t		  uc_stack;
++	struct sigcontext uc_mcontext;
++	sigset_t	  uc_sigmask;	/* mask last for extensibility */
++} ucontext_t;
+ 
+ #endif /* sys/ucontext.h */
+-- 
+2.1.4
+
-- 
2.1.4
