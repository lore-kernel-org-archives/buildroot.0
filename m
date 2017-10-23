From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 24 Oct 2017 01:13:17 +0200
Subject: [Buildroot] [PATCH] libcurl: security bump to version 7.56.1
Message-ID: <20171023231317.5870-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2017-1000257 - IMAP FETCH response out of bounds read

https://curl.haxx.se/docs/adv_20171023.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/libcurl.hash | 4 ++--
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index c6970632ac..49292dfb9e 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://curl.haxx.se/download/curl-7.56.0.tar.xz.asc
-sha256 32437bcca0e9434384329fdc733547879d25ba70335b3cf9e3d9cbc3e71fd172  curl-7.56.0.tar.xz
+# https://curl.haxx.se/download/curl-7.56.1.tar.xz.asc
+sha256 8eed282cf3a0158d567a0feaa3c4619e8e847970597b5a2c81879e8f0d1a39d1  curl-7.56.1.tar.xz
 sha256 cbcf511f5702f7baf5424193a792bc9c18fab22bcbec2e6a587598389dc632c2  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index a6b699ce9c..57b9c2cbca 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.56.0
+LIBCURL_VERSION = 7.56.1
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
-- 
2.11.0
