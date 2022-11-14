Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A96F2C433FE
	for <buildroot@archiver.kernel.org>; Mon, 14 Nov 2022 22:27:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3AB7D40155;
	Mon, 14 Nov 2022 22:27:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3AB7D40155
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oFUfzRS5tJV7; Mon, 14 Nov 2022 22:27:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A4E34031E;
	Mon, 14 Nov 2022 22:27:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A4E34031E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7189D1BF36D
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 22:27:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B78C4031E
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 22:27:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B78C4031E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hj8by6dO6mwj for <buildroot@lists.busybox.net>;
 Mon, 14 Nov 2022 22:27:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F8EA40217
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 22:27:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F8EA40217
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5EDCA83BA2; Mon, 14 Nov 2022 22:27:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 14 Nov 2022 23:25:45 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 4613d5d513579517dcaa004b469ceb0234027ce3
X-Git-Newrev: 968ba22f93ff6dbd11e807e9922031317d6f48fb
X-Patchwork-Hint: ignore
Message-Id: <20221114222746.5EDCA83BA2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/mupdf: fix
 CVE-2021-4216
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

commit: https://git.buildroot.net/buildroot/commit/?id=968ba22f93ff6dbd11e807e9922031317d6f48fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

A Floating point exception (division-by-zero) flaw was found in Mupdf
for zero width pages in muraster.c. It is fixed in Mupdf-1.20.0-rc1
upstream.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 3ddca0ccb90967977c2db8c966c205568cf4cb93)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-by-zero-for-zero-width-pages-in-muraster.patch | 29 ++++++++++++++++++++++
 package/mupdf/mupdf.mk                             |  3 +++
 2 files changed, 32 insertions(+)

diff --git a/package/mupdf/0005-Bug-704834-Fix-division-by-zero-for-zero-width-pages-in-muraster.patch b/package/mupdf/0005-Bug-704834-Fix-division-by-zero-for-zero-width-pages-in-muraster.patch
new file mode 100644
index 0000000000..099a3fdbab
--- /dev/null
+++ b/package/mupdf/0005-Bug-704834-Fix-division-by-zero-for-zero-width-pages-in-muraster.patch
@@ -0,0 +1,29 @@
+From 22c47acbd52949421f8c7cb46ea1556827d0fcbf Mon Sep 17 00:00:00 2001
+From: Sebastian Rasmussen <sebras@gmail.com>
+Date: Tue, 18 Jan 2022 20:33:10 +0100
+Subject: [PATCH] Bug 704834: Fix division by zero for zero width pages in
+ muraster.
+
+[Retrieved from:
+https://github.com/ArtifexSoftware/mupdf/commit/22c47acbd52949421f8c7cb46ea1556827d0fcbf]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ source/tools/muraster.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/source/tools/muraster.c b/source/tools/muraster.c
+index c2ceb62f2e..97f4ae2633 100644
+--- a/source/tools/muraster.c
++++ b/source/tools/muraster.c
+@@ -1003,8 +1003,9 @@ initialise_banding(fz_context *ctx, render_details *render, int color)
+ 
+ 	w = render->ibounds.x1 - render->ibounds.x0;
+ 	min_band_mem = (size_t)bpp * w * min_band_height;
+-	reps = (int)(max_band_memory / min_band_mem);
+-	if (reps < 1)
++	if (min_band_mem > 0)
++		reps = (int)(max_band_memory / min_band_mem);
++	if (min_band_mem == 0 || reps < 1)
+ 		reps = 1;
+ 
+ 	/* Adjust reps to even out the work between threads */
diff --git a/package/mupdf/mupdf.mk b/package/mupdf/mupdf.mk
index 56ea7cc507..e86ba1e73f 100644
--- a/package/mupdf/mupdf.mk
+++ b/package/mupdf/mupdf.mk
@@ -28,6 +28,9 @@ MUPDF_IGNORE_CVES += CVE-2021-3407
 # 0003-Bug-703791-Stay-within-hash-table-max-key-size-in-cached-color-converter.patch
 MUPDF_IGNORE_CVES += CVE-2021-37220
 
+# 0005-Bug-704834-Fix-division-by-zero-for-zero-width-pages-in-muraster.patch
+MUPDF_IGNORE_CVES += CVE-2021-4216
+
 # The pkg-config name for gumbo-parser is `gumbo`.
 MUPDF_PKG_CONFIG_PACKAGES = \
 	freetype2 \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
