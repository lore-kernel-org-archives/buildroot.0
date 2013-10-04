From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Fri,  4 Oct 2013 07:55:49 +0200
Subject: [Buildroot] [PATCH 1/1] package: change tarball compression to xz
Message-ID: <1380866149-10353-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
Note:
 the appropriate files on the BR server should be replaced
 e.g. ngircd-20.3.tar.gz --> ngircd-20.3.tar.xz
 
 package/imagemagick/imagemagick.mk |    2 +-
 package/ngircd/ngircd.mk           |    1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 2149574..4323f6d 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -6,7 +6,7 @@
 
 IMAGEMAGICK_MAJOR = 6.8.6
 IMAGEMAGICK_VERSION = $(IMAGEMAGICK_MAJOR)-2
-IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.bz2
+IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 # The official ImageMagick site only keeps the latest versions
 # available, which is annoying. Use an alternate site that keeps all
 # older versions.
diff --git a/package/ngircd/ngircd.mk b/package/ngircd/ngircd.mk
index d60ac06..13313a7 100644
--- a/package/ngircd/ngircd.mk
+++ b/package/ngircd/ngircd.mk
@@ -5,6 +5,7 @@
 ################################################################################
 
 NGIRCD_VERSION = 20.3
+NGIRCD_SOURCE = ngircd-$(NGIRCD_VERSION).tar.xz
 NGIRCD_SITE = ftp://ftp.berlios.de/pub/ngircd/
 NGIRCD_DEPENDENCIES = zlib
 NGIRCD_LICENSE = GPLv2+
-- 
1.7.9.5
