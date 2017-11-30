From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 30 Nov 2017 01:07:01 +0100
Subject: [Buildroot] [PATCH] libcurl: security bump to version 7.57.0
Message-ID: <20171130000701.4648-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following security issues:

- CVE-2017-8816: NTLM buffer overflow via integer overflow
- CVE-2017-8817: FTP wildcard out of bounds read
- CVE-2017-8818: SSL out of buffer access

For more details, see the changelog:
https://curl.haxx.se/changes.html#7_57_0

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/libcurl.hash | 4 ++--
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 49292dfb9e..275a5a373f 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://curl.haxx.se/download/curl-7.56.1.tar.xz.asc
-sha256 8eed282cf3a0158d567a0feaa3c4619e8e847970597b5a2c81879e8f0d1a39d1  curl-7.56.1.tar.xz
+# https://curl.haxx.se/download/curl-7.57.0.tar.xz.asc
+sha256 f5f6fd3c72b7b8389969f4fb671ed8532fa9b5bb7a5cae7ca89bc1cea45c7878  curl-7.57.0.tar.xz
 sha256 cbcf511f5702f7baf5424193a792bc9c18fab22bcbec2e6a587598389dc632c2  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 57b9c2cbca..0aab58a7de 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.56.1
+LIBCURL_VERSION = 7.57.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
-- 
2.11.0
