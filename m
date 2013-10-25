From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 25 Oct 2013 08:34:40 -0300
Subject: [Buildroot] [PATCH 3/4] fbv: patch up support for libpng 1.5+
In-Reply-To: <1382700881-28336-1-git-send-email-gustavo@zacarias.com.ar>
References: <1382700881-28336-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1382700881-28336-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/fbv/fbv-1.0b-libpng15.patch | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 package/fbv/fbv-1.0b-libpng15.patch

diff --git a/package/fbv/fbv-1.0b-libpng15.patch b/package/fbv/fbv-1.0b-libpng15.patch
new file mode 100644
index 0000000..7872a73
--- /dev/null
+++ b/package/fbv/fbv-1.0b-libpng15.patch
@@ -0,0 +1,24 @@
+Support for libpng 1.5+ shamelessly taken from Gentoo.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+--- a/png.c
++++ b/png.c
+@@ -69,7 +69,7 @@
+         fclose(fh); return(FH_ERROR_FORMAT);
+     }
+     rp=0;
+-    if (setjmp(png_ptr->jmpbuf))
++    if (setjmp(png_jmpbuf(png_ptr)))
+     {
+ 	png_destroy_read_struct(&png_ptr, &info_ptr, (png_infopp)NULL);
+         if(rp) free(rp);
+@@ -161,7 +161,7 @@
+         fclose(fh); return(FH_ERROR_FORMAT);
+     }
+     rp=0;
+-    if (setjmp(png_ptr->jmpbuf))
++    if (setjmp(png_jmpbuf(png_ptr)))
+     {
+ 	png_destroy_read_struct(&png_ptr, &info_ptr, (png_infopp)NULL);
+         if(rp) free(rp);
-- 
1.8.1.5
