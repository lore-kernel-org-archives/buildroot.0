From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Dec 2012 15:59:03 +0100
Subject: [Buildroot] [PATCH] gnupg: fix build failure on MIPS64
Message-ID: <1355669943-13925-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  http://autobuild.buildroot.org/results/49d5891dcecf2cce8de9f2bdb16a76ff86579f45/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gnupg/gnupg-mips64-build-fix.patch |   20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 package/gnupg/gnupg-mips64-build-fix.patch

diff --git a/package/gnupg/gnupg-mips64-build-fix.patch b/package/gnupg/gnupg-mips64-build-fix.patch
new file mode 100644
index 0000000..014435c
--- /dev/null
+++ b/package/gnupg/gnupg-mips64-build-fix.patch
@@ -0,0 +1,20 @@
+Fix build issue on MIPS64
+
+On MIPS64, there is a syntax problem in the preprocessor
+conditions. Fix that to avoid a build failure.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/mpi/longlong.h
+===================================================================
+--- a/mpi/longlong.h
++++ b/mpi/longlong.h
+@@ -752,7 +752,7 @@
+     (w1) = _r >> 64;                                                    \
+     (w0) = (UDItype) _r;                                                \
+   } while (0)
+-# elif if __GNUC__ > 2 || __GNUC_MINOR__ >= 7
++# elif __GNUC__ > 2 || __GNUC_MINOR__ >= 7
+ #  define umul_ppmm(w1, w0, u, v)                                       \
+      __asm__ ("dmultu %2,%3"                                            \
+               : "=l" ((UDItype)(w0)),                                   \
-- 
1.7.9.5
