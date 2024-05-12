Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6BAAC25B5F
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 10:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DD4A421B5;
	Sun, 12 May 2024 10:06:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id McHtSa3vUxWZ; Sun, 12 May 2024 10:06:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 688D24209D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 688D24209D;
	Sun, 12 May 2024 10:06:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E1B121BF27A
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 10:06:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD526840F0
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 10:06:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kWiqpOZeemOQ for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 10:06:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24B67840EF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24B67840EF
 for <buildroot@buildroot.org>; Sun, 12 May 2024 10:06:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1AA1287069; Sun, 12 May 2024 10:06:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 May 2024 12:05:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 322500d1bdad5cbcc229c75e766b58318bb12235
X-Git-Newrev: 4c561a7adf95d33acddabcd72e6155c8c05bbbfe
X-Patchwork-Hint: ignore
Message-Id: <20240512100605.1AA1287069@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch/Config.in.x86: enable SSE2 on Pentium
 M
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

commit: https://git.buildroot.net/buildroot/commit/?id=4c561a7adf95d33acddabcd72e6155c8c05bbbfe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Pentium M does support SSE2 so it would make sense to enable it.

Signed-off-by: Stefan Ott <stefan@ott.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in.x86 | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index 49823fe885..93a223b7ae 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -72,6 +72,7 @@ config BR2_x86_pentium_m
 	depends on !BR2_x86_64
 	select BR2_X86_CPU_HAS_MMX
 	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
 config BR2_x86_pentium2
 	bool "pentium2"
 	depends on !BR2_x86_64
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
