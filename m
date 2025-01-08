Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 016ACE77188
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 22:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C040960BC6;
	Wed,  8 Jan 2025 22:06:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OC_oxIwNxsBc; Wed,  8 Jan 2025 22:06:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D24F260E21
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D24F260E21;
	Wed,  8 Jan 2025 22:06:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AF02A1EB8
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2AEF840970
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:05:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hpiG147f6tu9 for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 22:05:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F395040481
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F395040481
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:05:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DFB6C83F99; Wed,  8 Jan 2025 22:05:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 8 Jan 2025 21:32:55 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 362d72d6f4a4a0620f1c1a70d1f97342cb2cb348
X-Git-Newrev: 40e308bc50d09d017a0e05f0ba667e8f16a8f865
X-Patchwork-Hint: ignore
Message-Id: <20250108220553.DFB6C83F99@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] linux: select proper
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

commit: https://git.buildroot.net/buildroot/commit/?id=40e308bc50d09d017a0e05f0ba667e8f16a8f865
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

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
index 2a47a20af9..5a32a75c4c 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -334,6 +334,8 @@ else ifeq ($(BR2_powerpc64),y)
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
