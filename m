Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1305DE6FE46
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 20:02:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AA5D847C5;
	Fri,  6 Sep 2024 20:02:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eiFDipKe9q60; Fri,  6 Sep 2024 20:02:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8600847E0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8600847E0;
	Fri,  6 Sep 2024 20:02:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4690E1BF20B
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E39C40B47
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:58:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x9Ou0Y-aooAR for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:58:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6A1B408D9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6A1B408D9
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:58:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C2D7A7FC34; Fri,  6 Sep 2024 19:58:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 23 Aug 2024 16:57:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 12cc05e260495d254a002e0377d6be70670477a1
X-Git-Newrev: c7109e265cb6c179dd51a02637bb5f97f4767d21
X-Patchwork-Hint: ignore
Message-Id: <20240906195855.C2D7A7FC34@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fbv: change upstream,
 update version
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c7109e265cb6c179dd51a02637bb5f97f4767d21
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

After the official fbv download page is no longer available switch to
an hopefully active github fork.

Changes made to the Buildroot package:
- new active upstream fork (6 month old commits)
- use autoreconf to create configure
- remove all patches because they are no longer required
- upstream removed GIF support, so remove it here too
- license is unchanged, but full COPYING file is now included

Tested on a RPI5 with a PNG, BMP and JPEG picture.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  7 --
 Config.in.legacy                                   |  6 ++
 DEVELOPERS                                         |  1 +
 package/fbv/0001-cross.patch                       | 44 ------------
 ...ion-instead-of-a-macro-for-jpeg-detection.patch | 29 ++++++++
 .../fbv/0002-fix-24bpp-support-on-big-endian.patch | 32 ---------
 package/fbv/0003-fix-bgr555.patch                  | 64 -----------------
 package/fbv/0004-giflib.patch                      | 84 ----------------------
 package/fbv/0005-include.patch                     | 20 ------
 package/fbv/0006-libpng15.patch                    | 24 -------
 package/fbv/0007-gif.c-fic-build-with-gcc-10.patch | 36 ----------
 package/fbv/Config.in                              | 13 +---
 package/fbv/fbv.hash                               |  4 +-
 package/fbv/fbv.mk                                 | 30 +-------
 14 files changed, 44 insertions(+), 350 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 3580d49430..778e3b8651 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -499,13 +499,6 @@ package/fbterm/0001-fbio.cpp-improxy.cpp-fbterm.cpp-fix-musl-compile.patch lib_p
 package/fbterm/0002-mouse.cpp-fix-musl-compile.patch lib_patch.Upstream
 package/fbterm/0003-C++11-compliance.patch lib_patch.Upstream
 package/fbterm/0004-iconv.patch lib_patch.Upstream
-package/fbv/0001-cross.patch lib_patch.Sob lib_patch.Upstream
-package/fbv/0002-fix-24bpp-support-on-big-endian.patch lib_patch.Sob lib_patch.Upstream
-package/fbv/0003-fix-bgr555.patch lib_patch.Upstream
-package/fbv/0004-giflib.patch lib_patch.Upstream
-package/fbv/0005-include.patch lib_patch.Sob lib_patch.Upstream
-package/fbv/0006-libpng15.patch lib_patch.Upstream
-package/fbv/0007-gif.c-fic-build-with-gcc-10.patch lib_patch.Upstream
 package/fcgiwrap/0001-use-LIBS-from-configure.patch lib_patch.Upstream
 package/fcgiwrap/0002-link-with-libsystemd-instead-of-libsystemd-daemon.patch lib_patch.Upstream
 package/ffmpeg/0001-swscale-x86-yuv2rgb-Fix-build-without-SSSE3.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index 03f4e4f95c..bbfc6b359e 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2024.11"
 
+config BR2_PACKAGE_FBV_GIF
+	bool "fbv GIF support has been removed"
+	select BR2_LEGACY
+	help
+	  Fbv GIF support has been removed, use PNG, BMP or JPEG.
+
 config BR2_BINUTILS_VERSION_2_40_X
 	bool "binutils 2.40 has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 9c119f2d6e..d2b64ee5c6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3298,6 +3298,7 @@ N:	Waldemar Brodkorb <wbx@openadk.org>
 F:	board/qemu/riscv32-virt/
 F:	configs/qemu_riscv32_nommu_virt_defconfig
 F:	package/asterisk/
