Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9493C433EF
	for <buildroot@archiver.kernel.org>; Tue, 18 Jan 2022 10:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B270408FE;
	Tue, 18 Jan 2022 10:50:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uPcvbZWLjQwg; Tue, 18 Jan 2022 10:50:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D9BD40906;
	Tue, 18 Jan 2022 10:50:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C07211BF28D
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 10:50:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC011408FE
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 10:50:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RTrYxz7eAgtw for <buildroot@lists.busybox.net>;
 Tue, 18 Jan 2022 10:50:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd10106.aruba.it (smtpcmd10106.aruba.it [62.149.156.106])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9ABA24025B
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 10:50:19 +0000 (UTC)
Received: from localhost.localdomain ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 9lxknDlmTDzPJ9m15na6uB; Tue, 18 Jan 2022 11:47:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642502837; bh=jMdz7UZ7YUFVqmUcM+8XZTz94ZKByKFDiBifrZSuRP8=;
 h=From:To:Subject:Date:MIME-Version;
 b=N9i7W08n7iTRuykyhGIIm9VIQ+xWRSpfqXYrHjkqvg/h0cVRIaTuy5/bUlQ23h2GN
 RE0og0C/VS3kCDav9HuKdRjjufiklV8MTWniQmWkla286CRDf27bRX9puviP/0dW+E
 +lc1R2sdm5r6bU2knYXmU9gGh5cZYqAYpUwjLtugdwqUWur65ZhZBlciknGEOH5JL4
 FVdi9QJCU0T+jmlBhWLqamvQ/Eivyn6vP9lHok1+i5LCx42GkFB8I0CEiydcmen5iU
 tuzR6g1cB7pQp5pZgx2JYDcBtcCWI7rS0WAiYkmMkPcQH6knAYRjihvK1+IRuBbrao
 uTeYY8gBNcqzg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 18 Jan 2022 11:43:25 +0100
Message-Id: <20220118104338.2081259-16-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
References: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfB0f5dJLXvDvAVheN83+aUk540MRHx2NEMtyl+9ZaxG39DvOQq9vFVJJOUYA/d4m8y8Xml/l8nDLT76eFmoesiHR/4lJj4c63p4L3D4O8U1EBeAL9qO6
 Vc+r7svDE+Ja2aau4rg10XqjI25Hf2n+UvGjD4QOz/qZ0BfiAlfQYUEknXSs1U1Tx1TNmnKlYvCdzhF3FBp3Q8I1j/Fa0f5GXFYgtzdCYh5MIg3R46nnoflc
 6YE6kU1xlBQYQn2L1gx9RH4NavuQKS60E96bWcFi1fLdCIp+J4z4MGpEBwhyUr0frvM6LuwHl2d6bykudIPPSsRnD7zvWnoBhlHMLAGp0u9JioPNLkIFHD87
 7LDrdDm4mI36iSrzF627XMPvegaaulrXZCk6wEskjyW1zAooPjHAHzpA/NVrbbQVHS8B1Q4QNj04dpW52lQ7PqhfAyyzbKs1oIRXqELCbxVFckZYyBwGpIIW
 10WdO1qlgfa8GYEVyof80ULi2HTfZvPNS0KNRcrRCp5VhXKgiQF4qmhrP12yy7sTo0wImmp46Ycy8eB5W/Sj0HGBzvkqRUlekVGoXK1StcOXX1y7oJhaGGZ8
 VwDWioxy/Pmq3dZo72TatTeOOS8ChO1f/tnReD+ns9ZfgC4cfYu7VDR/HevZzOY2qIlXwEjEUIoM4s5laxjqNoakboCT7W4Vu2/s8+/+z7YY8dPa8UW13NwX
 LDvmTHvkncaGtMJLWIV1DxZEHOatmGdTixByZkKrm9SOUeQ2Jxexn3bL7wadIc90xU6WbmV8CRIqEgM1YDj7Ki+BdxHNvOCk18ChwfAa46useWhLTXKR/Bdl
 YOEAMRIpprQ212PQ2mlMtn4JcjnDewpRCf7J3jOSA89B4ifa+efO5g5rTgHpjg==
Subject: [Buildroot] [PATCH 15/28]
 configs/microchip_sama5d27_wlsom1_ek_mmc_defconfig: enable NEON/VFPV4 FPU
 strategy
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

As pointed by SAMA5D2 Datasheet[1]:
```
The Cortex-A5 NEON Media Processing Engine (MPE) extends the Cortex-A5
functionality to provide support for the ARM v7 Advanced SIMD v2 and
Vector Floating-Point v4 (VFPv4) instruction sets.
```

So let's enable VFPV4/NEON FPU strategy instead of the default VFPV4-D16.

[1]: https://ww1.microchip.com/downloads/aemDocuments/documents/MPU32/ProductDocuments/DataSheets/SAMA5D2-Series-Data-sheet-ds60001476G.pdf

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/microchip_sama5d27_wlsom1_ek_mmc_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/microchip_sama5d27_wlsom1_ek_mmc_defconfig b/configs/microchip_sama5d27_wlsom1_ek_mmc_defconfig
index 024e8a1465..c5b9e65a81 100644
--- a/configs/microchip_sama5d27_wlsom1_ek_mmc_defconfig
+++ b/configs/microchip_sama5d27_wlsom1_ek_mmc_defconfig
@@ -2,6 +2,7 @@ BR2_arm=y
 BR2_cortex_a5=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
+BR2_ARM_FPU_NEON_VFPV4=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
