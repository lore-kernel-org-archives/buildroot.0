From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 28 May 2017 16:05:16 +0200
Subject: [Buildroot] [PATCH/next] package/fltk: bump version to 1.3.4-1
Message-ID: <20170528140516.15901-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch 0002-jpeg-9.patch, applied upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/fltk/0002-jpeg-9.patch | 26 --------------------------
 package/fltk/fltk.hash         |  6 +++---
 package/fltk/fltk.mk           |  4 ++--
 3 files changed, 5 insertions(+), 31 deletions(-)
 delete mode 100644 package/fltk/0002-jpeg-9.patch

diff --git a/package/fltk/0002-jpeg-9.patch b/package/fltk/0002-jpeg-9.patch
deleted file mode 100644
index 11ae85ee2..000000000
--- a/package/fltk/0002-jpeg-9.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From http://www.fltk.org/str.php?L2920
-However it's not yet applied apparently until bundled jpeg is upgraded.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura fltk-1.3.2.orig/src/Fl_JPEG_Image.cxx fltk-1.3.2/src/Fl_JPEG_Image.cxx
---- fltk-1.3.2.orig/src/Fl_JPEG_Image.cxx	2014-07-03 12:56:27.731197463 -0300
-+++ fltk-1.3.2/src/Fl_JPEG_Image.cxx	2014-07-03 12:56:57.907218257 -0300
-@@ -155,7 +155,7 @@
-   
-   jpeg_create_decompress(&dinfo);
-   jpeg_stdio_src(&dinfo, fp);
--  jpeg_read_header(&dinfo, 1);
-+  jpeg_read_header(&dinfo, TRUE);
-   
-   dinfo.quantize_colors      = (boolean)FALSE;
-   dinfo.out_color_space      = JCS_RGB;
-@@ -333,7 +333,7 @@
-   
-   jpeg_create_decompress(&dinfo);
-   jpeg_mem_src(&dinfo, data);
--  jpeg_read_header(&dinfo, 1);
-+  jpeg_read_header(&dinfo, TRUE);
-   
-   dinfo.quantize_colors      = (boolean)FALSE;
-   dinfo.out_color_space      = JCS_RGB;
diff --git a/package/fltk/fltk.hash b/package/fltk/fltk.hash
index 7b9b67dcf..af968aac7 100644
--- a/package/fltk/fltk.hash
+++ b/package/fltk/fltk.hash
@@ -1,4 +1,4 @@
-# From http://www.fltk.org/software.php?VERSION=1.3.3
-md5	9ccdb0d19dc104b87179bd9fd10822e3	fltk-1.3.3-source.tar.gz
+# From http://www.fltk.org/software.php?VERSION=1.3.4
+md5 d7fcd27ab928648e1a1366dd2e273970 fltk-1.3.4-1-source.tar.gz
 # Locally generated
-sha256	f8398d98d7221d40e77bc7b19e761adaf2f1ef8bb0c30eceb7beb4f2273d0d97	fltk-1.3.3-source.tar.gz
+sha256 7fb2c8882433ce694e6900c94fda505e8f4ed3fa9c7e597007098a33b85c53f4  fltk-1.3.4-1-source.tar.gz
diff --git a/package/fltk/fltk.mk b/package/fltk/fltk.mk
index 7ad717bf4..611d79da5 100644
--- a/package/fltk/fltk.mk
+++ b/package/fltk/fltk.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-FLTK_VERSION = 1.3.3
-FLTK_SOURCE = fltk-$(FLTK_VERSION)-source.tar.gz
+FLTK_VERSION = 1.3.4
+FLTK_SOURCE = fltk-$(FLTK_VERSION)-1-source.tar.gz
 FLTK_SITE = http://fltk.org/pub/fltk/$(FLTK_VERSION)
 FLTK_INSTALL_STAGING = YES
 # We force --libdir=/usr/lib, because by default, it is set to
-- 
2.11.0
