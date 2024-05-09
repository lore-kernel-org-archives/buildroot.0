Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B340C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 14:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FE0B405F4;
	Thu,  9 May 2024 14:36:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jleaNuinZgxo; Thu,  9 May 2024 14:36:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D64F940251
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D64F940251;
	Thu,  9 May 2024 14:36:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E89781BF39C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 14:36:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5A0E6064F
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 14:36:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x30eH5ciB5uy for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 14:36:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 145DF605A3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 145DF605A3
 for <buildroot@buildroot.org>; Thu,  9 May 2024 14:36:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EBDF086BD4; Thu,  9 May 2024 14:36:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 16:35:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0623c53054e478bf6faa68a3b95e4e6ae0a84ee0
X-Git-Newrev: c37e98f486e1f9201d0ff91d9e8166849ae422ac
X-Patchwork-Hint: ignore
Message-Id: <20240509143639.EBDF086BD4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/wandboard: update U-Boot and kernel
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

commit: https://git.buildroot.net/buildroot/commit/?id=c37e98f486e1f9201d0ff91d9e8166849ae422ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update to U-Boot 2024.04 and kernel 6.6.27 versions.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/wandboard_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/wandboard_defconfig b/configs/wandboard_defconfig
index b110c292dd..22eb529945 100644
--- a/configs/wandboard_defconfig
+++ b/configs/wandboard_defconfig
@@ -23,7 +23,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="wandboard"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
@@ -33,7 +33,7 @@ BR2_TARGET_UBOOT_SPL_NAME="SPL"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.12"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.27"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx6q-wandboard nxp/imx/imx6dl-wandboard nxp/imx/imx6q-wandboard-revb1 nxp/imx/imx6dl-wandboard-revb1 nxp/imx/imx6q-wandboard-revd1 nxp/imx/imx6dl-wandboard-revd1 nxp/imx/imx6qp-wandboard-revd1"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
