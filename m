Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D252FC433EF
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 18:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80DAB60F87;
	Tue,  1 Feb 2022 18:34:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XD_dz2JMYD0N; Tue,  1 Feb 2022 18:34:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C399960F6A;
	Tue,  1 Feb 2022 18:34:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 726001BF5D7
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 18:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A940400C4
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 18:33:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cRr_0rvideNL for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 18:33:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-g.aruba.it (smtpcmd01-g.aruba.it [62.149.158.217])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2968F40363
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 18:33:35 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Exy8nuBUiroAhExyAnYlHU; Tue, 01 Feb 2022 19:33:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643740415; bh=/0eZaqC5vuYXDdwBV3JFejMhCJUZfHwvrslFRSJ8yjk=;
 h=From:To:Subject:Date:MIME-Version;
 b=BgbgdVJC9Rdhf8VlUgafxIsk/s8Ys+FuIs49jPGNlMUYBbMksBJC8K/Alph6xly4R
 YYYG3x3OkpiE/rL14wau4qEqv0oioFqF8elM0PRnHP32v3kNo06yU/IggdTE9T+wHS
 q27hw08tNy9Cw8pWSZP3astiH0hDo51NYexZKezi/29z+xLNznUq5pcVOvjpKdwz03
 AYW90dP7EFvN4IcUF+kWf6eZjaZ/JM9bVR4E7dBkeqs/XJwg5vco7ULN2ma1NkeM3h
 X5SoJvnUiaOeqagv64fwI9Zv8DZGRla/J9xQ0hnLf5ZAF3NqflGkhObkQm7j7RGpxO
 GQLEN7NKSI7qg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue,  1 Feb 2022 19:33:30 +0100
Message-Id: <20220201183331.4009320-6-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201183331.4009320-1-giulio.benetti@benettiengineering.com>
References: <20220201183331.4009320-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfIA692OrNrpX2lMs/QoUnHD7qD5d7+7YHPqcrxEXZuVDlm1jI+SimkeRGy2fJWHSMbxT8ticeIHgPn7OTuFBJN5ZEadI/BZ/qKCWRzZhGGBImh8WQxXM
 NaNrBo/7hYD1ItpayaWqWMCpfhCxe+AraxRAuApUPwQiS6MFE+u0hRqBSlmbJ5YEJ+DMaSS3d5daPINXvzWXM7N5Ah9qpQT4XB6P4bTGWrcRHVae8I2gKbBr
 oY7W83kag/Y7U+DCu33qHunxF3Z9X3ZO8i9ovMtAGVw4XPS/6oBrAEiqk2jhX0boI2ky0V+2OfIYHack/oebQhR2Q8I+y1FKigPEPhMRMvcC3qz6dSkBq1yR
 b4FpRlwcZiKCNwVPrhVDFUtCEht1qud28R8YeJpVwUMbH9h47y+kZnQO2e/90oVfPAvknbvJz05Lp++DTcEbIb8XlwrIvg==
Subject: [Buildroot] [PATCH 5/6] configs/microchip_sama7g5ek_mmc_defconfig:
 add missing BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15
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
 configs/microchip_sama7g5ek_mmc_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/microchip_sama7g5ek_mmc_defconfig b/configs/microchip_sama7g5ek_mmc_defconfig
index b1cd193829..2d4b720342 100644
--- a/configs/microchip_sama7g5ek_mmc_defconfig
+++ b/configs/microchip_sama7g5ek_mmc_defconfig
@@ -1,6 +1,7 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/microchip/sama7g5ek/genimage.cfg"
 BR2_LINUX_KERNEL=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
