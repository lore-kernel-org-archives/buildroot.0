From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 19 Feb 2020 20:17:28 +0100
Subject: [Buildroot] [git commit branch/next] package/gensio: bump to
 version 1.5.2
Message-ID: <20200219190546.751BB8E4FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=df92c971429ff9c91e7fe24b12cf0c7edbd85645
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...0001-tests-Makefile-am-don-t-add-lpthread.patch | 29 ----------------------
 package/gensio/gensio.hash                         |  6 ++---
 package/gensio/gensio.mk                           |  2 +-
 3 files changed, 4 insertions(+), 33 deletions(-)

diff --git a/package/gensio/0001-tests-Makefile-am-don-t-add-lpthread.patch b/package/gensio/0001-tests-Makefile-am-don-t-add-lpthread.patch
deleted file mode 100644
index 5a9f3b7da5..0000000000
--- a/package/gensio/0001-tests-Makefile-am-don-t-add-lpthread.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From f63b15e690581d898da56ef2540b6199f5728e58 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 11 Feb 2020 19:14:53 +0100
-Subject: [PATCH] tests/Makefile.am: don't add -lpthread
-
-Don't add -lpthread unconditionally to oomtest_LDADD to avoid a build
-failure without threads, it will be added to LIBS by configure.ac if
-needed
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/cminyard/gensio/commit/f63b15e690581d898da56ef2540b6199f5728e58]
----
- tests/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tests/Makefile.am b/tests/Makefile.am
-index a280acc..b4335c5 100644
---- a/tests/Makefile.am
-+++ b/tests/Makefile.am
-@@ -127,7 +127,7 @@ test_fuzz: test_fuzz_certauth test_fuzz_mux test_fuzz_ssl test_fuzz_telnet \
- 
- oomtest_SOURCES = oomtest.c
- 
--oomtest_LDADD = $(top_builddir)/lib/libgensio.la $(OPENSSL_LIBS) -lpthread
-+oomtest_LDADD = $(top_builddir)/lib/libgensio.la $(OPENSSL_LIBS)
- 
- noinst_PROGRAMS = oomtest
- 
diff --git a/package/gensio/gensio.hash b/package/gensio/gensio.hash
index 623b41904c..b63e459f16 100644
--- a/package/gensio/gensio.hash
+++ b/package/gensio/gensio.hash
@@ -1,7 +1,7 @@
 # From https://sourceforge.net/projects/ser2net/files/ser2net/
-md5  53c027dfaaf374f57d5f36a6250fc018  gensio-1.5.1.tar.gz
-sha1  8329d7828016e643f60b8b3e70564d32cd03008f  gensio-1.5.1.tar.gz
+md5  eecceb741c34708deb8b29b7b84d5bd0  gensio-1.5.2.tar.gz
+sha1  4209ba80ecd1ead930ee8d9e60f384afd20481bd  gensio-1.5.2.tar.gz
 # Locally computed:
-sha256  c1ed28f5bd72185dba666a900d29afbecba58727d6c0dde4a182143273fc1e6b  gensio-1.5.1.tar.gz
+sha256  9213b05bcab615fe5b9c5d71bb5fe765500271941980ba606904ffc5d0cd30fa  gensio-1.5.2.tar.gz
 sha256  501f3108e6c03e5a0a5585ebaaa369171aead5319cd0a7a4dc1f66211c1f09f1  COPYING
 sha256  dcac7d447dd81ab96d28dce00a07a6486e623f7ded94e2a2a8e83312405cdf89  COPYING.LIB
diff --git a/package/gensio/gensio.mk b/package/gensio/gensio.mk
index 0386b30fd7..5272c3c0d7 100644
--- a/package/gensio/gensio.mk
+++ b/package/gensio/gensio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GENSIO_VERSION = 1.5.1
+GENSIO_VERSION = 1.5.2
 GENSIO_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
 GENSIO_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
 GENSIO_LICENSE_FILES = COPYING.LIB COPYING
