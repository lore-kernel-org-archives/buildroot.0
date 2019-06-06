From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Jun 2019 14:23:56 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/libcurl: security
 bump to version 7.65.0
Message-ID: <20190606124825.E12968EC51@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=558160bc8ca7cf4c0fa292aa64357f858fa615b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes the following security vulnerabilities:

- CVE-2019-5435: Integer overflows in curl_url_set()
  https://curl.haxx.se/docs/CVE-2019-5435.html

- CVE-2019-5436: TFTP receive buffer overflow
  https://curl.haxx.se/docs/CVE-2019-5436.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 7f60180f5c835c9ce1c7ea48d7bb22df9ae67886)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/libcurl.hash | 4 ++--
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index d321adcd62..bece16dc0d 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://curl.haxx.se/download/curl-7.64.1.tar.xz.asc
+# https://curl.haxx.se/download/curl-7.65.0.tar.xz.asc
 # with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256 9252332a7f871ce37bfa7f78bdd0a0e3924d8187cc27cb57c76c9474a7168fb3  curl-7.64.1.tar.xz
+sha256 7766d263929404f693905b5e5222aa0f2bdf8c66ab4b8758f0c0820a42b966cd  curl-7.65.0.tar.xz
 sha256 8c8824f50e73a021f5dde1fccbf69685939247399a33a32abab1fa448c9ddabb  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 852054a4bd..80bf2dd245 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.64.1
+LIBCURL_VERSION = 7.65.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
