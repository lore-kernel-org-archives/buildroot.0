Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54025C433F5
	for <buildroot@archiver.kernel.org>; Fri, 18 Feb 2022 11:09:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE20060B33;
	Fri, 18 Feb 2022 11:09:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D3Rx9iHg4va1; Fri, 18 Feb 2022 11:09:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 306576119E;
	Fri, 18 Feb 2022 11:09:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 79D6D1C116E
 for <buildroot@lists.busybox.net>; Fri, 18 Feb 2022 11:09:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 67BC96119E
 for <buildroot@lists.busybox.net>; Fri, 18 Feb 2022 11:09:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B5DGJn-tFBha for <buildroot@lists.busybox.net>;
 Fri, 18 Feb 2022 11:09:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp3.osuosl.org (Postfix) with ESMTP id D421460BBD
 for <buildroot@buildroot.org>; Fri, 18 Feb 2022 11:09:18 +0000 (UTC)
Received: from localhost.localdomain ([146.241.188.82])
 by Aruba Outgoing Smtp  with ESMTPSA
 id L18VnCqktvHpTL18VnDAbk; Fri, 18 Feb 2022 12:09:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1645182556; bh=ppQxBCCwjte+UCuizQnySjJM60mhWerUj7GUR5/fyUs=;
 h=From:To:Subject:Date:MIME-Version;
 b=QgPSicAqren9Z3ASTXMSkMHLGfAuiKZ7fvLd3IaiJSWyQeTzWp4NbVfuClwsLylC0
 zIU68DK/0DNNzFqaycMPS7cPyenBuvg1A9W0myxwfaBUbRJAT4yOqrteuNBKLUvRcd
 ggikBtuZlY15Xdz2Au6tapxm1JrrHXfQEWOJFTDhNHkN/OyXVDwRMettX3sFKiY5nZ
 s3TspF63PkrtdCeS9TqKidWasBZpzip4f6yUyP4nbOJHHxGgBtENFouzXx2QHnLwoy
 40rgJg0qbP2KcbOGtkTaxWk74wJgGpUlpy0f/GB4Q8XJx6f52w05PcoTgeWDbcnm16
 NEmrLu9GLVT6w==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri, 18 Feb 2022 12:09:14 +0100
Message-Id: <20220218110914.3098061-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfPoDZDzv+dEKovBgC10GvJVsoZ6Nl8GA6w9KK/kAhpi/Nz3iSlilQzUyD9veLXQBZHpxvoVmxYWb4Zd/wwDwNSIO5H+Z1qwbiakoiuuhOaN9UQ0vLOsu
 Pp+OrwcCR3pX/OEw0W+Eh8T5Zxjm6LIj8NpT0xdFmlwB7QYFKaTOfnuSTapKE4qtwMlLGeL2mbW+KUTgYPWe7eIzvFa3gMs0XZxbfM1Ub4CPcCzjlX/+IHhd
 qnZNLMu8+/vw+WdYhNMBh0KABUdRIFqGSVrlisXJZLRwOg05I6GZTrmdZ782cVFab785UgrIP3EzH+UXmoIUcA==
Subject: [Buildroot] [PATCH] configs/microchip_sam9x60ek_mmc_dev_defconfig:
 fix build failure due to previous wrong commit
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
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 616ba9c90b014637dc9925fa442a0af4a11f04b8 extended rootfs size, but
the option was listed in the wrong place. Options must be set in the order
they are specified by Config.in files. So let's move
BR2_TARGET_ROOTFS_EXT2_SIZE="120M" right after BR2_TARGET_ROOTFS_EXT2_4=y
as it should be.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/2103784289

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/microchip_sam9x60ek_mmc_dev_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/microchip_sam9x60ek_mmc_dev_defconfig b/configs/microchip_sam9x60ek_mmc_dev_defconfig
index 00ccd784b5..06e03967c4 100644
--- a/configs/microchip_sam9x60ek_mmc_dev_defconfig
+++ b/configs/microchip_sam9x60ek_mmc_dev_defconfig
@@ -7,7 +7,6 @@ BR2_TARGET_GENERIC_HOSTNAME="sam9x60ek"
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/microchip/sam9x60ek_mmc/genimage.cfg"
-BR2_TARGET_ROOTFS_EXT2_SIZE=120M
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,linux,linux4microchip-2021.10)/linux-linux4microchip-2021.10.tar.gz"
@@ -67,6 +66,7 @@ BR2_PACKAGE_HTOP=y
 BR2_PACKAGE_VIM=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v4.0.1)/at91bootstrap-v4.0.1.tar.gz"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
