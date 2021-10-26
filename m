Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96F15C433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 12:16:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EE836103C
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 12:16:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5EE836103C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B83960A39;
	Tue, 26 Oct 2021 12:16:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LnWSMWAYeC9n; Tue, 26 Oct 2021 12:16:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83CFB60A57;
	Tue, 26 Oct 2021 12:16:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 119B21BF38D
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 12:15:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EEAF84026D
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 12:15:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qCs-HGOg32nk for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 12:15:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 654AD40476
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 12:15:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 32BDD88DBC; Tue, 26 Oct 2021 12:12:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 26 Oct 2021 14:14:22 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 67a9ec958a9a30fc248dd64f8198955b4221b1f8
X-Git-Newrev: 45ec76a164acfdd8a4425e918b538f3a2cda3836
X-Patchwork-Hint: ignore
Message-Id: <20211026121221.32BDD88DBC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/freerdp: fix
 build with gcc 4.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=45ec76a164acfdd8a4425e918b538f3a2cda3836
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Build is broken with gcc 4.8 since bump to version 2.3.1 in commit
01e78811db25c34d506138994efd981e4ab60caf due to
https://github.com/FreeRDP/FreeRDP/commit/5b2f35747bb37b09b1803b99ca2b1cb248b5bb16

Fixes:
 - http://autobuild.buildroot.org/results/e8e7d43d6183bb6de7bd2c2b300dbdb89f2052d8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 11e899f2b3297c6e5067fc29f59e9f02674b661f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Fix-variable-declaration-in-loop.patch    | 33 +++++++++++++++++++++
 .../0002-Fixed-variable-declaration-in-loop.patch  | 34 ++++++++++++++++++++++
 2 files changed, 67 insertions(+)

diff --git a/package/freerdp/0001-Fix-variable-declaration-in-loop.patch b/package/freerdp/0001-Fix-variable-declaration-in-loop.patch
new file mode 100644
index 0000000000..a391e42ee6
--- /dev/null
+++ b/package/freerdp/0001-Fix-variable-declaration-in-loop.patch
@@ -0,0 +1,33 @@
+From ddde652460350b962d32036981ff8ed77ed2f1ed Mon Sep 17 00:00:00 2001
+From: Armin Novak <armin.novak@thincast.com>
+Date: Wed, 16 Sep 2020 09:30:37 +0200
+Subject: [PATCH] Fix variable declaration in loop
+
+[Retrieved from:
+https://github.com/FreeRDP/FreeRDP/commit/ddde652460350b962d32036981ff8ed77ed2f1ed]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ client/X11/xf_graphics.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/client/X11/xf_graphics.c b/client/X11/xf_graphics.c
+index 76fbef5bd6..bf71b563c3 100644
+--- a/client/X11/xf_graphics.c
++++ b/client/X11/xf_graphics.c
+@@ -386,6 +386,7 @@ static BOOL xf_Pointer_New(rdpContext* context, rdpPointer* pointer)
+ static void xf_Pointer_Free(rdpContext* context, rdpPointer* pointer)
+ {
+ #ifdef WITH_XCURSOR
++	UINT32 i;
+ 	xfContext* xfc = (xfContext*)context;
+ 	xfPointer* xpointer = (xfPointer*)pointer;
+ 
+@@ -395,7 +396,7 @@ static void xf_Pointer_Free(rdpContext* context, rdpPointer* pointer)
+ 	free(xpointer->cursorWidths);
+ 	free(xpointer->cursorHeights);
+ 
+-	for (int i = 0; i < xpointer->nCursors; i++)
++	for (i = 0; i < xpointer->nCursors; i++)
+ 	{
+ 		XFreeCursor(xfc->display, xpointer->cursors[i]);
+ 	}
diff --git a/package/freerdp/0002-Fixed-variable-declaration-in-loop.patch b/package/freerdp/0002-Fixed-variable-declaration-in-loop.patch
new file mode 100644
index 0000000000..14e1d6c8f4
--- /dev/null
+++ b/package/freerdp/0002-Fixed-variable-declaration-in-loop.patch
@@ -0,0 +1,34 @@
+From 4f8a48d96e472e43a5f856c449f61669792ce9fa Mon Sep 17 00:00:00 2001
+From: akallabeth <akallabeth@posteo.net>
+Date: Tue, 22 Sep 2020 07:43:56 +0200
+Subject: [PATCH] Fixed variable declaration in loop
+
+[Retrieved from:
+https://github.com/FreeRDP/FreeRDP/commit/4f8a48d96e472e43a5f856c449f61669792ce9fa]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ client/X11/xf_graphics.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/client/X11/xf_graphics.c b/client/X11/xf_graphics.c
+index bf71b563c3..c50726c8e4 100644
+--- a/client/X11/xf_graphics.c
++++ b/client/X11/xf_graphics.c
+@@ -240,7 +240,7 @@ static BOOL _xf_Pointer_GetCursorForCurrentScale(rdpContext* context, const rdpP
+ 	double xscale;
+ 	double yscale;
+ 	size_t size;
+-	int cursorIndex = -1;
++	int cursorIndex = -1, i;
+ 
+ 	if (!context || !pointer || !context->gdi)
+ 		return FALSE;
+@@ -255,7 +255,7 @@ static BOOL _xf_Pointer_GetCursorForCurrentScale(rdpContext* context, const rdpP
+ 	xTargetSize = pointer->width * xscale;
+ 	yTargetSize = pointer->height * yscale;
+ 
+-	for (int i = 0; i < xpointer->nCursors; i++)
++	for (i = 0; i < xpointer->nCursors; i++)
+ 	{
+ 		if (xpointer->cursorWidths[i] == xTargetSize && xpointer->cursorHeights[i] == yTargetSize)
+ 		{
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
