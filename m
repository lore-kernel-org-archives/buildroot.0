Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 484C3CE7B11
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 20:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AADB80C5E;
	Fri,  6 Sep 2024 20:06:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OEaJTCt4g_tq; Fri,  6 Sep 2024 20:06:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2C9C80CB5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2C9C80CB5;
	Fri,  6 Sep 2024 20:06:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 95F011BF20B
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C453408D8
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DzaiW9k5cK3z for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:59:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6387409FE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6387409FE
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:58:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C40AF869F2; Fri,  6 Sep 2024 19:58:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Sep 2024 22:38:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1b753a3c14df48f0bb36d4d9e45d98b8f94e82df
X-Git-Newrev: a1a638f14cb3d61867e8ba7536361fc47df5289a
X-Patchwork-Hint: ignore
Message-Id: <20240906195858.C40AF869F2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch/Config.in.m68k: Add an option for
 68030
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

commit: https://git.buildroot.net/buildroot/commit/?id=a1a638f14cb3d61867e8ba7536361fc47df5289a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot is probably the only thing lightweight enough to run on
68030 machines in the current day.

Add a CPU option for the 68030.

Tested on a Motorola MVME147.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in.m68k | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/Config.in.m68k b/arch/Config.in.m68k
index 9fd22aaf1e..235cafacf5 100644
--- a/arch/Config.in.m68k
+++ b/arch/Config.in.m68k
@@ -23,6 +23,11 @@ choice
 	help
 	  Specific CPU variant to use
 
+config BR2_m68k_68030
+	bool "68030"
+	select BR2_m68k_m68k
+	select BR2_USE_MMU
+
 config BR2_m68k_68040
 	bool "68040"
 	select BR2_m68k_m68k
@@ -36,6 +41,7 @@ config BR2_m68k_cf5208
 endchoice
 
 config BR2_GCC_TARGET_CPU
+	default "68030"		if BR2_m68k_68030
 	default "68040"		if BR2_m68k_68040
 	default "5208"		if BR2_m68k_cf5208
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
