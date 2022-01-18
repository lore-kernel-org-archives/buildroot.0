Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7844C433F5
	for <buildroot@archiver.kernel.org>; Tue, 18 Jan 2022 10:51:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7990080B77;
	Tue, 18 Jan 2022 10:51:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pQpkhDe9smBW; Tue, 18 Jan 2022 10:51:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE85280BD4;
	Tue, 18 Jan 2022 10:51:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B41C41BF28D
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 10:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0B5D405EC
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 10:51:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BhnoscmkkxNj for <buildroot@lists.busybox.net>;
 Tue, 18 Jan 2022 10:51:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd10106.aruba.it (smtpcmd10106.aruba.it [62.149.156.106])
 by smtp2.osuosl.org (Postfix) with ESMTP id A97C0405FA
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 10:51:10 +0000 (UTC)
Received: from localhost.localdomain ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 9lxknDlmTDzPJ9m1wna7kg; Tue, 18 Jan 2022 11:48:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642502888; bh=S2b5JbyN42FN9wNk113aaucVyhxzhmQINhcWuYces/o=;
 h=From:To:Subject:Date:MIME-Version;
 b=hZWU6Iy0Yqvb3Mk7BS371jWHGNTasxbSSQhQiSzbcmu6sTsLitGKBhGDO69dBjE6x
 aC1Bz3EbsQf/7TGETREzTO3e3RkLyXup6hIIgDetrLp8+YZtM1bDf2VqE7Sb+oOz5M
 d15nvn+V2hH84c4sNWvcfT3GQt3nqekofrlJfwOQjvLxXGk2MiF+pnxM055O9H0QFy
 d9ZxWjIZr65KfnFa959Eo94yAFwwvcxtcWS5zvU/QUhWZheAJtllL6CmOSturWxIHw
 DSZ8W8KQPYJlmOG/RxT0D25JzUNmG0S0iud5F0lK9Wl9hGbh/ZoSDHws2qa8sC5/b8
 N5pXp03oAX2vA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 18 Jan 2022 11:43:29 +0100
Message-Id: <20220118104338.2081259-20-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
References: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfDWAzxGrR9MrPtQzNOWKmB3m5Q9LhOfyk3yUBVTBfDzTE42ny9ImldGgUJ1p/HIhA95LC20TMCxGlBnBUy55AB1D8vdu45bRturlI7l3xXfeWbWvfTb8
 vTNFUWkA1k/QJCDMN5Ol4hdD46pkpsCmilHiVcVDlY1VCQjFO689SBYT9Uf9+78DXJehWPbxYIdzrX/5BwWQyHyj9W5POChVkqJXMjk5fQW68oHM4fS4pZsZ
 XYQ8nqDcfiZ3OWRhld/ZrlAh+Mjqmt/LZX6HcYrmhy0+2sgS1zUMenfJ9KEy5YTfz/4Gk0SWICSuHbO8FOInkT1357Zw/lfuxxSdbpBQEFwwyxJ2D+E0ewxS
 CFbdub5Hh91p7+EIrrsyGeR6C8w4kCCZXOkg1RlE2Aa22R62iCDOoikgbK1s2s5QpmB7zx4Qnk04wMnRj9fYfjB1e0Y0TdSxzdHmZfxP1VszYTzGlismuyEI
 NNzK7E07rahhDi4C/TlLXVlEx78xIeDmzZ0U/Ke0gNlHamctdcB6eV7ik7c1hDLt3eVHVTN0hzlJ0MNwWXrdHSVt04pRQ60Snq8EILJ/BhrSUOfC6eQIWUY/
 eaSyZm5PsvQfL8SsY6w+nqu4HoxDmaGM0bb0gVcejo6a2B/UJbrFnAhgAFVvN09Waga+XXmfT3/yHoR+wH2/BR/IDMtUzuq35PzCM2rhQp5oo7P9qU+jdCdb
 A3u3kIhlxxSwa2fkfZWzkOmM0lhfu3RKtEjCHug2c1W2CdX0OpoQOB8cqzfIQOEkBensp9kJpd9olis29BundBeARS9r7yDN7BpPj7f3JMdI277rj+Hq4S0n
 R0afNJaBWaexpKyo+LuFKpDp5c+YB4RIt+BF82B5/w7XjVceR1WXoudpbz5IRQ==
Subject: [Buildroot] [PATCH 19/28] configs/orangepi_lite_defconfig: enable
 NEON/VFPV4 FPU strategy
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
 configs/orangepi_lite_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/orangepi_lite_defconfig b/configs/orangepi_lite_defconfig
index e834816456..9805d953b9 100644
--- a/configs/orangepi_lite_defconfig
+++ b/configs/orangepi_lite_defconfig
@@ -1,6 +1,6 @@
 BR2_arm=y
 BR2_cortex_a7=y
-BR2_ARM_FPU_VFPV4=y
+BR2_ARM_FPU_NEON_VFPV4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 BR2_TARGET_GENERIC_HOSTNAME="OrangePi_Lite"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi Lite"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
