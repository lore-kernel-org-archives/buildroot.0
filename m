Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6B84C433F5
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 22:39:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 865DD61ABF
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 22:39:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 865DD61ABF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EB1F40494;
	Wed, 17 Nov 2021 22:39:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OzzC3FCYncO0; Wed, 17 Nov 2021 22:39:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBC82401BD;
	Wed, 17 Nov 2021 22:39:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 474CF1BF2FA
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 22:37:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26F084015F
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 22:37:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BgYYX7CwMWv6 for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 22:37:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E74AD4018F
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 22:37:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D6CAB8D693; Wed, 17 Nov 2021 22:33:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 17 Nov 2021 23:27:05 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 074430c1e2ad7f12fe2112fa232956391a6fcde5
X-Git-Newrev: afd0c261fdca3cf015fb85bc5da4e3823e05c4b7
X-Patchwork-Hint: ignore
Message-Id: <20211117223317.D6CAB8D693@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x]
 configs/armadeus_apf51_defconfig: bump linux kernel to 4.4.291
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

commit: https://git.buildroot.net/buildroot/commit/?id=afd0c261fdca3cf015fb85bc5da4e3823e05c4b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/1758965994

To correct a build breakage after the move to a gcc 10.x based host
compiler, as the updated kernel contains a fix for:

HOSTLD  scripts/dtc/dtc
/usr/bin/ld: scripts/dtc/dtc-parser.tab.o:(.bss+0x10): multiple definition of `yylloc'; scripts/dtc/dtc-lexer.lex.o:(.bss+0x0): first defined here

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e33a814e772cdc36436c8c188d8c42d019fda639

Also correct a mistake in the kernel headers version comment.

Build-tested only.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9f66785d8cc739abebb3b0c76ffeb43d9d441dd1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/armadeus_apf51_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/armadeus_apf51_defconfig b/configs/armadeus_apf51_defconfig
index 26b6a447d4..aa7c2f84ae 100644
--- a/configs/armadeus_apf51_defconfig
+++ b/configs/armadeus_apf51_defconfig
@@ -2,7 +2,7 @@
 BR2_arm=y
 BR2_cortex_a8=y
 
-# Linux headers same as kernel, a 3.12 series
+# Linux headers same as kernel, a 4.4 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
 
 # System
@@ -13,7 +13,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc2"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.186"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.291"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/armadeus/apf51/linux-4.4.config"
 BR2_LINUX_KERNEL_UIMAGE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
