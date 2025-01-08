Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA1E1E77188
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 22:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8944881A15;
	Wed,  8 Jan 2025 22:05:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z-Iw5CCNZ_MX; Wed,  8 Jan 2025 22:05:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A372C81A23
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A372C81A23;
	Wed,  8 Jan 2025 22:05:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AFBFB206A
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:04:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0352840952
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:04:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LeZhBJGvdrvC for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 22:04:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25DD640481
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 25DD640481
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:04:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 103AC83F4C; Wed,  8 Jan 2025 22:04:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 8 Jan 2025 21:32:47 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: 13250bf4aafbde9b0f946d5d07aaf3b6dc34d31f
X-Git-Newrev: 809fd4b87a68d1cc3310e238ddbc835195a71b13
X-Patchwork-Hint: ignore
Message-Id: <20250108220444.103AC83F4C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] linux: select proper
 defconfig on ARC 750d/770d
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=809fd4b87a68d1cc3310e238ddbc835195a71b13
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

The Linux kernel "defconfig" on ARC is haps_hs_smp_defconfig, which
cannot be built on ARC 750d/770d targets, so let's use a kernel
defconfig that works properly on ARC 750d/770d.

Fixes:

  http://autobuild.buildroot.net/results/2913e5958cd6b20dbfdcdad304a5f5a0f8030d8d/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 954b5514a92d9d8439d57a815f097046e6270bb9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 7e443fb227..12699b8ee4 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -347,6 +347,8 @@ else ifeq ($(BR2_powerpc64),y)
 LINUX_KCONFIG_DEFCONFIG = ppc64_defconfig
 else ifeq ($(BR2_powerpc),y)
 LINUX_KCONFIG_DEFCONFIG = ppc_defconfig
+else ifeq ($(BR2_arc750d)$(BR2_arc770d),y)
+LINUX_KCONFIG_DEFCONFIG = axs101_defconfig
 else
 LINUX_KCONFIG_DEFCONFIG = defconfig
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
