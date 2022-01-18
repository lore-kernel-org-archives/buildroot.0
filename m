Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 908C7C433EF
	for <buildroot@archiver.kernel.org>; Tue, 18 Jan 2022 10:51:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D8C040902;
	Tue, 18 Jan 2022 10:51:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hO3zz30qyiBN; Tue, 18 Jan 2022 10:51:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45D8A40900;
	Tue, 18 Jan 2022 10:51:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AF9231BF28D
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 10:51:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D02D60D89
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 10:51:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FDHgqgO7FDMK for <buildroot@lists.busybox.net>;
 Tue, 18 Jan 2022 10:50:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd10106.aruba.it (smtpcmd10106.aruba.it [62.149.156.106])
 by smtp3.osuosl.org (Postfix) with ESMTP id 972CE60D88
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 10:50:59 +0000 (UTC)
Received: from localhost.localdomain ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 9lxknDlmTDzPJ9m1hna7Xt; Tue, 18 Jan 2022 11:47:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642502878; bh=/406gYHTVZ8aQ7VwnAyV3BPdiwYVG2U4F4IIwhIrvbQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=CMih5SdNEei15WmhYHyETcTkZBYHi2ObrNdM50uKDKCw9E0dvG8K93hcbWKQlOs8l
 UspxXZ/9rnyCM0iM+2EryrUl2Jl506XNrBdhlqEv+Mfn3zwG+XsfvyQT4ANBmT0SCP
 V+jht2S8iyntg+yYXjoNFy2ltB5aVDho4z6qwmNmtmb0W1rj2VgRYyXzoIuW69jE0W
 3R/Pe4OOPVJBMEcDZ72hMriacUaeZ1Q+P5rGqjCsDGvg9YfBJJrKDqemx3Zkcem+Fx
 AHOpBHZCKxrbg93Gbli9fB4Z9eSSnVbAGoNq2A1hvYhuSuXpxsu+TcYquqc698vHEl
 8C5NDBfYZdtOA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 18 Jan 2022 11:43:28 +0100
Message-Id: <20220118104338.2081259-19-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
References: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfJYsAMvPGcvSlUyTRIWspdp1sZnClTTYEqu18Zs+4ykaY+1IJKvCqmLWxBgsrt9pyn1xmrFU5wTlUTX0AP+9LE6BPpQLTsANrEG97ktVwin+KAU/rmIV
 XoiYlaPRhcAi+sEJwBt0Q3LkG8Ws24uN+hemrIGQjBg+dEN3mnIzA8QVuFAAPIiag1sObr1X0yXFfitkyqLZNquwoyrVVr1Ad2NpP7M2eiOcGoqkyAwMqbhj
 DaMi5TZmnCOz6LNxG/6akCPplj/OKk8EgE2QrxgLbGuE7YJMzdwCVzgzSs/T2ZBC5w1JOKWPf/3GYcbUMNw0zoV9ir2iEJ3NHIr6iG3R6Gi1rD9tJvQpuAw3
 diCkuSa8U9g3qETIBhlg6iDbHkn+LiP1Kv7lyj3H78flxjiAav3OH3llnvDeFNRWC2X07qBwSjuYMPnzQ5kkEBPYQugm84NLHHALlCAE8at3rIXTocKZjgt9
 SyQiGXvLf6wKKyg636afBXFuYNWGkfibga9aU4KE40g6mO5jzM6ePvUoYfEl46FtMiye9lAJ/ZX+03xBnsaSZIfflyKeb7WlBDk/b1sk3ZkiT8Y2SJknqGg0
 nctJn6djw99FfwtvtW9M5DqSwG/DujicdIR2J05v+ZfLcoQMkybopFrbSka4o7X+r+4AXqZT5Mp5yceI8UUpAkgPO+r1Tr38BEAjW/W0mubDRV/pqLmdIP6h
 JXk3GuFL680iE1HB5mklWRlJknD6KhFyP0HwxqzN4muuWXOzGHi62dtlk5guFYsyao3aNs2LfwFf5gK7bbp4orAXikMuFRH3smdp0DAW+GgfbouTGjjXwLOe
 OpA7IyAxjD+i4MgjEHPGh2W8hWHKS7tWz3MOL9N+R8U6n2wkjsVTL1Eb5EWaDA==
Subject: [Buildroot] [PATCH 18/28]
 configs/microchip_sama5d2_icp_mmc_dev_defconfig: enable NEON/VFPV4 FPU
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
 configs/microchip_sama5d2_icp_mmc_dev_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/microchip_sama5d2_icp_mmc_dev_defconfig b/configs/microchip_sama5d2_icp_mmc_dev_defconfig
index 052d9e032c..123bb3e69c 100644
--- a/configs/microchip_sama5d2_icp_mmc_dev_defconfig
+++ b/configs/microchip_sama5d2_icp_mmc_dev_defconfig
@@ -2,6 +2,7 @@ BR2_arm=y
 BR2_cortex_a5=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
+BR2_ARM_FPU_NEON_VFPV4=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
