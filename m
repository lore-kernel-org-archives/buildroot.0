Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE23ACD5BB8
	for <buildroot@archiver.kernel.org>; Thu,  5 Sep 2024 19:42:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9630E40175;
	Thu,  5 Sep 2024 19:42:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vO10frHAszGj; Thu,  5 Sep 2024 19:42:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CD9440361
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5CD9440361;
	Thu,  5 Sep 2024 19:42:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A49841BF423
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 19:42:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 924BC60AD5
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 19:42:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U6hZO0xPodZA for <buildroot@lists.busybox.net>;
 Thu,  5 Sep 2024 19:42:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6DDF60AAE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C6DDF60AAE
 for <buildroot@buildroot.org>; Thu,  5 Sep 2024 19:42:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B24C98694B; Thu,  5 Sep 2024 19:42:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Sep 2024 21:41:57 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8cf677f42864b6862be34645a7e4863c3112f6ab
X-Git-Newrev: 97d2040a30616cd34835bdcf85a1ee8b73574e48
X-Patchwork-Hint: ignore
Message-Id: <20240905194220.B24C98694B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/imx6ulpico: update
 U-Boot and kernel
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

commit: https://git.buildroot.net/buildroot/commit/?id=97d2040a30616cd34835bdcf85a1ee8b73574e48
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Update to U-Boot 2024.07 and kernel 6.6.48 versions.

The default U-Boot pico-imx6ul_defconfig causes the board to hang in SPL.

Fix it by chaging it to the more specific U-Boot
pico-pi-imx6ul_defconfig.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/imx6ulpico_defconfig | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/configs/imx6ulpico_defconfig b/configs/imx6ulpico_defconfig
index e406d9938b..a77eac5c58 100644
--- a/configs/imx6ulpico_defconfig
+++ b/configs/imx6ulpico_defconfig
@@ -3,8 +3,8 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
-# Linux headers same as kernel, a 5.15 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+# Linux headers same as kernel, a 6.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc5"
@@ -15,10 +15,10 @@ BR2_ROOTFS_OVERLAY="board/technexion/imx6ulpico/rootfs_overlay"
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.11"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.48"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6ul-pico-pi imx6ul-pico-hobbit imx6ul-pico-dwarf"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx6ul-pico-pi nxp/imx/imx6ul-pico-hobbit nxp/imx/imx6ul-pico-dwarf"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 
@@ -38,9 +38,9 @@ BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
-BR2_TARGET_UBOOT_BOARDNAME="pico-imx6ul"
+BR2_TARGET_UBOOT_BOARDNAME="pico-pi-imx6ul"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
