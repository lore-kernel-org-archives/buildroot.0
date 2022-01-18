Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 991EFC433EF
	for <buildroot@archiver.kernel.org>; Tue, 18 Jan 2022 10:43:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E0BC60D7B;
	Tue, 18 Jan 2022 10:43:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SN5csuqsnGhn; Tue, 18 Jan 2022 10:43:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D66A60D78;
	Tue, 18 Jan 2022 10:43:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 42F331BF28D
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 10:43:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3EBA260D78
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 10:43:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U8MDYbcGqMjP for <buildroot@lists.busybox.net>;
 Tue, 18 Jan 2022 10:43:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0642.aruba.it (smtpcmd0642.aruba.it [62.149.156.42])
 by smtp3.osuosl.org (Postfix) with ESMTP id B976A60D76
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 10:43:33 +0000 (UTC)
Received: from localhost.localdomain ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 9lxVneE6rX0z79lxWneNHv; Tue, 18 Jan 2022 11:43:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642502610; bh=Hg9OWpIfFCpSIkEFtDUh7Y5ajk/p4wnhBnmgQWpwwkw=;
 h=From:To:Subject:Date:MIME-Version;
 b=cnU8yVNXJgpT7fjBBwdVFFdZ4IdI/FXAEAFp9NShBIB7PjE/MqOeD7RrDxEqk28NX
 BmaA9UxxhkLGt0iYfeN40P7/C6Yweo94odVP53wTBmGfro09ZcYL6ToBLnC2dQq1pY
 DEQSWVuizBj4R+PF489Qr0fEVKLI5TPRHg51PdklZSTLhk8aqK36sQ7VlN6kxW+il4
 E4BfCbncAjgI5zZ2s6hVmRvbrnIWaK4YK3j3C2TQUkDrUy0LMaxXPRmEPTDkJkPa6L
 AQEXpY4O3pTCmU0tJNxM/7PGnEtSYpQwg9GiUGp1XiOd4U9hnLk2qpOREDJkQw/ZwZ
 2nPejet5S9oXQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 18 Jan 2022 11:42:56 +0100
Message-Id: <20220118104324.2081177-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfFyY8jydvl9hKplVdAItKsvzXMZAs8rTS3E7D8GtMlP4L+udb2XqNiO8hZafMcKVGhg+3kmB2EAmtc5wBgMw4AMU9VzT804bbIUF+fQSSaaIBi3JFYiw
 TriWoQ4Do7dC/WPM3ac5f2ar9dnZfE7350SxRrbb9/yvDPOSP3BczDuz5vEhlI6AQu0TcSxQrOfvQSLOTsQ5iYcPYHzW5vsDGSp7Je4x1PuRX3TAQcZfVUES
 +9fJzArmqDXKjUT5lpdu7pWvXL9tvX2Je+pBdyc387OQH6J6G+E0fn/jAP9VSm9Yi8mDzHNW8nhYhve+1QXB7fvJ7RCiMM2DMgp0GE3zrUm2Su95ffrzPIZT
 cU8MkMvno8daEyaVDqhUssp5CXqPXSxAmfjRijVVG6OyG4BPmPtvaAtqMeUQj+wW3YiB7vUwSIFmC67K+a8Z7ZvtJKm9nboS191KyLBPpXgLMgSMBzLOK646
 Yvb9tjJRSrowVFOTa5MeShgDCKnBVqaKgQdFw8wfWtl5DLoq63vsuqIMkfG9Re61WKkbsJuM6BC7rUxQ39SQO7ffhKk0EFbXjzAZBDRxj3AVr8lloWDHA9ra
 6TTFGpe51jfc3y0TYPAgVOUUmp1IyDQFaDkX7q8WtSuHT+VHOnm6Df+UIo2JtvcANTYGgKYVxt/2Tk4AnhOv9E0yKq0mnisnwO8Y0YFync9yWU2NxWZI7Rvq
 8GwmQETMuwr4VCDJjrAB2ZXhX+tkBIkPDN1Tm8fQkFtM1qPgg8OmnXR0QLHp44kdg6gLtZM+0BTwUUPB5eFK5Q9ZOj2hfhsq3QbpNVwO2UH1BmCK2lulQE0K
 lbJirbSobLkMr0O+rk6QF/8VGDynM0saZCD9OccMwVbpjJpJUB4+ISMesyTIyw==
Subject: [Buildroot] [PATCH 00/28] Use the best FPU strategies on 32-bits
 Arm Cortex
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

Hi All,

this patchset aims to enable the best FPU strategy for every board with
32-bits Arm Cortex actually present in Buildroot. I don't own these boards
so I can't test these changes. What is about Allwinner doesn't worry me
because I've tested a lot of cases with Olimex boards, but the other
changes are still to be tested.

So I ask to the board maintainers to test the patches that involve their
boards if possible. Anyway I've checked well all the SoCs Datasheet and I
think I've made it correctly, even if in some of them it's not specified
if VFPv4 means -D32. I assume it like that because otherwise -D16 is
usually specified.

