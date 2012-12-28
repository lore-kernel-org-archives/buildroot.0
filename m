From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Dec 2012 20:42:04 +0100
Subject: [Buildroot] [PATCH 11/20] efl/libevas: remove SVG support
In-Reply-To: <cover.1356723702.git.thomas.petazzoni@free-electrons.com>
References: <cover.1356723702.git.thomas.petazzoni@free-electrons.com>
Message-ID: <8d570d2cce967d1ceca90da9a0be002198d594d0.1356723702.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The SVG support requires esvg, which hasn't been released yet. The
recommandation of the EFL developers is to use the SVG loader from the
evas-generic-loaders project.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/efl/libevas/Config.in  |    5 -----
 package/efl/libevas/libevas.mk |    6 ------
 2 files changed, 11 deletions(-)

diff --git a/package/efl/libevas/Config.in b/package/efl/libevas/Config.in
index ddac49e..d8e5002 100644
--- a/package/efl/libevas/Config.in
+++ b/package/efl/libevas/Config.in
@@ -181,11 +181,6 @@ config BR2_PACKAGE_LIBEVAS_TIFF
 	help
 	  This enables the loader code that loads tiff files.
 
-config BR2_PACKAGE_LIBEVAS_SVG
-	bool "libevas svg loader"
-	help
-	  This enables the loader code that loads svg files.
-
 config BR2_PACKAGE_LIBEVAS_XPM
 	bool "libevas xpm loader"
 	help
diff --git a/package/efl/libevas/libevas.mk b/package/efl/libevas/libevas.mk
index 8e03ba6..6e69d7f 100644
--- a/package/efl/libevas/libevas.mk
+++ b/package/efl/libevas/libevas.mk
@@ -176,12 +176,6 @@ else
 LIBEVAS_CONF_OPT += --disable-image-loader-pmaps
 endif
 
-ifeq ($(BR2_PACKAGE_LIBEVAS_SVG),y)
-LIBEVAS_CONF_OPT += --enable-image-loader-svg
-else
-LIBEVAS_CONF_OPT += --disable-image-loader-svg
-endif
-
 ifeq ($(BR2_PACKAGE_LIBEVAS_TIFF),y)
 LIBEVAS_CONF_OPT += --enable-image-loader-tiff
 LIBEVAS_DEPENDENCIES += tiff
-- 
1.7.9.5
