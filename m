Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BFE7C433F5
	for <buildroot@archiver.kernel.org>; Tue, 18 Jan 2022 10:44:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09DE540900;
	Tue, 18 Jan 2022 10:44:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ObGj4ohUF_zq; Tue, 18 Jan 2022 10:44:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38201408FD;
	Tue, 18 Jan 2022 10:44:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7262E1BF28D
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 10:44:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6051E408FD
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 10:44:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id anyVzzz52Fmd for <buildroot@lists.busybox.net>;
 Tue, 18 Jan 2022 10:44:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd10102.aruba.it (smtpcmd10102.aruba.it [62.149.156.102])
 by smtp4.osuosl.org (Postfix) with ESMTP id 34E75408FC
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 10:44:05 +0000 (UTC)
Received: from localhost.localdomain ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 9lxknDlmTDzPJ9lxzna3aL; Tue, 18 Jan 2022 11:44:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642502643; bh=IVg3rZ661uAjjGR2Hek8p/XzN8Y8Vc5TR7x7ANEPti8=;
 h=From:To:Subject:Date:MIME-Version;
 b=RKqCC8R9MdzDTwgY0P/Pc9Y9hRx1qMf7thXZTPKf6RQOdaVSvSPoejWdNyFmyhioX
 T9/XnlzSg6094sKLkkfJR4OD7ZFk50MOPP4mw/xWcNLfZOkSjCbaCw23YgT508ldZh
 HqzJvMxgOw4mcHba2gWR/Vr9TyQgt6k0RiHvg43CdCi6vw2Qh3NVhw+I0qtUAmsP5w
 vjjLTUynIOrZ/qPsSb0BwHwIrnYrc9mTjDRusqxyYMk+gQGbbU6GFK2grl1IqYC+KB
 MdAY5/q4OVTd+jf4REWgHcDsaMzWAoVv+f016uLcXlt/j46WDH+d+H6O5pfdVRyDxL
 b7WIzKPO30ZJg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 18 Jan 2022 11:43:11 +0100
Message-Id: <20220118104338.2081259-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
References: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfH6TaVeUiEMbdqo8raQcPws8nxLHGRZskhAm2Yt7zbkU1ViAG881oVa/WqeJZX2ZoCLwbHVPI5qHyR0dZ5o0rvQQDp3p6HYk07XguJnl/p/XTmsFmGQm
 t+K9qFGNH0VyD+eYTLnULBUHrzQRkxd9FOnKLzsAyjqCIp+u0dsun1meU0xY7YrPaSDvVSLWDJGso9D287hYPMZZ5HXpxiudE7dLgH8Ic32MA7R+9jEo5Sd6
 o2h85mvMrJRqOx2C0CNBEt+3by+E5L8dhDRgm/hx/t+7jMu56TPWCtJbr7wFmfBzPyB15Ig9yRTR3cnXh0Ohk5CPOXLwhulN4qVEC3ob5dl+K+E9MwI8F3W0
 N6vmxnjBXxCnWDM4iT5iSKRmpcuG7/WEiFQiia/OIfjQJMvaJ+eKHTCd/FKEAi/pUnk0brM4ORv7m+N/kFjQMsJ/pNQTCRxI4Pe7wQx8+0q3IiBfC9UU5j74
 g7Q/B2OFMjuIUNlLXaXXd3GoGZUoDy5abVx/sbAqPAp87ma6gYNz0hX82dpuN+vptdH9OzJ+r9uQcsa4Nej0g7lcUsOkzAa1kwwvu9Y2eGroNGqx/bbjgu1k
 je1K5zb/xN4+eStL2JVXAT4hnVecrjRQM1x47/GETjNfIDL5I5fqKTrNEflDtQwXNQZitQxcugOv4pT60DDxwS0COEe8yIVYs2n+9rm4UkSUYJgQDCrz0wdz
 6YelYezRL0DeBfqcCmOv+V+IsPhSDo2zKJqUMruWmlblX2QZte6yhHXtReehGX3BsMYOfRBx2zPisVfaMD2NDIw6zWYEA6VQVti2K19nJmCgi8/d40ZdAebU
 Rm7OpKq0V5F54hbg+8V8yCInl9Mo4EknTgPwISMAtB1oRuyUnu8X2+AZj6thfQ==
Subject: [Buildroot] [PATCH 01/28]
 configs/acmesystems_acqua_a5_256mb_defconfig: enable NEON/VFPV4 FPU
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
 configs/acmesystems_acqua_a5_256mb_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/acmesystems_acqua_a5_256mb_defconfig b/configs/acmesystems_acqua_a5_256mb_defconfig
index f8129f3780..991de4c1be 100644
--- a/configs/acmesystems_acqua_a5_256mb_defconfig
+++ b/configs/acmesystems_acqua_a5_256mb_defconfig
@@ -1,5 +1,6 @@
 BR2_arm=y
 BR2_cortex_a5=y
+BR2_ARM_FPU_NEON_VFPV4=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
