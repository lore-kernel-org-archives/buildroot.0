Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA04CD6E7C
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:39:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36E9D41146;
	Fri,  5 Jun 2026 12:39:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 32VMqsD_icCb; Fri,  5 Jun 2026 12:39:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9EEB41145
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663168;
	bh=rjZCqrfysrt2+5pb/H9422jr4M8kh4IIC1yrDdbaULI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=P40pTS81bPuhsTYTL4SyN1GQZFRek0vEH7m8dnqYG8lz3U90Dg/IJa89SKHlF2I0S
	 ya77AQY3bVaPJlRteO4+5g3tGSvtZp6+DbPl7FY9yEEidgA1T3JnfNW3DstA0NCJ8P
	 YdlAYNG3zVtT/xvhBpF2uFnNdMxSQrRhT0hfbNTsxKxZcnu6PVp40iefPDJ2G9Uegt
	 lSX07bB8l/MbVfzwkwlwVZsYxUKXLkIRIRr5Mh9Dn7hUuyoqsOuV6yDmF9ODCOU7LJ
	 tWCZbQe75oTCBdAQnm4+Txsm9Nckp6vrYwkNsWWSR0Y02uLAmdI/onqUtqMz50ujjA
	 9f7JFzUdPUvsg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9EEB41145;
	Fri,  5 Jun 2026 12:39:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F0FE3B7
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 28D2E41024
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s-eFBqpAwpES for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8F4741013
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B8F4741013
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E29C787B22; Fri,  5 Jun 2026 12:38:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 11:03:00 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 8bee785fc18c9880746ff094f0ca2da81789af48
X-Git-Newrev: bbb0815f11e7eb6510e1df347d7e0f5f8e959b26
X-Patchwork-Hint: ignore
Message-Id: <20260605123834.E29C787B22@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/vlc: update
 freerdp2 patch
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bbb0815f11e7eb6510e1df347d7e0f5f8e959b26
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Replace Gentoo patch from 2018 with rebased version of an upstream
commit from 2022 which also fixes build errors introduced by gcc 14.x:

access/rdp.c: In function 'postConnectHandler':
access/rdp.c:238:39: error: assignment to 'pDesktopResize' {aka 'int
 (*)(struct rdp_context *)'} from incompatible pointer type 'void
 (*)(rdpContext *)' {aka 'void (*)(struct rdp_context *)'}
 [-Wincompatible-pointer-types]
  238 |     p_instance->update->DesktopResize = desktopResizeHandler;
      |                                       ^

No autobuilder error was recorded, the build error can be reproduced
with this defconfig:

BR2_x86_64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_VLC=y
BR2_PACKAGE_FREERDP=y

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9097605d2937993b1569dfc22b97a1c3f0372725)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .checkpackageignore                             |   1 -
 package/vlc/0007-Add-support-for-freerdp2.patch | 173 ++++++++++++++++++------
 2 files changed, 133 insertions(+), 41 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 8f29e5a12d..59e5e30b21 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -969,7 +969,6 @@ package/vlc/0003-build-use-pkg-config-to-get-tremor-libs.patch lib_patch.Upstrea
 package/vlc/0004-Fix-build-error-using-uClibc-by-adding-sys-types.h.patch lib_patch.Upstream
 package/vlc/0005-Don-t-assume-strerror_l-is-available.patch lib_patch.Upstream
 package/vlc/0006-posix-remove-ancient-run-time-fallback-to-real-time-.patch lib_patch.Upstream
-package/vlc/0007-Add-support-for-freerdp2.patch lib_patch.Upstream
 package/vlc/0009-modules-video_filter-opencv_example.cpp-fix-build-wi.patch lib_patch.Upstream
 package/vlc/0010-opengl-missing-library-check.patch lib_patch.Upstream
 package/vpnc/0001-Makefile-allow-to-override-the-PREFIX-variable.patch lib_patch.Upstream
