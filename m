Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44DE9C00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 08:59:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEE2B41655;
	Fri, 29 Jul 2022 08:59:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEE2B41655
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YdAr7hXzN8AU; Fri, 29 Jul 2022 08:59:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB381415C4;
	Fri, 29 Jul 2022 08:59:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB381415C4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 36AE11BF20B
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 08:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F25D40AFE
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 08:59:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F25D40AFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AZ-L_GXXhJm7 for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 08:59:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5782D4016A
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 08:59:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5782D4016A
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 06FED868B0; Fri, 29 Jul 2022 08:45:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 Jul 2022 10:58:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0005048ec6be44f1bf7b2458beb698f7acf23ccf
X-Git-Newrev: 4a2388f9dd11fee0a2b18a6ddec72cd23cd03177
X-Patchwork-Hint: ignore
Message-Id: <20220729084523.06FED868B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/aspeed_ast2500evb_defconfig: needs
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4a2388f9dd11fee0a2b18a6ddec72cd23cd03177
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800458

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/aspeed_ast2500evb_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/aspeed_ast2500evb_defconfig b/configs/aspeed_ast2500evb_defconfig
index c969f18d07..8db5a39a13 100644
--- a/configs/aspeed_ast2500evb_defconfig
+++ b/configs/aspeed_ast2500evb_defconfig
@@ -33,6 +33,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="evb-ast2500"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=ast2500-evb"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/aspeed/ast2500-evb/uboot.fragment"
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
