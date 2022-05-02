Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C932C433F5
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 21:59:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0630C81450;
	Mon,  2 May 2022 21:59:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Er8_Mho1B1Yr; Mon,  2 May 2022 21:59:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BE2C81398;
	Mon,  2 May 2022 21:59:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5923C1BF2BC
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:59:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5165060F4C
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:59:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4V64-8DjMq1d for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 21:59:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0034A60E2D
 for <buildroot@buildroot.org>; Mon,  2 May 2022 21:59:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id BDED484F0E; Mon,  2 May 2022 21:48:50 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 2 May 2022 23:40:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a6b71b47568cebe9b0a36380f4cbce509411017c
X-Git-Newrev: 8c25838b53e6e469839a71df5da610378e87aa40
X-Patchwork-Hint: ignore
Message-Id: <20220502214850.BDED484F0E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rockchip-mali: fix build failure
 due to missing URL
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

commit: https://git.buildroot.net/buildroot/commit/?id=8c25838b53e6e469839a71df5da610378e87aa40
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Github rockchip-linux doesn't provide libmali repository anymore and the
only up-to-date and maintained repository I've found is JeffyCN/mirrors
branch libmali that provide the identical situtation we were at with
previous repository, so let's switch to JeffyCN repository. This fixes
a build failure while trying to install rockchip-mali.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/rockchip-mali/rockchip-mali.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rockchip-mali/rockchip-mali.mk b/package/rockchip-mali/rockchip-mali.mk
index 6200191a73..848682229d 100644
--- a/package/rockchip-mali/rockchip-mali.mk
+++ b/package/rockchip-mali/rockchip-mali.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ROCKCHIP_MALI_VERSION = 721653b5b3b525a4f80d15aa7e2f9df7b7e60427
-ROCKCHIP_MALI_SITE = $(call github,rockchip-linux,libmali,$(ROCKCHIP_MALI_VERSION))
+ROCKCHIP_MALI_SITE = $(call github,JeffyCN,mirrors,$(ROCKCHIP_MALI_VERSION))
 ROCKCHIP_MALI_LICENSE = Proprietary
 ROCKCHIP_MALI_LICENSE_FILES = END_USER_LICENCE_AGREEMENT.txt
 ROCKCHIP_MALI_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
