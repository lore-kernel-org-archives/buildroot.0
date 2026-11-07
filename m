Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552B2606A330
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 11:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=LznCWklY
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 332B3606EA;
	Sat,  7 Nov 2026 11:26:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2dyGHQ-3mWCf; Sat,  7 Nov 2026 11:26:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8E92260719
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794050795;
	b=UU2KDqApiLlY5Segp2JGNgmZZbJVr5k1qtBH7zuyv6k5VnA7C7OjmyYEv5MgWnrooxos
	 1TZcLJUT909XSwKahh2ii4qbQT8W2j7lO5saGGrEm7EkeGejWpvEbk6+URvqST6jcpw5r
	 sPKt3SlotEfgpUWl0tpw+BWs6GtIJTIZibbMN0T+7Y6tdv9xEvoPx+QXPVbiRiOwO7OXs
	 6obI3pjvxXLof1MxHXzWqW04GYozTqvV20DRoD2QRxvx/5WhmG2rJgRe0viXPrWBFSnvH
	 +1Q5owHCkqUDMstS74RN5wyQYSJroxBN0YhzSeylaNaEHtyDw/0iFeQiaKaclAH58iA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794050795;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=Az4w9ZD1SWLH9JjEbtp1SklewbFljLCsbC726iPDOes=;
	b=eGRojG7e/kkjBCA2ctdTDCoshb61UBvSyT0fKvGD52aCDxJQFWYR71f+sPFF4UjP1Y4N
	 F+Xf3Egx9JTd5/kH1vT0OY6HPwdWNd4tn9L8lnEaZvKBvs+scDMh/AANtfQfydv63JvOS
	 N8KBzIo+tt5jGF8xQjXp/x4uvjWrdezPd0dtWDy9iu4Q3yRxU6dAgMCBahS07vSxJQJ47
	 5/6kojwSy5PD9JNIwGMJ7rilx4nN1QZtrk0/6bQoUi4ANm7gtdvCE5cQTrCw8LREwri0J
	 xuZkw+fleuLfS1ffbk+RKKGiKp3hS2hN89PEEth5eevc7iPZa2sOX1FCCwvvZ/QqJSw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794050795;
	bh=Az4w9ZD1SWLH9JjEbtp1SklewbFljLCsbC726iPDOes=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LznCWklY2pOhjHFbB4fqq7pbP5ZNeKYfa2xkCji968yvtzFjn37x5qJFzQsO8+vpO
	 quI0KwAnMLquaypAOtGw3DdVRzn0elvOXn1jbKdaxyzaqFQREHfmAQl1CGDm9F7rPg
	 zX8/x6eWbN0dFrYqbXpMNYOWnP9OVQi9Oyl6egyz6q05UsDo5LbE0miRvHUbvoI/ux
	 43eufBbPXBBQ4gu/JcUoRmpXYYqV7MzGvDVsx4sVW+av4ujBFjpYSJRARW38UN8yVY
	 571gSKVa/L+4PFE3ejSmdlSJL9YyerHK4ds5gOravHFcibE5yNTEAp3kpGD4z9j6Pj
	 hVSQQge/b+06A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E92260719;
	Sat,  7 Nov 2026 11:26:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BC44C32A
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 11:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1F47405CB
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 11:26:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KSgktYuJjs9l for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 11:26:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 18F34405D2
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 18F34405D2
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 11:26:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D8631818CC; Sat,  7 Nov 2026 11:24:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 7 Nov 2026 12:16:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aa1cdae7418e88022dc65dfe39e26d4bde14155e
X-Git-Newrev: acda85c85827c123a5238f3628009d8ae3ec0735
X-Patchwork-Hint: ignore
Message-Id: <20261107112456.D8631818CC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ffmpeg: bump version to 9.0.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7880325736563107776=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============7880325736563107776==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/acda85c85827c123a5238f3628009d8ae3ec0735
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Updated license hashes due to upstream commits:
https://git.videolan.org/?p=ffmpeg.git;a=commit;h=8d439b24839d486d1fcc858a2a5eb7ecd700e3a9
https://git.videolan.org/?p=ffmpeg.git;a=commit;h=8c920c4c396163e3b9a0b428dd550d3c986236aa