+F:	package/fbv/
 F:	package/libjwt/
 F:	package/mksh/
 F:	package/ruby/
diff --git a/package/fbv/0001-cross.patch b/package/fbv/0001-cross.patch
deleted file mode 100644
index ab5f0fb48c..0000000000
--- a/package/fbv/0001-cross.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-diff -urpN fbv-1.0b.orig/configure fbv-1.0b/configure
---- fbv-1.0b.orig/configure	2004-09-07 13:29:27.000000000 +0200
-+++ fbv-1.0b/configure	2008-04-24 10:52:37.000000000 +0200
-@@ -80,6 +80,7 @@ while true ; do
- 	esac
- done
- 
-+[ -z "$CC" ] && CC=cc
- [ -z "$prefix" ] && prefix="/usr/local"
- [ -z "$bindir" ] && bindir="${prefix}/bin"
- [ -z "$mandir" ] && mandir="${prefix}/man"
-@@ -106,12 +107,12 @@ xdir="/usr/X11R6"
- ungif="no"
- echo "libungif check" >>./config.log
- echo "  1st:" >>./config.log
--cc 2>>./config.log >>./config.log -o \$\$~test \$\$~test.c -lungif $libs
-+$CC 2>>./config.log >>./config.log -o \$\$~test \$\$~test.c -lungif $libs
- if [ -e \$\$~test ]; then
- 	libs="-lungif $libs" ; ungif="yes"
- else
- 	echo "  2nd: -lX11 -L$xdir/lib" >>./config.log
--	cc 2>>./config.log >>./config.log -o \$\$~test \$\$~test.c -lungif -lX11 -L$xdir/lib $libs
-+	$CC 2>>./config.log >>./config.log -o \$\$~test \$\$~test.c -lungif -lX11 -L$xdir/lib $libs
- 	if [ -e \$\$~test ]; then
- 	libs="-lungif -lX11 -L$xdir/lib $libs" ; ungif="yes"
- 	fi
-@@ -124,7 +125,7 @@ echo "libungif: $ungif" >> ./config.log
- echo -n "checking for libjpeg presence... "
- if [ "$jpeg" != "disabled" ]; then
- jpeg="no"
--cc 2>>./config.log >>./config.log -o \$\$~test \$\$~test.c -ljpeg $libs
-+$CC 2>>./config.log >>./config.log -o \$\$~test \$\$~test.c -ljpeg $libs
- if [ -e \$\$~test ]; then
- 	libs="-ljpeg $libs" ; jpeg="yes"
- fi
-@@ -135,7 +136,7 @@ echo "libjpeg: $jpeg" >> ./config.log
- echo -n "checking for libpng presence... "
- if [ "$png" != "disabled" ]; then
- png="no"
--cc 2>>./config.log >>./config.log -o \$\$~test \$\$~test.c -lpng $libs
-+$CC 2>>./config.log >>./config.log -o \$\$~test \$\$~test.c -lpng $libs
- if [ -e \$\$~test ]; then
- 	libs="-lpng $libs" ; png="yes"
- fi
diff --git a/package/fbv/0001-use-a-function-instead-of-a-macro-for-jpeg-detection.patch b/package/fbv/0001-use-a-function-instead-of-a-macro-for-jpeg-detection.patch
new file mode 100644
index 0000000000..131dafc5c1
--- /dev/null
+++ b/package/fbv/0001-use-a-function-instead-of-a-macro-for-jpeg-detection.patch
@@ -0,0 +1,29 @@
+From 3547055ba135dc1d8aacea68f16456aabb8c0a91 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Fri, 23 Aug 2024 06:11:43 +0200
+Subject: [PATCH] use a function instead of a macro for jpeg detection
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: https://github.com/amadvance/fbv/pull/1
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 3fa4666..fc65903 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -28,8 +28,8 @@ AC_SEARCH_LIBS([png_create_read_struct], [png], [
+ 	]
+ )
+ 
+-AC_SEARCH_LIBS([jpeg_create_decompress], [jpeg], [
+-	LIBS="-ljpeg"
++AC_SEARCH_LIBS([jpeg_start_decompress], [jpeg], [
++	LIBS="$LIBS -ljpeg"
+ 	CFLAGS="$CFLAGS -DFBV_SUPPORT_JPEG"
+ 	], [
+ 	]
+-- 
+2.39.2
+
diff --git a/package/fbv/0002-fix-24bpp-support-on-big-endian.patch b/package/fbv/0002-fix-24bpp-support-on-big-endian.patch
deleted file mode 100644
index 23185ac46b..0000000000
--- a/package/fbv/0002-fix-24bpp-support-on-big-endian.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-diff -upr a/fb_display.c b/fb_display.c
---- a/fb_display.c	2007-06-01 16:52:45.000000000 +0200
-+++ b/fb_display.c	2007-06-01 16:51:43.000000000 +0200
-@@ -307,7 +307,7 @@ void* convertRGB2FB(int fh, unsigned cha
- {
-     unsigned long i;
-     void *fbbuff = NULL;
--	u_int8_t  *c_fbbuff;
-+    u_int8_t  *c_fbbuff;
-     u_int16_t *s_fbbuff;
-     u_int32_t *i_fbbuff;
- 
-@@ -335,6 +335,16 @@ void* convertRGB2FB(int fh, unsigned cha
- 	    fbbuff = (void *) s_fbbuff;
- 	    break;
- 	case 24:
-+	    *cpp = 3;
-+	    c_fbbuff = (unsigned char *) malloc(count * 3 * sizeof(unsigned char));
-+	    for(i = 0; i < (3 * count); i += 3) {
-+		/* Big endian framebuffer. */
-+		c_fbbuff[i] = rgbbuff[i+2];
-+		c_fbbuff[i+1] = rgbbuff[i+1];
-+		c_fbbuff[i+2] = rgbbuff[i];
-+	    }
-+	    fbbuff = (void *) c_fbbuff;
-+	    break;
- 	case 32:
- 	    *cpp = 4;
- 	    i_fbbuff = (unsigned int *) malloc(count * sizeof(unsigned int));
-Only in build_avr32/fbv-1.0b-modified: .fb_display.c.swp
-Binary files build_avr32/fbv-1.0b/fb_display.o and build_avr32/fbv-1.0b-modified/fb_display.o differ
-Binary files build_avr32/fbv-1.0b/fbv and build_avr32/fbv-1.0b-modified/fbv differ
diff --git a/package/fbv/0003-fix-bgr555.patch b/package/fbv/0003-fix-bgr555.patch
deleted file mode 100644
index 8f185f0a37..0000000000
--- a/package/fbv/0003-fix-bgr555.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-[PATCH] fbv: support bgr555 format
-
-Signed-off-by: Josh.Wu <josh.wu@atmel.com>
-diff -Naur fbv-1.0b-ori/fb_display.c fbv-1.0b/fb_display.c
---- fbv-1.0b-ori/fb_display.c	2010-04-02 09:38:15.000000000 +0800
-+++ fbv-1.0b/fb_display.c	2010-04-01 18:54:15.000000000 +0800
-@@ -297,6 +297,14 @@
- 	 ((b >> 3) & 31)        );
- }
- 
-+inline static unsigned short make15color_bgr(unsigned char r, unsigned char g, unsigned char b)
-+{
-+    return (
-+	(((b >> 3) & 31) << 10) |
-+	(((g >> 3) & 31) << 5)  |
-+	 ((r >> 3) & 31)        );
-+}
-+
- inline static unsigned short make16color(unsigned char r, unsigned char g, unsigned char b)
- {
-     return (
-@@ -313,6 +321,14 @@
-     u_int16_t *s_fbbuff;
-     u_int32_t *i_fbbuff;
- 
-+    int is_bgr555 = 0;
-+    struct fb_var_screeninfo var;
-+    getVarScreenInfo(fh, &var);
-+    if(var.red.offset == 0 && 
-+       var.green.offset == 5 && 
-+       var.blue.offset == 10)
-+	is_bgr555 = 1;
-+
-     switch(bpp)
-     {
- 	case 8:
-@@ -325,15 +341,23 @@
- 	case 15:
- 	    *cpp = 2;
- 	    s_fbbuff = (unsigned short *) malloc(count * sizeof(unsigned short));
--	    for(i = 0; i < count ; i++)
--		s_fbbuff[i] = make15color(rgbbuff[i*3], rgbbuff[i*3+1], rgbbuff[i*3+2]);
-+	    if(is_bgr555)
-+	    	for(i = 0; i < count ; i++)
-+		    s_fbbuff[i] = make15color_bgr(rgbbuff[i*3], rgbbuff[i*3+1], rgbbuff[i*3+2]);
-+	    else
-+	    	for(i = 0; i < count ; i++)
-+		    s_fbbuff[i] = make15color(rgbbuff[i*3], rgbbuff[i*3+1], rgbbuff[i*3+2]);
- 	    fbbuff = (void *) s_fbbuff;
- 	    break;
- 	case 16:
- 	    *cpp = 2;
- 	    s_fbbuff = (unsigned short *) malloc(count * sizeof(unsigned short));
--	    for(i = 0; i < count ; i++)
--		s_fbbuff[i] = make16color(rgbbuff[i*3], rgbbuff[i*3+1], rgbbuff[i*3+2]);
-+	    if(is_bgr555)
-+	    	for(i = 0; i < count ; i++)
-+		    s_fbbuff[i] = make15color_bgr(rgbbuff[i*3], rgbbuff[i*3+1], rgbbuff[i*3+2]);
-+	    else
-+	    	for(i = 0; i < count ; i++)
-+		    s_fbbuff[i] = make16color(rgbbuff[i*3], rgbbuff[i*3+1], rgbbuff[i*3+2]);
- 	    fbbuff = (void *) s_fbbuff;
- 	    break;
- 	case 24:
diff --git a/package/fbv/0004-giflib.patch b/package/fbv/0004-giflib.patch
deleted file mode 100644
index 7043353586..0000000000
--- a/package/fbv/0004-giflib.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-Adjust source code to work with giflib 5.1x
-
-Downloaded patch for gif.c from
-https://projects.archlinux.org/svntogit/community.git/plain/trunk/giflib-5.1.patch?h=packages/fbv
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -wbBur fbv-1.0b/gif.c fbv-1.0b.my/gif.c
---- fbv-1.0b/gif.c	2003-08-25 00:23:02.000000000 +0400
-+++ fbv-1.0b.my/gif.c	2014-05-29 18:39:41.337332872 +0400
-@@ -31,10 +31,10 @@
- #include <string.h>
- #define min(a,b) ((a) < (b) ? (a) : (b))
- #define gflush return(FH_ERROR_FILE);
--#define grflush { DGifCloseFile(gft); return(FH_ERROR_FORMAT); }
--#define mgrflush { free(lb); free(slb); DGifCloseFile(gft); return(FH_ERROR_FORMAT); }
-+#define grflush { DGifCloseFile(gft, NULL); return(FH_ERROR_FORMAT); }
-+#define mgrflush { free(lb); free(slb); DGifCloseFile(gft, NULL); return(FH_ERROR_FORMAT); }
- #define agflush return(FH_ERROR_FORMAT);
--#define agrflush { DGifCloseFile(gft); return(FH_ERROR_FORMAT); }
-+#define agrflush { DGifCloseFile(gft, NULL); return(FH_ERROR_FORMAT); }
- 
- 
- int fh_gif_id(char *name)
-@@ -81,7 +81,7 @@
-     ColorMapObject *cmap;
-     int cmaps;
- 
--    gft=DGifOpenFileName(name);
-+    gft=DGifOpenFileName(name, NULL);
-     if(gft==NULL){printf("err5\n"); gflush;} //////////
-     do
-     {
-@@ -170,7 +170,7 @@
- 	}
-     }
-     while( rt!= TERMINATE_RECORD_TYPE );
--    DGifCloseFile(gft);
-+    DGifCloseFile(gft, NULL);
-     return(FH_ERROR_OK);
- }
- 
-@@ -184,7 +184,7 @@
-     int extcode;
-     GifRecordType rt;
- 
--    gft=DGifOpenFileName(name);
-+    gft=DGifOpenFileName(name, NULL);
-     if(gft==NULL) gflush;
-     do
-     {
-@@ -197,7 +197,7 @@
- 		px=gft->Image.Width;
- 		py=gft->Image.Height;
- 		*x=px; *y=py;
--		DGifCloseFile(gft);
-+		DGifCloseFile(gft, NULL);
- 		return(FH_ERROR_OK);
- 		break;
- 	    case EXTENSION_RECORD_TYPE:
-@@ -210,7 +210,7 @@
- 	}  
-     }
-     while( rt!= TERMINATE_RECORD_TYPE );
--    DGifCloseFile(gft);
-+    DGifCloseFile(gft, NULL);
-     return(FH_ERROR_FORMAT);
- }
- #endif
-diff -uNr fbv-1.0b.org/configure fbv-1.0b/configure
---- fbv-1.0b.org/configure	2004-09-07 13:29:27.000000000 +0200
-+++ fbv-1.0b/configure	2015-01-29 19:58:30.374599874 +0100
-@@ -106,9 +106,9 @@
- ungif="no"
- echo "libungif check" >>./config.log
- echo "  1st:" >>./config.log
--$CC 2>>./config.log >>./config.log -o \$\$~test \$\$~test.c -lungif $libs
-+$CC 2>>./config.log >>./config.log -o \$\$~test \$\$~test.c -lgif $libs
- if [ -e \$\$~test ]; then
--	libs="-lungif $libs" ; ungif="yes"
-+	libs="-lgif $libs" ; ungif="yes"
- else
- 	echo "  2nd: -lX11 -L$xdir/lib" >>./config.log
- 	$CC 2>>./config.log >>./config.log -o \$\$~test \$\$~test.c -lungif -lX11 -L$xdir/lib $libs
diff --git a/package/fbv/0005-include.patch b/package/fbv/0005-include.patch
deleted file mode 100644
index 3d1cc17f74..0000000000
--- a/package/fbv/0005-include.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-diff -urpN fbv-1.0b.orig/fb_display.c fbv-1.0b/fb_display.c
---- fbv-1.0b.orig/fb_display.c	2004-09-07 14:09:43.000000000 +0200
-+++ fbv-1.0b/fb_display.c	2008-04-24 10:48:29.000000000 +0200
-@@ -18,8 +18,6 @@
-     Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
- */
- 
--#include <linux/fb.h>
--
- #include <stdio.h>
- #include <stdlib.h>
- #include <sys/types.h>
-@@ -31,6 +29,7 @@
- #include <asm/types.h>
- #include <string.h>
- #include <errno.h>
-+#include <linux/fb.h>
- #include "config.h"
- /* Public Use Functions:
-  *
diff --git a/package/fbv/0006-libpng15.patch b/package/fbv/0006-libpng15.patch
deleted file mode 100644
index 7872a73cf6..0000000000
--- a/package/fbv/0006-libpng15.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Support for libpng 1.5+ shamelessly taken from Gentoo.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
---- a/png.c
-+++ b/png.c
-@@ -69,7 +69,7 @@
-         fclose(fh); return(FH_ERROR_FORMAT);
-     }
-     rp=0;
--    if (setjmp(png_ptr->jmpbuf))
-+    if (setjmp(png_jmpbuf(png_ptr)))
-     {
- 	png_destroy_read_struct(&png_ptr, &info_ptr, (png_infopp)NULL);
-         if(rp) free(rp);
-@@ -161,7 +161,7 @@
-         fclose(fh); return(FH_ERROR_FORMAT);
-     }
-     rp=0;
--    if (setjmp(png_ptr->jmpbuf))
-+    if (setjmp(png_jmpbuf(png_ptr)))
-     {
- 	png_destroy_read_struct(&png_ptr, &info_ptr, (png_infopp)NULL);
-         if(rp) free(rp);
diff --git a/package/fbv/0007-gif.c-fic-build-with-gcc-10.patch b/package/fbv/0007-gif.c-fic-build-with-gcc-10.patch
deleted file mode 100644
index 57d5777b61..0000000000
--- a/package/fbv/0007-gif.c-fic-build-with-gcc-10.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 8877207b290da1c3bc100f2705c30e6bdafcd985 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 26 May 2022 23:59:46 +0200
-Subject: [PATCH] gif.c: fic build with gcc >= 10
-
-Fix the following build failure with gcc >= 10::
-
-/nvmedata/autobuild/instance-30/output-1/per-package/fbv/host/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/11.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: gif.o: in function `fh_gif_load':
-gif.c:(.text+0x338): undefined reference to `m_rend_gif_decodecolormap'
-
-Fixes:
- - http://autobuild.buildroot.org/results/dca603a61b1fd0558992b4a40152d23b5b9c0049
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: not upstreamable (most active fork dropped gif
-support: https://github.com/godspeed1989/fbv/pull/17)]
----
- gif.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gif.c b/gif.c
-index 689e549..5560f25 100644
---- a/gif.c
-+++ b/gif.c
-@@ -48,7 +48,7 @@ int fh_gif_id(char *name)
-     return(0);
- }
- 
--inline void m_rend_gif_decodecolormap(unsigned char *cmb,unsigned char *rgbb,ColorMapObject *cm,int s,int l, int transparency)
-+static inline void m_rend_gif_decodecolormap(unsigned char *cmb,unsigned char *rgbb,ColorMapObject *cm,int s,int l, int transparency)
- {
-     GifColorType *cmentry;
-     int i;
--- 
-2.35.1
-
diff --git a/package/fbv/Config.in b/package/fbv/Config.in
index 2206276334..1d11bfb3ef 100644
--- a/package/fbv/Config.in
+++ b/package/fbv/Config.in
@@ -2,10 +2,10 @@ config BR2_PACKAGE_FBV
 	bool "fbv"
 	help
 	  fbv is a very simple graphic file viewer for the framebuffer
-	  console, capable of displaying GIF, JPEG, PNG and BMP files
-	  using libungif, libjpeg and libpng.
+	  console, capable of displaying JPEG, PNG and BMP files
+	  using libjpeg and libpng.
 
-	  http://freshmeat.net/projects/fbv/
+	  https://github.com/amadvance/fbv
 
 if BR2_PACKAGE_FBV
 
@@ -23,11 +23,4 @@ config BR2_PACKAGE_FBV_JPEG
 	help
 	  Enable support for JPEG using IJG's libjpeg.
 
-config BR2_PACKAGE_FBV_GIF
-	bool "GIF support"
-	default y
-	select BR2_PACKAGE_GIFLIB
-	help
-	  Enable support for GIF using giflib.
-
 endif # BR2_PACKAGE_FBV
diff --git a/package/fbv/fbv.hash b/package/fbv/fbv.hash
index 3f25465ba1..94a8165051 100644
--- a/package/fbv/fbv.hash
+++ b/package/fbv/fbv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9b55b9dafd5eb01562060d860e267e309a1876e8ba5ce4d3303484b94129ab3c  fbv-1.0b.tar.gz
-sha256  bf21d97bafcaacb5d6bc3d5502030c340f0e0593614078ab017af91e950083af  COPYING
+sha256  d18505f95546adb8175652e971d9ab3f2bece6ed21d72ff8e62881caa286a22b  fbv-7c2000804226ca860ca80f3baa993582e29aa1a2.tar.gz
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/fbv/fbv.mk b/package/fbv/fbv.mk
index a69e4ad518..f7a061dfd7 100644
--- a/package/fbv/fbv.mk
+++ b/package/fbv/fbv.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-FBV_VERSION = 1.0b
-FBV_SITE = http://s-tech.elsat.net.pl/fbv
-
+FBV_VERSION = 7c2000804226ca860ca80f3baa993582e29aa1a2
+FBV_SITE = $(call github,amadvance,fbv,$(FBV_VERSION))
 FBV_LICENSE = GPL-2.0
 FBV_LICENSE_FILES = COPYING
+FBV_AUTORECONF = YES
 
 ### image format dependencies and configure options
 FBV_DEPENDENCIES = # empty
@@ -29,29 +29,5 @@ FBV_DEPENDENCIES += jpeg
 else
 FBV_CONFIGURE_OPTS += --without-libjpeg
 endif
-ifeq ($(BR2_PACKAGE_FBV_GIF),y)
-FBV_DEPENDENCIES += giflib
-else
-FBV_CONFIGURE_OPTS += --without-libungif
-endif
-
-#fbv doesn't support cross-compilation
-define FBV_CONFIGURE_CMDS
-	(cd $(FBV_DIR); rm -f config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure \
-		--prefix=/usr \
-		$(FBV_CONFIGURE_OPTS) \
-	)
-endef
-
-define FBV_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
-endef
-
-define FBV_INSTALL_TARGET_CMDS
-	$(INSTALL) -D $(@D)/fbv $(TARGET_DIR)/usr/bin/fbv
-endef
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
