Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44447C433F5
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 22:37:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBC2361B5F
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 22:37:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CBC2361B5F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74ED780D10;
	Wed, 17 Nov 2021 22:37:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0jvSD5mr6yO0; Wed, 17 Nov 2021 22:37:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D18DB80CCC;
	Wed, 17 Nov 2021 22:37:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AD3901BF9B2
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 22:37:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA6EF605BC
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 22:37:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CLZnaDbXV94E for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 22:37:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 09EEA60073
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 22:37:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id DFC318D693; Wed, 17 Nov 2021 22:33:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 17 Nov 2021 23:27:18 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: afd0c261fdca3cf015fb85bc5da4e3823e05c4b7
X-Git-Newrev: 05810aab06780f5f9c42ea70f870abba0d1b059f
X-Patchwork-Hint: ignore
Message-Id: <20211117223317.DFC318D693@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] configs/rock64_defconfig:
 bump linux kernel to 4.19.216
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

commit: https://git.buildroot.net/buildroot/commit/?id=05810aab06780f5f9c42ea70f870abba0d1b059f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966299

To correct a build breakage after the move to a gcc 10.x based host
compiler, as the updated kernel contains a fix for:

HOSTLD  scripts/dtc/dtc
/usr/bin/ld: scripts/dtc/dtc-parser.tab.o:(.bss+0x10): multiple definition of `yylloc'; scripts/dtc/dtc-lexer.lex.o:(.bss+0x0): first defined here

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e33a814e772cdc36436c8c188d8c42d019fda639

Build-tested only.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3cf4822035ddf7b601e33fa99875ce76c81c1c46)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/rock64_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/rock64_defconfig b/configs/rock64_defconfig
index a9d29a424d..2fae2298de 100644
--- a/configs/rock64_defconfig
+++ b/configs/rock64_defconfig
@@ -7,7 +7,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pine64/rock64/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.19"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.216"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3328-rock64"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
