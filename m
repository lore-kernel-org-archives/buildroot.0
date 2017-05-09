From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 9 May 2017 17:16:10 +0200
Subject: [Buildroot] [git commit branch/next] imagemagick: bump version to
	7.0.5-5
Message-ID: <20170509152255.89D89818A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f4a385342336e6edefb6727be9234580724ebff4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

0001 patch already included in this release:
  https://github.com/ImageMagick/ImageMagick/commit/b218117cad34d39b9ffb587b45c71c5a49b12bde

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ub.com-ImageMagick-ImageMagick-issues-415.patch | 52 ----------------------
 package/imagemagick/imagemagick.hash               |  2 +-
 package/imagemagick/imagemagick.mk                 |  2 +-
 3 files changed, 2 insertions(+), 54 deletions(-)

diff --git a/package/imagemagick/0001-https-github.com-ImageMagick-ImageMagick-issues-415.patch b/package/imagemagick/0001-https-github.com-ImageMagick-ImageMagick-issues-415.patch
deleted file mode 100644
index 943679e..0000000
--- a/package/imagemagick/0001-https-github.com-ImageMagick-ImageMagick-issues-415.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From b218117cad34d39b9ffb587b45c71c5a49b12bde Mon Sep 17 00:00:00 2001
-From: Cristy <urban-warrior@imagemagick.org>
-Date: Fri, 31 Mar 2017 15:24:33 -0400
-Subject: [PATCH] https://github.com/ImageMagick/ImageMagick/issues/415
-
-Fixes CVE-2017-7606
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- coders/pnm.c | 2 +-
- coders/rle.c | 5 +++--
- 2 files changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/coders/pnm.c b/coders/pnm.c
-index 9a1221d79..c525ebb8f 100644
---- a/coders/pnm.c
-+++ b/coders/pnm.c
-@@ -1979,7 +1979,7 @@ static MagickBooleanType WritePNMImage(const ImageInfo *image_info,Image *image,
-                           pixel=ScaleQuantumToChar(GetPixelRed(image,p));
-                         else
-                           pixel=ScaleQuantumToAny(GetPixelRed(image,p),
--                          max_value);
-+                            max_value);
-                       }
-                     q=PopCharPixel((unsigned char) pixel,q);
-                     p+=GetPixelChannels(image);
-diff --git a/coders/rle.c b/coders/rle.c
-index 2318901ec..ec071dc7b 100644
---- a/coders/rle.c
-+++ b/coders/rle.c
-@@ -271,7 +271,8 @@ static Image *ReadRLEImage(const ImageInfo *image_info,ExceptionInfo *exception)
-         p=colormap;
-         for (i=0; i < (ssize_t) number_colormaps; i++)
-           for (x=0; x < (ssize_t) map_length; x++)
--            *p++=(unsigned char) ScaleShortToQuantum(ReadBlobLSBShort(image));
-+            *p++=(unsigned char) ScaleQuantumToChar(ScaleShortToQuantum(
-+              ReadBlobLSBShort(image)));
-       }
-     if ((flags & 0x08) != 0)
-       {
-@@ -476,7 +477,7 @@ static Image *ReadRLEImage(const ImageInfo *image_info,ExceptionInfo *exception)
-               for (x=0; x < (ssize_t) number_planes; x++)
-               {
-                 ValidateColormapValue(image,(size_t) (x*map_length+
--                    (*p & mask)),&index,exception);
-+                  (*p & mask)),&index,exception);
-                 *p=colormap[(ssize_t) index];
-                 p++;
-               }
--- 
-2.11.0
-
diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index ff7b24a..06a957a 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,2 +1,2 @@
 # From http://www.imagemagick.org/download/releases/digest.rdf
-sha256 4a1dde5bdfec0fc549955a051be25b7ff96dfb192060997699e43c7ce0f06ab2  ImageMagick-7.0.5-4.tar.xz
+sha256 c3644119dce993aa241fa08eced2cb6043fb5345f0eee7a7822a497f1142ebe3  ImageMagick-7.0.5-5.tar.xz
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 9bef6f7..6b5cd4e 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.0.5-4
+IMAGEMAGICK_VERSION = 7.0.5-5
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 IMAGEMAGICK_SITE = http://www.imagemagick.org/download/releases
 IMAGEMAGICK_LICENSE = Apache-2.0
