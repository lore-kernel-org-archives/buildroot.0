From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Aug 2016 14:51:35 +0200
Subject: [Buildroot] [PATCH] imagemagick: security bump to 7.0.2-9
Message-ID: <1472215895-6556-1-git-send-email-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes a number of buffer overflows / use-after-free issues:
http://git.imagemagick.org/repos/ImageMagick/blob/master/ChangeLog

  * Prevent buffer overflow in BMP & SGI coders (bug report from
    pwchen&rayzhong of tencent).
  * Prevent buffer overflow and other problems in SIXEL, PDB, MAP, TIFF and
    CALS coders (bug report from Donghai Zhu).
  * Prevent buffer overflow (bug report from Max Thrane).
  * Prevent memory use after free (reference
    https://www.imagemagick.org/discourse-server/viewtopic.php?f=3&t=30245).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index 71cfeda..dcbef18 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,2 +1,2 @@
 # From http://www.imagemagick.org/download/releases/digest.rdf
-sha256 1e173314ddcf1508f9f4c20ddd650883e089dea6acbedd8f2c54d02109104cf9 ImageMagick-7.0.2-6.tar.xz
+sha256 22df4f197985f36f77b7b0d44de92ff44415885045f0191b3319540bdc82ff53 ImageMagick-7.0.2-9.tar.xz
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 2d2fe76..373765c 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.0.2-6
+IMAGEMAGICK_VERSION = 7.0.2-9
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 IMAGEMAGICK_SITE = http://www.imagemagick.org/download/releases
 IMAGEMAGICK_LICENSE = Apache-2.0
-- 
2.8.1
