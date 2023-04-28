Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B71C77B60
	for <buildroot@archiver.kernel.org>; Fri, 28 Apr 2023 12:25:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 992A742046;
	Fri, 28 Apr 2023 12:25:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 992A742046
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id crwKTvnAU5zL; Fri, 28 Apr 2023 12:25:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3045942052;
	Fri, 28 Apr 2023 12:25:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3045942052
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 186E11BF584
 for <buildroot@lists.busybox.net>; Fri, 28 Apr 2023 12:25:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E46B742052
 for <buildroot@lists.busybox.net>; Fri, 28 Apr 2023 12:25:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E46B742052
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ES5E2mU8OlP8 for <buildroot@lists.busybox.net>;
 Fri, 28 Apr 2023 12:25:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D55742046
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3D55742046
 for <buildroot@buildroot.org>; Fri, 28 Apr 2023 12:25:10 +0000 (UTC)
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
 by mailout02.t-online.de (Postfix) with SMTP id D6ED321009;
 Fri, 28 Apr 2023 14:24:20 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.3.195]) by fwd71.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1psN9A-0h1sUz0; Fri, 28 Apr 2023 14:24:20 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:42750)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1psN9A-0001bl-0V;
 Fri, 28 Apr 2023 14:24:20 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Fri, 28 Apr 2023 14:24:20 +0200
Message-Id: <20230428122420.211802-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1682684660-8CFF6C12-A2C284BE/0/0 CLEAN NORMAL
X-TOI-MSGID: 91fda5f8-1bb1-4343-a4a8-51f067bbd4a4
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: bump version to 4.4.4
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://git.videolan.org/?p=ffmpeg.git;a=blob;f=Changelog;hb=refs/heads/release/4.4

Rebased all patches, switched _SITE to https.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0001-swscale-x86-yuv2rgb-Fix-build-without-SSSE3.patch    | 4 ++--
 package/ffmpeg/0003-libavutil-Fix-mips-build.patch            | 4 ++--
 .../0004-configure-add-extralibs-to-extralibs_xxx.patch       | 2 +-
 package/ffmpeg/Config.in                                      | 2 +-
 package/ffmpeg/ffmpeg.hash                                    | 2 +-
 package/ffmpeg/ffmpeg.mk                                      | 4 ++--
 6 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/ffmpeg/0001-swscale-x86-yuv2rgb-Fix-build-without-SSSE3.patch b/package/ffmpeg/0001-swscale-x86-yuv2rgb-Fix-build-without-SSSE3.patch
index 951ce4186d..9c1baaa651 100644
--- a/package/ffmpeg/0001-swscale-x86-yuv2rgb-Fix-build-without-SSSE3.patch
+++ b/package/ffmpeg/0001-swscale-x86-yuv2rgb-Fix-build-without-SSSE3.patch
@@ -22,7 +22,7 @@ diff --git a/libswscale/x86/yuv2rgb.c b/libswscale/x86/yuv2rgb.c
 index c12e88cbb5..4791e5b93a 100644
 --- a/libswscale/x86/yuv2rgb.c
 +++ b/libswscale/x86/yuv2rgb.c
-@@ -83,6 +83,7 @@ av_cold SwsFunc ff_yuv2rgb_init_x86(SwsContext *c)
+@@ -71,6 +71,7 @@ av_cold SwsFunc ff_yuv2rgb_init_x86(SwsContext *c)
  #if HAVE_X86ASM
      int cpu_flags = av_get_cpu_flags();
  
@@ -30,7 +30,7 @@ index c12e88cbb5..4791e5b93a 100644
      if (EXTERNAL_SSSE3(cpu_flags)) {
          switch (c->dstFormat) {
          case AV_PIX_FMT_RGB32:
-@@ -111,6 +112,7 @@ av_cold SwsFunc ff_yuv2rgb_init_x86(SwsContext *c)
+@@ -99,6 +100,7 @@ av_cold SwsFunc ff_yuv2rgb_init_x86(SwsContext *c)
              return yuv420_rgb15_ssse3;
          }
      }
