Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A61C433F5
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 23:05:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B239C4020B;
	Tue,  1 Feb 2022 23:05:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pnc-ohknXcgl; Tue,  1 Feb 2022 23:05:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A013C40137;
	Tue,  1 Feb 2022 23:05:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CA8821BF2BD
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 23:04:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D681400CC
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 23:04:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PHYiJ6DTFT2P for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 23:04:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-sp1.aruba.it (smtpcmd01-sp1.aruba.it [62.149.158.218])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4103940145
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 23:04:18 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id F2C7n0nERroAhF2C9nakRY; Wed, 02 Feb 2022 00:04:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643756657; bh=cOvzW+Qxwm2OSYdCWQzwWGs6pLfDCQzODVx0CCNm/2w=;
 h=From:To:Subject:Date:MIME-Version;
 b=CNiRljk65hu6tsUQ+GBpVKkO/GrnUs/z4U+cAkIZyxWUySc4IkW42tfOhWSrkV+Z1
 6Z3HlrV/I+cRTFstOgQqTTE6lrvfY/zBY3F7JYHKLtKvxdSPuuCDWD0Te2TFxMFOjJ
 9Y7+9xQSDJmqggLSmJZmNX/C9wCAten8mcV/qWy/71YFsM1jVGuZ5F9yzah65m3k8Q
 KX3b8RrXQZ7V2PYPbw1aFC3mwVSLIGWUxpavDcxDnka27973RWxPpTdIa7EP3GAtVD
 uD/hu0OeWmeRoONrDCkaUanudUtBmFCSgif3f+S64g9AFbgKCqiEELB3yakEvHwPCn
 P3vN4n/lhfziQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed,  2 Feb 2022 00:04:13 +0100
Message-Id: <20220201230414.4144930-6-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201230414.4144930-1-giulio.benetti@benettiengineering.com>
References: <20220201230414.4144930-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfDd6oUnv7ZmYvPTad0Y+3go93dHCoV7OPEdbV69EkSQRfNQLbb31fJoijwmETnTrru6ZMZYWjBR/QyhW69ieAC27SoSj8xiB/KO5kSjypaWdYL1ag3Y7
 sPYj0wm1fxH3oeIPnIrZXGq3vTHwaM18RdMUJly7Z/2d8jbjcBgv/eIkT6uppvOdXll3aQVdlOetzY0qAlrt98DgN3H7emZ8ux0VqWnbCTw/2TynG6Nd6rZr
 i95Aef379ISc3dFuEOkvTyKOjXBy5esabq5UZk6A7+ic6K1jPPB2FLehT8eUYDklz8UTCs/jitPkbE99UKhR60rVRHxAkbCX1V5ao1OXN8lFlhdjkQmFigWS
 /mJQeW2USmwDkc/0+6/LwkVOloLnWKRIQ0iRU7U37WyCCjZYm7dwrm1Q4BjmjhBtUtzKj0Qb9e3OC2cqe+ck9mD2l6QCEA==
Subject: [Buildroot] [PATCH v2 5/6]
 configs/microchip_sama7g5ek_mmc_defconfig: add missing
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15 and host openssl for linux
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
 Lothar Felten <lothar.felten@gmail.com>,
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
---
 configs/microchip_sama7g5ek_mmc_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configs/microchip_sama7g5ek_mmc_defconfig b/configs/microchip_sama7g5ek_mmc_defconfig
index b1cd193829..df48c0880b 100644
--- a/configs/microchip_sama7g5ek_mmc_defconfig
+++ b/configs/microchip_sama7g5ek_mmc_defconfig
@@ -1,12 +1,14 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/microchip/sama7g5ek/genimage.cfg"
 BR2_LINUX_KERNEL=y
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
