From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Apr 2015 15:36:58 +0200
Subject: [Buildroot] [git commit] uclibc: drop -ng 1.0.0 stray patch
Message-ID: <20150418133713.79A5E80489@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6aff21da187445b2e99863713f810de6abdec0a0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-guard-tcb-offsets.h-include-with-RESET_P.patch |   31 --------------------
 1 files changed, 0 insertions(+), 31 deletions(-)

diff --git a/package/uclibc/1.0.0/0001-sparc-clone.S-guard-tcb-offsets.h-include-with-RESET_P.patch b/package/uclibc/1.0.0/0001-sparc-clone.S-guard-tcb-offsets.h-include-with-RESET_P.patch
deleted file mode 100644
index a98ee68..0000000
--- a/package/uclibc/1.0.0/0001-sparc-clone.S-guard-tcb-offsets.h-include-with-RESET_P.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 857420a3271dc5bbddbe45a9e9878b9dc88fd143 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Tue, 3 Mar 2015 14:56:17 -0300
-Subject: [PATCH] sparc/clone.S: guard tcb-offsets.h include with RESET_PID
-
-Status: upstream [uClibc]
-
-Otherwise we have a broken scenario with non-threading builds.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- libc/sysdeps/linux/sparc/clone.S | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/libc/sysdeps/linux/sparc/clone.S b/libc/sysdeps/linux/sparc/clone.S
-index 8d9da5a..1d0e3e6 100644
---- a/libc/sysdeps/linux/sparc/clone.S
-+++ b/libc/sysdeps/linux/sparc/clone.S
-@@ -22,7 +22,9 @@
- 
- #include <asm/errno.h>
- #include <asm/unistd.h>
-+#ifdef RESET_PID
- #include <tcb-offsets.h>
-+#endif
- #include <sysdep.h>
- 
- #define CLONE_VM	0x00000100
--- 
-2.0.5
-
