From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Dec 2013 16:51:58 +0100
Subject: [Buildroot] [git commit] gnupg: bump version
Message-ID: <20131219155355.928019C0F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f7f241b5eace3c2f558626b0c9c0a7e8a1aad24b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And drop patch now upstream.

Security fix (CVE-2013-4576), see:

http://lists.gnupg.org/pipermail/gnupg-devel/2013-December/028102.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnupg/gnupg-mips64-build-fix.patch |   20 --------------------
 package/gnupg/gnupg.mk                     |    2 +-
 2 files changed, 1 insertions(+), 21 deletions(-)

diff --git a/package/gnupg/gnupg-mips64-build-fix.patch b/package/gnupg/gnupg-mips64-build-fix.patch
deleted file mode 100644
index 014435c..0000000
--- a/package/gnupg/gnupg-mips64-build-fix.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Fix build issue on MIPS64
-
-On MIPS64, there is a syntax problem in the preprocessor
-conditions. Fix that to avoid a build failure.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/mpi/longlong.h
-===================================================================
---- a/mpi/longlong.h
-+++ b/mpi/longlong.h
-@@ -752,7 +752,7 @@
-     (w1) = _r >> 64;                                                    \
-     (w0) = (UDItype) _r;                                                \
-   } while (0)
--# elif if __GNUC__ > 2 || __GNUC_MINOR__ >= 7
-+# elif __GNUC__ > 2 || __GNUC_MINOR__ >= 7
- #  define umul_ppmm(w1, w0, u, v)                                       \
-      __asm__ ("dmultu %2,%3"                                            \
-               : "=l" ((UDItype)(w0)),                                   \
diff --git a/package/gnupg/gnupg.mk b/package/gnupg/gnupg.mk
index 28f1f43..39a37d0 100644
--- a/package/gnupg/gnupg.mk
+++ b/package/gnupg/gnupg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG_VERSION = 1.4.15
+GNUPG_VERSION = 1.4.16
 GNUPG_SOURCE = gnupg-$(GNUPG_VERSION).tar.bz2
 GNUPG_SITE = ftp://ftp.gnupg.org/gcrypt/gnupg
 GNUPG_LICENSE = GPLv3+
