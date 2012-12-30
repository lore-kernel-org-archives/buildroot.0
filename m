From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Dec 2012 07:21:58 +0100
Subject: [Buildroot] [git commit] efl/libevas: remove SVG support
Message-ID: <20121230112956.B023E9A53C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=212a5abdbd41298647627a977b336c2f4b1f646c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The SVG support requires esvg, which hasn't been released yet. The
recommandation of the EFL developers is to use the SVG loader from the
evas-generic-loaders project.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/efl/libevas/Config.in  |    5 -----
 package/efl/libevas/libevas.mk |    6 ------
 2 files changed, 0 insertions(+), 11 deletions(-)

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
