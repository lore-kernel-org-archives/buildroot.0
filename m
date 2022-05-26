Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1922C433EF
	for <buildroot@archiver.kernel.org>; Thu, 26 May 2022 08:21:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B5008452A;
	Thu, 26 May 2022 08:21:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 297069afbz4K; Thu, 26 May 2022 08:21:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F7178428D;
	Thu, 26 May 2022 08:21:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 50C2F1BF3D9
 for <buildroot@lists.busybox.net>; Thu, 26 May 2022 08:20:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD8164255C
 for <buildroot@lists.busybox.net>; Thu, 26 May 2022 08:20:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4XgqrYlp_h0W for <buildroot@lists.busybox.net>;
 Thu, 26 May 2022 08:20:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7244C4255E
 for <buildroot@buildroot.org>; Thu, 26 May 2022 08:20:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id DAB3D864D7; Thu, 26 May 2022 08:09:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 26 May 2022 10:17:13 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: bb62363012653011a88ea522845b838ba0d1e97b
X-Git-Newrev: bd95f34edc947262cae1b77994c190103db34b52
X-Patchwork-Hint: ignore
Message-Id: <20220526080925.DAB3D864D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/pango: bump to
 version 1.50.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=bd95f34edc947262cae1b77994c190103db34b52
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

remove merged patch

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit c5fa4ae0d6c8dd24268ca2ad6f3a45feedeab6a4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-utils-viewer-cairo-c-fix-empty-body.patch | 40 ----------------------
 package/pango/pango.hash                           |  4 +--
 package/pango/pango.mk                             |  2 +-
 3 files changed, 3 insertions(+), 43 deletions(-)

diff --git a/package/pango/0001-utils-viewer-cairo-c-fix-empty-body.patch b/package/pango/0001-utils-viewer-cairo-c-fix-empty-body.patch
deleted file mode 100644
index 4b7b5f9b19..0000000000
--- a/package/pango/0001-utils-viewer-cairo-c-fix-empty-body.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 5372a0cfd641776ece77db5590bf0d265e810086 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 29 Mar 2022 21:39:03 +0000
-Subject: [PATCH] utils/viewer-cairo.c: fix empty-body
-
-Fix the following build failure raised
-since version 1.50.5 and
-https://gitlab.gnome.org/GNOME/pango/-/commit/cd08fb7402498e6ea542b4628447547477ac212e:
-
-../utils/viewer-cairo.c: In function 'cairo_vector_view_create':
-../utils/viewer-cairo.c:228:5: error: suggest braces around empty body in an 'if' statement [-Werror=empty-body]
-     ;
-     ^
-
-Fixes:
- - http://autobuild.buildroot.org/results/dee3d631474f83b345f22eb26c59a305c32258f8
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://gitlab.gnome.org/GNOME/pango/-/commit/5372a0cfd641776ece77db5590bf0d265e810086]
----
- utils/viewer-cairo.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/utils/viewer-cairo.c b/utils/viewer-cairo.c
-index ca98c1cd..f15b3fb9 100644
---- a/utils/viewer-cairo.c
-+++ b/utils/viewer-cairo.c
-@@ -225,7 +225,7 @@ cairo_vector_view_create (const PangoViewer *klass G_GNUC_UNUSED)
-     return NULL;
- 
-   if (0)
--    ;
-+    {}
-   #ifdef CAIRO_HAS_SVG_SURFACE
-     else if (0 == g_ascii_strcasecmp (extension, "svg"))
-       constructor = cairo_svg_surface_create;
--- 
-GitLab
-
diff --git a/package/pango/pango.hash b/package/pango/pango.hash
index fecf368535..7864df7a21 100644
--- a/package/pango/pango.hash
+++ b/package/pango/pango.hash
@@ -1,5 +1,5 @@
-# From https://ftp.acc.umu.se/pub/GNOME/sources/pango/1.50/pango-1.50.6.sha256sum
-sha256  a998bcf36881c3ac20495d40bceb304f4eaa9175bd2967c85656434cbdafe86a  pango-1.50.6.tar.xz
+# From https://ftp.acc.umu.se/pub/GNOME/sources/pango/1.50/pango-1.50.7.sha256sum
+sha256  0477f369a3d4c695df7299a6989dc004756a7f4de27eecac405c6790b7e3ad33  pango-1.50.7.tar.xz
 
 # Locally computed
 sha256  d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index c264e76741..c1c7ceeed6 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PANGO_VERSION_MAJOR = 1.50
-PANGO_VERSION = $(PANGO_VERSION_MAJOR).6
+PANGO_VERSION = $(PANGO_VERSION_MAJOR).7
 PANGO_SOURCE = pango-$(PANGO_VERSION).tar.xz
 PANGO_SITE = http://ftp.gnome.org/pub/GNOME/sources/pango/$(PANGO_VERSION_MAJOR)
 PANGO_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
