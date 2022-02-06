Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 971DCC433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 11:26:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F36B401A2;
	Sun,  6 Feb 2022 11:26:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h11UsC1HbWzc; Sun,  6 Feb 2022 11:26:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06EB1401ED;
	Sun,  6 Feb 2022 11:26:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3C14A1BF968
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 11:26:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A1A040345
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 11:26:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pdcve0eLRkg5 for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 11:26:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0642.aruba.it (smtpcmd0642.aruba.it [62.149.156.42])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07B3540343
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 11:26:26 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id GfgVnJtALX0z7GfgWnKneZ; Sun, 06 Feb 2022 12:26:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644146784; bh=RP8ztzcnxlHBNS0h9PjidXVLeKy9bdP3jJQ3h/wwQqA=;
 h=From:To:Subject:Date:MIME-Version;
 b=AIdOGFV9auy/wg+a94kk9Bh3dXkp8l1MtOyT4UA7QQoSYjHuhV16wWQV8P0vYKD7f
 6gVUTUKGtyFX3TANL1qsov8QK2+Nlr4e/IdzKT4SZfR8D7bF/TjCVDVxNgI2PoBUHt
 OgvAVySAP8AX6L0KLO9FBq0qq+O9iXjmqGMFSwJ+iFv94TD/WdWA74dmvvAeVm+eI8
 PO5DswOSTH17bsRhVWTWgD3pSga4sIbgBr4hUWCFdlJIU76z62opDcq+vvOEXWBWde
 DoLo4nOKd3qodgtmSi6wQsdZM8kRjubrDtDCF8y12f4kJ1FuOSWhaDBSxwL5uWdOnl
 J0IfGg7uIQwug==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  6 Feb 2022 12:26:19 +0100
Message-Id: <20220206112620.1637342-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220206112620.1637342-1-giulio.benetti@benettiengineering.com>
References: <20220206115156.6042cc1b@windsurf>
 <20220206112620.1637342-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfGDc2pGoCgkAkq/xcou+GZ6NrsarKugaWETG8vu22rbzqFPqtsm6tzK2snZ3b5mnzfXTofvCIKvJon6vKDYBXvQi9m4fJU5X3+JO3xsg5ZPey7Rg8xS6
 SNFRNKAOult5FRfJqNYqWrfBgFLixWLEDgASN0SntDgmxxA2RPPuhP5BWjmOG/O/NJcqUVHHwzuwz5Wzmw8yaCw2Ms+7J4+S+j/b/iKl1pjfhQiB5uPrRRsJ
 Cn51PyHMO3ZZR6is7KJuSqnZE1meU78grat3/ME8ooqLQ6ple/c2Jq2lnE/3aSwyDL1Bffuwgiq2dBIkNgf+h8SghySsgSylsy5OSHKBRhgl+ofPkFgdmEw+
 F9JzOzlspxJ5T23t7Oe8zMSVa4kw39fudWcpoPyEbVFhDWND6t0=
Subject: [Buildroot] [PATCH v3 1/2]
 configs/microchip_sama7g5ek_mmc_defconfig: set custom linux version to
 5.15.21 and add host openssl for linux
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
Cc: Eugen Hristev <eugen.hristev@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
https://gitlab.com/ymorin/buildroot/-/jobs/2035821098

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* add host openssl linux
V2->V3:
* set custom linux version as suggested by Thomas
---
 configs/microchip_sama7g5ek_mmc_defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/configs/microchip_sama7g5ek_mmc_defconfig b/configs/microchip_sama7g5ek_mmc_defconfig
index b1cd193829..7ab81d1dd0 100644
--- a/configs/microchip_sama7g5ek_mmc_defconfig
+++ b/configs/microchip_sama7g5ek_mmc_defconfig
@@ -1,12 +1,16 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/microchip/sama7g5ek/genimage.cfg"
 BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.21"
 BR2_LINUX_KERNEL_DEFCONFIG="sama7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama7g5ek"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
