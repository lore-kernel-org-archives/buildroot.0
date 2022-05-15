Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C455AC433EF
	for <buildroot@archiver.kernel.org>; Sun, 15 May 2022 10:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 41A1540A79;
	Sun, 15 May 2022 10:07:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZYRHna-L8nOx; Sun, 15 May 2022 10:07:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 20672403AC;
	Sun, 15 May 2022 10:07:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1A0E21BF573
 for <buildroot@lists.busybox.net>; Sun, 15 May 2022 10:07:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06D5B403AC
 for <buildroot@lists.busybox.net>; Sun, 15 May 2022 10:07:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2tnRYDpGVcZj for <buildroot@lists.busybox.net>;
 Sun, 15 May 2022 10:07:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A7A9D40112
 for <buildroot@buildroot.org>; Sun, 15 May 2022 10:07:37 +0000 (UTC)
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
 by mailout09.t-online.de (Postfix) with SMTP id 088E321A3;
 Sun, 15 May 2022 12:07:35 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.4.164]) by fwd78.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1nqB9w-0nfnlJ0; Sun, 15 May 2022 12:07:32 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:43388)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1nqB9w-0006bY-1E;
 Sun, 15 May 2022 12:07:32 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 15 May 2022 12:07:32 +0200
Message-Id: <20220515100732.2188787-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1652609252-0000AD4E-6862D63D/0/0 CLEAN NORMAL
X-TOI-MSGID: a2c27127-b1a3-4592-a975-0482a8a47d5b
Subject: [Buildroot] [PATCH 1/1] package/vlc: fix compilation with dav1d 1.0
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
Cc: Simon Dawson <spdawson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/a74/a74151c73b5dc613ce327a869105cb93631cbce9/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...-fix-compilation-with-upcoming-dav1d.patch | 88 +++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100644 package/vlc/0011-dav1d-fix-compilation-with-upcoming-dav1d.patch

diff --git a/package/vlc/0011-dav1d-fix-compilation-with-upcoming-dav1d.patch b/package/vlc/0011-dav1d-fix-compilation-with-upcoming-dav1d.patch
new file mode 100644
index 0000000000..74b8645379
--- /dev/null
+++ b/package/vlc/0011-dav1d-fix-compilation-with-upcoming-dav1d.patch
@@ -0,0 +1,88 @@
+From 2202c892c8dc1381b596c53c2ebd3ca680061f95 Mon Sep 17 00:00:00 2001
+From: Steve Lhomme <robux4@ycbcr.xyz>
+Date: Fri, 18 Mar 2022 11:42:49 +0100
+Subject: [PATCH] dav1d: fix compilation with (upcoming) dav1d 1.0
+
+(cherry picked from commit dbf45cea2a8abdfbef897b8a71f3eb782bb1b712) (edited)
+edited:
+- 3.0 has the 128 pixels padding elsewhere
+- 3.0 has an extra parameter for add_integer_with_range()
+- 3.0 was setting i_extra_picture_buffers further down in the code
+- 3.0 uses 16 threads max
+
+Signed-off-by: Steve Lhomme <robux4@ycbcr.xyz>
+
+Downloaded from upstream commit
+https://code.videolan.org/videolan/vlc/-/commit/2202c892c8dc1381b596c53c2ebd3ca680061f95
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ modules/codec/dav1d.c | 22 +++++++++++++++++++++-
+ 1 file changed, 21 insertions(+), 1 deletion(-)
+
+diff --git a/modules/codec/dav1d.c b/modules/codec/dav1d.c
+index 039165f52ec..cfabbc27cb3 100644
+--- a/modules/codec/dav1d.c
++++ b/modules/codec/dav1d.c
+@@ -63,10 +63,16 @@ vlc_module_begin ()
+     set_category(CAT_INPUT)
+     set_subcategory(SUBCAT_INPUT_VCODEC)
+ 
++#if DAV1D_API_VERSION_MAJOR >= 6
++    add_integer_with_range("dav1d-thread-frames", 0, 0, DAV1D_MAX_THREADS,
++                THREAD_FRAMES_TEXT, THREAD_FRAMES_LONGTEXT, false)
++    add_obsolete_string("dav1d-thread-tiles") // unused with dav1d 1.0
++#else
+     add_integer_with_range("dav1d-thread-frames", 0, 0, DAV1D_MAX_FRAME_THREADS,
+                 THREAD_FRAMES_TEXT, THREAD_FRAMES_LONGTEXT, false)
+     add_integer_with_range("dav1d-thread-tiles", 0, 0, DAV1D_MAX_TILE_THREADS,
+                 THREAD_TILES_TEXT, THREAD_TILES_LONGTEXT, false)
++#endif
+ vlc_module_end ()
+ 
+ /*****************************************************************************
+@@ -294,6 +300,11 @@ static int OpenDecoder(vlc_object_t *p_this)
+         return VLC_ENOMEM;
+ 
+     dav1d_default_settings(&p_sys->s);
++#if DAV1D_API_VERSION_MAJOR >= 6
++    p_sys->s.n_threads = var_InheritInteger(p_this, "dav1d-thread-frames");
++    if (p_sys->s.n_threads == 0)
++        p_sys->s.n_threads = (i_core_count < 16) ? i_core_count : 16;
++#else
+     p_sys->s.n_tile_threads = var_InheritInteger(p_this, "dav1d-thread-tiles");
+     if (p_sys->s.n_tile_threads == 0)
+         p_sys->s.n_tile_threads =
+@@ -303,6 +314,7 @@ static int OpenDecoder(vlc_object_t *p_this)
+     p_sys->s.n_frame_threads = var_InheritInteger(p_this, "dav1d-thread-frames");
+     if (p_sys->s.n_frame_threads == 0)
+         p_sys->s.n_frame_threads = (i_core_count < 16) ? i_core_count : 16;
++#endif
+     p_sys->s.allocator.cookie = dec;
+     p_sys->s.allocator.alloc_picture_callback = NewPicture;
+     p_sys->s.allocator.release_picture_callback = FreePicture;
+@@ -313,12 +325,20 @@ static int OpenDecoder(vlc_object_t *p_this)
+         return VLC_EGENERIC;
+     }
+ 
++#if DAV1D_API_VERSION_MAJOR >= 6
++    msg_Dbg(p_this, "Using dav1d version %s with %d threads",
++            dav1d_version(), p_sys->s.n_threads);
++
++    dec->i_extra_picture_buffers = (p_sys->s.n_threads - 1);
++#else
+     msg_Dbg(p_this, "Using dav1d version %s with %d/%d frame/tile threads",
+             dav1d_version(), p_sys->s.n_frame_threads, p_sys->s.n_tile_threads);
+ 
++    dec->i_extra_picture_buffers = (p_sys->s.n_frame_threads - 1);
++#endif
++
+     dec->pf_decode = Decode;
+     dec->pf_flush = FlushDecoder;
+-    dec->i_extra_picture_buffers = (p_sys->s.n_frame_threads - 1);
+ 
+     dec->fmt_out.video.i_width = dec->fmt_in.video.i_width;
+     dec->fmt_out.video.i_height = dec->fmt_in.video.i_height;
+-- 
+GitLab
+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
