Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B533BC433F5
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 14:24:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D9416108E
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 14:24:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5D9416108E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37E53606BB;
	Sat, 13 Nov 2021 14:24:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9Wj5wyhD60gH; Sat, 13 Nov 2021 14:24:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F2C46070E;
	Sat, 13 Nov 2021 14:24:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3FBCF1BF349
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 14:23:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E02740277
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 14:23:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AxaOl4xZh9nN for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 14:23:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 31F9E40275
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 14:23:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1793A8C98E; Sat, 13 Nov 2021 14:19:21 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 15:23:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 545a5754ea01d4732aa6d23315bdbb42d1758820
X-Git-Newrev: ddd77054888e991151e7d8f623375e5f51e147d6
X-Patchwork-Hint: ignore
Message-Id: <20211113141921.1793A8C98E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/acmesystems_aria_g25_{128,
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

commit: https://git.buildroot.net/buildroot/commit/?id=ddd77054888e991151e7d8f623375e5f51e147d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/1758965968
https://gitlab.com/buildroot.org/buildroot/-/jobs/1758965970

To correct a build breakage after the move to a gcc 10.x based host
compiler, as the updated kernel contains a fix for:

HOSTLD  scripts/dtc/dtc
/usr/bin/ld: scripts/dtc/dtc-parser.tab.o:(.bss+0x10): multiple definition of `yylloc'; scripts/dtc/dtc-lexer.lex.o:(.bss+0x0): first defined here

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e33a814e772cdc36436c8c188d8c42d019fda639

Build-tested only.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/acmesystems_aria_g25_128mb_defconfig | 2 +-
 configs/acmesystems_aria_g25_256mb_defconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/acmesystems_aria_g25_128mb_defconfig b/configs/acmesystems_aria_g25_128mb_defconfig
index 8bc8c4dcef..c428e318d2 100644
--- a/configs/acmesystems_aria_g25_128mb_defconfig
+++ b/configs/acmesystems_aria_g25_128mb_defconfig
@@ -15,7 +15,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/aria-g25/genimage.cfg"
 # Kernel configuration
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.216"
 BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-ariag25"
diff --git a/configs/acmesystems_aria_g25_256mb_defconfig b/configs/acmesystems_aria_g25_256mb_defconfig
index d161b118ae..83f7625dc7 100644
--- a/configs/acmesystems_aria_g25_256mb_defconfig
+++ b/configs/acmesystems_aria_g25_256mb_defconfig
@@ -15,7 +15,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/aria-g25/genimage.cfg"
 # Kernel configuration
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.216"
 BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-ariag25"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
