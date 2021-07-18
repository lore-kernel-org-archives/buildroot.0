Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4317CC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:50:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AFA96105A
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:50:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0AFA96105A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE7EA404F7;
	Tue,  3 Aug 2021 23:50:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cPrVJaoSqAVo; Tue,  3 Aug 2021 23:50:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7B62403FF;
	Tue,  3 Aug 2021 23:50:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1A4111BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:17:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A85F406A6
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IXNGc4OKQUZE for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1854C4044C
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6A1D886AA7; Tue,  3 Aug 2021 21:10:09 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 18 Jul 2021 23:42:04 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1176ed86f5e27ea21ba80648356537e843c803ee
X-Git-Newrev: 1464d87e04ea9f610801c469f2831b315f832737
X-Patchwork-Hint: ignore
Message-Id: <20210803211009.6A1D886AA7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/wandboard: bump U-Boot
 and kernel versions
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=1464d87e04ea9f610801c469f2831b315f832737
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Bump U-Boot to 2021.07 and kernel to 5.13 version.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/wandboard_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/wandboard_defconfig b/configs/wandboard_defconfig
index 37628ea403..0966719d48 100644
--- a/configs/wandboard_defconfig
+++ b/configs/wandboard_defconfig
@@ -5,8 +5,8 @@ BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_VFPV3=y
 
-# Linux headers same as kernel, a 5.12 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_12=y
+# Linux headers same as kernel, a 5.13 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_13=y
 
 # System
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
@@ -23,7 +23,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="wandboard"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
@@ -32,7 +32,7 @@ BR2_TARGET_UBOOT_SPL_NAME="SPL"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.12.2"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.13"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-wandboard imx6dl-wandboard imx6q-wandboard-revb1 imx6dl-wandboard-revb1 imx6q-wandboard-revd1 imx6dl-wandboard-revd1 imx6qp-wandboard-revd1"
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
