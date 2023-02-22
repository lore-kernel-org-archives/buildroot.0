Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B27C636D6
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 17:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9A2C541799;
	Wed, 22 Feb 2023 17:14:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A2C541799
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WJvj6cT4zrGy; Wed, 22 Feb 2023 17:14:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CADBB41792;
	Wed, 22 Feb 2023 17:14:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CADBB41792
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 075B81BF364
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 17:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9077A813CC
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 17:08:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9077A813CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SeHT3tMt663M for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 17:08:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF00781FFC
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 17:08:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF00781FFC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CD19C82261; Wed, 22 Feb 2023 17:08:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 17:45:18 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 972ad2022e2757eb43d2cea328fc583fbfdaf408
X-Git-Newrev: 89d06caa82ddd0ba259a5c1d302155fa904ac4bd
X-Patchwork-Hint: ignore
Message-Id: <20230222170818.CD19C82261@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] boot/uboot: remove use of
 legacy xloader symbol
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

commit: https://git.buildroot.net/buildroot/commit/?id=89d06caa82ddd0ba259a5c1d302155fa904ac4bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Commit "070b183d0c boot/xloader: remove package", from release 2018.11,
removed the package, but the symbol is still referenced.

Remove the reference to it.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 9b1b1763b754f8a25cf0f2a7fe05e53d256fe675)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/uboot/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 557472b58b..7b7cad53f1 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -430,7 +430,6 @@ endif
 
 config BR2_TARGET_UBOOT_SPL
 	bool "Install U-Boot SPL binary image"
-	depends on !BR2_TARGET_XLOADER
 	help
 	  Install the U-Boot SPL binary image to the images
 	  directory.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
