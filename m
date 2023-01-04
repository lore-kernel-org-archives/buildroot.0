Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E667C4332F
	for <buildroot@archiver.kernel.org>; Wed,  4 Jan 2023 16:56:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40EF641896;
	Wed,  4 Jan 2023 16:56:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40EF641896
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yqZXflxv_wyD; Wed,  4 Jan 2023 16:56:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58ABA41893;
	Wed,  4 Jan 2023 16:56:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58ABA41893
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 539CE1BF5DF
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 16:54:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BAA9C41894
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 16:54:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAA9C41894
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NNPXI9v2q0e3 for <buildroot@lists.busybox.net>;
 Wed,  4 Jan 2023 16:54:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB9CA41897
 for <buildroot@buildroot.org>; Wed,  4 Jan 2023 16:54:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB9CA41897
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BC74487518; Wed,  4 Jan 2023 16:54:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Jan 2023 17:53:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 11614fdde1611f846b8e5d99f55af7c6c131b817
X-Git-Newrev: 90e65e46b7c00218058e32efd079df291b736c4a
X-Patchwork-Hint: ignore
Message-Id: <20230104165453.BC74487518@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/ti-k3-r5-loader: drop bogus
 TI_K3_R5_LOADER_BOARD
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
