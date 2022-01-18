Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8688C433F5
	for <buildroot@archiver.kernel.org>; Tue, 18 Jan 2022 10:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 88299405F1;
	Tue, 18 Jan 2022 10:51:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kNnWlIhAyPZf; Tue, 18 Jan 2022 10:51:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A784405EC;
	Tue, 18 Jan 2022 10:51:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B600E1BF990
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 10:50:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE4C3408FE
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 10:50:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5Oo3BA_7aCCa for <buildroot@lists.busybox.net>;
 Tue, 18 Jan 2022 10:50:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd10106.aruba.it (smtpcmd10106.aruba.it [62.149.156.106])
 by smtp4.osuosl.org (Postfix) with ESMTP id A04F54025B
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 10:50:33 +0000 (UTC)
Received: from localhost.localdomain ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 9lxknDlmTDzPJ9m1Hna78Y; Tue, 18 Jan 2022 11:47:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642502853; bh=w6w52GtwPyd1AoWU6cQXZDv2Otd8JX75fAvAMx7Fdyo=;
 h=From:To:Subject:Date:MIME-Version;
 b=IuNf9OyVE+qYc4+aFh0CCmwb1SBK5esrJN1maSIwn0841FDzlIF2k/2UTvAr9FT1e
 rYYVoLyf2ZqOffQL3nFjHAc70LOBQsjeN4uUC2hZeWDO1qE+4TyUdLXcegkL7dJrX5
 Ro8ATTwKcu4xrYTfHww98gNsOgaUmw17OvGNZiDcm6tskAFj3XWEmK3KqzA7OXPSm5
 R0Jz2oSyDZtGnNECtW35qEqPOXPId9vwI134GtlkIyWbrHoEDAt54IjGTIjxoM4ous
 DrBFPOUPiK80IZGQa0IGBEyISoWFVmWt/YqSH1ByjXc/Vhxr0UsJSxmMZ4q/eMPfDT
 +GIyVCGYjBOhA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 18 Jan 2022 11:43:26 +0100
Message-Id: <20220118104338.2081259-17-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
References: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfJqsjK/FdPXyiP4BeN3WfR74ZEg+3mOtY50nzuER98rJ7wbDB9Z7RjWTNe+QbM/lIATDpRLEJ7StQMJ02mn+7m3bGHIhNtL5DN8noUlQGKgvjdFG/LVy
 P4yxKWlagnweENekLoxFvj/wQfVKbvl8jHSRoBcYHu73bXCcwWcFodFLu6bHq6FF0xxlTDMQOm/1sfGsYMJGAYGTg1mUoacZ/2XBcNFfJOgixYWCTEZ83sda
 Z+zjA4DVGWSxRt0i2KUDDHLGtdIvbk8kpGeb9mjszndryDqw3jvCzDko/hkWGG09MkMgCJOHDuMBiyGk/OuVL0nVYK3OPuki8xX8XkTQr2aZrMXRLub7cA+c
 KPCaPQ3k4ceCK5DO2ebwDpKFxdw912JiXh74ZgSRW8RHmiUQVN1T2Bax66rfrf2rDIVpRfApLA/325Q+pCIufl2mO9rrrzHC5+F542oQV4TlgjUtR2p/n1/e
 roEueLFqk0+ppbU4LgsFTrpnbK/3kM/zYPmyLbdQJTMWGss8VJTnUTKu/azkskwg/dQihfs7Ux/LN6G6zj8D1ZhZOJwWwjCZw3IX5683yCJ/j3d39MrK1DN+
 D3y3agQf1YBLakQ3+KuC0oHo8vK4zkiu3ks4Ijg72epHury56nrvbcKWXmV58Zo/X3Hgg3Gywzahvb1/0z23NRfSZrV924gTJXvmMu+iZu1lHSsWQpOfa+hL
 gkCMLV7iN8TQ9VMfHdCowtl5SHHFnk/fdabUzGCax1DuKulJawhr7Ynp+aUdtanZnoC/DPNEkbZmg0kSm6JUSZtSKUdWoNanikrlutqZgkSAXZg8bURadkIX
 bWlCoZxfiVVCpSejqe2PQwTvWBePNiTgrn4Rvy9e74gkG2Ot/9V06LFcSfxybw==
Subject: [Buildroot] [PATCH 16/28]
 configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig: enable NEON/VFPV4
 FPU strategy
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
 configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig b/configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig
index 3bcd5f0200..35b8c905e5 100644
--- a/configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig
+++ b/configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig
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
