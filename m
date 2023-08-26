Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CF52C83F01
	for <buildroot@archiver.kernel.org>; Sat, 26 Aug 2023 18:06:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0085418F7;
	Sat, 26 Aug 2023 18:06:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0085418F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5PLI5F9azSKS; Sat, 26 Aug 2023 18:06:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A7B6418EB;
	Sat, 26 Aug 2023 18:06:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A7B6418EB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 499701BF37C
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 18:06:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DAE03418DF
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 18:06:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAE03418DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TLrSnLZZj0E5 for <buildroot@lists.busybox.net>;
 Sat, 26 Aug 2023 18:06:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BAFE8415DF
 for <buildroot@buildroot.org>; Sat, 26 Aug 2023 18:06:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAFE8415DF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A4C81860EA; Sat, 26 Aug 2023 18:06:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Aug 2023 20:06:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 01893c74ebee2fb7be5248d35ff33d387ca5a92d
X-Git-Newrev: 0ee8ef970bab8680162175d127e388a04286791f
X-Patchwork-Hint: ignore
Message-Id: <20230826180615.A4C81860EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/freescale_imx6qsabresd_defconfig:
 fix defconfig
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

commit: https://git.buildroot.net/buildroot/commit/?id=0ee8ef970bab8680162175d127e388a04286791f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While switching ATF to github, the BR2_TARGET_UBOOT_CUSTOM_GIT=y
symbol was not removed. Since then this defconfig fail to build
in gitlab-ci due to invalid defconfig check.

  WARN: defconfig ./configs/freescale_imx6qsabresd_defconfig can't be used:
        Missing: BR2_TARGET_UBOOT_CUSTOM_GIT=y

[1] dd42b159a5f752921ee602530d289c810ad7ee51

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4889436612

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/freescale_imx6qsabresd_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/freescale_imx6qsabresd_defconfig b/configs/freescale_imx6qsabresd_defconfig
index 86513d8072..dddfaf5228 100644
--- a/configs/freescale_imx6qsabresd_defconfig
+++ b/configs/freescale_imx6qsabresd_defconfig
@@ -37,7 +37,6 @@ BR2_PACKAGE_HOST_MTOOLS=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6qsabresd"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
-BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-5.10.y-1.0.0)/uboot-imx-lf-5.10.y-1.0.0.tar.gz"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
