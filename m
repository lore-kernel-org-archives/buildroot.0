From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Jan 2018 09:11:23 +0100
Subject: [Buildroot] [git commit] libcurl: security bump to version 7.58.0
Message-ID: <20180126081427.177057FD0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e02dd5a4924c69fc806f4191bc7be67e28d5ad37
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2018-1000007: libcurl might leak authentication data to third
parties.

https://curl.haxx.se/docs/adv_2018-b3bf.html

Fixes CVE-2018-1000005: libcurl contains an out bounds read in code handling
HTTP/2 trailers.

https://curl.haxx.se/docs/adv_2018-824a.html

Update license hash due to copyright year change.

[Peter: also add CVE-2018-1000005 reference]
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/libcurl.hash | 6 +++---
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 275a5a3..b1afe18 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://curl.haxx.se/download/curl-7.57.0.tar.xz.asc
-sha256 f5f6fd3c72b7b8389969f4fb671ed8532fa9b5bb7a5cae7ca89bc1cea45c7878  curl-7.57.0.tar.xz
-sha256 cbcf511f5702f7baf5424193a792bc9c18fab22bcbec2e6a587598389dc632c2  COPYING
+# https://curl.haxx.se/download/curl-7.58.0.tar.xz.asc
+sha256 6a813875243609eb75f37fa72044e4ad618b55ec15a4eafdac2df6a7e800e3e3  curl-7.58.0.tar.xz
+sha256 5f3849ec38ddb927e79f514bf948890c41b8d1407286a49609b8fb1585931095  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 0aab58a..a1d2aa7 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.57.0
+LIBCURL_VERSION = 7.58.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
