From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Sep 2019 20:00:26 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/libcurl: security
 bump to version 7.66.0
Message-ID: <20190925175516.435828F469@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=206518a203ce9fbd587f4f34812381407a125d6b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Fixes the following security vulnerabilities:

CVE-2019-5481: FTP-KRB double-free
https://curl.haxx.se/docs/CVE-2019-5481.html

CVE-2019-5482: TFTP small blocksize heap buffer overflow
https://curl.haxx.se/docs/CVE-2019-5482.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 26832000650b4f2e1c5126009abe18d52cb97766)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/libcurl.hash | 4 ++--
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 580a2e640a..8f2d0c058c 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://curl.haxx.se/download/curl-7.65.3.tar.xz.asc
+# https://curl.haxx.se/download/curl-7.66.0.tar.xz.asc
 # with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256 f2d98854813948d157f6a91236ae34ca4a1b4cb302617cebad263d79b0235fea  curl-7.65.3.tar.xz
+sha256 dbb48088193016d079b97c5c3efde8efa56ada2ebf336e8a97d04eb8e2ed98c1  curl-7.66.0.tar.xz
 sha256 8c8824f50e73a021f5dde1fccbf69685939247399a33a32abab1fa448c9ddabb  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 8bb215381c..e78049cdcb 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.65.3
+LIBCURL_VERSION = 7.66.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
