From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  3 Jul 2014 13:01:45 -0300
Subject: [Buildroot] [PATCH] fltk: fix build failure with newer jpeg
	libraries
Message-ID: <1404403305-22479-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/978/9786ab41117fbe760e4e8ae40ccf37af55813728/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/fltk/fltk-02-jpeg-9.patch | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/fltk/fltk-02-jpeg-9.patch

diff --git a/package/fltk/fltk-02-jpeg-9.patch b/package/fltk/fltk-02-jpeg-9.patch
new file mode 100644
index 0000000..11ae85e
--- /dev/null
+++ b/package/fltk/fltk-02-jpeg-9.patch
@@ -0,0 +1,26 @@
+From http://www.fltk.org/str.php?L2920
+However it's not yet applied apparently until bundled jpeg is upgraded.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura fltk-1.3.2.orig/src/Fl_JPEG_Image.cxx fltk-1.3.2/src/Fl_JPEG_Image.cxx
+--- fltk-1.3.2.orig/src/Fl_JPEG_Image.cxx	2014-07-03 12:56:27.731197463 -0300
++++ fltk-1.3.2/src/Fl_JPEG_Image.cxx	2014-07-03 12:56:57.907218257 -0300
+@@ -155,7 +155,7 @@
+   
+   jpeg_create_decompress(&dinfo);
+   jpeg_stdio_src(&dinfo, fp);
+-  jpeg_read_header(&dinfo, 1);
++  jpeg_read_header(&dinfo, TRUE);
+   
+   dinfo.quantize_colors      = (boolean)FALSE;
+   dinfo.out_color_space      = JCS_RGB;
+@@ -333,7 +333,7 @@
+   
+   jpeg_create_decompress(&dinfo);
+   jpeg_mem_src(&dinfo, data);
+-  jpeg_read_header(&dinfo, 1);
++  jpeg_read_header(&dinfo, TRUE);
+   
+   dinfo.quantize_colors      = (boolean)FALSE;
+   dinfo.out_color_space      = JCS_RGB;
-- 
1.8.5.5
