Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19968E6FE47
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 20:02:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2C3C8473B;
	Fri,  6 Sep 2024 20:02:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2agX1lyoTSWG; Fri,  6 Sep 2024 20:02:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CEE684751
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CEE684751;
	Fri,  6 Sep 2024 20:02:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 39B391BF20B
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6C48409FD
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:58:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m-03N86dseDF for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:58:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36D30407AF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 36D30407AF
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:58:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 27BAF828CC; Fri,  6 Sep 2024 19:58:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Aug 2024 15:07:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8bd00c16d8af2b4b620a0b2c136e6830b9d6b3a0
X-Git-Newrev: 60da48c3b70d8ed8dcc9d77143c1462bdf839ab6
X-Patchwork-Hint: ignore
Message-Id: <20240906195857.27BAF828CC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/imx6-sabreauto: update U-Boot and
 kernel
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=60da48c3b70d8ed8dcc9d77143c1462bdf839ab6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update to U-Boot 2024.07 and kernel 6.6.47 versions.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/imx6-sabreauto_defconfig | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/configs/imx6-sabreauto_defconfig b/configs/imx6-sabreauto_defconfig
index 24b3fd387f..337a5ae9bb 100644
--- a/configs/imx6-sabreauto_defconfig
+++ b/configs/imx6-sabreauto_defconfig
@@ -4,8 +4,8 @@ BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_VFPV3=y
 
-# Linux headers same as kernel, a 5.15 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+# Linux headers same as kernel, a 6.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
 # System
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
@@ -24,7 +24,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6sabreauto"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
 BR2_TARGET_UBOOT_NEEDS_LZOP=y
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
@@ -34,8 +34,8 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.47"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabreauto imx6dl-sabreauto imx6qp-sabreauto"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx6q-sabreauto nxp/imx/imx6dl-sabreauto nxp/imx/imx6qp-sabreauto"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
