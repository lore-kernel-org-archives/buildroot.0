Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5177C35FF1
	for <buildroot@archiver.kernel.org>; Thu, 13 Mar 2025 20:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7497C4178C;
	Thu, 13 Mar 2025 20:49:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XOcH2lwxWlfJ; Thu, 13 Mar 2025 20:49:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2255D417C3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2255D417C3;
	Thu, 13 Mar 2025 20:49:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D510115
 for <buildroot@buildroot.org>; Thu, 13 Mar 2025 20:49:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 329E3401A2
 for <buildroot@buildroot.org>; Thu, 13 Mar 2025 20:49:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zOJTV3S1B-aI for <buildroot@buildroot.org>;
 Thu, 13 Mar 2025 20:48:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8756408F1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C8756408F1
 for <buildroot@buildroot.org>; Thu, 13 Mar 2025 20:48:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B0B4087FBE; Thu, 13 Mar 2025 20:48:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 13 Mar 2025 21:17:42 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: 9c0891190a66c50fe6f2a7f6a66aad7854e1d13f
X-Git-Newrev: 9ddb20f8dc065dbd197ecd560cb470cc41cfcd64
X-Patchwork-Hint: ignore
Message-Id: <20250313204858.B0B4087FBE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/foot: support
 soft-float architecture
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=9ddb20f8dc065dbd197ecd560cb470cc41cfcd64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

Architecture using soft float don't support the math FE_* exceptions.
This commit adds a patch to conditionnally build the FE_* exception
handling.

Fixes:
    https://autobuild.buildroot.org/results/88d/88d764dd12bdbdbe633ebc703c461ebe95b75693/

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit ac83fdcb29f64af79839bb8efffbaae71f0cc3cc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...wings-handle-architecture-with-soft-float.patch | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/package/foot/0001-box-drawings-handle-architecture-with-soft-float.patch b/package/foot/0001-box-drawings-handle-architecture-with-soft-float.patch
new file mode 100644
index 0000000000..1120fa44c1
--- /dev/null
+++ b/package/foot/0001-box-drawings-handle-architecture-with-soft-float.patch
@@ -0,0 +1,42 @@
+From 9443ac7e2937bb4f26cf44c73bb8150860c5df45 Mon Sep 17 00:00:00 2001
+From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
+Date: Tue, 4 Feb 2025 09:48:13 +0100
+Subject: [PATCH] box-drawings: handle architecture with soft-float
+
+Currently, architecture using soft-floats doesn't support instructions
+FE_INVALID, FE_DIVBYZERO, FE_OVERFLOW and FE_UNDERFLOW and so building
+on those architectures results with a build error.
+As the sqrt math function should set errno to EDOM if an error occurs,
+fetestexcept shouldn't be mandatory.
+
+This commit removes the float environment error handling.
+
+Upstream: https://codeberg.org/dnkl/foot/commit/9443ac7e2937bb4f26cf44c73bb8150860c5df45
+Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
+---
+ box-drawing.c | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/box-drawing.c b/box-drawing.c
+index 1c613051..421ff54d 100644
+--- a/box-drawing.c
++++ b/box-drawing.c
+@@ -1462,14 +1462,12 @@ draw_box_drawings_light_arc(struct buf *buf, char32_t wc)
+      */
+     for (double i = y_min*16; i <= y_max*16; i++) {
+         errno = 0;
+-        feclearexcept(FE_ALL_EXCEPT);
+ 
+         double y = i / 16.;
+         double x = circle_hemisphere * sqrt(c_r2 - (y - c_y) * (y - c_y)) + c_x;
+ 
+         /* See math_error(7) */
+-        if (errno != 0 ||
+-            fetestexcept(FE_INVALID | FE_DIVBYZERO | FE_OVERFLOW | FE_UNDERFLOW))
++        if (errno != 0)
+         {
+             continue;
+         }
+-- 
+2.48.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
