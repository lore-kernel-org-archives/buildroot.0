Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6E98C433F5
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 14:23:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B8EA60F46
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 14:23:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4B8EA60F46
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BF9380C27;
	Sat, 13 Nov 2021 14:23:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9H704A86DU2Z; Sat, 13 Nov 2021 14:23:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D4A780BE5;
	Sat, 13 Nov 2021 14:23:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0560A1BF95C
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 14:23:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E9BC181B60
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 14:23:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SKHujTM9-hiE for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 14:23:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48D3E81A46
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 14:23:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 31D758C98D; Sat, 13 Nov 2021 14:19:21 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 15:23:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 771594160ae002b1f463d49ffd1be64ef517a475
X-Git-Newrev: b591ef0b9dd9a54adbc379a36271d30d63f97a87
X-Patchwork-Hint: ignore
Message-Id: <20211113141921.31D758C98D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/armadeus_apf28_defconfig: bump
 linux kernel to 4.9.289
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

commit: https://git.buildroot.net/buildroot/commit/?id=b591ef0b9dd9a54adbc379a36271d30d63f97a87
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/1758965992

To correct a build breakage after the move to a gcc 10.x based host
compiler, as the updated kernel contains a fix for:

HOSTLD  scripts/dtc/dtc
/usr/bin/ld: scripts/dtc/dtc-parser.tab.o:(.bss+0x10): multiple definition of `yylloc'; scripts/dtc/dtc-lexer.lex.o:(.bss+0x0): first defined here

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e33a814e772cdc36436c8c188d8c42d019fda639

Build-tested only.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/armadeus_apf28_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/armadeus_apf28_defconfig b/configs/armadeus_apf28_defconfig
index 56351ebde5..01e14e6618 100644
--- a/configs/armadeus_apf28_defconfig
+++ b/configs/armadeus_apf28_defconfig
@@ -13,7 +13,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.172"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.289"
 BR2_LINUX_KERNEL_DEFCONFIG="mxs"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x40008000"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
