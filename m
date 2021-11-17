Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D529FC433F5
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 22:38:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78E0560F9B
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 22:38:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 78E0560F9B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51053801CF;
	Wed, 17 Nov 2021 22:38:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 04PBjfFwnwTf; Wed, 17 Nov 2021 22:38:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98C2580BEE;
	Wed, 17 Nov 2021 22:38:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CBDEE1BF2FA
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 22:37:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B2FC04015F
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 22:37:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qrMnBz1LTlXR for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 22:37:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4C3F4017D
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 22:37:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C380E8D694; Wed, 17 Nov 2021 22:33:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 17 Nov 2021 23:26:30 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: a8d44f01abc922ee3de56fbb367d5e60a9bb464b
X-Git-Newrev: 7893815ab596f1b2933deca4347be1bfbf6988ac
X-Patchwork-Hint: ignore
Message-Id: <20211117223317.C380E8D694@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x]
 configs/acmesystems_arietta_g25_{128,
 256}mb_defconfig: bump linux kernel to 4.19.216
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

commit: https://git.buildroot.net/buildroot/commit/?id=7893815ab596f1b2933deca4347be1bfbf6988ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/1758965971
https://gitlab.com/buildroot.org/buildroot/-/jobs/1758965973

To correct a build breakage after the move to a gcc 10.x based host
compiler, as the updated kernel contains a fix for:

HOSTLD  scripts/dtc/dtc
/usr/bin/ld: scripts/dtc/dtc-parser.tab.o:(.bss+0x10): multiple definition of `yylloc'; scripts/dtc/dtc-lexer.lex.o:(.bss+0x0): first defined here

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e33a814e772cdc36436c8c188d8c42d019fda639

Build-tested only.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 771594160ae002b1f463d49ffd1be64ef517a475)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/acmesystems_arietta_g25_128mb_defconfig | 2 +-
 configs/acmesystems_arietta_g25_256mb_defconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/acmesystems_arietta_g25_128mb_defconfig b/configs/acmesystems_arietta_g25_128mb_defconfig
index 62bcbd44cb..b882b2bdb2 100644
--- a/configs/acmesystems_arietta_g25_128mb_defconfig
+++ b/configs/acmesystems_arietta_g25_128mb_defconfig
@@ -15,7 +15,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/arietta-g25/genimage.cfg"
 # Kernel configuration
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.216"
 BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-ariettag25"
diff --git a/configs/acmesystems_arietta_g25_256mb_defconfig b/configs/acmesystems_arietta_g25_256mb_defconfig
index 94258444a2..10501d462c 100644
--- a/configs/acmesystems_arietta_g25_256mb_defconfig
+++ b/configs/acmesystems_arietta_g25_256mb_defconfig
@@ -15,7 +15,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/arietta-g25/genimage.cfg"
 # Kernel configuration
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.216"
 BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-ariettag25"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
