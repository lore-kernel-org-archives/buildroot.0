Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E867C3DA79
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 19:51:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24A4081A30;
	Thu, 29 Dec 2022 19:51:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24A4081A30
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AbWIBQW6scPW; Thu, 29 Dec 2022 19:51:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EA3E8195D;
	Thu, 29 Dec 2022 19:51:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EA3E8195D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0CE161BF2B4
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 19:51:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E8C5B4088C
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 19:51:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8C5B4088C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jo5NdAB3bkwk for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 19:51:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9847D40257
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9847D40257
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 19:51:40 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.171.174.182])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id F3F512003E0;
 Thu, 29 Dec 2022 20:51:21 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 29 Dec 2022 20:47:15 +0100
Message-Id: <20221229194729.8085-13-ju.o@free.fr>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221229194729.8085-1-ju.o@free.fr>
References: <20221229194729.8085-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1672343499;
 bh=Y34r/BL43Rl1f/fmBwD91Xhb2lhVh28eZexU/+cNmU8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=s9o7ddm3bTsG/GzUC5s2ri2KYvOM/VYtSQ+FEdGbxYFceEQJfUxdO7lOvyzKp27m3
 VR1gXgb/pqx4toRJ9+GWSFpLjqdsLDsx/aqClgpT9/1eeT/18XyRGiuo65Ruy49pKY
 PTTQDVnJslg9/d4D4kl8PDoVE7xlauC4O/x1z3VtRUwPm+QkSJjqFG8oRFE+Cxqzu4
 puCj+G0hkiqvORN0XBBp99icPHGqiyrZ/eROUCsSkFV/vjSuOlLqjHSRrldruR2LFQ
 n5QfiW9Qft5BMGKwYfl9+jJROXQ1+KoUzZQDNc3C7fGBenzeFyKqUoi67bZY85pzRT
 Kjj77IcKrjKuw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=s9o7ddm3
Subject: [Buildroot] [PATCH 13/27] configs/freescale_imx6qsabreauto: update
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

Note 2: this commit updates the Kernel and U-Boot download urls.
The method is also changed from _CUSTOM_GIT to _CUSTOM_TARBALL.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 configs/freescale_imx6qsabreauto_defconfig | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/configs/freescale_imx6qsabreauto_defconfig b/configs/freescale_imx6qsabreauto_defconfig
index 58b4a5f92d..72696ab1ad 100644
--- a/configs/freescale_imx6qsabreauto_defconfig
+++ b/configs/freescale_imx6qsabreauto_defconfig
@@ -16,9 +16,8 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
 
 # kernel
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/linux-imx.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="lf-5.10.y-1.0.0"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-5.10.y-1.0.0)/linux-imx-lf-5.10.y-1.0.0.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabreauto"
@@ -38,7 +37,6 @@ BR2_PACKAGE_HOST_MTOOLS=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6qsabreauto"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
-BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/uboot-imx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="lf-5.10.y-1.0.0"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-5.10.y-1.0.0)/uboot-imx-lf-5.10.y-1.0.0.tar.gz"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
