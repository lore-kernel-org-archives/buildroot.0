Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4ACDE9D41C
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 17:08:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B15C361237;
	Wed,  4 Feb 2026 17:08:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 52SFYVGBRMyk; Wed,  4 Feb 2026 17:08:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 426936120F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770224915;
	bh=9A1ughp5ddoWZoIq1DlGffYZOowujuVRXnCpkIbnWWE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PJnEoP2Yp2BzpZNb6yzwLZLs0pSRmLoubBvBBfvxacj41GPGiF6Isa3/pqQc8ke5R
	 vfLeqbsr6e1+CINomjL9cdpPg0wA6oW5fSV8SCluWVMME+waqv7xCmXoaRbDnsOUch
	 TvPehF8AGGTp+gKAH0+85wAVYvLJl9RbuYZVNFCfKZ2Iv8U5RRAZ07aT/E70LieB4n
	 4z9E+g4qDh8ZDL6rQy/NCWdtTVHSzgRiVEYELKlVqa0/hYmcYegDHJr8/P9R7KsSdI
	 FhC/RqcZJAmBXX+BIkbMtNoqASWAGnisZtu8a+XC6e3g1zbg5BMi8DjyjLn0fQV6o6
	 ruDAdhKFLBPWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 426936120F;
	Wed,  4 Feb 2026 17:08:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 13045F5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:07:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6CA32405A2
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:07:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0uD-3LpWIhk8 for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 17:07:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8D844054F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8D844054F
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:07:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 819B686980; Wed,  4 Feb 2026 17:07:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 17:28:00 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 5e04489b1ca8745ea509db38253b1e116f6493e1
X-Git-Newrev: 4b00d940fadacffc4fe5f334a0a24c524486d04c
X-Patchwork-Hint: ignore
Message-Id: <20260204170747.819B686980@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] boot/grub2: fix
 'targeting' typo
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4b00d940fadacffc4fe5f334a0a24c524486d04c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Found by codespell.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 37862b394decbbdf9e6b2c36835f0dec6f05e83c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 boot/grub2/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/grub2/Config.in b/boot/grub2/Config.in
index 3a50ec0ad7..8cd56cad00 100644
--- a/boot/grub2/Config.in
+++ b/boot/grub2/Config.in
@@ -118,7 +118,7 @@ config BR2_TARGET_GRUB2_LOONGARCH64_EFI
 	depends on BR2_loongarch64
 	select BR2_TARGET_GRUB2_HAS_EFI_BOOT
 	help
-	  Select this option if the platform you're targetting is a
+	  Select this option if the platform you're targeting is a
 	  64bit LoongArch platform and you want to boot Grub 2 as an EFI
 	  application.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
