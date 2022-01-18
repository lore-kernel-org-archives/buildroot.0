Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32306C433F5
	for <buildroot@archiver.kernel.org>; Tue, 18 Jan 2022 10:54:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF6B581A2B;
	Tue, 18 Jan 2022 10:54:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xLoNsAhllatY; Tue, 18 Jan 2022 10:54:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4524980BF5;
	Tue, 18 Jan 2022 10:54:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 45E9F1BF2A6
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 10:53:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 41C0980B6E
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 10:53:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TprScMQqaWyZ for <buildroot@lists.busybox.net>;
 Tue, 18 Jan 2022 10:53:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd10106.aruba.it (smtpcmd10106.aruba.it [62.149.156.106])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72DBE80B4E
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 10:53:18 +0000 (UTC)
Received: from localhost.localdomain ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 9lxknDlmTDzPJ9m09na5st; Tue, 18 Jan 2022 11:46:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642502776; bh=Ecwa/BOFRG7Q90lA8p1uZI/xPx0jghOh3TBB9TEYcnY=;
 h=From:To:Subject:Date:MIME-Version;
 b=n4jAXMiMul+f5CcE8NNB+n5gAc3fSB3V81CrZlYjWpbDx+duC704LsabjAM4k10Tj
 TkwwyI1xcMkW9efSJS6XI6/hCWsO4+WwE+RQsZ4PW8jBxanyglDP3w7n/2ObRwn3fj
 0M8Upx+ZAkpyUfQy74LqFOfMRBhNRXIL7qPLS4TtG+1Em78EtEzlzkBzWe7GMEeQW9
 tA4dQDxpFN2TsQkRpnXIPnWeVcpQjol7wuegXNh66ITW0qFsZzSUPM957Opwgw2rfV
 m5a319fR0ED+DsrnsXFSn8uSJtaHGnEZ/+Bgrqt+bIt3fWIv3ACNx/Z0r3ktumNo2L
 WCfdZHMMlhOUA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 18 Jan 2022 11:43:20 +0100
Message-Id: <20220118104338.2081259-11-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
References: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfDktE9Ilz2Qo8EGf/Cipux0GITtw2ev+1OJ8O68YCEvS0Z84j9vUvvDmLGZAymDpIpfXSH/qIyOeIcAaGWXtxTCT2V277lnU1KsFRDgNYt6EEpC/P2BK
 QV3xQMRHCh+0syHKI5L3tGbkl4ZAx590kdK6+UmmfBKDMNIsGf+gaUJVbi/Wtynnc6g52nW2ED9FeaeAzG8QycwCL5CgNTKCiwrP2bqzjVr4rseNaQNwjxTK
 Ht5AOBkQXpOLERUfrHecvNMc0prYAPBPvM61eEJ+Kb7IukioXOKTbRTyyoQSe/pdgR+Rqsz5aRv/8DdaRgSKJSh5gfVSwaxQFFuL6Im/ko6uQuuKjjvC2Eb5
 ikafZQ8dGDM5y6tbfM058zdLdP7Y2A6OFKOt/h5E3+Ufeq776LP5tZV0fAu6NbT8SbOwlDYrd7fBpss8vQVKc7iHotHgBdp0c7IYtTAnC0ufgEPqe/VOp6Ze
 pveJFkaM3Jh+eblU+CpefUMJw2f4S1EV7P6S8OX9lkhwik9i0uD2LE2Baaov0PqpuHBeFAf5ipGGDMjphg/izl9/QU56TJw0iBRyn7W0SG97Q9ZRVTecCBSZ
 1TEZ5XrqzaALfCNdv6nJiXmkBk9FqU0f71yx+XD4voJtmbXhmjXjBvM6NEw5sjepz1ALbk3m599X878O1xd/iYqVhxnyhDZOLmhVD9YKU8qAyUaO0shRx1Ey
 1mIUFIjG6lEjDOqfzMexiqL+byRpwoHaydFW3XUv3EHmUr2J/o2El4Od+ybpVXEM6TMJ8bVqP8vd6tgAilymbhGbVN3yg1gG6Pmn3tHQqQmT6kFizdv8Ml4f
 lllZNCsTP6Z0cK56JKeB9oMDzIsvownjN881CB5NwM/b/4kEurTzK6b8i4sAtA==
Subject: [Buildroot] [PATCH 10/28]
 configs/friendlyarm_nanopi_m1_plus_defconfig: enable NEON/VFPV4 FPU
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

This board has Allwinner H3 that is a cortex-A7 and supports NEON/VFPV4
FPU strategy, so let's enable it instead of only VFPV4.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/friendlyarm_nanopi_m1_plus_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/friendlyarm_nanopi_m1_plus_defconfig b/configs/friendlyarm_nanopi_m1_plus_defconfig
index 06adc54b15..bd4d78cbf6 100644
--- a/configs/friendlyarm_nanopi_m1_plus_defconfig
+++ b/configs/friendlyarm_nanopi_m1_plus_defconfig
@@ -1,7 +1,7 @@
 # Architecture
 BR2_arm=y
 BR2_cortex_a7=y
-BR2_ARM_FPU_VFPV4=y
+BR2_ARM_FPU_NEON_VFPV4=y
 
 # Linux headers same as kernel, a 5.0 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
