Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B79A5C433F5
	for <buildroot@archiver.kernel.org>; Tue, 18 Jan 2022 10:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5065F405F1;
	Tue, 18 Jan 2022 10:54:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hSTevipmvxkB; Tue, 18 Jan 2022 10:54:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 55902405EE;
	Tue, 18 Jan 2022 10:53:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 552481BF28D
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 10:52:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43D9880BD1
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 10:52:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f5_Dy6vbwaNp for <buildroot@lists.busybox.net>;
 Tue, 18 Jan 2022 10:52:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd10106.aruba.it (smtpcmd10106.aruba.it [62.149.156.106])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6DC6480B6E
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 10:52:47 +0000 (UTC)
Received: from localhost.localdomain ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 9lxknDlmTDzPJ9lzana5Ii; Tue, 18 Jan 2022 11:45:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642502745; bh=A/oc4dxh2DVXC3ffAGCLEYf+kvnfOD/QTu3AzY1gK+I=;
 h=From:To:Subject:Date:MIME-Version;
 b=kmXpxLilNcNw4WHL/vZ8hYegVy7LO1UQ5fIWv9kt8VSWYNaz6Ct4jpBubv+MPBre+
 dMfYnEagRMxlfEwUCOiG/7jwBwObwZxvNnRVVXzByjsEZZBJjYGigCE7HcbZYME+OS
 FZY/P6BFtTD2X9r+rEZSMEF3dY/kV5GuAeBq2JS2Iu//wb5jhmzc30kMOAXrup0IEA
 XwMnvlkJ37p7oCsltw6KbUhO0/CPeMMFCTu9x5UErrWh5qqCV5AZ7Iv0n3en/hJCnK
 2HVRC/pmPAHgcatTPjjV5JYqnK49h933NXKrtDXXAkdzvkkBhwJH7Xy/FgeWAuUoGa
 rzJCgoy/F5OqQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 18 Jan 2022 11:43:17 +0100
Message-Id: <20220118104338.2081259-8-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
References: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfKH9h4EXWJ7Py08hqyhf1q0E4Flp/kBewhFZ3/aGm9Pg/1CDgBbsBfXPj3I1BEv5TL9x1vsaMkqKD6D59KwYDHMhM4zJIQYaWFQutdsnU5quKalmNXCm
 GhEAJpSgKCaCFPTQUvhwg86FIODmorZ6LOHqKKdEfzKMRdSehgXRvwSAVPSSEws2Ko8e/NGZyViBdApnypZpju/kXka4ttAX1jR1Gm6CDE+FNvhiAQCzcWmv
 KPdCyi8mPY39eFhfQdKLeya65LpCYBoPh/SyHwG914QHoFwnBA2Z2E+T5t9beCJXr4Z4S4dx93FkyOBE6ymHdeQq1JaBPYoqbwf227e5pMeHWnKrurDdv6hq
 Qy78Ndtguyxod7Lo1tG1MisP6gbi5XwxIDP/v8xxHH/6H7/Pp8FDUGgbELXsSVyLmErj85kY01ngb5grpdldje8ryfmEhTvmvHw5bdGmXahmFC31Z9W+DtH1
 +7BBI5Eo5yls3ei8znofBN4CiSEng/tToXVh0AVfLm1v6PEMbqhnxBBorgjL5KCNPDkiqLSKXZ/RwDlyXGmkN+mpFFOkoMHs4UxN+LHoNTDRxEEHmL2Qa92t
 Mv1HOsYnWyTM/uXYHItXw1X9yC1WedIJW5slfkIR759/RAZoREbrUqfRE/k8DaOmHspZJtm31+UzqFZH0qy/eels2HlFKigWEs+TW6/ROb+szo+6ZGJLoBj0
 Pdl2loTP1TOLfJV/C+BUlOFHlGI+8oJgHpnhtAMf4bedUm+b9UCMf+qzKU///NdtwggURb3bKdF/2HVqnqy/aAD1R8g0oPjN+iEfz/VwdVXz1WheGYxqMoJf
 TL0Wyw1E/ALzJ8S2c0dvgz+KZfKW8rPtilA4iXBUi/lnAIX2PZlazydwUUfLnA==
Subject: [Buildroot] [PATCH 07/28] configs/chromebook_snow_defconfig: enable
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

This board has NVIDIA Tegra K1 that is a cortex-A15 and supports
NEON/VFPV4 FPU strategy, so let's enable it.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/chromebook_snow_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/chromebook_snow_defconfig b/configs/chromebook_snow_defconfig
index bcb94b716b..bc188967b3 100644
--- a/configs/chromebook_snow_defconfig
+++ b/configs/chromebook_snow_defconfig
@@ -1,5 +1,6 @@
 BR2_arm=y
 BR2_cortex_a15=y
+BR2_ARM_FPU_NEON_VFPV4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15=y
 BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 BR2_TARGET_GENERIC_GETTY_TERM="linux"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
