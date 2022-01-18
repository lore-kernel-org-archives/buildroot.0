Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD28C433F5
	for <buildroot@archiver.kernel.org>; Tue, 18 Jan 2022 10:50:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32BDD81A12;
	Tue, 18 Jan 2022 10:50:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3JHWcTZnZgXm; Tue, 18 Jan 2022 10:50:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D0BA819E6;
	Tue, 18 Jan 2022 10:50:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 906151BF28D
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 10:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8612F819E6
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 10:50:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q46J93pqTOvd for <buildroot@lists.busybox.net>;
 Tue, 18 Jan 2022 10:50:10 +0000 (UTC)
X-Greylist: delayed 00:05:03 by SQLgrey-1.8.0
Received: from smtpcmd10106.aruba.it (smtpcmd10106.aruba.it [62.149.156.106])
 by smtp1.osuosl.org (Postfix) with ESMTP id 85645819D1
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 10:50:07 +0000 (UTC)
Received: from localhost.localdomain ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 9lxknDlmTDzPJ9m0pna6em; Tue, 18 Jan 2022 11:47:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642502825; bh=HDqq9wif4WQW4Lybuf2dbCyF04L8DFvUl6e8CQ/yi2I=;
 h=From:To:Subject:Date:MIME-Version;
 b=XjAIvXuW/YgSczAflkKZdxczaOTSwyna/NVOffRqPu1gZSM14Kkb6Kl+mffcqVaq0
 nT651zlwtIZI7OBbE+gUiwzxBkqzHcN8xWfebo6nSF1UmcPXwzaGBba48cm22aM1IC
 8OvecMe4Ytvn1RZJZ2UpJmxsS4Uu3QyVXaRVyYp+DSB62tikTuBQLpU7W3Y8Z77JTJ
 n6OWi5NGhsApMxduXk/RFOx/igi9NToDYoWlhNfOfqib5LTpHW4ehV9216awom3M0y
 TdFSZeBHZNBRPqce81LVCNKhjeaf5HdQTQwpCCsQIeibrJRbUorRkWOV2xFbttv66g
 DbXEiJweoBleQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 18 Jan 2022 11:43:24 +0100
Message-Id: <20220118104338.2081259-15-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
References: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfL3jZsU0TDDxmkPnQbbuVtqc2gu9Fb8lGt3F1vjKKKJbR7n83iAUIJ5J9mjyN6VWppBoWfvmp0wrhSWlXsFc9ZB2jYkq+kLqjJ9KP0AmTh/a3xLP32bL
 3my49/IXOSnXLnToG8xslXjwjLJDjNaztRl3kmTaNFoeVDNCl1yBPAPBq7Hbce1JITnOT4MDUBvTOP+l88yPiDeAwWzRb7ETdd4g96bj56RsJ1t4qeKCS+hq
 C5gGpCIIFLwbfpEWu90tEZN4ff3U+XycgD2+bTmkbFNhG13Nn057fJWWeYh5Hj9nqLYjhd/8Dsiu5MBABxtj0FFYuv1Icm3EPIUb5lgy3lc0FPbJsOsEL8rU
 v0fGJFcCY1+VaHfmbpgyW306CmNytzdqjDutNtFWfPUvJpWhxAqwj0Gtt7Okxr3AsS503gFLMx31AAB3Vi2wMwJkNELkDPg0lXTTsdVKBpSjTawEk/0y8Ov5
 QrLWnAWZmcbossdPP1hW5Gy40xUmBXKJaPVdo+3ksPNYPxHl5K5/c7PBPQLh/Y0z7Ry3tFaN6Rmonz2e45XGwpaxCXQXcBYEPPx7cdMt5XDiDjfCtJcwob+q
 TKhzDCisy4zQzzFc6JM1X2xKPGYTa0AcEPVZQRamJH1Fkn/BY/7KNLpI4h4fYFJFT3AoyTuyTFbt53Gr4Ax5n6eecQqzOa2ylN6lViO+96/QQtc9OXtSNJ9l
 pAQgRynfrBIIpJL6K1SXu6xqonAcK8GvxBOfrmIzWep70SIwPBNz8wprBdrDHSN1+udjqIhbovPXx7fEg3Qm4Od38yW26wUVRhh9yJfibv5E/CjqsLD8nZN2
 Sfb8I1zJ4buwLUBJp1z+gW0K/l24bPUnLnN/gZ8syJts4aSar1IcN4iiEJyIhQ==
Subject: [Buildroot] [PATCH 14/28] configs/licheepi_zero_defconfig: enable
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

This board has Allwinner V3s that is a cortex-A7 and supports NEON/VFPV4
FPU strategy, so let's enable it instead of only VFPV4.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/licheepi_zero_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/licheepi_zero_defconfig b/configs/licheepi_zero_defconfig
index 2e1a413988..bdb937d2dd 100644
--- a/configs/licheepi_zero_defconfig
+++ b/configs/licheepi_zero_defconfig
@@ -1,7 +1,7 @@
 # Target options
 BR2_arm=y
 BR2_cortex_a7=y
-BR2_ARM_FPU_VFPV4=y
+BR2_ARM_FPU_NEON_VFPV4=y
 
 # Toolchain
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_3=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
