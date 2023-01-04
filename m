Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0CA5C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:01:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 589F54EE6A;
	Tue, 21 Feb 2023 00:01:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 589F54EE6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0rQMiK3T_44E; Tue, 21 Feb 2023 00:01:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D3034EE89;
	Tue, 21 Feb 2023 00:01:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D3034EE89
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6214E1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:58:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB7146F95F
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB7146F95F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l0DjD3-gacfU for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF8276F9B3
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF8276F9B3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DD4CF828C8; Mon, 20 Feb 2023 20:52:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Jan 2023 17:53:50 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 11614fdde1611f846b8e5d99f55af7c6c131b817
X-Git-Newrev: 90e65e46b7c00218058e32efd079df291b736c4a
X-Patchwork-Hint: ignore
Message-Id: <20230220205223.DD4CF828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] boot/ti-k3-r5-loader: drop
 bogus TI_K3_R5_LOADER_BOARD
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

commit: https://git.buildroot.net/buildroot/commit/?id=90e65e46b7c00218058e32efd079df291b736c4a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit "0189bcb47c boot/ti-k3-r5-loader: new package" added an unused
define.
The define value is calculated from an inexistent option
BR2_TARGET_TI_K3_R5_LOADER_BOARD, so drop the line.

Cc: Anand Gadiyar <gadiyar@ti.com>
Cc: Xuanhao Shi <X15000177@gmail.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
index 422ab20d71..afa309aa98 100644
--- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
+++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
@@ -26,7 +26,6 @@ TI_K3_R5_LOADER_KCONFIG_DEPENDENCIES = \
 	$(BR2_BISON_HOST_DEPENDENCY) \
 	$(BR2_FLEX_HOST_DEPENDENCY)
 
-TI_K3_R5_LOADER_BOARD = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_BOARD))
 ifeq ($(BR2_TARGET_TI_K3_R5_LOADER_USE_DEFCONFIG),y)
 TI_K3_R5_LOADER_KCONFIG_DEFCONFIG = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG))_defconfig
 else ifeq ($(BR2_TARGET_TI_K3_R5_LOADER_USE_CUSTOM_CONFIG),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
