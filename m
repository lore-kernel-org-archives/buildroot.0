From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 11 Nov 2011 18:12:46 -0300
Subject: [Buildroot] [PATCH 1/2] uClibc: fix sparc build breakage
Message-ID: <1321045967-6216-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix build breakage for sparc as reported in bug #4021
Patches from Konrad Eisele <konrad@gaisler.com>
Submitted in the uclibc mailing list.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../uClibc/uClibc-0.9.31.1-sparc-errno-fix.patch   |   11 +++++++++++
 .../uClibc/uClibc-0.9.32-sparc-errno-fix.patch     |   11 +++++++++++
 2 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 toolchain/uClibc/uClibc-0.9.31.1-sparc-errno-fix.patch
 create mode 100644 toolchain/uClibc/uClibc-0.9.32-sparc-errno-fix.patch

diff --git a/toolchain/uClibc/uClibc-0.9.31.1-sparc-errno-fix.patch b/toolchain/uClibc/uClibc-0.9.31.1-sparc-errno-fix.patch
new file mode 100644
index 0000000..44d06cb
--- /dev/null
+++ b/toolchain/uClibc/uClibc-0.9.31.1-sparc-errno-fix.patch
@@ -0,0 +1,11 @@
+--- uClibc-0.9.32.ori/libc/sysdeps/linux/sparc/pipe.S	2011-06-08 21:35:20.000000000 +0200
++++ uClibc-0.9.32/libc/sysdeps/linux/sparc/pipe.S	2011-11-11 15:57:25.000000000 +0100
+@@ -52,7 +52,7 @@
+ 	 restore %g0,%g0,%o0
+ 
+ .Lerror:
+-	call	HIDDEN_JUMPTARGET(__errno_location)
++	call	__errno_location
+ 	 or	%g0,EINVAL,%i0
+ 	st	%i0,[%o0]
+ 	ret
diff --git a/toolchain/uClibc/uClibc-0.9.32-sparc-errno-fix.patch b/toolchain/uClibc/uClibc-0.9.32-sparc-errno-fix.patch
new file mode 100644
index 0000000..44d06cb
--- /dev/null
+++ b/toolchain/uClibc/uClibc-0.9.32-sparc-errno-fix.patch
@@ -0,0 +1,11 @@
+--- uClibc-0.9.32.ori/libc/sysdeps/linux/sparc/pipe.S	2011-06-08 21:35:20.000000000 +0200
++++ uClibc-0.9.32/libc/sysdeps/linux/sparc/pipe.S	2011-11-11 15:57:25.000000000 +0100
+@@ -52,7 +52,7 @@
+ 	 restore %g0,%g0,%o0
+ 
+ .Lerror:
+-	call	HIDDEN_JUMPTARGET(__errno_location)
++	call	__errno_location
+ 	 or	%g0,EINVAL,%i0
+ 	st	%i0,[%o0]
+ 	ret
-- 
1.7.3.4
