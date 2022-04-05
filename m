Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68421C433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Apr 2022 20:07:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18CC841703;
	Tue,  5 Apr 2022 20:07:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UAWXDXSOmsQb; Tue,  5 Apr 2022 20:07:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D577D4174C;
	Tue,  5 Apr 2022 20:07:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5B0B51BF3A4
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 20:06:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 46451812CC
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 20:06:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a3dJPRoV9DWk for <buildroot@lists.busybox.net>;
 Tue,  5 Apr 2022 20:06:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE53082FA2
 for <buildroot@buildroot.org>; Tue,  5 Apr 2022 20:06:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 045DF8363E; Tue,  5 Apr 2022 19:57:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 5 Apr 2022 21:52:13 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: b82afb7f10d8561efa5651f452acf79824efc3fb
X-Git-Newrev: 99d31b4da16d22a715e3be5183c42a50deec92d6
X-Patchwork-Hint: ignore
Message-Id: <20220405195717.045DF8363E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/pango: fix
 empty-body
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

commit: https://git.buildroot.net/buildroot/commit/?id=99d31b4da16d22a715e3be5183c42a50deec92d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix the following build failure raised since bump to version 1.50.5 in
commit 68b0efbae49a42d0e14d6040e5e7e573d382ff75:

../utils/viewer-cairo.c: In function 'cairo_vector_view_create':
../utils/viewer-cairo.c:228:5: error: suggest braces around empty body in an 'if' statement [-Werror=empty-body]
     ;
     ^

Fixes:
 - http://autobuild.buildroot.org/results/dee3d631474f83b345f22eb26c59a305c32258f8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 43991ac5e0e6cdb4aa03ed7011243aa0f473fd56)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-utils-viewer-cairo-c-fix-empty-body.patch | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/package/pango/0001-utils-viewer-cairo-c-fix-empty-body.patch b/package/pango/0001-utils-viewer-cairo-c-fix-empty-body.patch
new file mode 100644
index 0000000000..4b7b5f9b19
--- /dev/null
+++ b/package/pango/0001-utils-viewer-cairo-c-fix-empty-body.patch
@@ -0,0 +1,40 @@
+From 5372a0cfd641776ece77db5590bf0d265e810086 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 29 Mar 2022 21:39:03 +0000
+Subject: [PATCH] utils/viewer-cairo.c: fix empty-body
+
+Fix the following build failure raised
+since version 1.50.5 and
+https://gitlab.gnome.org/GNOME/pango/-/commit/cd08fb7402498e6ea542b4628447547477ac212e:
+
+../utils/viewer-cairo.c: In function 'cairo_vector_view_create':
+../utils/viewer-cairo.c:228:5: error: suggest braces around empty body in an 'if' statement [-Werror=empty-body]
+     ;
+     ^
+
+Fixes:
+ - http://autobuild.buildroot.org/results/dee3d631474f83b345f22eb26c59a305c32258f8
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://gitlab.gnome.org/GNOME/pango/-/commit/5372a0cfd641776ece77db5590bf0d265e810086]
+---
+ utils/viewer-cairo.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/utils/viewer-cairo.c b/utils/viewer-cairo.c
+index ca98c1cd..f15b3fb9 100644
+--- a/utils/viewer-cairo.c
++++ b/utils/viewer-cairo.c
+@@ -225,7 +225,7 @@ cairo_vector_view_create (const PangoViewer *klass G_GNUC_UNUSED)
+     return NULL;
+ 
+   if (0)
+-    ;
++    {}
+   #ifdef CAIRO_HAS_SVG_SURFACE
+     else if (0 == g_ascii_strcasecmp (extension, "svg"))
+       constructor = cairo_svg_surface_create;
+-- 
+GitLab
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
