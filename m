From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 26 Oct 2013 11:07:47 +0200
Subject: [Buildroot] [git commit] fbv: patch up support for libpng 1.5+
Message-ID: <20131026093658.B7E809BBC9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a784f7566e3dc67f963aa8bc4da296474d0e7fa8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fbv/fbv-1.0b-libpng15.patch |   24 ++++++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)

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
