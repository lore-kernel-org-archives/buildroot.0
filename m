From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 20 Sep 2020 09:37:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/tor: bump version to 0.4.4.5
Message-ID: <20200920073702.704430-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes: https://blog.torproject.org/node/1921

Rebased patch.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../tor/0001-Fix-static-linking-with-OpenSSL.patch   | 12 ++++++------
 package/tor/tor.hash                                 |  2 +-
 package/tor/tor.mk                                   |  2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/tor/0001-Fix-static-linking-with-OpenSSL.patch b/package/tor/0001-Fix-static-linking-with-OpenSSL.patch
index 942f913465..128b6ed0ce 100644
--- a/package/tor/0001-Fix-static-linking-with-OpenSSL.patch
+++ b/package/tor/0001-Fix-static-linking-with-OpenSSL.patch
@@ -8,8 +8,8 @@ and remove host paths when looking for openssl.
 
 [Vincent:
  - Adapt the patch to make it apply on the new version.]
-[Bernd: rebased for tor-0.2.7.6, 0.2.8.10, 0.2.9.9, 0.3.1.7, 0.3.2.10 &
-        0.3.4.8, 0.3.5.7]
+[Bernd: rebased for tor-0.2.7.6, 0.2.8.10, 0.2.9.9, 0.3.1.7, 0.3.2.10,
+        0.3.4.8, 0.3.5.7 & 0.4.4.5]
 [Fabrice: fix detection of openssl functions in 0.3.5.8]
 Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
@@ -38,7 +38,7 @@ diff --git a/configure.ac b/configure.ac
 index 05e1392cf..580befa6b 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -966,7 +966,7 @@ AC_ARG_WITH(ssl-dir,
+@@ -973,7 +973,7 @@ AC_ARG_WITH(ssl-dir,
    ])
  
  AC_MSG_NOTICE([Now, we'll look for OpenSSL >= 1.0.1])
@@ -47,7 +47,7 @@ index 05e1392cf..580befa6b 100644
      [#include <openssl/ssl.h>
       char *getenv(const char *);],
      [struct ssl_cipher_st;
-@@ -998,7 +998,7 @@ dnl Now check for particular openssl functions.
+@@ -1005,7 +1005,7 @@ dnl Now check for particular openssl functions.
  save_LIBS="$LIBS"
  save_LDFLAGS="$LDFLAGS"
  save_CPPFLAGS="$CPPFLAGS"
@@ -60,7 +60,7 @@ diff --git a/src/test/include.am b/src/test/include.am
 index ecb768957..39a622e88 100644
 --- a/src/test/include.am
 +++ b/src/test/include.am
-@@ -378,8 +378,8 @@ src_test_test_ntor_cl_LDFLAGS = @TOR_LDFLAGS_zlib@ $(TOR_LDFLAGS_CRYPTLIB)
+@@ -400,8 +400,8 @@ src_test_test_ntor_cl_LDFLAGS = @TOR_LDFLAGS_zlib@ $(TOR_LDFLAGS_CRYPTLIB)
  src_test_test_ntor_cl_LDADD = \
  	$(TOR_INTERNAL_LIBS) \
  	$(rust_ldadd) \
@@ -71,7 +71,7 @@ index ecb768957..39a622e88 100644
  	@CURVE25519_LIBS@ @TOR_LZMA_LIBS@
  src_test_test_ntor_cl_AM_CPPFLAGS =	       \
  	$(AM_CPPFLAGS)
-@@ -388,8 +388,8 @@ src_test_test_hs_ntor_cl_SOURCES  = src/test/test_hs_ntor_cl.c
+@@ -410,8 +410,8 @@ src_test_test_hs_ntor_cl_SOURCES  = src/test/test_hs_ntor_cl.c
  src_test_test_hs_ntor_cl_LDFLAGS = @TOR_LDFLAGS_zlib@ $(TOR_LDFLAGS_CRYPTLIB)
  src_test_test_hs_ntor_cl_LDADD = \
  	$(TOR_INTERNAL_LIBS) \
diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index 47c2dd49b4..ddf1a880ff 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6a2d0637d4e514be2ec574723a05065245cce51da78a21cec1dc831be5ccac62  tor-0.4.3.6.tar.gz
+sha256  a45ca00afe765e3baa839767c9dd6ac9a46dd01720a3a8ff4d86558c12359926  tor-0.4.4.5.tar.gz
 sha256  ae2afe6cd3fd9d512afbaa1ef218757eb00aa6b6aa5e2dfc2774b6837e373fa1  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 050114ccac..fe9b52670b 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.3.6
+TOR_VERSION = 0.4.4.5
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
-- 
2.27.0
