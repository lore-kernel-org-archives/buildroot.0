Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 221D7C5516D
	for <buildroot@archiver.kernel.org>; Thu, 30 Jul 2026 17:38:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8903081187;
	Thu, 30 Jul 2026 17:38:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UaRfRUVudil9; Thu, 30 Jul 2026 17:38:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1AF28118A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785433115;
	bh=ghiWoNjzCaKvgSCVm2uWLhI3/054UmypHY66oLVAst4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZeQQ1uqa/wp8K+vbTB+C4PpK1OB4em9GeLecuKA770JQ2utLVibIaWXwWtbCyh55s
	 DB8e/WPkWp3zArrLRUqYcIUB39CPACc23MYfnhtqOn26feNSRICUspayzVAf1bEUU3
	 QMNOapmq7Jg6rMUsoSbF4Pvbdn2hfnNdd82Og2HjFQpRwh7kL3JNfTbjVIFsgmGwOz
	 FyWfQxFtr/ZRQHUaWAHq5TGo7wKT6lcgVSZ2UUFHmLIvykNQCmeZfSNvU0Oee4eZnQ
	 kQxQN5eE9Z9oOhQK3lhrj2vdJadYYmIhm5KIdrieLMJzRtJWP3jmxgA/a1JnvEWo5G
	 J33XBBPwnAY+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1AF28118A;
	Thu, 30 Jul 2026 17:38:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 21A142CE
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 17:38:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1EF3440C3A
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 17:38:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XMzD3k5bYcvs for <buildroot@buildroot.org>;
 Thu, 30 Jul 2026 17:38:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 556EB40C76
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 556EB40C76
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 17:38:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 909738B616; Thu, 30 Jul 2026 17:37:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Jul 2026 19:34:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9f17ac02b8561ca7adeb7911e4939b2ac9ad6320
X-Git-Newrev: a568d33d23d11dc48665bc6531a019ca2c2d4108
X-Patchwork-Hint: ignore
Message-Id: <20260730173750.909738B616@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uboot-tools: bump version to
 2026.07
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a568d33d23d11dc48665bc6531a019ca2c2d4108
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release:
https://git.u-boot-project.org/u-boot/u-boot/-/releases/v2026.07

Signed-off-by: Philippe MONTCHO <philippemontcho@gmail.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/uboot-tools/uboot-tools.hash | 2 +-
 package/uboot-tools/uboot-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uboot-tools/uboot-tools.hash b/package/uboot-tools/uboot-tools.hash
index 6916498256..e992835582 100644
--- a/package/uboot-tools/uboot-tools.hash
+++ b/package/uboot-tools/uboot-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  ac7c04b8b7004923b00a4e5d6699c5df4d21233bac9fda690d8cfbc209fff2fd  u-boot-2026.04.tar.bz2
+sha256  78e8bfc382fe388f9b55aa1daf8c563522a037779b5d4c349d1415e381f1243e  u-boot-2026.07.tar.bz2
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Licenses/gpl-2.0.txt
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 8a2877333c..b5924f6954 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UBOOT_TOOLS_VERSION = 2026.04
+UBOOT_TOOLS_VERSION = 2026.07
 UBOOT_TOOLS_SOURCE = u-boot-$(UBOOT_TOOLS_VERSION).tar.bz2
 UBOOT_TOOLS_SITE = https://ftp.denx.de/pub/u-boot
 UBOOT_TOOLS_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
