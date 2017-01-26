From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 26 Jan 2017 20:02:01 +0100
Subject: [Buildroot] [PATCH 1/1] package/tor: bump version to 0.2.9.9
Message-ID: <20170126190201.2153-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tor/0001-openssl-libz.patch | 70 ++++++++++++++++++-------------------
 package/tor/tor.hash                |  2 +-
 package/tor/tor.mk                  |  2 +-
 3 files changed, 37 insertions(+), 37 deletions(-)

diff --git a/package/tor/0001-openssl-libz.patch b/package/tor/0001-openssl-libz.patch
index c454b8a050..93fb942a40 100644
--- a/package/tor/0001-openssl-libz.patch
+++ b/package/tor/0001-openssl-libz.patch
@@ -3,7 +3,7 @@ and remove host paths when looking for openssl.
 
 [Vincent:
  - Adapt the patch to make it apply on the new version.]
-[Bernd: rebased for tor-0.2.7.6 & 0.2.8.10]
+[Bernd: rebased for tor-0.2.7.6, 0.2.8.10 & 0.2.9.9]
 
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
@@ -11,7 +11,7 @@ Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 diff -uNr tor-0.2.7.6.org/configure.ac tor-0.2.7.6/configure.ac
 --- tor-0.2.7.6.org/configure.ac	2015-12-10 16:15:25.000000000 +0100
 +++ tor-0.2.7.6/configure.ac	2016-01-31 20:21:34.850408145 +0100
-@@ -607,11 +607,11 @@
+@@ -612,11 +612,11 @@
        fi
    ])
  
@@ -28,9 +28,9 @@ diff -uNr tor-0.2.7.6.org/configure.ac tor-0.2.7.6/configure.ac
 diff -uNr tor-0.2.7.6.org/src/or/include.am tor-0.2.7.6/src/or/include.am
 --- tor-0.2.7.6.org/src/or/include.am	2015-12-08 18:35:17.000000000 +0100
 +++ tor-0.2.7.6/src/or/include.am	2016-01-31 20:22:09.322777527 +0100
-@@ -110,7 +110,7 @@
- src_or_tor_LDADD = src/or/libtor.a src/common/libor.a \
- 	src/common/libor-crypto.a $(LIBDONNA) \
+@@ -108,7 +108,7 @@
+ src_or_tor_LDADD = src/or/libtor.a src/common/libor.a src/common/libor-ctime.a \
+ 	src/common/libor-crypto.a $(LIBKECCAK_TINY) $(LIBDONNA) \
  	src/common/libor-event.a src/trunnel/libor-trunnel.a \
 -	@TOR_ZLIB_LIBS@ @TOR_LIB_MATH@ @TOR_LIBEVENT_LIBS@ @TOR_OPENSSL_LIBS@ \
 +	@TOR_LIB_MATH@ @TOR_LIBEVENT_LIBS@ @TOR_OPENSSL_LIBS@ @TOR_ZLIB_LIBS@ \
@@ -40,8 +40,8 @@ diff -uNr tor-0.2.7.6.org/src/or/include.am tor-0.2.7.6/src/or/include.am
 diff -uNr tor-0.2.7.6.org/src/test/include.am tor-0.2.7.6/src/test/include.am
 --- tor-0.2.7.6.org/src/test/include.am	2015-12-08 18:35:17.000000000 +0100
 +++ tor-0.2.7.6/src/test/include.am	2016-01-31 20:25:59.673127854 +0100
-@@ -127,8 +127,8 @@
- 	src/common/libor-testing.a \
+@@ -177,8 +177,8 @@
+ 	src/common/libor-ctime-testing.a \
  	src/common/libor-event-testing.a \
  	src/trunnel/libor-trunnel-testing.a \
 -	@TOR_ZLIB_LIBS@ @TOR_LIB_MATH@ @TOR_LIBEVENT_LIBS@ \