Removed patches 0005, 0006 & 0007 which are included in this release,
rebased remaining patches.

Added patch 0004 to fix a build error on armv5 which would be introduced
by this bump.

Removed configure option --disable-crystalhd due to upstream removal:
http://git.videolan.org/?p=ffmpeg.git;a=commitdiff;h=5b23b18d40ead8606c92d967279b3f43c94d8a60

Removed omx-related configure options due to upstream commit
https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/f31675400b9956f178e8743e4f9038a6fc1211d8

Contrary to the commit description libpostproc was removed from ffmpeg
tree:
https://git.videolan.org/?p=ffmpeg.git;a=commit;h=8c920c4c396163e3b9a0b428dd550d3c986236aa
https://lists.ffmpeg.org/archives/list/ffmpeg-devel@ffmpeg.org/thread/YPPWZBQF42TJX2AQXWXDMHRRREAKQ7US/#6VMF7HDCEU45NJB5TYJEUKGRXVNQ7V6D

The libpostproc code was removed from upstream ffmpeg but is still
needed for hardware-based deinterlacing using vaapi in Kodi.
We re-add the optional libpostproc code by using the diff file created
by ffmpeg upstream maintainer and provided for download by Kodi.
Due to changes by the libpostproc patch we need to update the hash of
LICENSE.md. For details see
https://github.com/michaelni/libpostproc/blob/master/README.md

Added patch for tvheadend to fix build errors introduced by this bump.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: replace "patch -p1" call with "$(APPLY_PATCHES)"]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                |  3 -
 ...scale-x86-yuv2rgb-Fix-build-without-SSSE3.patch | 24 +++---
 ...api_h264-skip-decode-if-pic-has-no-slices.patch | 13 +--
 package/ffmpeg/0003-libavutil-Fix-mips-build.patch | 17 ++--
 .../ffmpeg/0004-avutil-arm-fix-armv5-build.patch   | 47 ++++++++++
 package/ffmpeg/ffmpeg.hash                         |  5 +-
 package/ffmpeg/ffmpeg.mk                           | 15 +++-
 ...ing-use-the-new-lavc-supported-config-API.patch | 99 ++++++++++++++++++++++
 8 files changed, 188 insertions(+), 35 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index cd21cce1f8..25c668db54 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -319,9 +319,6 @@ package/fbterm/0003-C++11-compliance.patch lib_patch.Upstream
 package/fbterm/0004-iconv.patch lib_patch.Upstream
 package/fcgiwrap/0001-use-LIBS-from-configure.patch lib_patch.Upstream
 package/fcgiwrap/0002-link-with-libsystemd-instead-of-libsystemd-daemon.patch lib_patch.Upstream
-package/ffmpeg/0001-swscale-x86-yuv2rgb-Fix-build-without-SSSE3.patch lib_patch.Upstream
-package/ffmpeg/0002-avcodec-vaapi_h264-skip-decode-if-pic-has-no-slices.patch lib_patch.Upstream
-package/ffmpeg/0003-libavutil-Fix-mips-build.patch lib_patch.Upstream
 package/flatbuffers/0001-include-flatbuffers-base.h-fix-build-on-musl.patch lib_patch.Upstream
 package/flex/0001-build-AC_USE_SYSTEM_EXTENSIONS-in-configure.ac.patch lib_patch.Upstream
 package/flex/0002-build-make-it-possible-to-disable-the-build-of-the-f.patch lib_patch.Upstream
diff --git a/package/ffmpeg/0001-swscale-x86-yuv2rgb-Fix-build-without-SSSE3.patch b/package/ffmpeg/0001-swscale-x86-yuv2rgb-Fix-build-without-SSSE3.patch
index aa56e5a9b4..3c171c4ce7 100644
--- a/package/ffmpeg/0001-swscale-x86-yuv2rgb-Fix-build-without-SSSE3.patch
+++ b/package/ffmpeg/0001-swscale-x86-yuv2rgb-Fix-build-without-SSSE3.patch
@@ -7,11 +7,11 @@ commit fc6a5883d6af8cae0e96af84dda0ad74b360a084 breaks build on
 x86_64 CPUs which do not have SSSE3, e.g. AMD Phenom-II
 
 Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
