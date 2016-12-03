From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  3 Dec 2016 13:05:47 +0100
Subject: [Buildroot] [PATCH 1/1] package/tor: bump version to 0.2.8.10
Message-ID: <20161203120547.1129-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tor/0001-openssl-libz.patch | 12 ++++++------
 package/tor/tor.hash                |  2 +-
 package/tor/tor.mk                  |  2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/tor/0001-openssl-libz.patch b/package/tor/0001-openssl-libz.patch
index 855b1c5..c454b8a 100644
--- a/package/tor/0001-openssl-libz.patch
+++ b/package/tor/0001-openssl-libz.patch
@@ -3,7 +3,7 @@ and remove host paths when looking for openssl.
 
 [Vincent:
  - Adapt the patch to make it apply on the new version.]
-[Bernd: rebased for tor-0.2.7.6]
+[Bernd: rebased for tor-0.2.7.6 & 0.2.8.10]
 
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
@@ -19,7 +19,7 @@ diff -uNr tor-0.2.7.6.org/configure.ac tor-0.2.7.6/configure.ac
 +TOR_SEARCH_LIBRARY(openssl, $tryssldir, [-lssl -lcrypto -lz $TOR_LIB_GDI],
      [#include <openssl/rand.h>],
      [void RAND_add(const void *buf, int num, double entropy);],
-     [RAND_add((void*)0,0,0); exit(0);], [],
+     [RAND_add((void*)0,0,0);], [],
 -    [/usr/local/openssl /usr/lib/openssl /usr/local/ssl /usr/lib/ssl /usr/local /usr/athena /opt/openssl])
 +    [])
  
@@ -41,9 +41,9 @@ diff -uNr tor-0.2.7.6.org/src/test/include.am tor-0.2.7.6/src/test/include.am
 --- tor-0.2.7.6.org/src/test/include.am	2015-12-08 18:35:17.000000000 +0100
 +++ tor-0.2.7.6/src/test/include.am	2016-01-31 20:25:59.673127854 +0100
 @@ -127,8 +127,8 @@
- src_test_test_LDADD = src/or/libtor-testing.a src/common/libor-testing.a \
- 	src/common/libor-crypto-testing.a $(LIBDONNA) src/common/libor.a \
- 	src/common/libor-event-testing.a src/trunnel/libor-trunnel-testing.a \
+ 	src/common/libor-testing.a \
+ 	src/common/libor-event-testing.a \
+ 	src/trunnel/libor-trunnel-testing.a \
 -	@TOR_ZLIB_LIBS@ @TOR_LIB_MATH@ @TOR_LIBEVENT_LIBS@ \
 -	@TOR_OPENSSL_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_GDI@ @CURVE25519_LIBS@ \
 +	@TOR_LIB_MATH@ @TOR_LIBEVENT_LIBS@ \
@@ -76,7 +76,7 @@ diff -uNr tor-0.2.7.6.org/src/test/include.am tor-0.2.7.6/src/test/include.am
 @@ -174,8 +174,8 @@
  src_test_test_ntor_cl_LDFLAGS = @TOR_LDFLAGS_zlib@ @TOR_LDFLAGS_openssl@
  src_test_test_ntor_cl_LDADD = src/or/libtor.a src/common/libor.a \
- 	src/common/libor-crypto.a $(LIBDONNA) \
+ 	src/common/libor-crypto.a $(LIBKECCAK_TINY) $(LIBDONNA) \
 -	@TOR_ZLIB_LIBS@ @TOR_LIB_MATH@ \
 -	@TOR_OPENSSL_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_GDI@ @CURVE25519_LIBS@
 +	@TOR_LIB_MATH@ \
diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index a836476..b13fc4a 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	493a8679f904503048114aca6467faef56861206bab8283d858f37141d95105d	tor-0.2.7.6.tar.gz
+sha256 c88b8c57b34ebf44b731df5d68f73eb6b6708bcf4e42cf7b4817fd4e304c9c4d  tor-0.2.8.10.tar.gz
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 6a622cf..06d05c8 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.2.7.6
+TOR_VERSION = 0.2.8.10
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3c
 TOR_LICENSE_FILES = LICENSE
-- 
2.10.2
