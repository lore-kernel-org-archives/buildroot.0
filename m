From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  5 Mar 2021 16:14:54 +0100
Subject: [Buildroot] [PATCH 1/1] package/sdl2_image: add
 SDL2_IMAGE_CPE_ID_PRODUCT
Message-ID: <20210305151454.2008432-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:libsdl:sdl_image is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibsdl%3Asdl2_image

Indeed, cpe:2.3:a:libsdl:sdl2_image contains a single CPE entry for
version 2.0.4, all the other entries have been deprecated in favor of
cpe:2.3:a:libsdl:sdl_image:

  <cpe-item name="cpe:/a:libsdl:sdl2_image:2.0.3" deprecated="true" deprecation_date="2020-07-28T15:42:37.767Z">
      <reference href="https://www.libsdl.org/projects/SDL_image/">Product</reference>
    <cpe-23:cpe23-item name="cpe:2.3:a:libsdl:sdl2_image:2.0.3:*:*:*:*:*:*:*">
        <cpe-23:deprecated-by name="cpe:2.3:a:libsdl:sdl_image:2.0.3:*:*:*:*:*:*:*" type="NAME_CORRECTION"/>
  <cpe-item name="cpe:/a:libsdl:sdl2_image:2.0.4">
      <reference href="http://hg.libsdl.org/SDL_image/">Version</reference>
    <cpe-23:cpe23-item name="cpe:2.3:a:libsdl:sdl2_image:2.0.4:*:*:*:*:*:*:*"/>
  <cpe-item name="cpe:/a:libsdl:sdl2_image:2.0.5" deprecated="true" deprecation_date="2020-07-28T15:42:40.500Z">
      <reference href="http://hg.libsdl.org/SDL_image/">Version</reference>
    <cpe-23:cpe23-item name="cpe:2.3:a:libsdl:sdl2_image:2.0.5:*:*:*:*:*:*:*">
        <cpe-23:deprecated-by name="cpe:2.3:a:libsdl:sdl_image:2.0.5:*:*:*:*:*:*:*" type="NAME_CORRECTION"/>:

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sdl2_image/sdl2_image.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sdl2_image/sdl2_image.mk b/package/sdl2_image/sdl2_image.mk
index 06f6eca30c..13de7b1268 100644
--- a/package/sdl2_image/sdl2_image.mk
+++ b/package/sdl2_image/sdl2_image.mk
@@ -11,6 +11,7 @@ SDL2_IMAGE_INSTALL_STAGING = YES
 SDL2_IMAGE_LICENSE = Zlib
 SDL2_IMAGE_LICENSE_FILES = COPYING.txt
 SDL2_IMAGE_CPE_ID_VENDOR = libsdl
+SDL2_IMAGE_CPE_ID_PRODUCT = sdl_image
 
 # Unconditionally enable support for image formats that don't require
 # any dependency.
-- 
2.30.0
