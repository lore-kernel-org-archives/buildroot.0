From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 16 Dec 2012 16:52:00 +0100
Subject: [Buildroot] [git commit] gnupg: fix build failure on MIPS64
Message-ID: <20121216200125.2A8AF9A29B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=835c29a965f62e9da16e3535c0155b2b0219c191
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/49d5891dcecf2cce8de9f2bdb16a76ff86579f45/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gnupg/gnupg-mips64-build-fix.patch |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)

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
