Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ABD3C433FE
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 15:15:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C55CB409F9;
	Sat, 23 Apr 2022 15:15:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oCPFNWH6iIm2; Sat, 23 Apr 2022 15:15:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 457614146F;
	Sat, 23 Apr 2022 15:15:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 153E41BF95C
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 15:12:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFC2483E0C
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 15:12:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yfvEtpLgJqY6 for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 15:12:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 33BD583E14
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 15:12:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 0C39283FE2; Sat, 23 Apr 2022 15:02:46 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 23 Apr 2022 17:03:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bf781cbb639a527525607036a81cbf913be2edb7
X-Git-Newrev: c5fa4ae0d6c8dd24268ca2ad6f3a45feedeab6a4
X-Patchwork-Hint: ignore
Message-Id: <20220423150246.0C39283FE2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pango: bump to version 1.50.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=c5fa4ae0d6c8dd24268ca2ad6f3a45feedeab6a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

remove merged patch

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
