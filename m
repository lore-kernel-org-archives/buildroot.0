From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Sep 2018 20:44:22 +0200
Subject: [Buildroot] [git commit] package/tor: bump version to 0.3.4.8
Message-ID: <20180913184507.F1569880C0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bf98b7c06bdb805d0e940df12a01af46e75714bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rebased patch 0001.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tor/0001-openssl-libz.patch | 10 +++++-----
 package/tor/tor.hash                |  2 +-
 package/tor/tor.mk                  |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/tor/0001-openssl-libz.patch b/package/tor/0001-openssl-libz.patch
index 62a9a4a0ec..cb2ed46b39 100644
--- a/package/tor/0001-openssl-libz.patch
+++ b/package/tor/0001-openssl-libz.patch
@@ -3,8 +3,8 @@ and remove host paths when looking for openssl.
 
 [Vincent:
  - Adapt the patch to make it apply on the new version.]
-[Bernd: rebased for tor-0.2.7.6, 0.2.8.10, 0.2.9.9, 0.3.1.7 & 0.3.2.10]
-
+[Bernd: rebased for tor-0.2.7.6, 0.2.8.10, 0.2.9.9, 0.3.1.7, 0.3.2.10 &
+        0.3.4.8]
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 
@@ -17,9 +17,9 @@ diff -uNr tor-0.3.1.7.org/configure.ac tor-0.3.1.7/configure.ac
  AC_MSG_NOTICE([Now, we'll look for OpenSSL >= 1.0.1])
 -TOR_SEARCH_LIBRARY(openssl, $tryssldir, [-lssl -lcrypto $TOR_LIB_GDI $TOR_LIB_WS32],
 +TOR_SEARCH_LIBRARY(openssl, $tryssldir, [-lssl -lcrypto -lz $TOR_LIB_GDI $TOR_LIB_WS32],
-     [#include <openssl/ssl.h>],
-     [struct ssl_method_st; const struct ssl_method_st *TLSv1_1_method(void);],
-     [TLSv1_1_method();], [],
+     [#include <openssl/ssl.h>
+      char *getenv(const char *);],
+     [struct ssl_cipher_st;
 diff -uNr tor-0.3.1.7.org/src/or/include.am tor-0.3.1.7/src/or/include.am
 --- tor-0.3.1.7.org/src/or/include.am	2017-06-19 17:56:51.000000000 +0200
 +++ tor-0.3.1.7/src/or/include.am	2017-09-19 19:41:02.015861546 +0200
diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index 35659eca6e..e28f02dcec 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 85346b4d026e6a041c8e326d2cc64b5f5361b032075c89c5854f16dbc02fce6f  tor-0.3.3.9.tar.gz
+sha256 826a4cb2c099a29c7cf91516ffffcfcb5aace7533b8853a8c8bddcfe2bfb1023  tor-0.3.4.8.tar.gz
 sha256 f9a4f724d8037711dde7d3f1d17094fb7d211545b3a3bbb1b03e769e13ca5608  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 2ee25c873f..a20763a97e 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.3.3.9
+TOR_VERSION = 0.3.4.8
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
