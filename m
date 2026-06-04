Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14770CD6E79
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:39:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E361460DE3;
	Fri,  5 Jun 2026 12:39:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oIIhv6fcFs5b; Fri,  5 Jun 2026 12:39:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C7CF60DDF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663189;
	bh=hzVSHUiMPaLz2H4dpKzPDLN8NiVpLjCH6vDszvW/msk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=J6ocXj0OIp0pcdrszpM2iCLV5qNl4+PSGl7sBu/YQzh4trFnSUCUQafkaTXImNuja
	 Qxm56FFVbVnV+fSNq271H3gsyr9iBNgq/21dmyzzTQcnL1PJj3aVHkPunYQUmmE32v
	 f/x5o9h8BfuUT74lEcFMpnMfnjn4GZwAMFnqHeETErsapo0jZIzFhXEpAtajNbcIvq
	 GqoWEKiuOzZgnjaIifpUbFwJyu6yZ0IwKD6BnYKk8urgNLYUfqUAzk9fr2wiX+J3DA
	 obaeerBRw7KZfrpJeyEtbSKd9KBBToe1BlZWEdnqyz4+PWAzC268eXLcqYCZKtUsty
	 SeJzFUt5xij8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C7CF60DDF;
	Fri,  5 Jun 2026 12:39:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A523388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC17282003
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UCdFlgY8z3f6 for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9D9881FEF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E9D9881FEF
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1F5ED87176; Fri,  5 Jun 2026 12:38:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 11:45:23 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 6dfd71a1b9e42f825690e4dfff5596ba63c108b6
X-Git-Newrev: 2ebef53381b306047b44828007f6bdae47ffb7f0
X-Patchwork-Hint: ignore
Message-Id: <20260605123836.1F5ED87176@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] Revert "linux: disable
 -Werror"
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2ebef53381b306047b44828007f6bdae47ffb7f0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

This reverts commit 6b56e0b4f09b36140e2cb9e41072d5ac6074f375.

commit 6b56e0b4f09b ("linux: disable -Werror") said we needed to disable
CONFIG_WERROR in the kernel because it failed to build the esp-hosted
kernel module. This was very much the hammer approach because a) it'd be
better to fix the warnings in the kernel module or b) disable the
kernel's CONFIG_WERROR *only* if esp-hosted is to be built, via the
ESP_HOSTED_LINUX_CONFIG_FIXUPS variable in
package/esp-hosted/esp-hosted.mk.

This is a simple revert without making any change to any kernel module
(including esp-hosted) because all upstream Buildroot defconfigs with a
kernel module enabled build fine today (albeit with warnings). The two
defconfigs that were pointed at by the now-reverted commit all have been
(updated for and) run on master without failing the build.

Suggested-by: Arnout Vandecappelle <arnout@rnout.be>
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit a966f5cde5beef557fed3a271895089e62649f6b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 linux/linux.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index c61089bfe0..79117275f7 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -474,7 +474,6 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_LOGO)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_LOGO_LINUX_CLUT224))
 	$(call KCONFIG_DISABLE_OPT,CONFIG_GCC_PLUGINS)
-	$(call KCONFIG_DISABLE_OPT,CONFIG_WERROR)
 	$(PACKAGES_LINUX_CONFIG_FIXUPS)
 endef
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
