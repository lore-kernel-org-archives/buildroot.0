From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Dec 2017 22:00:05 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] libcurl: security bump to
 version 7.57.0
Message-ID: <20171220210025.2141F835D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f4cf0ab238a9c000696667fa028a0eb2aaf953b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Fixes the following security issues:

- CVE-2017-8816: NTLM buffer overflow via integer overflow
- CVE-2017-8817: FTP wildcard out of bounds read
- CVE-2017-8818: SSL out of buffer access

For more details, see the changelog:
https://curl.haxx.se/changes.html#7_57_0

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit fb2ed961988867ab77c48786075e03a6110d1d0a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/libcurl.hash | 4 ++--
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 49292df..275a5a3 100644
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
index 57b9c2c..0aab58a 100644
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
