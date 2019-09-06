From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Sep 2019 09:04:17 +0200
Subject: [Buildroot] [git commit] package/aubio: bump to version 0.4.9
Message-ID: <20190906070237.42D3F8B844@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=39c8202b7558091620684958bdfc4ca717134488
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove upstream patch.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/aubio/0001-Fix-build-with-FFmpeg-4.0.patch | 32 ----------------------
 package/aubio/aubio.hash                           |  4 +--
 package/aubio/aubio.mk                             |  2 +-
 3 files changed, 3 insertions(+), 35 deletions(-)

diff --git a/package/aubio/0001-Fix-build-with-FFmpeg-4.0.patch b/package/aubio/0001-Fix-build-with-FFmpeg-4.0.patch
deleted file mode 100644
index 40ff2dfb89..0000000000
--- a/package/aubio/0001-Fix-build-with-FFmpeg-4.0.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 5690daf759b473b9d13b4547ef37adc2695cf524 Mon Sep 17 00:00:00 2001
-From: James Cowgill <jcowgill@jcowgill.uk>
-Date: Sun, 25 Feb 2018 14:23:25 +0000
-Subject: [PATCH] Fix build with FFmpeg 4.0
-
-Downloaded from upstream commit
-https://git.aubio.org/?p=aubio.git;a=commitdiff;h=5690daf759b473b9d13b4547ef37adc2695cf524
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- src/io/source_avcodec.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/io/source_avcodec.c b/src/io/source_avcodec.c
-index ccdce807..8197445c 100644
---- a/src/io/source_avcodec.c
-+++ b/src/io/source_avcodec.c
-@@ -58,7 +58,11 @@
- #include "fmat.h"
- #include "source_avcodec.h"
- 
-+#if LIBAVCODEC_VERSION_INT < AV_VERSION_INT(56, 56, 0)
- #define AUBIO_AVCODEC_MAX_BUFFER_SIZE FF_MIN_BUFFER_SIZE
-+#else
-+#define AUBIO_AVCODEC_MAX_BUFFER_SIZE AV_INPUT_BUFFER_MIN_SIZE
-+#endif
- 
- struct _aubio_source_avcodec_t {
-   uint_t hop_size;
--- 
-2.14.4
-
diff --git a/package/aubio/aubio.hash b/package/aubio/aubio.hash
index edb63f0769..f484776c1b 100644
--- a/package/aubio/aubio.hash
+++ b/package/aubio/aubio.hash
@@ -1,5 +1,5 @@
-# From https://aubio.org/pub/aubio-0.4.6.tar.bz2.sha256
-sha256 bdc73be1f007218d3ea6d2a503b38a217815a0e2ccc4ed441f6e850ed5d47cfb  aubio-0.4.6.tar.bz2
+# From https://aubio.org/pub/aubio-0.4.9.tar.bz2.sha256
+sha256 d48282ae4dab83b3dc94c16cf011bcb63835c1c02b515490e1883049c3d1f3da  aubio-0.4.9.tar.bz2
 
 # Hash for license file:
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/aubio/aubio.mk b/package/aubio/aubio.mk
index ba182d9bd7..b79beccd97 100644
--- a/package/aubio/aubio.mk
+++ b/package/aubio/aubio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUBIO_VERSION = 0.4.6
+AUBIO_VERSION = 0.4.9
 AUBIO_SITE = https://aubio.org/pub
 AUBIO_SOURCE = aubio-$(AUBIO_VERSION).tar.bz2
 AUBIO_LICENSE = GPL-3.0+
