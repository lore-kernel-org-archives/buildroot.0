Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B502C433F5
	for <buildroot@archiver.kernel.org>; Tue, 18 Jan 2022 10:52:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35C4D60D88;
	Tue, 18 Jan 2022 10:52:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6tq4daO5Pljo; Tue, 18 Jan 2022 10:52:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CE7A60D89;
	Tue, 18 Jan 2022 10:52:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5607A1BF28D
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 10:51:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4454080B60
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 10:51:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sIZnVWJUM-HK for <buildroot@lists.busybox.net>;
 Tue, 18 Jan 2022 10:51:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd10106.aruba.it (smtpcmd10106.aruba.it [62.149.156.106])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F61680B4E
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 10:51:30 +0000 (UTC)
Received: from localhost.localdomain ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 9lxknDlmTDzPJ9m2Hna87B; Tue, 18 Jan 2022 11:48:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642502907; bh=m6GrDbMs5q0Mw+l5OXWGh8Th4Eutr4a1AaOlRXQiOnM=;
 h=From:To:Subject:Date:MIME-Version;
 b=R7y/7v6mUZSPr8sA4cCimZlhsn7f87W6X8+Kl+TL3umQ1m4KWGLbgrfQnirmq0ymh
 WdeNUoH7VCDy7UfWKERlEbsDh1aZyDzsYGovvlZLbKERBXSfDdo+SGcB3LRK4/WN2A
 PbFODmRY8S1Bg081y47AhpXqFc92xw3xk/UWWT/SNadzZMtaccAf7CbmpzOVa7Qnhx
 6NqNwj0s7z8zre2JuFcQF5Pzx3j4VKclmfn8CgX0zf+evzTGoC6jOMJOn9HJNdn3XT
 Rvu6q5g+g5sAjwIPb+7WIVeusjm+6cGZtz/+x02ZJ4P+i2A/Q2sNW/fXVa78PDkfp2
 nTC+W7pc0s8qg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 18 Jan 2022 11:43:32 +0100
Message-Id: <20220118104338.2081259-23-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
References: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfCdvQv0A85zUtcQsbQ3JdcppU3nJZYsIC3NGymh5hQAA/ubAl2Fw+/GW1z4bmMnpT8ZUNJWkDydW3eDY3UhoWnY3PV6EGnKo/yQRVcQBbaoqXrsxlJYB
 vEGbZMCbu62ngjgnaKm++1Dj7USbnV9BM0QQZIvX3BThzFSvIAcd4vCtkMRe6TJrrIpn/tOXY9HkEMn106a14OzWs4VDRs+2j54LXV8pLPYPPcIKby2KbD5V
 A6TbTtH0UdWRDuuCyP+z8vO8u6Zec2qQyDmCS9i3IbJ8ABia96Avrz7p1JXF0NWv0SccSdfA6FS+n46fV9UOnjNvIDC4gOGA5ASayEKeth0yPFdxGjLC8PH+
 dcX4yux7Ivu1TKSHXkMAlWrYYKI9jIRiYtsnploLLIsTw0in/pFq1j/rUTvNUp32CAhYwoxU7EoNSsf7IvOUUx0RLgPjJDSNsYnCmVpuQPE8XEbFc1SS2BUY
 3TERG0dZIGgC55i71rk4PsFXfPBnDUGFH4RzJqwjf22U+rNJMTBQM7/hj6TJb3/jIfCSHlDlkGDiyQ1pfn049F4JYzzUtK1I/kRD2aphzSpNWCLgTDl0Sdjq
 e22PP4IL72HyYzN08jgBkWtvawx8ZMUwW0FT1N3wcZYI/f0HmnWEAxne6quvix2AKNHPsILN1Nw2y0krXYjsWaIw30x5HnZxuG2Z4j0I1WkjQwFlPKrzIl1X
 2Q81sYsXl4rQpDLHtCg0hnHPL8VxsqU+qhOgfuYGRXQ3gE14y/q98Jb/aJ+ThcZjWW/26a783roW4IR0BiXTfKAnRBChkY0RDbVdSmvqWs1MF6CmFRhNyZax
 MiVPpb6AaoNn6I2/JaXtYgIjQw5dBelp7nnbxQkHuW6nnkklda7Y8UbZtq8TXg==
Subject: [Buildroot] [PATCH 22/28] configs/orangepi_pc_plus_defconfig:
 enable NEON/VFPV4 FPU strategy
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
Cc: Theo Debrouwere <t.debrouwere@televic.com>, Simon Doppler <dopsi@dopsi.ch>,
 Edgar Bonet <bonet@grenoble.cnrs.fr>, Jan Kraval <jan.kraval@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Davide Viti <zinosat@gmail.com>, Mike Harmony <mike.harmony@snapav.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Michel Stempin <michel.stempin@wanadoo.fr>,
 Lothar Felten <lothar.felten@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabio Estevam <festevam@gmail.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Biagio Montaruli <biagio.hkr@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This board has Allwinner H3 that is a cortex-A7 and supports NEON/VFPV4
FPU strategy, so let's enable it instead of only VFPV4.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/orangepi_pc_plus_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/orangepi_pc_plus_defconfig b/configs/orangepi_pc_plus_defconfig
index c3ff8bc417..cb108a8d31 100644
--- a/configs/orangepi_pc_plus_defconfig
+++ b/configs/orangepi_pc_plus_defconfig
@@ -1,6 +1,6 @@
 BR2_arm=y
 BR2_cortex_a7=y
-BR2_ARM_FPU_VFPV4=y
+BR2_ARM_FPU_NEON_VFPV4=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_12=y
 BR2_TARGET_GENERIC_HOSTNAME="OrangePi_PC_Plus"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
