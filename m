From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Nov 2020 21:39:13 +0100
Subject: [Buildroot] [git commit] package/jpeg-turbo: security bump to
 version 2.0.5
Message-ID: <20201117202855.D9F8886484@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=105d61c85062b18bc9555011f909c8c8a5a33277
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issue:

- CVE-2020-13790: ibjpeg-turbo 2.0.4, and mozjpeg 4.0.0, has a heap-based
  buffer over-read in get_rgb_row() in rdppm.c via a malformed PPM input
  file

For more details, see the release notes:
https://github.com/libjpeg-turbo/libjpeg-turbo/releases/tag/2.0.5

Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
[Peter: mark as security bump / extend commit message]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jpeg-turbo/jpeg-turbo.hash | 8 ++++----
 package/jpeg-turbo/jpeg-turbo.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/jpeg-turbo/jpeg-turbo.hash b/package/jpeg-turbo/jpeg-turbo.hash
index 874f04fc82..abf129bd93 100644
--- a/package/jpeg-turbo/jpeg-turbo.hash
+++ b/package/jpeg-turbo/jpeg-turbo.hash
@@ -1,7 +1,7 @@
-# From https://sourceforge.net/projects/libjpeg-turbo/files/2.0.4/
-sha1 163d8f96d0999526a117de0388624241b54dcd67  libjpeg-turbo-2.0.4.tar.gz
-md5  d01d9e0c28c27bc0de9f4e2e8ff49855 libjpeg-turbo-2.0.4.tar.gz
+# From https://sourceforge.net/projects/libjpeg-turbo/files/2.0.5/
+sha1 9d4c565d402b2f5661be78d76098073ec7e30f10  libjpeg-turbo-2.0.5.tar.gz
+md5  3a7dc293918775fc933f81e2bce36464 libjpeg-turbo-2.0.5.tar.gz
 # Locally computed
-sha256 33dd8547efd5543639e890efbf2ef52d5a21df81faf41bb940657af916a23406  libjpeg-turbo-2.0.4.tar.gz
+sha256 16f8f6f2715b3a38ab562a84357c793dd56ae9899ce130563c72cd93d8357b5d  libjpeg-turbo-2.0.5.tar.gz
 sha256 69e570a251515ced17d4492256d57c89db77ed949652f88a44c80c1ca9607920  LICENSE.md
 sha256 82fece2bff2669c476495f0fe70096b154e8bc5b40916a64e99836d9a01c3110  README.ijg
diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
index 65debb2510..ddb22bc20b 100644
--- a/package/jpeg-turbo/jpeg-turbo.mk
+++ b/package/jpeg-turbo/jpeg-turbo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JPEG_TURBO_VERSION = 2.0.4
+JPEG_TURBO_VERSION = 2.0.5
 JPEG_TURBO_SOURCE = libjpeg-turbo-$(JPEG_TURBO_VERSION).tar.gz
 JPEG_TURBO_SITE = https://downloads.sourceforge.net/project/libjpeg-turbo/$(JPEG_TURBO_VERSION)
 JPEG_TURBO_LICENSE = IJG (libjpeg), BSD-3-Clause (TurboJPEG), Zlib (SIMD)
