From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Sep 2017 23:56:29 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] libcurl: security bump to
	version 7.55.0
Message-ID: <20170905220139.055A880466@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=57fa6658477f6fbeb7652c3bdac9735ba7f3673d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Fixes:

 glob: do not parse after a strtoul() overflow range (CVE-2017-1000101)
 tftp: reject file name lengths that don't fit (CVE-2017-1000100)
 file: output the correct buffer to the user (CVE-2017-1000099)

Switch to .tar.xz to save bandwidth.

Add reference to tarball signature.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit d88c79090add53947dc3290fb61d51f2b630301c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/libcurl.hash | 3 ++-
 package/libcurl/libcurl.mk   | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 1b8d80f..6d49b67 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,2 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256 fdfc4df2d001ee0c44ec071186e770046249263c491fcae48df0e1a3ca8f25a0  curl-7.54.1.tar.bz2
+# https://curl.haxx.se/download/curl-7.55.0.tar.xz.asc
+sha256 cdd58522f8607fd4e871df79d73acb3155075e2134641e5adab12a0962df059d  curl-7.55.0.tar.xz
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 6848449..dd0ccbf 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.54.1
-LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.bz2
+LIBCURL_VERSION = 7.55.0
+LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
 	$(if $(BR2_PACKAGE_ZLIB),zlib) \
