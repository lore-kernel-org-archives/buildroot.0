Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26119C25B75
	for <buildroot@archiver.kernel.org>; Sat, 11 May 2024 20:50:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ABF6540BDA;
	Sat, 11 May 2024 20:50:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b_h18YsA29Jl; Sat, 11 May 2024 20:50:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5AA8540BDB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5AA8540BDB;
	Sat, 11 May 2024 20:50:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EB17C1BF57C
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 20:50:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C238342178
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 20:50:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vLrCyT51al16 for <buildroot@lists.busybox.net>;
 Sat, 11 May 2024 20:50:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB79542190
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB79542190
 for <buildroot@buildroot.org>; Sat, 11 May 2024 20:50:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 32FC586FF9; Sat, 11 May 2024 20:50:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 11 May 2024 22:49:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1c7f6a44579a4defc5126528bc4f93c99d14d104
X-Git-Newrev: e942b78ca1c6d4bf6cd10dc592a41e99e2e24e82
X-Patchwork-Hint: ignore
Message-Id: <20240511205019.32FC586FF9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Config.in.legacy: fix legacy
 BR2_BINFMT_FLAT_SHARED
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

commit: https://git.buildroot.net/buildroot/commit/?id=e942b78ca1c6d4bf6cd10dc592a41e99e2e24e82
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This legacy option was missing a select BR2_LEGACY.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Config.in.legacy b/Config.in.legacy
index 83bb88020a..04b62ffd32 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -148,6 +148,7 @@ comment "Legacy options removed in 2024.05"
 
 config BR2_BINFMT_FLAT_SHARED
 	bool "FLAT shared binary format removed"
+	select BR2_LEGACY
 	help
 	  Support for the FLAT shared binary format has been removed:
 	  its support was removed from the Linux kernel, and also from
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
