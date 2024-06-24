Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EAE6C2D0D1
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 20:02:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DA9060B29;
	Mon, 24 Jun 2024 20:02:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5zemSGLIVVXY; Mon, 24 Jun 2024 20:02:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1038C60B3C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1038C60B3C;
	Mon, 24 Jun 2024 20:02:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 752571BF473
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 20:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6175340ADA
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 20:02:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lpDVTJ1Xf8Qh for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 20:02:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52722400C1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 52722400C1
 for <buildroot@buildroot.org>; Mon, 24 Jun 2024 20:02:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4F59C82B60; Mon, 24 Jun 2024 20:02:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 24 Jun 2024 21:33:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8a90c1b7e268d1a8b22ab4043c3f4e6c788aca0c
X-Git-Newrev: 1cbbe1d6e3142e3b34cb9262ffd826a385f3a28d
X-Patchwork-Hint: ignore
Message-Id: <20240624200226.4F59C82B60@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libglib2: update the patches to be
 applied with fuzz 0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1cbbe1d6e3142e3b34cb9262ffd826a385f3a28d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit allows the package patches to be applied with fuzz factor 0.
The fuzz factor specifies how many lines of the patch can be inexactly
matched, so the value 0 requires all lines to be exactly matched.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 ....build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/package/libglib2/0001-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch b/package/libglib2/0001-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch
index fb99057242..8f87671167 100644
--- a/package/libglib2/0001-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch
+++ b/package/libglib2/0001-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch
@@ -1,4 +1,4 @@
-From ff3db531608eb0f9de8a88c1bc34fe0f1d93121c Mon Sep 17 00:00:00 2001
+From 03e9cae3f3a7e2bbd5110f1ce2739601571bc024 Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Fri, 12 Nov 2021 18:01:05 +0100
 Subject: [PATCH] meson.build: add girdir to gio-2.0.pc and glib-2.0.pc
@@ -14,6 +14,8 @@ Fixes:
  - http://autobuild.buildroot.org/results/3088ef32b03e0bb984291b1227b187f1ff816eb7
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 Upstream: Never submitted
 ---
  gio/meson.build  | 1 +
@@ -21,22 +23,22 @@ Upstream: Never submitted
  2 files changed, 2 insertions(+)
 
 diff --git a/gio/meson.build b/gio/meson.build
-index 29473d26b..112d4ada9 100644
+index 462606f3b56c..e6b736167b8d 100644
 --- a/gio/meson.build
 +++ b/gio/meson.build
-@@ -841,6 +841,7 @@ pkg.generate(libgio,
+@@ -880,6 +880,7 @@ pkg.generate(libgio,
    variables : ['datadir=' + join_paths('${prefix}', get_option('datadir')),
                 'schemasdir=' + join_paths('${datadir}', schemas_subdir),
                 'bindir=' + join_paths('${prefix}', get_option('bindir')),
 +               'girdir=' + join_paths('${libdir}', '../share/gir-1.0'),
                 'giomoduledir=' + pkgconfig_giomodulesdir,
                 'gio=' + join_paths('${bindir}', 'gio'),
-                'gio_querymodules=' + join_paths('${bindir}', 'gio-querymodules'),
+                'gio_querymodules=@0@'.format(pkgconfig_multiarch_bindir / 'gio-querymodules'),
 diff --git a/glib/meson.build b/glib/meson.build
-index f78f32969..6c5486699 100644
+index da76fc005e46..cde2edb197c7 100644
 --- a/glib/meson.build
 +++ b/glib/meson.build
-@@ -384,6 +384,7 @@ pkg.generate(libglib,
+@@ -441,6 +441,7 @@ pkg.generate(libglib,
    subdirs : ['glib-2.0'],
    extra_cflags : ['-I${libdir}/glib-2.0/include'] + win32_cflags,
    variables : ['bindir=' + join_paths('${prefix}', get_option('bindir')),
@@ -45,5 +47,5 @@ index f78f32969..6c5486699 100644
                 'gobject_query=' + join_paths('${bindir}', 'gobject-query'),
                 'glib_mkenums=' + join_paths('${bindir}', 'glib-mkenums')],
 -- 
-2.33.0
+2.43.0
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