diff --git a/package/ffmpeg/0003-libavutil-Fix-mips-build.patch b/package/ffmpeg/0003-libavutil-Fix-mips-build.patch
index 8b81e66981..8dd689f5d0 100644
--- a/package/ffmpeg/0003-libavutil-Fix-mips-build.patch
+++ b/package/ffmpeg/0003-libavutil-Fix-mips-build.patch
@@ -20,7 +20,7 @@ diff --git a/configure b/configure
 index 6bfd98b384..773a7d516c 100755
 --- a/configure
 +++ b/configure
-@@ -2161,6 +2161,7 @@ HEADERS_LIST="
+@@ -2135,6 +2135,7 @@ HEADERS_LIST="
      opencv2_core_core_c_h
      OpenGL_gl3_h
      poll_h
@@ -28,7 +28,7 @@ index 6bfd98b384..773a7d516c 100755
      sys_param_h
      sys_resource_h
      sys_select_h
-@@ -6218,6 +6219,7 @@ check_func_headers VideoToolbox/VTCompressionSession.h VTCompressionSessionPrepa
+@@ -6182,6 +6183,7 @@ check_func_headers VideoToolbox/VTCompressionSession.h VTCompressionSessionPrepa
  check_headers windows.h
  check_headers X11/extensions/XvMClib.h
  check_headers asm/types.h
diff --git a/package/ffmpeg/0004-configure-add-extralibs-to-extralibs_xxx.patch b/package/ffmpeg/0004-configure-add-extralibs-to-extralibs_xxx.patch
index dbc19c1cec..3247ab08fe 100644
--- a/package/ffmpeg/0004-configure-add-extralibs-to-extralibs_xxx.patch
+++ b/package/ffmpeg/0004-configure-add-extralibs-to-extralibs_xxx.patch
@@ -17,7 +17,7 @@ diff --git a/configure b/configure
 index 0bb3a7cf2b..3bda99e415 100755
 --- a/configure
 +++ b/configure
-@@ -7602,15 +7602,15 @@ rpath=$(enabled rpath && echo "-Wl,-rpath,\${libdir}")
+@@ -7715,15 +7715,15 @@ rpath=$(enabled rpath && echo "-Wl,-rpath,\${libdir}")
  source_path=${source_path}
  LIBPREF=${LIBPREF}
  LIBSUF=${LIBSUF}
diff --git a/package/ffmpeg/Config.in b/package/ffmpeg/Config.in
index 2efef7dd86..52029c2ade 100644
--- a/package/ffmpeg/Config.in
+++ b/package/ffmpeg/Config.in
@@ -22,7 +22,7 @@ menuconfig BR2_PACKAGE_FFMPEG
 	  FFmpeg is a complete, cross-platform solution to record,
 	  convert and stream audio and video.
 
-	  http://www.ffmpeg.org
+	  https://www.ffmpeg.org
 
 if BR2_PACKAGE_FFMPEG
 
diff --git a/package/ffmpeg/ffmpeg.hash b/package/ffmpeg/ffmpeg.hash
index c9d7ea7c41..b18218cb48 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  6c5b6c195e61534766a0b5fe16acc919170c883362612816d0a1c7f4f947006e  ffmpeg-4.4.3.tar.xz
+sha256  e80b380d595c809060f66f96a5d849511ef4a76a26b76eacf5778b94c3570309  ffmpeg-4.4.4.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
 sha256  b634ab5640e258563c536e658cad87080553df6f34f62269a21d554844e58bfe  COPYING.LGPLv2.1
 sha256  cb48bf09a11f5fb576cddb0431c8f5ed0a60157a9ec942adffc13907cbe083f2  LICENSE.md
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 136e3e24ca..59e13b503e 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 4.4.3
+FFMPEG_VERSION = 4.4.4
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
-FFMPEG_SITE = http://ffmpeg.org/releases
+FFMPEG_SITE = https://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
 
 FFMPEG_LICENSE = LGPL-2.1+, libjpeg license
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
