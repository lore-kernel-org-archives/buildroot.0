From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 15 Mar 2018 20:06:19 +0200
Subject: [Buildroot] [PATCH] libcurl: security bump to version 7.59.0
Message-ID: <7128741177a05a7861260441801d38311867fe0f.1521137179.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CVE-2018-1000120: curl could be fooled into writing a zero byte out of
bounds when curl is told to work on an FTP URL with the setting to only
issue a single CWD command, if the directory part of the URL contains a
"%00" sequence.

https://curl.haxx.se/docs/adv_2018-9cd6.html

CVE-2018-1000121: curl might dereference a near-NULL address when
getting an LDAP URL.

https://curl.haxx.se/docs/adv_2018-97a2.html

CVE-2018-1000122: When asked to transfer an RTSP URL, curl could
calculate a wrong data length to copy from the read buffer.

https://curl.haxx.se/docs/adv_2018-b047.html

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libcurl/libcurl.hash | 4 ++--
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index b1afe1891d10..aec61e3f8317 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://curl.haxx.se/download/curl-7.58.0.tar.xz.asc
-sha256 6a813875243609eb75f37fa72044e4ad618b55ec15a4eafdac2df6a7e800e3e3  curl-7.58.0.tar.xz
+# https://curl.haxx.se/download/curl-7.59.0.tar.xz.asc
+sha256 e44eaabdf916407585bf5c7939ff1161e6242b6b015d3f2f5b758b2a330461fc  curl-7.59.0.tar.xz
 sha256 5f3849ec38ddb927e79f514bf948890c41b8d1407286a49609b8fb1585931095  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 39ed3e4da5f9..c6289e05f4cb 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.58.0
+LIBCURL_VERSION = 7.59.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
-- 
2.16.2
