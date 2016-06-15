From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Jun 2016 23:11:44 +0200
Subject: [Buildroot] [git commit] imagemagick: bump to version 7.0.2-0
Message-ID: <20160615211203.A2EED80401@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=de81d2e541b9853fefe3924c7329a9949252aa0a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new disables for libraries that aren't supported in buildroot and
sort them for ease of maintenance.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/imagemagick/imagemagick.hash |  2 +-
 package/imagemagick/imagemagick.mk   | 21 ++++++++++++---------
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index 8a51047..e34f15a 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,2 +1,2 @@
 # From http://www.imagemagick.org/download/releases/digest.rdf
-sha256 c028642af5f4cbae864b4afd6ea96878191be64103ca9c7cc67612ec3cbb9dec ImageMagick-6.9.4-6.tar.xz
+sha256	cd3076a573a815ff828c75d231eef8660f2f6c5eaf848c2f4e8c4dcc955671ea	ImageMagick-7.0.2-0.tar.xz
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 74ac5a4..065f33d 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 6.9.4-6
+IMAGEMAGICK_VERSION = 7.0.2-0
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 IMAGEMAGICK_SITE = http://www.imagemagick.org/download/releases
 IMAGEMAGICK_LICENSE = Apache-2.0
@@ -12,7 +12,7 @@ IMAGEMAGICK_LICENSE_FILES = LICENSE
 
 IMAGEMAGICK_INSTALL_STAGING = YES
 IMAGEMAGICK_CONFIG_SCRIPTS = \
-	$(addsuffix -config,Magick MagickCore MagickWand Wand)
+	$(addsuffix -config,MagickCore MagickWand)
 
 ifeq ($(BR2_INSTALL_LIBSTDCPP)$(BR2_USE_WCHAR),yy)
 IMAGEMAGICK_CONFIG_SCRIPTS += Magick++-config
@@ -23,16 +23,19 @@ IMAGEMAGICK_CONF_ENV = ac_cv_sys_file_offset_bits=64
 IMAGEMAGICK_CONF_OPTS = \
 	--program-transform-name='s,,,' \
 	--disable-openmp \
-	--without-perl \
-	--without-wmf \
-	--without-openexr \
-	--without-jp2 \
-	--without-jbig \
-	--without-gvc \
 	--without-djvu \
 	--without-dps \
-	--without-gslib \
+	--without-flif \
 	--without-fpx \
+	--without-gslib \
+	--without-gvc \
+	--without-jbig \
+	--without-jp2 \
+	--without-lqr \
+	--without-openexr \
+	--without-perl \
+	--without-raqm \
+	--without-wmf \
 	--without-x
 
 IMAGEMAGICK_DEPENDENCIES = host-pkgconf
