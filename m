Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADC6FC433F5
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 16:22:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E8C960E93
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 16:22:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6E8C960E93
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4ACB68266D;
	Fri,  5 Nov 2021 16:22:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KHS9Ech4wTcg; Fri,  5 Nov 2021 16:22:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96C99826D6;
	Fri,  5 Nov 2021 16:22:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4E6931BF2A5
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 16:20:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B52240012
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 16:20:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A8wQJ6J70kIR for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 16:20:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F41AA404A4
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 16:20:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3B84C8AC58; Fri,  5 Nov 2021 16:16:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 5 Nov 2021 17:18:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c693879dd5926b32adf2a215308ceb2820665115
X-Git-Newrev: 4a48c079a9a8f1f4a6350d82f571a2094bbe0640
X-Patchwork-Hint: ignore
Message-Id: <20211105161640.3B84C8AC58@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/imx6ullevk: bump U-Boot and kernel
 versions
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

commit: https://git.buildroot.net/buildroot/commit/?id=4a48c079a9a8f1f4a6350d82f571a2094bbe0640
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump U-Boot to 2021.10 and kernel to 5.14.14.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/imx6ullevk_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/imx6ullevk_defconfig b/configs/imx6ullevk_defconfig
index 81db66268a..06641f1458 100644
--- a/configs/imx6ullevk_defconfig
+++ b/configs/imx6ullevk_defconfig
@@ -3,8 +3,8 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
-# Linux headers same as kernel, a 5.7 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_7=y
+# Linux headers same as kernel, a 5.14 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_14=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
@@ -12,7 +12,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.7.8"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.14.14"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6ull-14x14-evk"
@@ -22,7 +22,7 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6ull_14x14_evk"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
 BR2_TARGET_UBOOT_FORMAT_DTB_IMX=y
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
