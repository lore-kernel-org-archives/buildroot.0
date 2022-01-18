Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C0CC433EF
	for <buildroot@archiver.kernel.org>; Tue, 18 Jan 2022 10:53:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA1F6401CD;
	Tue, 18 Jan 2022 10:53:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7GAynqV2bJMe; Tue, 18 Jan 2022 10:53:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C22540909;
	Tue, 18 Jan 2022 10:53:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5CC5B1BF28D
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 10:52:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A40040197
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 10:52:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9mz2pDqtgtYE for <buildroot@lists.busybox.net>;
 Tue, 18 Jan 2022 10:52:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd10106.aruba.it (smtpcmd10106.aruba.it [62.149.156.106])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6AADD4018B
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 10:52:34 +0000 (UTC)
Received: from localhost.localdomain ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 9lxknDlmTDzPJ9lzPna54S; Tue, 18 Jan 2022 11:45:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642502733; bh=c2ThZnxH6z4RldRGyn3rah0Ed697t4dnCKfYfnoe01E=;
 h=From:To:Subject:Date:MIME-Version;
 b=DYf8W7po4l6aVzgKAFue911SwGawhDixLUmxxA6qnXG1229mfuKIpGD3XcOj8nxdM
 fCdfO2s/3Jw/kvXet59ZJ7JobsBIm0+Is+eP/klONjpSmd8UozkDC/9BRKKIi3t398
 7p2sLUp04YFOGMX6cvJpRHS1h9cf1Ml4UgdoUwEjjiHCaEwk4cHiHZCnYxr3843VCr
 93LhzgW4iLd/aIVREi4KEQZ7ryDcWJF0T7BNGp0DXHPw0tRrwuN0o4B4Rpnm8rtUuu
 +7tGYYQrDaV88bbW0E1bnBqqBLOqzn5L6bb62eBjDZNtyLclvIIp3l+m9BrJYmIrGZ
 DPEivQEseLOWA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 18 Jan 2022 11:43:16 +0100
Message-Id: <20220118104338.2081259-7-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
References: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfCOpj46OitXICsgwLI4GiyyO4I9ETPe3q9TmO8/nWVlFHGRa9qCtFIDGzJt6XqFEhbqZNnOUuyu9kEdNJ2wFzKl2xu03/ROlXiSBB8wMPIMC3afbQgUK
 5KmdlFSvfanuxbJ8I+k5BqQNQVvEL2R1Q9zt1wv+MwBxBaecQgmMx2HH9YCIOYIBksi00TIRbutx6DxBQWon0AMdiOKunWbYO1e1cDut+scxwXJw8eDV4GRx
 h/WQC3Gu/xLcQk0aZKkylAv6H7g5go63iHfby2aFiyKI+vdhY6n8xfSzNGvpLj7zceOeXWcdYqqfNasJ4/0j4ZV/0U5Qo/MgDQLKaRfy59cM/EwS4iGfdl82
 c4tzqRYPNg1uPhXAjDELXEMvVgiTI0NHnjHI5wi8TOdcR9jzRo57FqNcdWdemRnpAJK37Hnh3+dPZemTkQfid/H/LlSocjgbGkCVZLaErdMXVWWPIKcH2Z0D
 KN8RpMes/jCW9Z9yBzZ1nVZsGMXOT9X+Mw02CfP3SBpsRwv89j/HPrtSGm2rjpAQyUsImpIXvHKy89m4tI/H3f3TEn0Km62pYbZoVIlv1CJZWAFmVgYjz7RY
 LyyfDe4y/2wqMRx/FmsCN9iYqE2ClJWUeBpEjRF6ZV0WUQMBW1iZav8aRaERfIpxOqo1/wN4XjSSoWxgpysPxTC9VaO8V0tNuXDVyBXCbu/ECORYpunn9xwk
 PyBkVYwfwR0GZatgrrPyWGo+zioztE/fG9kk3AIQFzOnQ2KhjCD9tibbFVEbAFJMX3Ls5dtuHLRqmMkJbU42Wf2tuo4tQaFNpZ+en7Loee/pqmf89+r1STEe
 ApG02kKu0s/U3sFJUFuIZkZMkVbyVWVKD6s4ryT87fC8SdDX13jU8ZhSZhAYdg==
Subject: [Buildroot] [PATCH 06/28] configs/beagleboneai_defconfig: enable
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

This board has TI AM5729 that is a cortex-A15 and supports NEON/VFPV4 FPU
strategy, so let's enable it.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/beagleboneai_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/beagleboneai_defconfig b/configs/beagleboneai_defconfig
index 586a75317e..edc29e4e5e 100644
--- a/configs/beagleboneai_defconfig
+++ b/configs/beagleboneai_defconfig
@@ -1,5 +1,6 @@
 BR2_arm=y
 BR2_cortex_a15=y
+BR2_ARM_FPU_NEON_VFPV4=y
 BR2_GLOBAL_PATCH_DIR="board/beagleboneai/patches"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 BR2_SYSTEM_DHCP="eth0"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
