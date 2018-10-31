From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Oct 2018 09:40:55 +0100
Subject: [Buildroot] [PATCH] libcurl: security bump to version 7.62.0
Message-ID: <20181031084056.25144-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following security issues:

CVE-2018-16839: SASL password overflow via integer overflow
https://curl.haxx.se/docs/CVE-2018-16839.html

CVE-2018-16840: use-after-free in handle close
https://curl.haxx.se/docs/CVE-2018-16840.html

CVE-2018-16842: warning message out-of-buffer read
https://curl.haxx.se/docs/CVE-2018-16842.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/libcurl.hash | 4 ++--
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 395307653d..432943538a 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://curl.haxx.se/download/curl-7.61.1.tar.xz.asc
+# https://curl.haxx.se/download/curl-7.62.0.tar.xz.asc
 # with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256 3d5913d6a39bd22e68e34dff697fd6e4c3c81563f580c76fca2009315cd81891  curl-7.61.1.tar.xz
+sha256 dab5643a5fe775ae92570b9f3df6b0ef4bc2a827a959361fb130c73b721275c1  curl-7.62.0.tar.xz
 sha256 5f3849ec38ddb927e79f514bf948890c41b8d1407286a49609b8fb1585931095  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index c3da8aa3e5..99a451b636 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.61.1
+LIBCURL_VERSION = 7.62.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
-- 
2.11.0
