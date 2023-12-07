Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 768B8C4167B
	for <buildroot@archiver.kernel.org>; Thu,  7 Dec 2023 12:07:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D8338390F;
	Thu,  7 Dec 2023 12:07:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D8338390F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kdnWxJTHQDVM; Thu,  7 Dec 2023 12:07:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C08980CE6;
	Thu,  7 Dec 2023 12:07:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C08980CE6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4B2461BF3D4
 for <buildroot@lists.busybox.net>; Thu,  7 Dec 2023 12:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2519B42148
 for <buildroot@lists.busybox.net>; Thu,  7 Dec 2023 12:07:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2519B42148
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u4tCk2Zkjy3n for <buildroot@lists.busybox.net>;
 Thu,  7 Dec 2023 12:07:09 +0000 (UTC)
Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 94F714029B
 for <buildroot@buildroot.org>; Thu,  7 Dec 2023 12:07:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94F714029B
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id BD9lrT5vVoaCcBD9lrp35n; Thu, 07 Dec 2023 13:07:06 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu,  7 Dec 2023 13:07:03 +0100
Message-Id: <20231207120704.47607-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfMQwCJzQOrYZip9PzVpwDOffeaR9nWDSUmDYjx8XTdxSX7CFr9JfjxACjpB5pY8nlzezldwV5WIUBauSfN9Eq6umokppfk/dokc3lEnQ47rXL0ujiyNp
 pVMPKazJ9GRoeuWsaQQVDQORh8wnPs4dDP+SYYbQ3XM+AAbxN2vntJV24SKb+Ae/Ukh9z8O/QXQCIR82ImgsmGbUmGjI/REvxcAmvfVkwI3Z0todXHJyzXK7
 fzzZIRu9p4xLgH9edCoaiG1Cr0AjaGL9Q01CWXJyW3AGzN4r9ZbZRSvsRlxnqo8jLiqBT6F2ItFqqo/Js9fFOo+Ed/4Q4635nk4uC1YIb0Wue5CzN5FHW9lx
 7adaNXah
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1701950826; bh=fYPjEknFY63yZe3uGUsNYJPF/rlAz6VGTrIeeqxrOzQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=RlamTRqtUxmFWdJsGGfThLKNf0FXGWSeNTu0zPE4+Bxc5dzM67w98tH9vA1OJQmlA
 nX4OF3Trsfv7haqu70pWx7mD/8Ny7wBK4/bRK+6UhOZtdHMlFyMFuWYSc8BiJjybTN
 c3UlHFSafoRdUTYdUqVaXxeDTy+tmiT90OgNaGF4twbikkO6VolOmM7DGTZ1Y8XiZb
 MA6mDmh9AUCnDn463/sYBaSAvHdf1kajPsqHeJBOuZfAUsubvvdB65cKBKCxohMmIi
 +DEDzu2SBxXaI/IbsvOQEmG5ipeDiWdG0iXzp/xvY7YNKVPNeqEDz6n6U/HdCu4P6c
 3i8LfjnCWKvkg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=RlamTRqt
Subject: [Buildroot] [PATCH] configs/imx6ullevk_defconfig: bump Linux to
 6.6.4 and U-Boot to 2023.10
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

Let's also enable NXP firmware package to let latest SDMA firmware to be
loaded. To achieve this we also need to enable dynamic eudev to let it
to load the firmware.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/imx6ullevk_defconfig | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/configs/imx6ullevk_defconfig b/configs/imx6ullevk_defconfig
index b507d1c0d6..662ef0270e 100644
--- a/configs/imx6ullevk_defconfig
+++ b/configs/imx6ullevk_defconfig
@@ -3,8 +3,8 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
-# Linux headers same as kernel, a 6.1 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+# Linux headers same as kernel, a 6.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
@@ -12,17 +12,17 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.12"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.4"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6ull-14x14-evk"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx6ull-14x14-evk"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 # bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6ull_14x14_evk"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.10"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_DTB_IMX=y
@@ -36,3 +36,12 @@ BR2_PACKAGE_HOST_MTOOLS=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+
+# NXP firmware package for SDMA Firmware
+BR2_PACKAGE_FREESCALE_IMX=y
+BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6UL=y
+BR2_PACKAGE_FIRMWARE_IMX=y
+
+# For automatic kernel module loading
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
