Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB04BC4708E
	for <buildroot@archiver.kernel.org>; Wed,  7 Dec 2022 13:34:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 982E8400D2;
	Wed,  7 Dec 2022 13:34:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 982E8400D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DlTAUjIJfOO0; Wed,  7 Dec 2022 13:34:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ACA3A40156;
	Wed,  7 Dec 2022 13:34:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACA3A40156
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0F9B71BF4D8
 for <buildroot@lists.busybox.net>; Wed,  7 Dec 2022 13:33:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EBA4E405F5
 for <buildroot@lists.busybox.net>; Wed,  7 Dec 2022 13:33:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBA4E405F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JsqoGpdS7a_u for <buildroot@lists.busybox.net>;
 Wed,  7 Dec 2022 13:33:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 22DB040A01
 for <buildroot@buildroot.org>; Wed,  7 Dec 2022 13:33:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22DB040A01
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0F5F185D9D; Wed,  7 Dec 2022 13:33:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 7 Dec 2022 13:45:07 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: fa32dc149eadb1d37a988b0e010f6b5ce0535aeb
X-Git-Newrev: 922e8695815505cfac4f0dab39fec925efae8a2e
X-Patchwork-Hint: ignore
Message-Id: <20221207133355.0F5F185D9D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/vlc: security
 bump version to 3.0.18
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=922e8695815505cfac4f0dab39fec925efae8a2e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

Removed patch 0010, a different fix was applied upstream:
https://code.videolan.org/videolan/vlc/-/commit/05445b74a38d045cb28f71f96ccbe882445a031e

Removed patch 0011 which was backported from upstream.
Renumbered patch 0012 -> 0010.

Release notes:
http://www.videolan.org/vlc/releases/3.0.18.html

Fixes CVE-2022-41325:
http://www.videolan.org/security/sb-vlc3018.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Peter: fix sha1 hash entry]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 6866076d79ff2e022762b79421f511a8037fda73)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ess-live555.cpp-fix-build-with-live555-20.patch | 36 ---------
 ...tch => 0010-opengl-missing-library-check.patch} |  0
 ...dav1d-fix-compilation-with-upcoming-dav1d.patch | 88 ----------------------
 package/vlc/vlc.hash                               |  8 +-
 package/vlc/vlc.mk                                 |  2 +-
 5 files changed, 5 insertions(+), 129 deletions(-)