diff --git a/package/vlc/0007-Add-support-for-freerdp2.patch b/package/vlc/0007-Add-support-for-freerdp2.patch
index 75f095545b..c3148600ca 100644
--- a/package/vlc/0007-Add-support-for-freerdp2.patch
+++ b/package/vlc/0007-Add-support-for-freerdp2.patch
@@ -1,32 +1,32 @@
-From 3780bbb20bf35aa8f21ac672da3f0c5f408468e9 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Thu, 16 Aug 2018 12:27:40 +0200
-Subject: [PATCH] Add support for freerdp2
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Juliane de Sartiges <jill@videolabs.io>
+Date: Wed, 27 Jul 2022 09:32:25 +0200
+Subject: [PATCH] freerdp: update to freerdp2 api
 
-Downloaded from
-https://gitweb.gentoo.org/repo/gentoo.git/tree/media-video/vlc/files/vlc-2.2.8-freerdp-2.patch
+Upstream: https://code.videolan.org/videolan/vlc/-/commit/95e7bba6105bd8c2b8ea9cabc02c8dfe7411cab2
 
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Bernd: rebased for 3.0.23]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  configure.ac         |  2 +-
- modules/access/rdp.c | 51 ++++++++++++++-------------------------------------
- 2 files changed, 15 insertions(+), 38 deletions(-)
+ modules/access/rdp.c | 85 ++++++++++++++++++++------------------------
+ 2 files changed, 40 insertions(+), 47 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index bfe43512a2..4808b8becf 100644
+index d96287d3e0..a91fc73172 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1992,7 +1992,7 @@ PKG_ENABLE_MODULES_VLC([VNC], [vnc], [libvncclient >= 0.9.9], (VNC/rfb client su
+@@ -2194,7 +2194,7 @@ PKG_ENABLE_MODULES_VLC([VNC], [vnc], [libvncclient >= 0.9.9], (VNC/rfb client su
  
  dnl  RDP/Remote Desktop access module
  dnl
 -PKG_ENABLE_MODULES_VLC([FREERDP], [rdp], [freerdp >= 1.0.1], (RDP/Remote Desktop client support) )
-+PKG_ENABLE_MODULES_VLC([FREERDP], [rdp], [freerdp2 >= 1.0.1], (RDP/Remote Desktop client support) )
++PKG_ENABLE_MODULES_VLC([FREERDP], [rdp], [freerdp2 >= 2.0.0], (RDP/Remote Desktop client support) )
  
  dnl
  dnl  Real RTSP plugin
 diff --git a/modules/access/rdp.c b/modules/access/rdp.c
-index 2992090219..49986f5da9 100644
+index 0c39663c64..04ae005938 100644
 --- a/modules/access/rdp.c
 +++ b/modules/access/rdp.c
 @@ -45,18 +45,6 @@
@@ -48,37 +48,51 @@ index 2992090219..49986f5da9 100644
  #include <errno.h>
  #ifdef HAVE_POLL
  # include <poll.h>
-@@ -144,6 +132,7 @@ static void desktopResizeHandler( rdpContext *p_context )
+@@ -75,6 +63,8 @@
+ 
+ #define CFG_PREFIX "rdp-"
+ 
++#define FREERDP_PIXEL_BPP(_format) (_format >> 24)
++
+ /*****************************************************************************
+  * Module descriptor
+  *****************************************************************************/
+@@ -139,11 +129,12 @@ typedef struct vlcrdp_context_t vlcrdp_context_t;
+ 
+ /* updates handlers */
+ 
+-static void desktopResizeHandler( rdpContext *p_context )
++static BOOL desktopResizeHandler( rdpContext *p_context )
+ {
      vlcrdp_context_t * p_vlccontext = (vlcrdp_context_t *) p_context;
      demux_sys_t *p_sys = p_vlccontext->p_demux->p_sys;
      rdpGdi *p_gdi = p_context->gdi;
-+    unsigned bytesPerPixel;
++    int i_colordepth = FREERDP_PIXEL_BPP( p_gdi->dstFormat );
  
      if ( p_sys->es )
      {
-@@ -153,17 +142,21 @@ static void desktopResizeHandler( rdpContext *p_context )
+@@ -151,11 +142,13 @@ static void desktopResizeHandler( rdpContext *p_context )
+         p_sys->es = NULL;
+     }
  
-     /* Now init and fill es format */
+-    /* Now init and fill es format */
      vlc_fourcc_t i_chroma;
 -    switch( p_gdi->bytesPerPixel )
-+    switch( p_gdi->dstFormat )
++    /* Now init and fill es format */
++    switch ( i_colordepth )
      {
          default:
--        case 16:
-+            msg_Dbg( p_vlccontext->p_demux, "unhandled dstFormat %x bpp", p_gdi->dstFormat);
-+        case PIXEL_FORMAT_BGR16:
++            msg_Dbg( p_vlccontext->p_demux, "invalid color depth %d", i_colordepth);
++            /* fallthrough */
+         case 16:
              i_chroma = VLC_CODEC_RGB16;
-+            bytesPerPixel = 16;
              break;
--        case 24:
-+        case PIXEL_FORMAT_BGR24:
+@@ -163,7 +156,7 @@ static void desktopResizeHandler( rdpContext *p_context )
              i_chroma = VLC_CODEC_RGB24;
-+            bytesPerPixel = 24;
              break;
--        case 32:
-+        case PIXEL_FORMAT_BGRA32:
-             i_chroma = VLC_CODEC_RGB32;
-+            bytesPerPixel = 32;
+         case 32:
+-            i_chroma = VLC_CODEC_RGB32;
++            i_chroma = VLC_CODEC_ARGB;
              break;
      }
      es_format_t fmt;
@@ -87,11 +101,61 @@ index 2992090219..49986f5da9 100644
      fmt.video.i_frame_rate_base = 1000;
      fmt.video.i_frame_rate = 1000 * p_sys->f_fps;
 -    p_sys->i_framebuffersize = p_gdi->width * p_gdi->height * p_gdi->bytesPerPixel;
-+    p_sys->i_framebuffersize = p_gdi->width * p_gdi->height * bytesPerPixel;
++    p_sys->i_framebuffersize = p_gdi->width * p_gdi->height * (i_colordepth >> 3);
  
      if ( p_sys->p_block )
          p_sys->p_block = block_Realloc( p_sys->p_block, 0, p_sys->i_framebuffersize );
-@@ -237,28 +230,19 @@ static bool postConnectHandler( freerdp *p_instance )
+@@ -184,20 +177,21 @@ static void desktopResizeHandler( rdpContext *p_context )
+         p_sys->p_block = block_Alloc( p_sys->i_framebuffersize );
+ 
+     p_sys->es = es_out_Add( p_vlccontext->p_demux->out, &fmt );
++    return TRUE;
+ }
+ 
+-static void beginPaintHandler( rdpContext *p_context )
++static BOOL beginPaintHandler( rdpContext *p_context )
+ {
+     vlcrdp_context_t * p_vlccontext = (vlcrdp_context_t *) p_context;
+     demux_sys_t *p_sys = p_vlccontext->p_demux->p_sys;
+     rdpGdi *p_gdi = p_context->gdi;
+-    p_gdi->primary->hdc->hwnd->invalid->null = 1;
+-    p_gdi->primary->hdc->hwnd->ninvalid = 0;
++    p_gdi->primary->hdc->hwnd->invalid->null = TRUE;
+     if ( ! p_sys->p_block && p_sys->i_framebuffersize )
+         p_sys->p_block = block_Alloc( p_sys->i_framebuffersize );
++    return TRUE;
+ }
+ 
+-static void endPaintHandler( rdpContext *p_context )
++static BOOL endPaintHandler( rdpContext *p_context )
+ {
+     vlcrdp_context_t * p_vlccontext = (vlcrdp_context_t *) p_context;
+     demux_sys_t *p_sys = p_vlccontext->p_demux->p_sys;
+@@ -208,11 +202,12 @@ static void endPaintHandler( rdpContext *p_context )
+         p_sys->p_block->i_buffer = p_sys->i_framebuffersize;
+         memcpy( p_sys->p_block->p_buffer, p_gdi->primary_buffer, p_sys->p_block->i_buffer );
+     }
++    return TRUE;
+ }
+ 
+ /* instance handlers */
+ 
+-static bool preConnectHandler( freerdp *p_instance )
++static BOOL preConnectHandler( freerdp *p_instance )
+ {
+     vlcrdp_context_t * p_vlccontext = (vlcrdp_context_t *) p_instance->context;
+     demux_sys_t *p_sys = p_vlccontext->p_demux->p_sys;
+@@ -229,49 +224,54 @@ static bool preConnectHandler( freerdp *p_instance )
+     p_instance->settings->EncryptionMethods =
+             var_InheritBool( p_vlccontext->p_demux, CFG_PREFIX "encrypt" );
+ 
+-    return true;
++    return TRUE;
+ }
+ 
+-static bool postConnectHandler( freerdp *p_instance )
++static BOOL postConnectHandler( freerdp *p_instance )
+ {
      vlcrdp_context_t * p_vlccontext = (vlcrdp_context_t *) p_instance->context;
  
      msg_Dbg( p_vlccontext->p_demux, "connected to desktop %dx%d (%d bpp)",
@@ -109,22 +173,51 @@ index 2992090219..49986f5da9 100644
      p_instance->update->DesktopResize = desktopResizeHandler;
      p_instance->update->BeginPaint = beginPaintHandler;
      p_instance->update->EndPaint = endPaintHandler;
++    UINT32 format;
++    switch ( p_instance->settings->ColorDepth )
++    {
++        default:
++            msg_Dbg( p_vlccontext->p_demux, "no valid pixel format found for color depth %d bpp", p_instance->settings->ColorDepth);
++            /* fallthrough */
++        case 16:
++            format = PIXEL_FORMAT_RGB16;
++            break;
++        case 24:
++            format = PIXEL_FORMAT_RGB24;
++            break;
++        case 32:
++            format = PIXEL_FORMAT_ARGB32;
++            break;
++    }
  
--    gdi_init( p_instance,
+     gdi_init( p_instance,
 -                CLRBUF_16BPP |
 -#if defined(FREERDP_VERSION_MAJOR) && defined(FREERDP_VERSION_MINOR) && \
 -    !(FREERDP_VERSION_MAJOR > 1 || (FREERDP_VERSION_MAJOR == 1 && FREERDP_VERSION_MINOR >= 2))
 -                CLRBUF_24BPP |
 -#endif
 -                CLRBUF_32BPP, NULL );
-+    if ( p_instance->settings->ColorDepth > 16 )
-+        gdi_init( p_instance, PIXEL_FORMAT_XRGB32);
-+    else
-+        gdi_init( p_instance, PIXEL_FORMAT_RGB16);
++                format );
  
      desktopResizeHandler( p_instance->context );
-     return true;
-@@ -432,10 +416,6 @@ static int Open( vlc_object_t *p_this )
+-    return true;
++    return TRUE;
+ }
+ 
+-static bool authenticateHandler( freerdp *p_instance, char** ppsz_username,
++static BOOL authenticateHandler( freerdp *p_instance, char** ppsz_username,
+                                  char** ppsz_password, char** ppsz_domain )
+ {
+     VLC_UNUSED(ppsz_domain);
+     vlcrdp_context_t * p_vlccontext = (vlcrdp_context_t *) p_instance->context;
+     *ppsz_username = var_InheritString( p_vlccontext->p_demux, CFG_PREFIX "user" );
+     *ppsz_password = var_InheritString( p_vlccontext->p_demux, CFG_PREFIX "password" );
+-    return true;
++    return TRUE;
+ }
+ 
+ /*****************************************************************************
+@@ -432,10 +432,6 @@ static int Open( vlc_object_t *p_this )
      if ( p_sys->f_fps <= 0 ) p_sys->f_fps = 1.0;
      p_sys->i_frame_interval = 1000000 / p_sys->f_fps;
  
@@ -135,7 +228,7 @@ index 2992090219..49986f5da9 100644
      p_sys->p_instance = freerdp_new();
      if ( !p_sys->p_instance )
      {
-@@ -508,9 +488,6 @@ static void Close( vlc_object_t *p_this )
+@@ -512,9 +508,6 @@ static void Close( vlc_object_t *p_this )
  
      freerdp_disconnect( p_sys->p_instance );
      freerdp_free( p_sys->p_instance );
@@ -146,5 +239,5 @@ index 2992090219..49986f5da9 100644
      if ( p_sys->p_block )
          block_Release( p_sys->p_block );
 -- 
-2.14.4
+2.47.3
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
