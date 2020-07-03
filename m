From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 3 Jul 2020 21:28:35 +0200
Subject: [Buildroot] [git commit] package/libcurl: bump to version 7.71.1
Message-ID: <20200703192625.66C8486172@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8360886fb2d983fb3324a352531b19289fe4e8f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This release fixes build with BR2_PACKAGE_LIBCURL_PROXY_SUPPORT disabled
and mbedtls enabled.

Add reference to upstream tarball signature.

Fixes:
http://autobuild.buildroot.net/results/f32b6ab927560839cacaa1b9e6b64ced92b9ffe3/
http://autobuild.buildroot.net/results/566f0db496f6d1feefd9d3e6b6955a2539670735/
http://autobuild.buildroot.net/results/19de1111318aea863118c9b0b44dc282f011918f/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libcurl/libcurl.hash | 6 ++++--
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 104d603f3e..46f72c1eaf 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,3 +1,5 @@
-# Locally calculated
+# Locally calculated after checking pgp signature
+# https://curl.haxx.se/download/curl-7.71.1.tar.xz.asc
+# signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
+sha256  40f83eda27cdbeb25cd4da48cefb639af1b9395d6026d2da1825bf059239658c  curl-7.71.1.tar.xz
 sha256  db3c4a3b3695a0f317a0c5176acd2f656d18abc45b3ee78e50935a78eb1e132e  COPYING
-sha256  cdf18794393d8bead915312708a9e5d819c6e9919de14b20d5c8e7987abd9772  curl-7.71.0.tar.xz
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 11748924ff..6f053f00a8 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.71.0
+LIBCURL_VERSION = 7.71.1
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
