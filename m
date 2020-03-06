From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu,  5 Mar 2020 18:23:35 -0700
Subject: [Buildroot] [PATCH 1/2] package/gensio: bump to version 2.0.1
Message-ID: <20200306012336.63370-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch that is now upstream.

Removed GENSIO_AUTORECONF as we no longer patch configure.ac.

Fixes:
http://autobuild.buildroot.net/results/cce/ccebd933feddcea2253837b8a0bf1ef96356b4fb/

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...tests-Makefile-am-don-t-add-lpthread.patch | 29 -------------------
 package/gensio/gensio.hash                    |  6 ++--
 package/gensio/gensio.mk                      |  4 +--
 3 files changed, 4 insertions(+), 35 deletions(-)
 delete mode 100644 package/gensio/0001-tests-Makefile-am-don-t-add-lpthread.patch

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
index 623b41904c..be78696b5a 100644
--- a/package/gensio/gensio.hash
+++ b/package/gensio/gensio.hash
@@ -1,7 +1,7 @@
 # From https://sourceforge.net/projects/ser2net/files/ser2net/
-md5  53c027dfaaf374f57d5f36a6250fc018  gensio-1.5.1.tar.gz
-sha1  8329d7828016e643f60b8b3e70564d32cd03008f  gensio-1.5.1.tar.gz
+md5  6676c877275f3475b59f584204d94daa  gensio-2.0.1.tar.gz
+sha1  0624b6ea0c9b939454df1e0265b20fdacd5383b1  gensio-2.0.1.tar.gz
 # Locally computed:
-sha256  c1ed28f5bd72185dba666a900d29afbecba58727d6c0dde4a182143273fc1e6b  gensio-1.5.1.tar.gz
+sha256  92333a2f0baa3d77a6ff13a81ae165e871d70e8a583882c46363fe4b710c7348  gensio-2.0.1.tar.gz
 sha256  501f3108e6c03e5a0a5585ebaaa369171aead5319cd0a7a4dc1f66211c1f09f1  COPYING
 sha256  dcac7d447dd81ab96d28dce00a07a6486e623f7ded94e2a2a8e83312405cdf89  COPYING.LIB
diff --git a/package/gensio/gensio.mk b/package/gensio/gensio.mk
index 0386b30fd7..101f2c2574 100644
--- a/package/gensio/gensio.mk
+++ b/package/gensio/gensio.mk
@@ -4,13 +4,11 @@
 #
 ################################################################################
 
-GENSIO_VERSION = 1.5.1
+GENSIO_VERSION = 2.0.1
 GENSIO_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
 GENSIO_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
 GENSIO_LICENSE_FILES = COPYING.LIB COPYING
 GENSIO_INSTALL_STAGING = YES
-# We're patching configure.ac
-GENSIO_AUTORECONF = YES
 GENSIO_CONF_OPTS = \
 	--without-openipmi \
 	--without-swig \
-- 
2.20.1
