From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 18 Jun 2017 09:43:14 +0200
Subject: [Buildroot] [PATCH/2017.02.x 1/1] package/imagemagick: change
	download url to github
Message-ID: <20170618074314.15411-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream quickly removes old versions from
http://www.imagemagick.org/download/releases

For our LTS versions we should switch to a stable upstream repo which
provides all released versions.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/imagemagick/imagemagick.hash | 4 ++--
 package/imagemagick/imagemagick.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index ff7b24a9a..63974893d 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,2 +1,2 @@
-# From http://www.imagemagick.org/download/releases/digest.rdf
-sha256 4a1dde5bdfec0fc549955a051be25b7ff96dfb192060997699e43c7ce0f06ab2  ImageMagick-7.0.5-4.tar.xz
+# Locally computed
+sha256 3ca9ef4cf9a931cc33b098be6df9b250471dd6376d21095d3c71db2a688e6a0c  7.0.5-4.tar.gz
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 9bef6f781..b0cf2b85b 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 IMAGEMAGICK_VERSION = 7.0.5-4
-IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
-IMAGEMAGICK_SITE = http://www.imagemagick.org/download/releases
+IMAGEMAGICK_SOURCE = $(IMAGEMAGICK_VERSION).tar.gz
+IMAGEMAGICK_SITE = https://github.com/ImageMagick/ImageMagick/archive
 IMAGEMAGICK_LICENSE = Apache-2.0
 IMAGEMAGICK_LICENSE_FILES = LICENSE
 
-- 
2.11.0
