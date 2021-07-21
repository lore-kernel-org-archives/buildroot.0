Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60C16C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:19:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1439160EBC
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:19:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1439160EBC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D59F940628;
	Wed,  4 Aug 2021 00:19:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xnb9W_EDbmYu; Wed,  4 Aug 2021 00:19:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ADFF340633;
	Wed,  4 Aug 2021 00:19:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B47401BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:19:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7F8E540FAA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mEP53D5sEuFE for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E663D40F13
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 4415981484; Tue,  3 Aug 2021 21:10:13 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 21 Jul 2021 09:25:44 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 459d725db02febf10cde1d5cac9485c2fd0cfeec
X-Git-Newrev: 2f4409fea1bf9e9eeb55b432eb987dbe1c339780
X-Patchwork-Hint: ignore
Message-Id: <20210803211013.4415981484@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/gstreamer1/gst1-plugins-base: fix build with meson 0.58.x
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=2f4409fea1bf9e9eeb55b432eb987dbe1c339780
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes:
In file included from ../gst-libs/gst/gl/gstglwindow.c:54:
../gst-libs/gst/gl/wayland/gstglwindow_wayland_egl.h:25:10: fatal error: xdg-shell-client-protocol.h: No such file or directory
   25 | #include "xdg-shell-client-protocol.h"
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...0002-gstgl-Fix-build-when-Meson-0.58.0rc1.patch | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/package/gstreamer1/gst1-plugins-base/0002-gstgl-Fix-build-when-Meson-0.58.0rc1.patch b/package/gstreamer1/gst1-plugins-base/0002-gstgl-Fix-build-when-Meson-0.58.0rc1.patch
new file mode 100644
index 0000000000..347569f71b
--- /dev/null
+++ b/package/gstreamer1/gst1-plugins-base/0002-gstgl-Fix-build-when-Meson-0.58.0rc1.patch
@@ -0,0 +1,51 @@
+From 90903917a8185e0f9add7af8153ae2fc9875fdcb Mon Sep 17 00:00:00 2001
+From: Xavier Claessens <xavier.claessens@collabora.com>
+Date: Mon, 26 Apr 2021 14:25:03 -0400
+Subject: [PATCH] gstgl: Fix build when Meson >= 0.58.0rc1
+
+"implicit_include_directories: false" now also means that current build
+directory is not added to include paths by default any more. We have to
+add it manually because we have some custom_target() that generate
+headers in current build directory.
+
+See https://github.com/mesonbuild/meson/issues/8700.
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gst-plugins-base/-/merge_requests/1127>
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[james.hilliard1@gmail.com: backport from upstream commit
+90903917a8185e0f9add7af8153ae2fc9875fdcb]
+---
+ gst-libs/gst/gl/meson.build | 15 ++++++++++++---
+ 1 file changed, 12 insertions(+), 3 deletions(-)
+
+diff --git a/gst-libs/gst/gl/meson.build b/gst-libs/gst/gl/meson.build
+index db11c5e89..731ee9f5e 100644
+--- a/gst-libs/gst/gl/meson.build
++++ b/gst-libs/gst/gl/meson.build
+@@ -989,11 +989,20 @@ if build_gstgl
+     command : [mkenums, glib_mkenums, '@OUTPUT@', '@INPUT@'])
+   gen_sources = [gl_enumtypes_h]
+ 
++  common_args = gst_plugins_base_args + gl_cpp_args + ['-DBUILDING_GST_GL']
++
++  # We have custom_target() that generate headers in the current build dir,
++  # but with implicit_include_directories: false, meson >= 0.58.0 won't include
++  # it by default. We cannot use include_directories('.') here because it would
++  # also include current source dir which is what we want to avoid because
++  # case-insensitive FS would include gst-libs/gl/egl/egl.h as EGL/egl.h.
++  common_args += '-I@0@'.format(meson.current_build_dir())
++
+   gstgl = library('gstgl-' + api_version,
+     gl_sources, gl_egl_sources, gl_x11_sources, gl_wayland_sources, gl_priv_sources, gl_enumtypes_c, gl_enumtypes_h,
+-    c_args : gst_plugins_base_args + gl_cpp_args + ['-DBUILDING_GST_GL'],
+-    cpp_args : gst_plugins_base_args + gl_cpp_args + ['-DBUILDING_GST_GL'],
+-    objc_args : gst_plugins_base_args + gl_cpp_args + gl_objc_args + ['-DBUILDING_GST_GL'],
++    c_args : common_args,
++    cpp_args : common_args,
++    objc_args : common_args + gl_objc_args,
+     include_directories : [configinc, libsinc, gl_includes],
+     version : libversion,
+     soversion : soversion,
+-- 
+2.25.1
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