-[bernd.kuhls@t-online.de:
-  - retrieved from upstream patchwork:
-    https://patchwork.ffmpeg.org/project/ffmpeg/patch/20200223122256.23402-1-michael@niedermayer.cc/
-]
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+Upstream: https://patchwork.ffmpeg.org/project/ffmpeg/patch/20200223122256.23402-1-michael@niedermayer.cc/
+
+[Bernd: rebased for 9.0]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 [yann.morin.1998@free.fr: fix reference top patchwork and SoB order]
 Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 ---
@@ -19,25 +19,25 @@ Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
  1 file changed, 2 insertions(+)
 
 diff --git a/libswscale/x86/yuv2rgb.c b/libswscale/x86/yuv2rgb.c
-index c12e88cbb5..4791e5b93a 100644
+index 2291c84e53..d4e23dce45 100644
 --- a/libswscale/x86/yuv2rgb.c
 +++ b/libswscale/x86/yuv2rgb.c
-@@ -70,6 +70,7 @@ av_cold SwsFunc ff_yuv2rgb_init_x86(SwsContext *c)
+@@ -243,6 +243,7 @@ av_cold SwsFunc ff_yuv2rgb_init_x86(SwsInternal *c)
  #if HAVE_X86ASM
      int cpu_flags = av_get_cpu_flags();
  
 +#if HAVE_SSSE3
      if (EXTERNAL_SSSE3(cpu_flags)) {
-         switch (c->dstFormat) {
+         switch (c->opts.dst_format) {
          case AV_PIX_FMT_RGB32:
-@@ -98,6 +99,7 @@ av_cold SwsFunc ff_yuv2rgb_init_x86(SwsContext *c)
-             return yuv420_rgb15_ssse3;
+@@ -275,6 +276,7 @@ av_cold SwsFunc ff_yuv2rgb_init_x86(SwsInternal *c)
+ #endif
          }
      }
 +#endif
  
-     if (EXTERNAL_MMXEXT(cpu_flags)) {
-         switch (c->dstFormat) {
+ #endif /* HAVE_X86ASM */
+     return NULL;
 -- 
 2.26.2
 
diff --git a/package/ffmpeg/0002-avcodec-vaapi_h264-skip-decode-if-pic-has-no-slices.patch b/package/ffmpeg/0002-avcodec-vaapi_h264-skip-decode-if-pic-has-no-slices.patch
index 2892df9d81..dfeb37b1e1 100644
--- a/package/ffmpeg/0002-avcodec-vaapi_h264-skip-decode-if-pic-has-no-slices.patch
+++ b/package/ffmpeg/0002-avcodec-vaapi_h264-skip-decode-if-pic-has-no-slices.patch
@@ -10,19 +10,19 @@ Corresponding kodi bug: https://github.com/xbmc/xbmc/issues/15704
 Downloaded from Kodi ffmpeg repo:
 https://github.com/xbmc/FFmpeg/commit/2c6b3f357331e203ad87214984661c40704aceb7
 
-Patch was sent upstream:
-http://ffmpeg.org/pipermail/ffmpeg-devel/2019-March/240863.html
+Upstream: http://ffmpeg.org/pipermail/ffmpeg-devel/2019-March/240863.html
 
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Bernd: rebased for 9.0]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  libavcodec/vaapi_h264.c | 5 +++++
  1 file changed, 5 insertions(+)
 
 diff --git a/libavcodec/vaapi_h264.c b/libavcodec/vaapi_h264.c
-index dd2a6571604..e521a05c4ff 100644
+index 7f00da09fc..01bbb42dbd 100644
 --- a/libavcodec/vaapi_h264.c
 +++ b/libavcodec/vaapi_h264.c
-@@ -314,6 +314,11 @@ static int vaapi_h264_end_frame(AVCodecContext *avctx)
+@@ -323,6 +323,11 @@ static int vaapi_h264_end_frame(AVCodecContext *avctx)
      H264SliceContext *sl = &h->slice_ctx[0];
      int ret;
  
@@ -34,3 +34,6 @@ index dd2a6571604..e521a05c4ff 100644
      ret = ff_vaapi_decode_issue(avctx, pic);
      if (ret < 0)
          goto finish;
+-- 
+2.47.3
+
diff --git a/package/ffmpeg/0003-libavutil-Fix-mips-build.patch b/package/ffmpeg/0003-libavutil-Fix-mips-build.patch
index aeb272c459..ce72514d67 100644
--- a/package/ffmpeg/0003-libavutil-Fix-mips-build.patch
+++ b/package/ffmpeg/0003-libavutil-Fix-mips-build.patch
@@ -7,10 +7,9 @@ Check for sys/auxv.h because not all toolchains contain this header.
 
 Fixes https://trac.ffmpeg.org/ticket/9138
 
-Patch sent upstream:
-http://ffmpeg.org/pipermail/ffmpeg-devel/2021-June/281272.html
+Upstream: http://ffmpeg.org/pipermail/ffmpeg-devel/2021-June/281272.html
 
-[Bernd: rebased for version 6.1.2]
+[Bernd: rebased for 9.0]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 [Dario: make the patch to be applied with fuzz factor 0]
 Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
@@ -20,18 +19,18 @@ Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
  2 files changed, 5 insertions(+), 3 deletions(-)
 
 diff --git a/configure b/configure
-index a89cfa6d959d..6ec00df75312 100755
+index 374bd5c151..fbb108506d 100755
 --- a/configure
 +++ b/configure
-@@ -2227,6 +2227,7 @@ HEADERS_LIST="
-     OpenGL_gl3_h
+@@ -2480,6 +2480,7 @@ HEADERS_LIST="
+     malloc_h
      poll_h
      pthread_np_h
 +    sys_auxv_h
+     sys_hwprobe_h
      sys_param_h
      sys_resource_h
-     sys_select_h
-@@ -6472,6 +6473,7 @@ check_func_headers VideoToolbox/VTCompressionSession.h VTCompressionSessionPrepa
+@@ -7088,6 +7089,7 @@ check_func_headers VideoToolbox/VideoToolbox.h VTPixelTransferSessionCreate -fra
  check_func_headers VideoToolbox/VideoToolbox.h VTPixelRotationSessionCreate -framework VideoToolbox
  check_headers windows.h
  check_headers asm/types.h
@@ -40,7 +39,7 @@ index a89cfa6d959d..6ec00df75312 100755
  # it seems there are versions of clang in some distros that try to use the
  # gcc headers, which explodes for stdatomic
 diff --git a/libavutil/mips/cpu.c b/libavutil/mips/cpu.c
-index 59619d54dee3..19196de50b59 100644
+index 2009c70f71..3e1d44c2ff 100644
 --- a/libavutil/mips/cpu.c
 +++ b/libavutil/mips/cpu.c
 @@ -19,7 +19,7 @@
diff --git a/package/ffmpeg/0004-avutil-arm-fix-armv5-build.patch b/package/ffmpeg/0004-avutil-arm-fix-armv5-build.patch
new file mode 100644
index 0000000000..5f0a6bc325
--- /dev/null
+++ b/package/ffmpeg/0004-avutil-arm-fix-armv5-build.patch
@@ -0,0 +1,47 @@
+From d79bcb8ff738af8d15021cbe746c23cc245e03d6 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Fri, 30 Oct 2026 08:52:16 +0100
+Subject: [PATCH] avutil/arm: fix armv5 build
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/471db1d323aaed50ff922f0da76ecc8e45c4e817
+
+added armv6 optimizations and guarded the include with
+
+  #elif ARCH_ARM && HAVE_ARMV6
+
+but guarded the code only with
+
+  #elif ARCH_ARM
+
+causing a build error with armv5 toolchains:
+
+libavutil/pixelutils.c: In function ‘av_pixelutils_get_sad_fn’:
+libavutil/pixelutils.c:102:5: error: implicit declaration of function
+ ‘ff_pixelutils_sad_init_arm’ [-Wimplicit-function-declaration]
+
+Upstream: https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/6d1bfd760916ab52814b950692d1c1635d29f3c7
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ libavutil/pixelutils.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libavutil/pixelutils.c b/libavutil/pixelutils.c
+index 869af809eb..7631469163 100644
+--- a/libavutil/pixelutils.c
++++ b/libavutil/pixelutils.c
+@@ -30,7 +30,7 @@
+ 
+ #if ARCH_AARCH64 && HAVE_NEON
+ #include "aarch64/pixelutils.h"
+-#elif ARCH_ARM && HAVE_ARMV6
++#elif ARCH_ARM
+ #include "arm/pixelutils.h"
+ #elif ARCH_MIPS && HAVE_MSA
+ #include "mips/pixelutils.h"
+-- 
+2.47.3
+
diff --git a/package/ffmpeg/ffmpeg.hash b/package/ffmpeg/ffmpeg.hash
index 481fddcf61..41bb586831 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,5 +1,6 @@
 # Locally calculated
-sha256  bbb18f3cc5c1c34b21cf176c0168c4d9aa97697542a97f60d491a58a814dea65  ffmpeg-7.0.3.tar.xz
+sha256  8c3850283eb25fa026482078a04051e0be17347b09ef81a0849bec15a96e002e  ffmpeg-9.0.2.tar.xz
+sha256  019ab331eac814e4995c65dcc8076cc433a64bb4a5d2aa6aef5516922dd691e6  001-ffmpeg-all-libpostproc-plugin.patch
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
-sha256  b634ab5640e258563c536e658cad87080553df6f34f62269a21d554844e58bfe  COPYING.LGPLv2.1
+sha256  246041b6ecf9bc32d718a62c57877c78b5eb397b6467e74ed7ae2626ab189c30  COPYING.LGPLv2.1
 sha256  cb48bf09a11f5fb576cddb0431c8f5ed0a60157a9ec942adffc13907cbe083f2  LICENSE.md
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 47cf560b16..cda7236eb4 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 7.0.3
+FFMPEG_VERSION = 9.0.2
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
 FFMPEG_SITE = https://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
@@ -16,6 +16,15 @@ FFMPEG_LICENSE += and GPL-2.0+
 FFMPEG_LICENSE_FILES += COPYING.GPLv2
 endif
 
+FFMPEG_EXTRA_DOWNLOADS = \
+	https://github.com/xbmc/xbmc/raw/refs/tags/22.0rc1-Piers/tools/depends/target/ffmpeg/001-ffmpeg-all-libpostproc-plugin.patch
+
+define FFMPEG_APPLY_POSTPROC_PATCH
+	$(APPLY_PATCHES) $(@D) $(FFMPEG_DL_DIR) \
+		001-ffmpeg-all-libpostproc-plugin.patch
+endef
+FFMPEG_PRE_PATCH_HOOKS += FFMPEG_APPLY_POSTPROC_PATCH
+
 FFMPEG_CPE_ID_VENDOR = ffmpeg
 
 FFMPEG_CONF_OPTS = \
@@ -52,9 +61,7 @@ FFMPEG_CONF_OPTS = \
 	--disable-libvo-amrwbenc \
 	--disable-symver \
 	--disable-doc \
-	--disable-mmal \
-	--disable-omx \
-	--disable-omx-rpi
+	--disable-mmal
 
 FFMPEG_DEPENDENCIES += host-pkgconf
 
diff --git a/package/tvheadend/0002-transcoding-use-the-new-lavc-supported-config-API.patch b/package/tvheadend/0002-transcoding-use-the-new-lavc-supported-config-API.patch
new file mode 100644
index 0000000000..41e8c29e07
--- /dev/null
+++ b/package/tvheadend/0002-transcoding-use-the-new-lavc-supported-config-API.patch
@@ -0,0 +1,99 @@
+From 2f97e414ebb8469183066350e4d39cd52c38a01c Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Tue, 18 Aug 2026 13:55:27 +1000
+Subject: [PATCH] transcoding: use the new lavc supported-config API
+
+libavcodec 63 (FFmpeg 9.0) removed the AVCodec configuration arrays
+pix_fmts, sample_fmts, supported_samplerates and ch_layouts, so the
+codec profile defaults no longer compile:
+
+  src/transcoding/codec/codec.c:122:31: error: AVCodec has no member named pix_fmts
+  src/transcoding/codec/codec.c:134:34: error: AVCodec has no member named sample_fmts
+  src/transcoding/codec/codec.c:137:35: error: AVCodec has no member named supported_samplerates
+  src/transcoding/codec/codec.c:143:38: error: AVCodec has no member named ch_layouts
+
+avcodec_get_supported_config(), added in libavcodec 61.13.100 (FFmpeg
+7.1) when those fields were deprecated, is the replacement. It hands
+back the same arrays with the same config-specific terminators, or NULL
+when the codec accepts every value, so the callers that walk them are
+unchanged - including the supported_samplerates NULL case that falls
+back to default_sample_rates.
+
+Use it wherever it is available and keep the direct field access for
+older libavcodec.
+
+Upstream: https://github.com/tvheadend/tvheadend/pull/2224
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/transcoding/codec/codec.c | 34 +++++++++++++++++++++++++++++++++-
+ 1 file changed, 33 insertions(+), 1 deletion(-)
+
+diff --git a/src/transcoding/codec/codec.c b/src/transcoding/codec/codec.c
+index 6e5d1e3e7..2706df733 100644
+--- a/src/transcoding/codec/codec.c
++++ b/src/transcoding/codec/codec.c
+@@ -115,11 +115,30 @@ codec_get_title(const AVCodec *self)
+ 
+ /* TVHCodec ================================================================= */
+ 
++#if LIBAVCODEC_VERSION_INT >= AV_VERSION_INT(61, 13, 100)
++static const void *
++tvh_codec_supported_config(const AVCodec *codec, enum AVCodecConfig config)
++{
++    const void *configs = NULL;
++
++    if (avcodec_get_supported_config(NULL, codec, config, 0, &configs, NULL)) {
++        return NULL;
++    }
++    return configs;
++}
++#endif
++
++
+ static void
+ tvh_codec_video_init(TVHVideoCodec *self, const AVCodec *codec)
+ {
+     if (!self->pix_fmts) {
++#if LIBAVCODEC_VERSION_INT >= AV_VERSION_INT(61, 13, 100)
++        self->pix_fmts =
++            tvh_codec_supported_config(codec, AV_CODEC_CONFIG_PIX_FORMAT);
++#else
+         self->pix_fmts = codec->pix_fmts;
++#endif
+     }
+ }
+ 
+@@ -131,15 +150,28 @@ tvh_codec_audio_init(TVHAudioCodec *self, const AVCodec *codec)
+     };
+ 
+     if (!self->sample_fmts) {
++#if LIBAVCODEC_VERSION_INT >= AV_VERSION_INT(61, 13, 100)
++        self->sample_fmts =
++            tvh_codec_supported_config(codec, AV_CODEC_CONFIG_SAMPLE_FORMAT);
++#else
+         self->sample_fmts = codec->sample_fmts;
++#endif
+     }
+     if (!self->sample_rates) {
++#if LIBAVCODEC_VERSION_INT >= AV_VERSION_INT(61, 13, 100)
++        self->sample_rates =
++            tvh_codec_supported_config(codec, AV_CODEC_CONFIG_SAMPLE_RATE);
++#else
+         self->sample_rates = codec->supported_samplerates;
++#endif
+         if (!self->sample_rates)
+             self->sample_rates = default_sample_rates;
+     }
+     if (!self->channel_layouts) {
+-#if LIBAVCODEC_VERSION_MAJOR > 59
++#if LIBAVCODEC_VERSION_INT >= AV_VERSION_INT(61, 13, 100)
++        self->channel_layouts =
++            tvh_codec_supported_config(codec, AV_CODEC_CONFIG_CHANNEL_LAYOUT);
++#elif LIBAVCODEC_VERSION_MAJOR > 59
+         self->channel_layouts = codec->ch_layouts;
+ #else
+         self->channel_layouts = codec->channel_layouts;
+-- 
+2.47.3
+

--===============7880325736563107776==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7880325736563107776==--
