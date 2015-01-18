From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 18 Jan 2015 17:36:52 +0100
Subject: [Buildroot] [PATCH 1/1] package/tiff: Add utilities submenu and
	more utility options
Message-ID: <1421599012-21491-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tiff/Config.in |   48 ++++++++++++++++++++++++++++++++++++++++++++++++
 package/tiff/tiff.mk   |   36 +++++++++++++++++++++++++++---------
 2 files changed, 75 insertions(+), 9 deletions(-)

diff --git a/package/tiff/Config.in b/package/tiff/Config.in
index 3a929f7..4b0e7db 100644
--- a/package/tiff/Config.in
+++ b/package/tiff/Config.in
@@ -60,14 +60,62 @@ config BR2_PACKAGE_TIFF_JBIG
 	default y
 endmenu
 
+menu "tiff Utilities"
+
+config BR2_PACKAGE_TIFF_BMP2TIFF
+	bool "bmp2tiff"
+	help
+	  bmp2tiff utility
+
+config BR2_PACKAGE_TIFF_FAX2PS
+	bool "fax2ps"
+	help
+	  fax2ps utility
+
+config BR2_PACKAGE_TIFF_FAX2TIFF
+	bool "fax2tiff"
+	help
+	  fax2tiff utility
+
+config BR2_PACKAGE_TIFF_GIF2TIFF
+	bool "gif2tiff"
+	help
+	  gif2tiff utility
+
+config BR2_PACKAGE_TIFF_PAL2RGB
+	bool "pal2rgb"
+	help
+	  pal2rgb utility
+
+config BR2_PACKAGE_TIFF_PPM2TIFF
+	bool "ppm2tiff"
+	help
+	  ppm2tiff utility
+
+config BR2_PACKAGE_TIFF_RAS2TIFF
+	bool "ras2tiff"
+	help
+	  ras2tiff utility
+
+config BR2_PACKAGE_TIFF_RAW2TIFF
+	bool "raw2tiff"
+	help
+	  raw2tiff utility
+
 config BR2_PACKAGE_TIFF_TIFF2PDF
 	bool "tiff2pdf"
 	help
 	  tiff2pdf utility
 
+config BR2_PACKAGE_TIFF_TIFF2PS
+	bool "tiff2ps"
+	help
+	  tiff2ps utility
+
 config BR2_PACKAGE_TIFF_TIFFCP
 	bool "tiffcp"
 	help
 	  tiffcp utility
+endmenu
 
 endif
diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index 43f96b7..f801d04 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -16,18 +16,9 @@ TIFF_CONF_OPTS = \
 TIFF_DEPENDENCIES = host-pkgconf
 
 TIFF_TOOLS_TO_DELETE = \
-	bmp2tiff \
-	fax2ps \
-	fax2tiff \
-	gif2tiff \
-	pal2rgb \
-	ppm2tiff \
-	ras2tiff \
-	raw2tiff \
 	rgb2ycbcr \
 	thumbnail \
 	tiff2bw \
-	tiff2ps \
 	tiff2rgba \
 	tiffcmp \
 	tiffcrop \
@@ -38,9 +29,36 @@ TIFF_TOOLS_TO_DELETE = \
 	tiffset \
 	tiffsplit \
 
+ifeq ($(BR2_PACKAGE_TIFF_BMP2TIFF),)
+	TIFF_TOOLS_TO_DELETE += bmp2tiff
+endif
+ifeq ($(BR2_PACKAGE_TIFF_FAX2PS),)
+	TIFF_TOOLS_TO_DELETE += fax2ps
+endif
+ifeq ($(BR2_PACKAGE_TIFF_FAX2TIFF),)
+	TIFF_TOOLS_TO_DELETE += fax2tiff
+endif
+ifeq ($(BR2_PACKAGE_TIFF_GIF2TIFF),)
+	TIFF_TOOLS_TO_DELETE += gif2tiff
+endif
+ifeq ($(BR2_PACKAGE_TIFF_PAL2RGB),)
+	TIFF_TOOLS_TO_DELETE += pal2rgb
+endif
+ifeq ($(BR2_PACKAGE_TIFF_PPM2TIFF),)
+	TIFF_TOOLS_TO_DELETE += ppm2tiff
+endif
+ifeq ($(BR2_PACKAGE_TIFF_RAS2TIFF),)
+	TIFF_TOOLS_TO_DELETE += ras2tiff
+endif
+ifeq ($(BR2_PACKAGE_TIFF_RAW2TIFF),)
+	TIFF_TOOLS_TO_DELETE += raw2tiff
+endif
 ifeq ($(BR2_PACKAGE_TIFF_TIFF2PDF),)
 	TIFF_TOOLS_TO_DELETE += tiff2pdf
 endif
+ifeq ($(BR2_PACKAGE_TIFF_TIFF2PS),)
+	TIFF_TOOLS_TO_DELETE += tiff2ps
+endif
 ifeq ($(BR2_PACKAGE_TIFF_TIFFCP),)
 	TIFF_TOOLS_TO_DELETE += tiffcp
 endif
-- 
1.7.10.4
