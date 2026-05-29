Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B29CD4F54
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 20:59:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D30E684965;
	Fri, 29 May 2026 20:59:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E9wMndD4wUkv; Fri, 29 May 2026 20:59:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 142B38496C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780088343;
	bh=wz5PCrDA2LJUT6Nkn/Uq/a+1euiVXHItXCG1x8keroM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bKyv9lG9D6caibzXXrD5kfI2vPGhLhOkO9gxEnd6zWWIWZcq0ROx3TBh5VH6jaIry
	 1iK77LMxaEbLXyfesSGimeJbTdhY49/hAyWKEAIL04A/gunZv4sOHiK8PavdErfY4y
	 KGskC6NENlxJLMzog4DSWrFbqJcTEb/bR/dkQg0MH9MFzLPew69+/2eye+x66DV6JE
	 bM0DYB0xGOaG6rWnPA+1skTJf+qDLNqcX7SimMejXggFOgYRR4VHUlri43yczWeec/
	 UovFdQ1x6zEUEmKiuhT/bTY/2EwHzesyDQ+dL5JvCl4XU3m2X1ESCgmr+5T/IGqYcf
	 ometzArVSkwAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 142B38496C;
	Fri, 29 May 2026 20:59:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A945AD3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 20:59:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9882E61791
 for <buildroot@buildroot.org>; Fri, 29 May 2026 20:59:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LKmQQbWTo7oL for <buildroot@buildroot.org>;
 Fri, 29 May 2026 20:59:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1CF1616E5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E1CF1616E5
 for <buildroot@buildroot.org>; Fri, 29 May 2026 20:59:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 302BA8747E; Fri, 29 May 2026 20:58:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 22:55:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 727c2981cb59ebf6a3ee4e3ef03829cc8ae48536
X-Git-Newrev: a966f5cde5beef557fed3a271895089e62649f6b
X-Patchwork-Hint: ignore
Message-Id: <20260529205848.302BA8747E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Revert "linux: disable -Werror"
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a966f5cde5beef557fed3a271895089e62649f6b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
