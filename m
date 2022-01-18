Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA80C433EF
	for <buildroot@archiver.kernel.org>; Tue, 18 Jan 2022 10:54:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1D14401B1;
	Tue, 18 Jan 2022 10:54:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SDVnve2GmGOu; Tue, 18 Jan 2022 10:54:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 015AD401CD;
	Tue, 18 Jan 2022 10:54:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 78F9C1BF28D
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 10:53:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 73C5D405EC
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 10:53:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EoA9ItFCWj4t for <buildroot@lists.busybox.net>;
 Tue, 18 Jan 2022 10:52:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd10106.aruba.it (smtpcmd10106.aruba.it [62.149.156.106])
 by smtp2.osuosl.org (Postfix) with ESMTP id 78927400C6
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 10:52:59 +0000 (UTC)
Received: from localhost.localdomain ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 9lxknDlmTDzPJ9lznna5Y2; Tue, 18 Jan 2022 11:45:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642502757; bh=29IX0oL7SlEdE65eioLBl/3j+vcf97x6LgTJxksDagQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=FT7bOQnh9tcPfAB117wcYt9J+XHtMrr+/cvhWQxxFPU31FrXWVfiHiqgWwNozpuHU
 d4MwjWOS7f/4DnEp2rKj+GTpGWJMFWv/Rq74XRq5zEUnaH2PTPY/ZERfRl28t5kp/8
 TcfocOa5XKpzlq55Ksuilq2Ygdgp6kAbJLBe1pv+3KzLgI4TPr9LIrtpF7ziPhSWTs
 3V2hRZeHSwxPpRPjaBOJRUho7VTPtGD2OKAz0o7UIN3uM35sxaR+cl1BMP0YFIf4+w
 xC8V31l82pA3TB0IG6lz7eM7pYUnb7upDEllHfitemBu9chCoFbNuBhhgylkvUFgoS
 eBHalPDCvmg5g==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 18 Jan 2022 11:43:18 +0100
Message-Id: <20220118104338.2081259-9-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
References: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfLAZrBvf0gU98dKoUWEc/SmMenlb4PuYPzKNeSG9FwQUnSebiqWrx0jLnUXEMKR+/9LlPdxFduOQ/d8W1RXpSWO83UqY9oLd8PU/lcoBjm8/labBXtx8
 06HuIg7I1XM+xnlAliXIykVhlxeDAApsvvX+ZsRXzXIaNr709vvc3sZYZ+hx6x9ZJHG7DodSCZ7m8sHg6UWQ2X6aIgOFDW9hqL+FIsMD11cgBPJmeaueR5yw
 P45df1LWUD8LlDPLdoHsWH1po1grxD1O7oHEGcfGIWLrAqThwZk5a89crp4YrVOCB47S5WhqJO4hTMy0s/mkgaSLHsi7CspB43q+LRMZdSewC7Hbk0GOcdUt
 aXytuqJrg6F0VPiRJUFTMVVKpeTtkGEz18U6Y9NSY6vkd3cvKQK5CePifYg2pSkSDI6pox1aSK5ADx9MPh3smuSc7IiJT7vamA6Y3NPU+pWnK6AMgM7jgeCA
 jAX5nQD6vudbuoI3pOC6+afLZ4ececZwmLCKLghrsz6PJv1dUvpE2hzfMLFuwNu5x/cq6kczUaufBNufvjL6mWNIG91253p35Ju3HGjSQCMQLT3G6M6772dJ
 syIqKLPm7BJWVSaOnPiOUwxCvB+nQRd/A15oPENKM9pdZjYUA+0phI+CR7oVNQzuOxSNpZV7SR13TQOF5CbXnKi3ImqBo1nOsMkTP+lcA5NHiqtwzrcE84Xx
 IPHrue5hBUe/rmbNjVWRCQQhv+29uiWXKUjuHL5AiLdap1WEBCTFwIvhzj4uqemPixn4v9ha68nok7iuGhZSOx7H73VcDd7Of40iyHKY7o7Pwnpw3JZQP3ow
 hwOGm5qX3cPm0mxhT1qit9kk1GlIzhVdTzK17cTiYsDRQol6/fIFFqOYfT26ug==
Subject: [Buildroot] [PATCH 08/28] configs/freescale_imx7dsabresd_defconfig:
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

This board has i.M7D that supports NEON/VFPV4 FPU strategy, so let's
enable it.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/freescale_imx7dsabresd_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/freescale_imx7dsabresd_defconfig b/configs/freescale_imx7dsabresd_defconfig
index 5a9cff488d..dc9d8c0306 100644
--- a/configs/freescale_imx7dsabresd_defconfig
+++ b/configs/freescale_imx7dsabresd_defconfig
@@ -1,6 +1,7 @@
 # architecture
 BR2_arm=y
 BR2_cortex_a7=y
+BR2_ARM_FPU_NEON_VFPV4=y
 
 # Linux headers same as kernel, a 5.10 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
