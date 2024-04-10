Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA09CD11C2
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 20:00:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BB6FA40182;
	Wed, 10 Apr 2024 20:00:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 75gWS4kmot4N; Wed, 10 Apr 2024 20:00:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE3F3417AB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE3F3417AB;
	Wed, 10 Apr 2024 20:00:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 373521BF983
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 20:00:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5191E406B7
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 20:00:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j93LsBvhPcUM for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 20:00:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B209406A4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B209406A4
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 20:00:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4332C85E94; Wed, 10 Apr 2024 20:00:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 10 Apr 2024 21:50:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6406ee805f1a94646a0d05979161fa53164520e0
X-Git-Newrev: 07d3c7e263673864274d81071d71543cea06847c
X-Patchwork-Hint: ignore
Message-Id: <20240410200011.4332C85E94@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/nezha_defconfig: bump u-boot to
 current top of d1-wip
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=07d3c7e263673864274d81071d71543cea06847c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is now based on U-Boot 2024.01-rc1.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 configs/nezha_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/nezha_defconfig b/configs/nezha_defconfig
index 2ab278318f..7f3070f419 100644
--- a/configs/nezha_defconfig
+++ b/configs/nezha_defconfig
@@ -22,7 +22,7 @@ BR2_TARGET_OPENSBI_PLAT="generic"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,smaeul,u-boot,528ae9bc6c55edd3ffe642734b4132a8246ea777)/uboot-528ae9bc6c55edd3ffe642734b4132a8246ea777.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,smaeul,u-boot,2e89b706f5c956a70c989cd31665f1429e9a0b48)/uboot-2e89b706f5c956a70c989cd31665f1429e9a0b48.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nezha"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
