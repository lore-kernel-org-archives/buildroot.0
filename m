Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0164FCD6E7D
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CECF960AA4;
	Fri,  5 Jun 2026 12:37:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m3hK6IOEEbGC; Fri,  5 Jun 2026 12:37:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C59B160AA8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663076;
	bh=/9NVTghWTW8/ZhXyxpbv5y8r7vn51gU8PC8VgcE9/ig=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qW6g+APterG9M+fXcBA/5h2aZ6kDVQzV6/sFdA7uKjE532DL1IcLJmmTUKjmMS87C
	 PgRbAUcGTqBNOS1yVS/SumvRZSbKhbOhErVZy2JCvi6vqyE61NYAKJBtMa21gx8Jsg
	 5LjcT95TFPZJLBq2RtAj/azjywkEoRLbDI3UPAEPjE6lENuhZuytWb9neTYh/SSGGW
	 OOiKqllmvaSg7dCVLVOyvXQxjihILbHXsur9AW/bSrWBdwukJ9WrosAgBYdyDPQt0+
	 mbVG+k/i95ysBzYogqR0NhiOhRluuUKAuMFtxZawzaYVA9jgB40ZXSAsP8alWGzavy
	 +nbzccSvpFQGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C59B160AA8;
	Fri,  5 Jun 2026 12:37:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0121A388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 33F0981E57
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M9oSERGxPdm5 for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:37:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A673581E77
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A673581E77
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D035487B3F; Fri,  5 Jun 2026 12:37:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 11:45:20 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 729efd317dcfa9efdb8c6f56c0ec00e7fc270d7b
X-Git-Newrev: 260f7ec2a9b461b0382c0d982ccbb07005fcf216
X-Patchwork-Hint: ignore
Message-Id: <20260605123711.D035487B3F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] Revert "linux: disable
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/260f7ec2a9b461b0382c0d982ccbb07005fcf216
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
index 65affbfa7f..98aed16861 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -470,7 +470,6 @@ define LINUX_KCONFIG_FIXUP_CMDS
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
