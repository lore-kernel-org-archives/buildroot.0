From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Nov 2020 13:20:21 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/tor: bump version
 to 0.4.3.6
Message-ID: <20201116121538.DAA09864FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3a8951dae116bcd1c29d7ef50b1c00747a06ba20
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Release notes for 0.4.3.5: https://blog.torproject.org/node/1872
"Tor 0.4.3.5 is the first stable release in the 0.4.3.x series."

Release notes for 0.4.3.6: https://blog.torproject.org/node/1900

The fix for CVE-2020-15572 "Fix a crash due to an out-of-bound memory
access when Tor is compiled with NSS support" does not affect buildroot
because we do not support building tor with libnss.

Rebased patch 0001.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ad9125d7a399d05a3d7c2af12aa293b86e7fc9ca)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tor/0001-Fix-static-linking-with-OpenSSL.patch | 12 ++++++------
 package/tor/tor.hash                                   |  2 +-
 package/tor/tor.mk                                     |  2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/tor/0001-Fix-static-linking-with-OpenSSL.patch b/package/tor/0001-Fix-static-linking-with-OpenSSL.patch
index e4cd24e138..942f913465 100644
--- a/package/tor/0001-Fix-static-linking-with-OpenSSL.patch
+++ b/package/tor/0001-Fix-static-linking-with-OpenSSL.patch
@@ -38,7 +38,7 @@ diff --git a/configure.ac b/configure.ac
 index 05e1392cf..580befa6b 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -885,7 +885,7 @@ AC_ARG_WITH(ssl-dir,
+@@ -966,7 +966,7 @@ AC_ARG_WITH(ssl-dir,
    ])
  
  AC_MSG_NOTICE([Now, we'll look for OpenSSL >= 1.0.1])
@@ -47,7 +47,7 @@ index 05e1392cf..580befa6b 100644
      [#include <openssl/ssl.h>
       char *getenv(const char *);],
      [struct ssl_cipher_st;
-@@ -919,7 +919,7 @@ dnl Now check for particular openssl functions.
+@@ -998,7 +998,7 @@ dnl Now check for particular openssl functions.
  save_LIBS="$LIBS"
  save_LDFLAGS="$LDFLAGS"
  save_CPPFLAGS="$CPPFLAGS"
@@ -60,7 +60,7 @@ diff --git a/src/test/include.am b/src/test/include.am
 index ecb768957..39a622e88 100644
 --- a/src/test/include.am
 +++ b/src/test/include.am
-@@ -317,8 +317,8 @@ src_test_test_ntor_cl_LDFLAGS = @TOR_LDFLAGS_zlib@ $(TOR_LDFLAGS_CRYPTLIB)
+@@ -378,8 +378,8 @@ src_test_test_ntor_cl_LDFLAGS = @TOR_LDFLAGS_zlib@ $(TOR_LDFLAGS_CRYPTLIB)
  src_test_test_ntor_cl_LDADD = \
  	$(TOR_INTERNAL_LIBS) \
  	$(rust_ldadd) \
@@ -71,7 +71,7 @@ index ecb768957..39a622e88 100644
  	@CURVE25519_LIBS@ @TOR_LZMA_LIBS@
  src_test_test_ntor_cl_AM_CPPFLAGS =	       \
  	$(AM_CPPFLAGS)
-@@ -327,8 +327,8 @@ src_test_test_hs_ntor_cl_SOURCES  = src/test/test_hs_ntor_cl.c
+@@ -388,8 +388,8 @@ src_test_test_hs_ntor_cl_SOURCES  = src/test/test_hs_ntor_cl.c
  src_test_test_hs_ntor_cl_LDFLAGS = @TOR_LDFLAGS_zlib@ $(TOR_LDFLAGS_CRYPTLIB)
  src_test_test_hs_ntor_cl_LDADD = \
  	$(TOR_INTERNAL_LIBS) \
@@ -86,7 +86,7 @@ diff --git a/src/tools/include.am b/src/tools/include.am
 index f7aa7e0d1..4c4e8aa7a 100644
 --- a/src/tools/include.am
 +++ b/src/tools/include.am
-@@ -30,7 +30,7 @@ src_tools_tor_gencert_LDADD = \
+@@ -35,7 +35,7 @@ src_tools_tor_gencert_LDADD = \
  	$(TOR_CRYPTO_LIBS) \
  	$(TOR_UTIL_LIBS) \
  	$(rust_ldadd) \
@@ -95,7 +95,7 @@ index f7aa7e0d1..4c4e8aa7a 100644
  	@TOR_LIB_WS32@ @TOR_LIB_IPHLPAPI@ @TOR_LIB_GDI@ @TOR_LIB_USERENV@ @CURVE25519_LIBS@
  endif
  
-@@ -40,7 +40,7 @@ src_tools_tor_print_ed_signing_cert_LDADD = \
+@@ -45,7 +45,7 @@ src_tools_tor_print_ed_signing_cert_LDADD = \
  	src/trunnel/libor-trunnel.a \
          $(TOR_CRYPTO_LIBS) \
          $(TOR_UTIL_LIBS) \
diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index e55f3ea3c2..47c2dd49b4 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  06a1d835ddf382f6bca40a62e8fb40b71b2f73d56f0d53523c8bd5caf9b3026d  tor-0.4.2.7.tar.gz
+sha256  6a2d0637d4e514be2ec574723a05065245cce51da78a21cec1dc831be5ccac62  tor-0.4.3.6.tar.gz
 sha256  ae2afe6cd3fd9d512afbaa1ef218757eb00aa6b6aa5e2dfc2774b6837e373fa1  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 09f780d3f5..050114ccac 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.2.7
+TOR_VERSION = 0.4.3.6
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
