Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8EBBC61DA4
	for <buildroot@archiver.kernel.org>; Thu, 16 Feb 2023 21:26:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B78A41990;
	Thu, 16 Feb 2023 21:26:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B78A41990
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id riD-4uBfufRq; Thu, 16 Feb 2023 21:26:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 092E0419A8;
	Thu, 16 Feb 2023 21:26:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 092E0419A8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 280531BF42E
 for <buildroot@lists.busybox.net>; Thu, 16 Feb 2023 21:26:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 012CA4199C
 for <buildroot@lists.busybox.net>; Thu, 16 Feb 2023 21:26:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 012CA4199C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oLWd0J5CDlf3 for <buildroot@lists.busybox.net>;
 Thu, 16 Feb 2023 21:25:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8711E41990
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8711E41990
 for <buildroot@buildroot.org>; Thu, 16 Feb 2023 21:25:58 +0000 (UTC)
Received: from localhost.localdomain ([146.241.66.151])
 by Aruba Outgoing Smtp  with ESMTPSA
 id SllKppmOEySOSSllLpIolu; Thu, 16 Feb 2023 22:25:55 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu, 16 Feb 2023 22:25:52 +0100
Message-Id: <20230216212553.2591068-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216212553.2591068-1-giulio.benetti@benettiengineering.com>
References: <20230216212553.2591068-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfHperI59WzQ736Ve4Z1rZvJp12pHe+ezBYv4Su6mG/j7V5S2bcMgeD4lH0w/71dplylf+GSHeIGMtWPCdMd4RHfdMa5A5Qd+rHGgHPBDOcoU72CUTlik
 A2m4f0rwBJshgM66+4uwArJFu01V5vIaBCk7upk7uIUBrOJvQN6e71u2sWXqB56rqqcSJ/gaVbT8JM5AzraAyjbQBD0QlQGS+0uf9OhkzzjhA9PCgJOVBBN6
 DG3i7TGYRay7jLsBWHK8ieO0beVP6OuJZO6D+fE3P2ABrjeL+plbnHB+q8lie5Ccrt5wa8bZcYvrj1IF6rOk5YJO8NpDtlokudgYrgHb1eccdvsY5zbNSC+o
 995l6Yfa
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1676582755; bh=mEmga+jJfODYD2Mb+KZhngMpHzFhTW0OPwvDlPz6eSA=;
 h=From:To:Subject:Date:MIME-Version;
 b=F8mUipRtLecXlqmS5+zNXV2snukgtTWsX0MOb+aZjaPzIDDIWjHZsELvlIPk3LTeV
 FrKZFQGPdxNwjR8xUuXZzrQ/7+vmuh1yWOtdQvnFqCIYcajj7+3diP5PsSjBYKgXpF
 xDgU8XLxmAKqFlDYhMj+x0K7AASPKdcb25RecDMv3O4sYTyPKV6hBt5owl3C4uL/TA
 Tnf3GfAgrdGd/87tYYoa9mRC70bQ5jbb+lgibycOqVc8qOUgLA0vkMkH9Q7nUs8Cvw
 Xg+F9ualyXCk7ghhHzu2LyPddvOWfW1x0fKnRnMVoG8nNszbw+CcWcvKp7IgqjH1+z
 KaF3gGbYSfiUA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=F8mUipRt
Subject: [Buildroot] [PATCH 2/3] configs/freescale_imx6ullevk_defconfig:
 bump Linux and U-Boot to lf-5.15.71-2.2.0
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
Cc: Fabio Estevam <festevam@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabrice Goucem <fabrice.goucem@oss.nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Let's also enable BR2_TARGET_UBOOT_NEEDS_OPENSSL required by uboot to
build correctly.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/freescale_imx6ullevk_defconfig | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/configs/freescale_imx6ullevk_defconfig b/configs/freescale_imx6ullevk_defconfig
index 7a8965be18..db4fa69f71 100644
--- a/configs/freescale_imx6ullevk_defconfig
+++ b/configs/freescale_imx6ullevk_defconfig
@@ -1,11 +1,11 @@
 BR2_arm=y
 BR2_cortex_a7=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-5.10.y-1.0.0)/linux-imx-lf-5.10.y-1.0.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-5.15.71-2.2.0)/linux-imx-lf-5.15.71-2.2.0.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6ull-14x14-evk"
@@ -15,8 +15,9 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6ull_14x14_evk"
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-5.10.y-1.0.0)/uboot-imx-lf-5.10.y-1.0.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-5.15.71-2.2.0)/uboot-imx-lf-5.15.71-2.2.0.tar.gz"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
