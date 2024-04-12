Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A760C00A94
	for <buildroot@archiver.kernel.org>; Fri, 12 Apr 2024 19:29:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F15D4608CC;
	Fri, 12 Apr 2024 19:29:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YnlAXU3f7W_f; Fri, 12 Apr 2024 19:29:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFFBD608CE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFFBD608CE;
	Fri, 12 Apr 2024 19:29:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5708E1BF4E2
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 19:29:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50D854068B
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 19:29:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WHWbRNZGnpNY for <buildroot@lists.busybox.net>;
 Fri, 12 Apr 2024 19:29:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 004FA4062B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 004FA4062B
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 004FA4062B
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 19:29:46 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 1DC69B0054E;
 Fri, 12 Apr 2024 21:29:41 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 12 Apr 2024 21:29:23 +0200
Message-ID: <20240412192923.1073882-1-ju.o@free.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712950183;
 bh=D9xLXSWRPJ29VnTr8RSfcZxf+2Oz8J+qjIurliFZWqU=;
 h=From:To:Cc:Subject:Date:From;
 b=p9iLdU0k6KuzIFtAwlDvNy2I/68xOQDJou8XZUNWgEI31okJeKYESke+uuM+akrNY
 KJ/jz6TDrajnbFXsp/6bVMge8vGGWGtGHiDJU63M8L8RajQp1JaWC3Jd/vuCSwAlLr
 Hn+gxnqRpGtTbBCo9zOilnMumD5LX7Wgs9cl7lKT+CKv2xH55qXEjTEvsmPxosTEwW
 CSMQywnRozWcBIiqQLKV78GJGSA8VLDDEkKFpsIcGNiswX3YyQ2JFMSJZjEjmRaUlG
 gAajq4ldbOMw/Fd05wo0wgVBYdXmBJMHTJm83K8u+T09Av4LgELW3FXi21yVn34UJw
 dMuLpA2MVbqDQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=p9iLdU0k
Subject: [Buildroot] [PATCH 1/1] configs/warpboard: bump U-Boot and kernel
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
Cc: Julien Olivain <ju.o@free.fr>, Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump U-Boot to 2022.07 and kernel to 6.6.26 versions.

U-Boot is bumped to 2022.07 rather than the latest version (which is
2024.04 at the time of this commit), because it is the last version
supporting the warpboard. The support has been removed upstream in
commit [1], included in version 2022.10.

The Kernel DTS name is also updated, to follow the reorganization
in [2], first included in v6.5.

Fixes: [3]

[1] https://source.denx.de/u-boot/u-boot/-/commit/c50ff4a933d5617415221bbb85b0bfa5247b697a
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=724ba6751532055db75992fc6ae21c3e322e94a7
[3] https://gitlab.com/buildroot.org/buildroot/-/jobs/6609466749

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 configs/warpboard_defconfig | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/configs/warpboard_defconfig b/configs/warpboard_defconfig
index 1655381aa63..0bda8ee8629 100644
--- a/configs/warpboard_defconfig
+++ b/configs/warpboard_defconfig
@@ -5,8 +5,8 @@ BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_VFPV3=y
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 6.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
 # system
 BR2_TARGET_GENERIC_HOSTNAME="warpboard"
@@ -18,11 +18,11 @@ BR2_ROOTFS_OVERLAY="board/freescale/warpboard/rootfs_overlay"
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.26"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/freescale/warpboard/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6sl-warp"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx6sl-warp"
 
 # wifi firmware for brcm4330
 BR2_PACKAGE_LINUX_FIRMWARE=y
@@ -40,7 +40,7 @@ BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="warp"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.11"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.07"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 
 # host utility
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
