Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F034C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 17:27:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5B4B8282C;
	Mon,  4 Apr 2022 17:27:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BHT_OMTC3Wbb; Mon,  4 Apr 2022 17:27:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E404F81B14;
	Mon,  4 Apr 2022 17:27:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F17381BF9AD
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 17:26:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF6594050C
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 17:26:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5QSicgk7fxzi for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 17:26:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CAA3040182
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 17:26:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 5C0198622F; Mon,  4 Apr 2022 17:17:29 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 4 Apr 2022 19:15:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d2fc098faa5b8b8608b4c3d56dc526374c3319aa
X-Git-Newrev: 43991ac5e0e6cdb4aa03ed7011243aa0f473fd56
X-Patchwork-Hint: ignore
Message-Id: <20220404171729.5C0198622F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pango: fix empty-body
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

commit: https://git.buildroot.net/buildroot/commit/?id=43991ac5e0e6cdb4aa03ed7011243aa0f473fd56
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
