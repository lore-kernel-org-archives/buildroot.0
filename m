Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C76DEC3DA79
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 22:26:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B0F860808;
	Thu, 29 Dec 2022 22:26:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B0F860808
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8XK4Px2vauG4; Thu, 29 Dec 2022 22:26:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8746E60B11;
	Thu, 29 Dec 2022 22:26:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8746E60B11
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6C7D91BF287
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 22:26:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 485854035D
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 22:26:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 485854035D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N51LzrcJq6V3 for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 22:26:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A9B7402E8
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2A9B7402E8
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 22:26:35 +0000 (UTC)
Received: from b52572-12.ea.freescale.net (unknown
 [IPv6:2a01:e0a:43e:e970:8763:f5a3:4adf:bb86])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 09663B0057C;
 Thu, 29 Dec 2022 23:26:15 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 29 Dec 2022 23:25:27 +0100
Message-Id: <20221229222533.32242-3-ju.o@free.fr>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221229222533.32242-1-ju.o@free.fr>
References: <20221229194729.8085-1-ju.o@free.fr>
 <20221229222533.32242-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1672352793;
 bh=z33uS7XhADSNNYK+xuFNaFTdh2JM7lLOuECvLsd8+nk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=X2Yody+vqfIbo5X/OnE0SrcuKCFVdGUTew0PXTLtmg1kGxMNFzRo1/JzRtvhjZykB
 0eiCA5SIu/cPSfoW4CT7rtgUFqD6K9YanzzTuMfvQxwtBzsqZyNpmQ+OXNX3rPTsIr
 DNAuinoGERQOBlliSLAXnDbBMRyU5sI/WNEhAjlr1lH2OyI1S8aT9TVxw01IwTmIWA
 537s9Es2d/4iWlky2SfK0SmaKqNU3lg/TvsKPgweNjiNWCrKtpjFZ2BL1T1kYhMWRb
 wQKHimHMfFKuZN3R3Me5LLFU+hjpTgnZq6Ou2HjzJWRRst4L75Afu9a7D3dsMJqlPr
 JT1f/kc6PAR5A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=X2Yody+v
Subject: [Buildroot] [PATCH 21/27] configs/freescale_imx8mmevk: update
 codeaurora URLs to github
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, Gary Bisson <bisson.gary@gmail.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>,
 Gilles Talis <gilles.talis@gmail.com>, Refik Tuzakli <tuzakli.refik@gmail.com>,
 Julien Olivain <ju.o@free.fr>, Erik Larsson <karl.erik.larsson@gmail.com>,
 Fabrice Goucem <fabrice.goucem@oss.nxp.com>,
 Stephane Viau <stephane.viau@oss.nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

NXP moved all its open source code repositories from Code Aurora Forum
to github. See for example:
https://github.com/nxp-imx/meta-imx/commit/39bc4d81969a40e0da660519cf4ed083b9c53097

Software packages are now grouped in several NXP github
projects/organizations (nxp-imx, nxp-qoriq, ...). See:
https://www.nxp.com/design/software/embedded-software/nxp-github:NXP-GITHUB

The NXP code published on Code Aurora is still present (at the time of
this commit) but is no longer receiving updates. It is also expected
to be shut down on 2023-03-31. The Code Aurora website
https://source.codeaurora.org/ currently show the following message:
"""
Note: Qualcomm Innovation Center Inc. maintained repositories have
migrated to git.codelinaro.org. QUIC repositories on this site will
not receive any updates after March 31, 2022, and will be deleted on
March 31, 2023. If your project depends on these repositories, please
adjust your tooling configuration to use the new, up-to-date project
location.
"""

For this reason, the NXP recipes using codeaurora.org urls need to be
updated to the correct github.com replacement.

Note: this commit does not change the component version. Only the
download URL is updated. The archive content is expected to be the
same.

Note 2: this commit updates the Kernel, U-Boot and ATF download urls.
The method is also changed from _CUSTOM_GIT to _CUSTOM_TARBALL.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 configs/freescale_imx8mmevk_defconfig | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/configs/freescale_imx8mmevk_defconfig b/configs/freescale_imx8mmevk_defconfig
index ae82f29158..dcb4b42540 100644
--- a/configs/freescale_imx8mmevk_defconfig
+++ b/configs/freescale_imx8mmevk_defconfig
@@ -5,9 +5,8 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh board/freescale/common/imx/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/imx8mm-evk.dtb"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/linux-imx"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="lf-5.10.y-1.0.0"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-5.10.y-1.0.0)/linux-imx-lf-5.10.y-1.0.0.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v8"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mm-evk freescale/imx8mm-evk-revb-qca-wifi"
@@ -19,16 +18,14 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/imx-atf"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="lf-5.10.y-1.0.0"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-5.10.y-1.0.0)/imx-atf-lf-5.10.y-1.0.0.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mm"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/uboot-imx"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="lf-5.10.y-1.0.0"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-5.10.y-1.0.0)/uboot-imx-lf-5.10.y-1.0.0.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mm_evk"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