diff --git a/package/vlc/0010-modules-access-live555.cpp-fix-build-with-live555-20.patch b/package/vlc/0010-modules-access-live555.cpp-fix-build-with-live555-20.patch
deleted file mode 100644
index 5f046648d4..0000000000
--- a/package/vlc/0010-modules-access-live555.cpp-fix-build-with-live555-20.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From eba390d13ec4089cd6b9d8687ab3f8905b9d3ac8 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 22 May 2021 22:56:04 +0200
-Subject: [PATCH] modules/access/live555.cpp: fix build with live555 >=
- 2020.12.11
-
-Since live555-2020.12.11, connectionEndpointAddress() member function
-use a "struct sockaddr_storage" in preparation for eventual support of
-IPv6: http://www.live555.com/liveMedia/public/changelog.txt
-
-Fixes:
- - http://autobuild.buildroot.org/results/83170984f96238756c45bf1f4e542363afafd45f
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- modules/access/live555.cpp | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/modules/access/live555.cpp b/modules/access/live555.cpp
-index 9d6e01ae32..32a6c294eb 100644
---- a/modules/access/live555.cpp
-+++ b/modules/access/live555.cpp
-@@ -850,7 +850,9 @@ static int SessionsSetup( demux_t *p_demux )
-             if( !p_sys->b_multicast )
-             {
-                 /* We need different rollover behaviour for multicast */
--                p_sys->b_multicast = IsMulticastAddress( sub->connectionEndpointAddress() );
-+                struct sockaddr_storage tempAddr;
-+                sub->getConnectionEndpointAddress( tempAddr );
-+                p_sys->b_multicast = IsMulticastAddress( tempAddr );
-             }
- 
-             tk = (live_track_t*)malloc( sizeof( live_track_t ) );
--- 
-2.30.2
-
diff --git a/package/vlc/0012-opengl-missing-library-check.patch b/package/vlc/0010-opengl-missing-library-check.patch
similarity index 100%
rename from package/vlc/0012-opengl-missing-library-check.patch
rename to package/vlc/0010-opengl-missing-library-check.patch
diff --git a/package/vlc/0011-dav1d-fix-compilation-with-upcoming-dav1d.patch b/package/vlc/0011-dav1d-fix-compilation-with-upcoming-dav1d.patch
deleted file mode 100644
index 74b8645379..0000000000
--- a/package/vlc/0011-dav1d-fix-compilation-with-upcoming-dav1d.patch
+++ /dev/null
@@ -1,88 +0,0 @@
-From 2202c892c8dc1381b596c53c2ebd3ca680061f95 Mon Sep 17 00:00:00 2001
-From: Steve Lhomme <robux4@ycbcr.xyz>
-Date: Fri, 18 Mar 2022 11:42:49 +0100
-Subject: [PATCH] dav1d: fix compilation with (upcoming) dav1d 1.0
-
-(cherry picked from commit dbf45cea2a8abdfbef897b8a71f3eb782bb1b712) (edited)
-edited:
-- 3.0 has the 128 pixels padding elsewhere
-- 3.0 has an extra parameter for add_integer_with_range()
-- 3.0 was setting i_extra_picture_buffers further down in the code
-- 3.0 uses 16 threads max
-
-Signed-off-by: Steve Lhomme <robux4@ycbcr.xyz>
-
-Downloaded from upstream commit
-https://code.videolan.org/videolan/vlc/-/commit/2202c892c8dc1381b596c53c2ebd3ca680061f95
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- modules/codec/dav1d.c | 22 +++++++++++++++++++++-
- 1 file changed, 21 insertions(+), 1 deletion(-)
-
-diff --git a/modules/codec/dav1d.c b/modules/codec/dav1d.c
-index 039165f52ec..cfabbc27cb3 100644
---- a/modules/codec/dav1d.c
-+++ b/modules/codec/dav1d.c
-@@ -63,10 +63,16 @@ vlc_module_begin ()
-     set_category(CAT_INPUT)
-     set_subcategory(SUBCAT_INPUT_VCODEC)
- 
-+#if DAV1D_API_VERSION_MAJOR >= 6
-+    add_integer_with_range("dav1d-thread-frames", 0, 0, DAV1D_MAX_THREADS,
-+                THREAD_FRAMES_TEXT, THREAD_FRAMES_LONGTEXT, false)
-+    add_obsolete_string("dav1d-thread-tiles") // unused with dav1d 1.0
-+#else
-     add_integer_with_range("dav1d-thread-frames", 0, 0, DAV1D_MAX_FRAME_THREADS,
-                 THREAD_FRAMES_TEXT, THREAD_FRAMES_LONGTEXT, false)
-     add_integer_with_range("dav1d-thread-tiles", 0, 0, DAV1D_MAX_TILE_THREADS,
-                 THREAD_TILES_TEXT, THREAD_TILES_LONGTEXT, false)
-+#endif
- vlc_module_end ()
- 
- /*****************************************************************************
-@@ -294,6 +300,11 @@ static int OpenDecoder(vlc_object_t *p_this)
-         return VLC_ENOMEM;
- 
-     dav1d_default_settings(&p_sys->s);
-+#if DAV1D_API_VERSION_MAJOR >= 6
-+    p_sys->s.n_threads = var_InheritInteger(p_this, "dav1d-thread-frames");
-+    if (p_sys->s.n_threads == 0)
-+        p_sys->s.n_threads = (i_core_count < 16) ? i_core_count : 16;
-+#else
-     p_sys->s.n_tile_threads = var_InheritInteger(p_this, "dav1d-thread-tiles");
-     if (p_sys->s.n_tile_threads == 0)
-         p_sys->s.n_tile_threads =
-@@ -303,6 +314,7 @@ static int OpenDecoder(vlc_object_t *p_this)
-     p_sys->s.n_frame_threads = var_InheritInteger(p_this, "dav1d-thread-frames");
-     if (p_sys->s.n_frame_threads == 0)
-         p_sys->s.n_frame_threads = (i_core_count < 16) ? i_core_count : 16;
-+#endif
-     p_sys->s.allocator.cookie = dec;
-     p_sys->s.allocator.alloc_picture_callback = NewPicture;
-     p_sys->s.allocator.release_picture_callback = FreePicture;
-@@ -313,12 +325,20 @@ static int OpenDecoder(vlc_object_t *p_this)
-         return VLC_EGENERIC;
-     }
- 
-+#if DAV1D_API_VERSION_MAJOR >= 6
-+    msg_Dbg(p_this, "Using dav1d version %s with %d threads",
-+            dav1d_version(), p_sys->s.n_threads);
-+
-+    dec->i_extra_picture_buffers = (p_sys->s.n_threads - 1);
-+#else
-     msg_Dbg(p_this, "Using dav1d version %s with %d/%d frame/tile threads",
-             dav1d_version(), p_sys->s.n_frame_threads, p_sys->s.n_tile_threads);
- 
-+    dec->i_extra_picture_buffers = (p_sys->s.n_frame_threads - 1);
-+#endif
-+
-     dec->pf_decode = Decode;
-     dec->pf_flush = FlushDecoder;
--    dec->i_extra_picture_buffers = (p_sys->s.n_frame_threads - 1);
- 
-     dec->fmt_out.video.i_width = dec->fmt_in.video.i_width;
-     dec->fmt_out.video.i_height = dec->fmt_in.video.i_height;
--- 
-GitLab
-
diff --git a/package/vlc/vlc.hash b/package/vlc/vlc.hash
index 9060097906..4b9940df33 100644
--- a/package/vlc/vlc.hash
+++ b/package/vlc/vlc.hash
@@ -1,7 +1,7 @@
-# From https://get.videolan.org/vlc/3.0.17.4/vlc-3.0.17.4.tar.xz.sha256
-sha256  8c5a62d88a4fb45c1b095cf10befef217dfa87aedcec5184b9e7d590b6dd4133  vlc-3.0.17.4.tar.xz
-# From https://get.videolan.org/vlc/3.0.17.4/vlc-3.0.17.4.tar.xz.sha1
-sha1  ebcd9939103fda141267c5a8f1c603df4533218e  vlc-3.0.17.4.tar.xz
+# From https://get.videolan.org/vlc/3.0.18/vlc-3.0.18.tar.xz.sha256
+sha256  57094439c365d8aa8b9b41fa3080cc0eef2befe6025bb5cef722accc625aedec  vlc-3.0.18.tar.xz
+# From https://get.videolan.org/vlc/3.0.18/vlc-3.0.18.tar.xz.sha1
+sha1  b11ccaa0f5ee15a550564817d60458eb0946f80e  vlc-3.0.18.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index aee3b735a9..c6ae46f469 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VLC_VERSION = 3.0.17.4
+VLC_VERSION = 3.0.18
 VLC_SITE = https://get.videolan.org/vlc/$(VLC_VERSION)
 VLC_SOURCE = vlc-$(VLC_VERSION).tar.xz
 VLC_LICENSE = GPL-2.0+, LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