@@ -51,9 +51,9 @@ diff -uNr tor-0.2.7.6.org/src/test/include.am tor-0.2.7.6/src/test/include.am
  	@TOR_SYSTEMD_LIBS@
  
  src_test_test_slow_CPPFLAGS = $(src_test_test_CPPFLAGS)
-@@ -146,8 +146,8 @@
- src_test_bench_LDADD = src/or/libtor.a src/common/libor.a \
- 	src/common/libor-crypto.a $(LIBDONNA) \
+@@ -200,8 +200,8 @@
+ 	src/common/libor-ctime.a \
+ 	src/common/libor-crypto.a $(LIBKECCAK_TINY) $(LIBDONNA) \
  	src/common/libor-event.a src/trunnel/libor-trunnel.a \
 -	@TOR_ZLIB_LIBS@ @TOR_LIB_MATH@ @TOR_LIBEVENT_LIBS@ \
 -	@TOR_OPENSSL_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_GDI@ @CURVE25519_LIBS@ \
@@ -62,20 +62,20 @@ diff -uNr tor-0.2.7.6.org/src/test/include.am tor-0.2.7.6/src/test/include.am
  	@TOR_SYSTEMD_LIBS@
  
  src_test_test_workqueue_LDFLAGS = @TOR_LDFLAGS_zlib@ @TOR_LDFLAGS_openssl@ \
-@@ -156,8 +156,8 @@
- 	src/common/libor-testing.a \
- 	src/common/libor-crypto-testing.a $(LIBDONNA) \
+@@ -211,8 +211,8 @@
+ 	src/common/libor-ctime-testing.a \
+ 	src/common/libor-crypto-testing.a $(LIBKECCAK_TINY) $(LIBDONNA) \
  	src/common/libor-event-testing.a \
 -	@TOR_ZLIB_LIBS@ @TOR_LIB_MATH@ @TOR_LIBEVENT_LIBS@ \
 -	@TOR_OPENSSL_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_GDI@ @CURVE25519_LIBS@
 +	@TOR_LIB_MATH@ @TOR_LIBEVENT_LIBS@ \
 +	@TOR_OPENSSL_LIBS@ @TOR_ZLIB_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_GDI@ @CURVE25519_LIBS@
  
- noinst_HEADERS+= \
- 	src/test/fakechans.h \
-@@ -174,8 +174,8 @@
- src_test_test_ntor_cl_LDFLAGS = @TOR_LDFLAGS_zlib@ @TOR_LDFLAGS_openssl@
+ src_test_test_timers_CPPFLAGS = $(src_test_test_CPPFLAGS)
+ src_test_test_timers_CFLAGS = $(src_test_test_CFLAGS)
+@@ -245,8 +245,8 @@
  src_test_test_ntor_cl_LDADD = src/or/libtor.a src/common/libor.a \
+ 	src/common/libor-ctime.a \
  	src/common/libor-crypto.a $(LIBKECCAK_TINY) $(LIBDONNA) \
 -	@TOR_ZLIB_LIBS@ @TOR_LIB_MATH@ \
 -	@TOR_OPENSSL_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_GDI@ @CURVE25519_LIBS@
@@ -87,30 +87,30 @@ diff -uNr tor-0.2.7.6.org/src/test/include.am tor-0.2.7.6/src/test/include.am
 diff -uNr tor-0.2.7.6.org/src/tools/include.am tor-0.2.7.6/src/tools/include.am
 --- tor-0.2.7.6.org/src/tools/include.am	2015-11-13 14:33:26.000000000 +0100
 +++ tor-0.2.7.6/src/tools/include.am	2016-01-31 20:27:29.954004495 +0100
-@@ -21,7 +21,7 @@
- src_tools_tor_gencert_LDFLAGS = @TOR_LDFLAGS_zlib@ @TOR_LDFLAGS_openssl@
- src_tools_tor_gencert_LDADD = src/common/libor.a src/common/libor-crypto.a \
+@@ -26,7 +26,7 @@
+     src/common/libor-ctime.a \
+     $(LIBKECCAK_TINY) \
      $(LIBDONNA) \
