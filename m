Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA68C433EF
	for <buildroot@archiver.kernel.org>; Wed,  2 Feb 2022 15:58:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A46E60FAD;
	Wed,  2 Feb 2022 15:58:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZxutRlgRDO5x; Wed,  2 Feb 2022 15:58:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3F7960BE0;
	Wed,  2 Feb 2022 15:58:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CEA7B1BF426
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 15:58:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD1AE84030
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 15:58:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iU6eW4CwML4j for <buildroot@lists.busybox.net>;
 Wed,  2 Feb 2022 15:58:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd15176.aruba.it (smtpcmd15176.aruba.it [62.149.156.176])
 by smtp1.osuosl.org (Postfix) with ESMTP id 36E2684029
 for <buildroot@buildroot.org>; Wed,  2 Feb 2022 15:58:25 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id FI1VnxRoqXfntFI1WnH4gt; Wed, 02 Feb 2022 16:58:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643817503; bh=X3pJMczcfGm3mPgHXJBF9mM3FNS98ZEoWM5YbzHTmHo=;
 h=From:To:Subject:Date:MIME-Version;
 b=iwA9OUa8ORSQDAGAP4Viou9PWYEGgjm/d16Ey2SFkIzGW4phNFX5rwsL+K/5mLBny
 V3kzeAVzIP/3ivLLtNvotZacY5RDNxWAFV6+AYFihAhzRYiPExwzUPczGSdr071m2H
 5N1XgAiP2WOsS6F4yT93LqbObrtysXGNzZJHlgFXhziqAU2d6HWxBxEcfD9jDmM9on
 1pOHjhjySetiSIvGAzTNLo7hQfX+AqE/KLEbsxMC2awW8weNhEVgH7nGJb4YY65DuJ
 vi3A8iHVqMpzbOhBFR1sojzV8K2auNQ07E+uVfQCXzSvkoOLlEaBPExWAgisRs3N7+
 kvWwD+16CHOAw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed,  2 Feb 2022 16:58:21 +0100
Message-Id: <20220202155821.4038299-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfDglJK/cDrYL25VehmOOk7qbNDpJDik/GDajr5MODFj6eWLNvXJRir/gKQwBDeviPDUlZx+04SHi8PbhAoef3xeNWEqJlXCTlchsKxgjBJiBTtCagZJ7
 hype5G19Yq4XSMSjK7GU2S8B09EjY68Lpge8ocnR0og2fH/K0JdlaarKSGBzj37Ho5XmaR4wxxA3ZQYCdE3+OGHlxUnQLAsytYNPOJkAEp+Lt7tka/9IAHv/
 qWJ4ipk6puMu+eqb3TDIIcvG1EjNLNPfP8N6FOkpFYBqZ6HIeQOXu5ZcLjdGiTE9M52Qvdgg7jEIWITNwJN2d/mJ76BvW3d4oKdt0GifALg=
Subject: [Buildroot] [PATCH] configs/microchip_sam9x60ek_mmc_dev_defconfig:
 expand rootfs size to 120M
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

Default 60M for rootfs are not enough and generate a build failure, so
let's expand rootfs size to 120M.

Fixes:
https://gitlab.com/ymorin/buildroot/-/jobs/2035821088

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/microchip_sam9x60ek_mmc_dev_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/microchip_sam9x60ek_mmc_dev_defconfig b/configs/microchip_sam9x60ek_mmc_dev_defconfig
index da1bd33dd3..00ccd784b5 100644
--- a/configs/microchip_sam9x60ek_mmc_dev_defconfig
+++ b/configs/microchip_sam9x60ek_mmc_dev_defconfig
@@ -7,6 +7,7 @@ BR2_TARGET_GENERIC_HOSTNAME="sam9x60ek"
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/microchip/sam9x60ek_mmc/genimage.cfg"
+BR2_TARGET_ROOTFS_EXT2_SIZE=120M
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,linux,linux4microchip-2021.10)/linux-linux4microchip-2021.10.tar.gz"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
