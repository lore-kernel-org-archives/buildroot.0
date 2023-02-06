Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13512C61DA4
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 13:25:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3C6760AAF;
	Mon,  6 Feb 2023 13:25:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3C6760AAF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OsIew2Qd5voh; Mon,  6 Feb 2023 13:25:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA19B60B03;
	Mon,  6 Feb 2023 13:25:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA19B60B03
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 036411BF2A7
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 13:23:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CAEB740459
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 13:23:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CAEB740459
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JX-9CnJRvXQz for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 13:23:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 55BD240471
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 13:23:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55BD240471
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 51D8283C26; Mon,  6 Feb 2023 13:23:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 14:22:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: abcecd737b198e8a1a48bf4533e5c2b8de8b8cf4
X-Git-Newrev: 9b1b1763b754f8a25cf0f2a7fe05e53d256fe675
X-Patchwork-Hint: ignore
Message-Id: <20230206132305.51D8283C26@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/uboot: remove use of legacy xloader
 symbol
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

commit: https://git.buildroot.net/buildroot/commit/?id=9b1b1763b754f8a25cf0f2a7fe05e53d256fe675
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit "070b183d0c boot/xloader: remove package", from release 2018.11,
removed the package, but the symbol is still referenced.

Remove the reference to it.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/uboot/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 282418c3ed..f5c20f5168 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -450,7 +450,6 @@ endif
 
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
