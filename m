Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A3DAC61DA4
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 17:10:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 05D7E4172B;
	Wed, 22 Feb 2023 17:10:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05D7E4172B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K1_5xGgUpSNB; Wed, 22 Feb 2023 17:10:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 230334173E;
	Wed, 22 Feb 2023 17:10:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 230334173E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1A1F11BF97A
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 17:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A7C7C8200C
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 17:08:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7C7C8200C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WgWMXehsemvb for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 17:08:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6ED3581432
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 17:08:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6ED3581432
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6C4B8867D5; Wed, 22 Feb 2023 17:08:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 17:45:13 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 48351fe47d2d0390687f9a401fc684076eae2936
X-Git-Newrev: 3ba34e0e3d59917e9c3645e738ba1faa472b48a6
X-Patchwork-Hint: ignore
Message-Id: <20230222170816.6C4B8867D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] boot/uboot: remove use of
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

commit: https://git.buildroot.net/buildroot/commit/?id=3ba34e0e3d59917e9c3645e738ba1faa472b48a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
index 953c36135e..3fe2a94ff9 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -414,7 +414,6 @@ endif
 
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
