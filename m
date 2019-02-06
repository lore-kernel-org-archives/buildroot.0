From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed,  6 Feb 2019 17:54:35 +0100
Subject: [Buildroot] [PATCH] package/libcurl: security bump to version 7.64.0
Message-ID: <20190206165436.8652-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following security issues:

CVE-2018-16890: NTLM type-2 out-of-bounds buffer read
https://curl.haxx.se/docs/CVE-2018-16890.html

CVE-2019-3822: NTLMv2 type-3 header stack buffer overflow
https://curl.haxx.se/docs/CVE-2019-3822.html

CVE-2019-3823: SMTP end-of-response out-of-bounds read
https://curl.haxx.se/docs/CVE-2019-3823.html

The copyright year changed in the COPYING file, so update the hash.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/libcurl.hash | 6 +++---
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 432943538a..b158600eca 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://curl.haxx.se/download/curl-7.62.0.tar.xz.asc
+# https://curl.haxx.se/download/curl-7.64.0.tar.xz.asc
 # with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256 dab5643a5fe775ae92570b9f3df6b0ef4bc2a827a959361fb130c73b721275c1  curl-7.62.0.tar.xz
-sha256 5f3849ec38ddb927e79f514bf948890c41b8d1407286a49609b8fb1585931095  COPYING
+sha256 2f2f13fa34d44aa29cb444077ad7dc4dc6d189584ad552e0aaeb06e608af6001  curl-7.64.0.tar.xz
+sha256 8c8824f50e73a021f5dde1fccbf69685939247399a33a32abab1fa448c9ddabb  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 3bc5207951..1fae41ea3a 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.62.0
+LIBCURL_VERSION = 7.64.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
-- 
2.11.0
