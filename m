Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D58C8C25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 11:06:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDD75426A0;
	Sat,  8 Jun 2024 11:06:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BfTUWTHhPVa6; Sat,  8 Jun 2024 11:06:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84F454273B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84F454273B;
	Sat,  8 Jun 2024 11:06:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 66DA51BF863
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 11:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 54AA66069F
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 11:06:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LHw0j2lrjap1 for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 11:06:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C2886069D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C2886069D
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 11:06:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4D30082894; Sat,  8 Jun 2024 11:06:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jun 2024 13:05:27 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 10f0d0a74206b5f8c29415003c38bb231563a97c
X-Git-Newrev: 51dc052d1d488e3eec52d9bfde0270aa8845ca4c
X-Patchwork-Hint: ignore
Message-Id: <20240608110634.4D30082894@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] arch/Config.in.x86:
 enable SSE2 on Pentium M
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

commit: https://git.buildroot.net/buildroot/commit/?id=51dc052d1d488e3eec52d9bfde0270aa8845ca4c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

The Pentium M does support SSE2 so it would make sense to enable it.

Signed-off-by: Stefan Ott <stefan@ott.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4c561a7adf95d33acddabcd72e6155c8c05bbbfe)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
