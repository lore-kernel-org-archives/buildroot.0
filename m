Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF2ACD4F25
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA73984574;
	Fri, 15 May 2026 17:45:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eBZPgKFr3lZE; Fri, 15 May 2026 17:45:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0ED18453F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867115;
	bh=TMzTOzRRG1qzr8kmFIGx+KF01l/xoGDCRVen89+VrDw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jgB6axAAtFhpTBcL07UJJg7e2qLd9ij4dkxflNhUCLp422dBvoIejCN7bW7y9aTzQ
	 tigYxC1+8yvxUjipTVc87K2I0mZTC1y1q+HrLLXOJ7SbMcSqo8q/FWZqLYybGW670m
	 1TXEC3Jo+YpghjtT8gpWZKyDfBtmeFsc4PlF/xyIFky1W82TrXcdPHvEwz0YfU495T
	 LOVygU6aGJy43v3apdNQlMQYFY3NX2EWjzgYyRisWf9OdIIYKsxf8wBaUzt/KWruQc
	 qXPMgcbAGJijWbx/4PCuue/MQxViu5sVi374AV4XVm4QUoZf4InktbhObfR3I2JVR6
	 XOzKTJz59PVEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0ED18453F;
	Fri, 15 May 2026 17:45:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EA2B45B
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC54B8416C
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:44:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5yT2luBusbbk for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:44:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 054E284179
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 054E284179
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:44:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 437B986395; Fri, 15 May 2026 17:44:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 16:59:17 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 59e81d40902ab650533094c3f16caede77669c50
X-Git-Newrev: 1f1a302056bb5e51a8a5d0194bda1bf67573f49d
X-Patchwork-Hint: ignore
Message-Id: <20260515174449.437B986395@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] linux/Config.in: add
 kernel.org URL to help
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1f1a302056bb5e51a8a5d0194bda1bf67573f49d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
[Arnout: add it to the main help text, where it belongs]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 2ab95cf0eea0349f91b82faf7308ad04ba9bcabb)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 linux/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index 9f7a42b2e8..22a87f1c9d 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -8,6 +8,8 @@ config BR2_LINUX_KERNEL
 	  Enable this option if you want to build a Linux kernel for
 	  your embedded device
 
+	  https://www.kernel.org/
+
 if BR2_LINUX_KERNEL
 
 # Packages that need to have a kernel with support for loadable modules,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
