Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44B28D59F67
	for <buildroot@archiver.kernel.org>; Wed,  6 Nov 2024 21:13:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD4654075F;
	Wed,  6 Nov 2024 21:13:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xzbd9U9MNeAt; Wed,  6 Nov 2024 21:13:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF85340748
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF85340748;
	Wed,  6 Nov 2024 21:13:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 00F414C38
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 21:13:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DCE14403E7
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 21:13:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u3pjpmQJGvDE for <buildroot@buildroot.org>;
 Wed,  6 Nov 2024 21:13:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DBB7E40260
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DBB7E40260
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 21:13:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CF7B885E53; Wed,  6 Nov 2024 21:13:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 6 Nov 2024 21:49:30 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: f51525bca2865ac47bfdc96bc09987ad3797a20a
X-Git-Newrev: b0cfdd972afee887246acf44d6aef34007bc6938
X-Patchwork-Hint: ignore
Message-Id: <20241106211315.CF7B885E53@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] boot/uboot: update link
 to the U-Boot docs
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

commit: https://git.buildroot.net/buildroot/commit/?id=b0cfdd972afee887246acf44d6aef34007bc6938
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

The denx.de/wiki/U-Boot link now redirects to docs.u-boot.org/en/latest
Replace the link to the new location for the U-Boot documentation

Signed-off-by: Bryan Brattlof <bb@ti.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 164d9f0546372eb076506eebc8f88c6c4a544a36)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/uboot/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index beafb38930..5b524c487f 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -3,7 +3,7 @@ config BR2_TARGET_UBOOT
 	help
 	  Build "Das U-Boot" Boot Monitor
 
-	  https://www.denx.de/wiki/U-Boot
+	  https://docs.u-boot.org/en/latest/
 
 if BR2_TARGET_UBOOT
 choice
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
