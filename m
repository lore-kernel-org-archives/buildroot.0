From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Jun 2018 22:44:05 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] libcurl: security bump to
 version 7.60.0
Message-ID: <20180611211536.B2B618832D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=33bd7b2e0ea707ccfa7839c2d3708a46beaa88d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Drop upstream patch.

This release fixes the security issues listed below.

CVE-2018-1000300: curl might overflow a heap based memory buffer when
closing down an FTP connection with very long server command replies.

  https://curl.haxx.se/docs/adv_2018-82c2.html

CVE-2018-1000301: curl can be tricked into reading data beyond the end
of a heap based buffer used to store downloaded content.

  https://curl.haxx.se/docs/adv_2018-b138.html

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 051e2f2d0b3a74ede4cc1865513ebe4c59e7d2ed)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/libcurl.hash | 4 ++--
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index aec61e3f83..cb1e6e72f2 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://curl.haxx.se/download/curl-7.59.0.tar.xz.asc
-sha256 e44eaabdf916407585bf5c7939ff1161e6242b6b015d3f2f5b758b2a330461fc  curl-7.59.0.tar.xz
+# https://curl.haxx.se/download/curl-7.60.0.tar.xz.asc
+sha256 8736ff8ded89ddf7e926eec7b16f82597d029fc1469f3a551f1fafaac164e6a0  curl-7.60.0.tar.xz
 sha256 5f3849ec38ddb927e79f514bf948890c41b8d1407286a49609b8fb1585931095  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index c6289e05f4..5c2dd74610 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.59.0
+LIBCURL_VERSION = 7.60.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