--        @TOR_LIB_MATH@ @TOR_ZLIB_LIBS@ @TOR_OPENSSL_LIBS@ \
-+        @TOR_LIB_MATH@ @TOR_OPENSSL_LIBS@ @TOR_ZLIB_LIBS@ \
-         @TOR_LIB_WS32@ @TOR_LIB_GDI@ @CURVE25519_LIBS@
+-    @TOR_LIB_MATH@ @TOR_ZLIB_LIBS@ @TOR_OPENSSL_LIBS@ \
++    @TOR_LIB_MATH@ @TOR_OPENSSL_LIBS@ @TOR_ZLIB_LIBS@ \
+     @TOR_LIB_WS32@ @TOR_LIB_GDI@ @CURVE25519_LIBS@
  
  if COVERAGE_ENABLED
-@@ -32,7 +32,7 @@
- src_tools_tor_cov_gencert_LDADD = src/common/libor-testing.a \
-     src/common/libor-crypto-testing.a \
+@@ -39,7 +39,7 @@
+     src/common/libor-ctime-testing.a \
+     $(LIBKECCAK_TINY) \
      $(LIBDONNA) \
--        @TOR_LIB_MATH@ @TOR_ZLIB_LIBS@ @TOR_OPENSSL_LIBS@ \
-+        @TOR_LIB_MATH@ @TOR_OPENSSL_LIBS@ @TOR_ZLIB_LIBS@ \
-         @TOR_LIB_WS32@ @TOR_LIB_GDI@ @CURVE25519_LIBS@
+-    @TOR_LIB_MATH@ @TOR_ZLIB_LIBS@ @TOR_OPENSSL_LIBS@ \
++    @TOR_LIB_MATH@ @TOR_OPENSSL_LIBS@ @TOR_ZLIB_LIBS@ \
+     @TOR_LIB_WS32@ @TOR_LIB_GDI@ @CURVE25519_LIBS@
  endif
  
-@@ -40,7 +40,7 @@
- src_tools_tor_checkkey_LDFLAGS = @TOR_LDFLAGS_zlib@ @TOR_LDFLAGS_openssl@
- src_tools_tor_checkkey_LDADD = src/common/libor.a src/common/libor-crypto.a \
+@@ -50,7 +50,7 @@
+     src/common/libor-crypto.a \
+     $(LIBKECCAK_TINY) \
      $(LIBDONNA) \
--        @TOR_LIB_MATH@ @TOR_ZLIB_LIBS@ @TOR_OPENSSL_LIBS@ \
-+        @TOR_LIB_MATH@ @TOR_OPENSSL_LIBS@ @TOR_ZLIB_LIBS@ \
-         @TOR_LIB_WS32@ @TOR_LIB_GDI@ @CURVE25519_LIBS@
+-    @TOR_LIB_MATH@ @TOR_ZLIB_LIBS@ @TOR_OPENSSL_LIBS@ \
++    @TOR_LIB_MATH@ @TOR_OPENSSL_LIBS@ @TOR_ZLIB_LIBS@ \
+     @TOR_LIB_WS32@ @TOR_LIB_GDI@ @CURVE25519_LIBS@
  
  EXTRA_DIST += src/tools/tor-fw-helper/README
diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index 4fdb82c67f..470fc4829b 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 b35748f2839cf8ce9910b677ea873463495ac88689244c007ed038f6887f4aaf  tor-0.2.8.12.tar.gz
+sha256 33325d2b250fd047ba2ddc5d11c2190c4e2951f4b03ec48ebd8bf0666e990d43  tor-0.2.9.9.tar.gz
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 5606cc2bf6..bb0fbb16b5 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.2.8.12
+TOR_VERSION = 0.2.9.9
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3c
 TOR_LICENSE_FILES = LICENSE
-- 
2.11.0
