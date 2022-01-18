Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7723C433EF
	for <buildroot@archiver.kernel.org>; Tue, 18 Jan 2022 10:55:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D579405F1;
	Tue, 18 Jan 2022 10:55:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YuBIws2WaX8h; Tue, 18 Jan 2022 10:54:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6650E405EC;
	Tue, 18 Jan 2022 10:54:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5C3E51BF2A6
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 10:53:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A2A380BD9
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 10:53:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jwNo8TCnJKU3 for <buildroot@lists.busybox.net>;
 Tue, 18 Jan 2022 10:53:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd10106.aruba.it (smtpcmd10106.aruba.it [62.149.156.106])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F91280BD4
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 10:53:26 +0000 (UTC)
Received: from localhost.localdomain ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 9lxknDlmTDzPJ9m0Hna63f; Tue, 18 Jan 2022 11:46:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642502785; bh=RqSHUntn4oU5tTTFVjhF1KvvWKY/22UyyNLBwicNH2g=;
 h=From:To:Subject:Date:MIME-Version;
 b=KDZN2mmlgNCyQI27APEVwHeELnrpDJWyIy7m4vTt79n1g2fdUSuwai74sVzio95FP
 Ig7QQ3Jw53SYLcVJJb95LTqTEQSrcf/VY8MAHS9Jit97Ayth7mJkitpBdRsXI7hWkB
 EQG5btZWgDTch5fbUlJGiS9qxsOahxJ7GaXKOgJ0d+uLtvy6+VJ6R50AKQUh74fddl
 +SMMyC1ILs91u6thy171Tdc95Ia33vnAyMYn6/qx6/XNGgTX6MSGiub5xVTLuWsChO
 ukE6LBtluVimPJs4bPVbb0aio7ZNMr0NUutDjmSLz4PG8dhsKDGGh3BCLtdyWw6qVV
 GsNQrv1kkstNw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 18 Jan 2022 11:43:21 +0100
Message-Id: <20220118104338.2081259-12-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
References: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfBBEX6HHoX9UXLWNFAT6A7xNTk7pMjJ2qHMlQvtEKKm8aQ18KHH74B9JnfAd0zx8KCKQxYF+3PnvGWAaYDkUXMBN3ne9y5cp9SYcuNBYxzTBQ/HIGQD/
 uvx5ua0nivKgDRhKw4920Aem77byLEaDFgrDX9eFuX4OW8elVul45atmtGQt+4bFdaxPf+Lf3ZLg8WJuCDU0+9ObzU2Iulx4WNfou6wh+QgDm/pCpFNl/GJ1
 LKtoG5Mkv5i4XTyzd71t3tOZlfK8hCRcLfs4Xc1vhN1IUyKov1ofgBwgqMcAiNlMdomAfbWdIV47jZS+5E1llCUvGG16wfULC1rjMCiFBtfcjvBdXa9nMqPJ
 ybxxYE0JnTjfQ6d8/CUMgLaqA5sg9w7W5Xw0aKWwNEEsztp7+QtXjTge8y3wpxBlXdurXvwg1XXH+NFq5QNq4KBQW6Q0t9XKbaEOh8g6rUyWX9VYcrB/EC2G
 fgS8ndRUGwRbWQeQRq3of3tfjg8TohK/ewdKocRl0hFml+O84Sj0yT3WhpXhpV9K737Wlzo7RM7N1jNxHTtt1RgaFIiASiUS8ju+9CeM4CbEIyZsI4CsnlsQ
 +0Beq+CSJAxqu74WFJ9l2qLB6BaP4EPuOyaPI3c+UfcilTqy4YgEf4mkfztJHbPn5Ev1VMeB41ADdcWIKQSGivladmil7r5bqIfWCkugOJ6Q2ofsA+1CWGvn
 RTSQhwLnFr0Wwuq2DKBOQj7u7LEz2UA2J2Ff3UCWk/V8apOw0H3AEBBbVhoRNoL3wg/1c6qOoVztAZIInjLzQynKARK+wd8Ou/jTegy62fDVzKLiFfbAJcqq
 K0mUA/JrnGorCMi73gqkipojF2JsIT4d1Sju7l1xD826wJXBESnTppuCrZnlRw==
Subject: [Buildroot] [PATCH 11/28] configs/friendlyarm_nanopi_neo_defconfig:
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
 configs/friendlyarm_nanopi_neo_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/friendlyarm_nanopi_neo_defconfig b/configs/friendlyarm_nanopi_neo_defconfig
index 1519d828d6..559a3a2415 100644
--- a/configs/friendlyarm_nanopi_neo_defconfig
+++ b/configs/friendlyarm_nanopi_neo_defconfig
@@ -1,6 +1,6 @@
 BR2_arm=y
 BR2_cortex_a7=y
-BR2_ARM_FPU_VFPV4=y
+BR2_ARM_FPU_NEON_VFPV4=y
 
 BR2_TARGET_GENERIC_HOSTNAME="nanopi-neo"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the NanoPi NEO"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
