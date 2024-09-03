Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C74FCD37AC
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 20:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 237CF402A7;
	Tue,  3 Sep 2024 20:38:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MZJH7fkf8S3M; Tue,  3 Sep 2024 20:38:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05C29402C5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05C29402C5;
	Tue,  3 Sep 2024 20:38:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 29ACE1BF57B
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 20:38:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1788760680
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 20:38:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5-r3wZVHen8P for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 20:38:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 483F560679
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 483F560679
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 20:38:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 337FF86C68; Tue,  3 Sep 2024 20:38:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Sep 2024 22:38:09 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1b753a3c14df48f0bb36d4d9e45d98b8f94e82df
X-Git-Newrev: a1a638f14cb3d61867e8ba7536361fc47df5289a
X-Patchwork-Hint: ignore
Message-Id: <20240903203834.337FF86C68@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] arch/Config.in.m68k: Add an
 option for 68030
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