Best regards
---
Giulio Benetti
Benetti Engineering sas

Giulio Benetti (28):
  configs/acmesystems_acqua_a5_256mb_defconfig: enable NEON/VFPV4 FPU
    strategy
  configs/acmesystems_acqua_a5_512mb_defconfig: enable NEON/VFPV4 FPU
    strategy
  configs/bananapi_m2_plus_defconfig: enable NEON/VFPV4 FPU strategy
  configs/bananapi_m2_plus_defconfig: enable NEON/VFPV4 FPU strategy
  configs/beagleboardx15_defconfig: enable NEON/VFPV4 FPU strategy
  configs/beagleboneai_defconfig: enable NEON/VFPV4 FPU strategy
  configs/chromebook_snow_defconfig: enable NEON/VFPV4 FPU strategy
  configs/chromebook_snow_defconfig: enable NEON/VFPV4 FPU strategy
  configs/friendlyarm_nanopi_m1_defconfig: enable NEON/VFPV4 FPU
    strategy
  configs/friendlyarm_nanopi_m1_plus_defconfig: enable NEON/VFPV4 FPU
    strategy
  configs/friendlyarm_nanopi_r1_defconfig: enable NEON/VFPV4 FPU
    strategy
  configs/friendlyarm_nanopi_r1_defconfig: enable NEON/VFPV4 FPU
    strategy
  configs/grinn_liteboard_defconfig: enable NEON/VFPV4 FPU strategy
  configs/licheepi_zero_defconfig: enable NEON/VFPV4 FPU strategy
  configs/microchip_sama5d27_wlsom1_ek_mmc_defconfig: enable NEON/VFPV4
    FPU strategy
  configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig: enable
    NEON/VFPV4 FPU strategy
  configs/microchip_sama5d2_icp_mmc_dev_defconfig: enable NEON/VFPV4 FPU
    strategy
  configs/microchip_sama5d2_icp_mmc_dev_defconfig: enable NEON/VFPV4 FPU
    strategy
  configs/orangepi_lite_defconfig: enable NEON/VFPV4 FPU strategy
  configs/orangepi_one_defconfig: enable NEON/VFPV4 FPU strategy
  configs/orangepi_pc_defconfig: enable NEON/VFPV4 FPU strategy
  configs/orangepi_pc_plus_defconfig: enable NEON/VFPV4 FPU strategy
  configs/orangepi_plus_defconfig: enable NEON/VFPV4 FPU strategy
  configs/orangepi_r1_defconfig: enable NEON/VFPV4 FPU strategy
  configs/orangepi_zero_defconfig: enable NEON/VFPV4 FPU strategy
  configs/stm32mp157a_dk1_defconfig: enable NEON/VFPV4 FPU strategy
  configs/stm32mp157c_dk2_defconfig: enable NEON/VFPV4 FPU strategy
  configs/stm32mp157c_odyssey_defconfig: enable NEON/VFPV4 FPU strategy

 configs/acmesystems_acqua_a5_256mb_defconfig           | 1 +
 configs/acmesystems_acqua_a5_512mb_defconfig           | 1 +
 configs/bananapi_m2_plus_defconfig                     | 1 +
 configs/bananapi_m2_ultra_defconfig                    | 1 +
 configs/beagleboardx15_defconfig                       | 1 +
 configs/beagleboneai_defconfig                         | 1 +
 configs/chromebook_snow_defconfig                      | 1 +
 configs/freescale_imx7dsabresd_defconfig               | 1 +
 configs/friendlyarm_nanopi_m1_defconfig                | 2 +-
 configs/friendlyarm_nanopi_m1_plus_defconfig           | 2 +-
 configs/friendlyarm_nanopi_neo_defconfig               | 2 +-
 configs/friendlyarm_nanopi_r1_defconfig                | 2 +-
 configs/grinn_liteboard_defconfig                      | 1 +
 configs/licheepi_zero_defconfig                        | 2 +-
 configs/microchip_sama5d27_wlsom1_ek_mmc_defconfig     | 1 +
 configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig | 1 +
 configs/microchip_sama5d2_icp_mmc_defconfig            | 1 +
 configs/microchip_sama5d2_icp_mmc_dev_defconfig        | 1 +
 configs/orangepi_lite_defconfig                        | 2 +-
 configs/orangepi_one_defconfig                         | 2 +-
 configs/orangepi_pc_defconfig                          | 2 +-
 configs/orangepi_pc_plus_defconfig                     | 2 +-
 configs/orangepi_plus_defconfig                        | 2 +-
 configs/orangepi_r1_defconfig                          | 2 +-
 configs/orangepi_zero_defconfig                        | 2 +-
 configs/stm32mp157a_dk1_defconfig                      | 1 +
 configs/stm32mp157c_dk2_defconfig                      | 1 +
 configs/stm32mp157c_odyssey_defconfig                  | 1 +
 28 files changed, 28 insertions(+), 12 deletions(-)

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
