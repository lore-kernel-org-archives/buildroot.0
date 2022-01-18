Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 894BAC433EF
	for <buildroot@archiver.kernel.org>; Tue, 18 Jan 2022 10:53:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 443C860D90;
	Tue, 18 Jan 2022 10:53:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fu--wElTHpN9; Tue, 18 Jan 2022 10:53:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F32760DB7;
	Tue, 18 Jan 2022 10:53:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 561101BF28D
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 10:52:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4473E80B6E
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 10:52:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v4Da1U1jWofD for <buildroot@lists.busybox.net>;
 Tue, 18 Jan 2022 10:52:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd10106.aruba.it (smtpcmd10106.aruba.it [62.149.156.106])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7FB6480B8B
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 10:52:05 +0000 (UTC)
Received: from localhost.localdomain ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 9lxknDlmTDzPJ9m2nna8gH; Tue, 18 Jan 2022 11:48:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642502939; bh=3TDJRtqrQp2MNfnehqtFQljBe7g0DmmzEmGd1nuLuqw=;
 h=From:To:Subject:Date:MIME-Version;
 b=K5/D5i6pPU2qmSamfMukcLNzm5++kheqW8eORNZxkHfUlijcekFXxBMvu4FE16dPu
 k0BhaY2JPJIJVTnrNt9RwPyt3p0WB0x7g/l2hS0O3+tBJbf28QNLCvP5m86msBOH6b
 0TQV1HPNi5H5AsBdnWBNBlqNLgAxv8mbvS8PxU8+sqCsJlfY7WdejC3+/Ucn6YFtfe
 BzxbAFgXRR3NgOB9JW4lu3feXCaVQ6wz5KOcuN++B1tpYGLnqEY3X/CEFIbxB+dTcy
 NnxKvjdFoOG1O5qMTQiHltO2nZM/a0XBR5sfKHs2x1L7rCYZqfpDXFWH35R728+XPl
 9guL3fzBjUVhw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 18 Jan 2022 11:43:36 +0100
Message-Id: <20220118104338.2081259-27-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
References: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfCAX/ZbOetIMlxLudOMq8ImwBbdlpsiades+++aPZi15nlwysBnnrABYjGki055dhNlNPDAjUA58UZ5+3adYc0ParjYgsdVbk6KkmqMDOEWPOp2n7Rw4
 93BgxujVKeIadkXZc8L65p9uq27N5o5VhH2udx96/+ORnMq3VReADB4/HbBziKFcvuilU7+bOCdVLtAYiFQNAGNliuXE950IAXznB3tjGZe6mkhJsJu18+xH
 Ea7x0P8QnB1sZ/IDDselgA8y4oeGZQoUrSGrDvBSE0B2VJ4Ra0Wz+T743xrOPFracFQ863sEI+rk0iQGMFYe5LEiulObb5HyZEl1a/QeZG4Q95yDwvd1v6ET
 o6b/4nlWCzLxVlxyzpq+WQ7lbcAk/psRo3Gak1B7DVU+zKNIwyh1H7Oz41TRKII1DyQNHYabZy22hXIIjl7lFL+WzmYxU8tH5Tnl+T5OImO3Oj6mU6TT7dSb
 q5CCqc13Kt15mgt/7zInjFNOtteJlFPEg/k08lY+bAyp57y8xbG9VSNgDhrRYedKN5ekMhEGkibOVzeZxTFTBHuKs4ya+DoMomTQxAhtl2HwWMkzBy5TQ+2K
 SFG0MOSfn6xBwjBy1lFbScf+1+1B3NV8+mTa9Frw1YMfhD8ygDCeuned8iQY/Hc+A4t8hDUlXJDWDv68s72CXuIUyjqqyvWuhJrW1NRnPE4PlRXlvbwJgpSN
 hHAD8SXTYtyweGtkrlnKkPAEp/r4Kp6nOlACwXKKC+T9sZGd+oefP/rantnJjgvZ7uIhkt6BC/Xk5HGoEBiVNgFDJvdUtz/DhyiLi70yfAOYNOaPE54X7oJ8
 bEjwYzDTlL/6o0FL87u0rFG89fJZKH0MaimBpzS9ebeHEIqbI0I3xmb66U0eSA==
Subject: [Buildroot] [PATCH 26/28] configs/stm32mp157a_dk1_defconfig: enable
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

This board has stm32mp157a that is a cortex-A7 and supports NEON/VFPV4 FPU
strategy, so let's enable it instead of the default VFPV4-D16.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/stm32mp157a_dk1_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/stm32mp157a_dk1_defconfig b/configs/stm32mp157a_dk1_defconfig
index a487ce9891..1768500b74 100644
--- a/configs/stm32mp157a_dk1_defconfig
+++ b/configs/stm32mp157a_dk1_defconfig
@@ -1,6 +1,7 @@
 # Architecture
 BR2_arm=y
 BR2_cortex_a7=y
+BR2_ARM_FPU_NEON_VFPV4=y
 
 # Linux headers same as kernel, a 5.13 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_13=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
