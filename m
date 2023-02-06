Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCB6AC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:14:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FF7D4F159;
	Tue, 21 Feb 2023 00:14:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FF7D4F159
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DtrEG19xUb9q; Tue, 21 Feb 2023 00:14:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 578D84F060;
	Tue, 21 Feb 2023 00:14:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 578D84F060
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BEE541BF27E
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28080415A1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28080415A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZI5pihG3iXEN for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6DC50417A0
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DC50417A0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6AE65828C8; Mon, 20 Feb 2023 20:52:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 14:22:38 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: abcecd737b198e8a1a48bf4533e5c2b8de8b8cf4
X-Git-Newrev: 9b1b1763b754f8a25cf0f2a7fe05e53d256fe675
X-Patchwork-Hint: ignore
Message-Id: <20230220205249.6AE65828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] boot/uboot: remove use of
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

commit: https://git.buildroot.net/buildroot/commit/?id=9b1b1763b754f8a25cf0f2a7fe05e53d256fe675
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
