Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A75FDC433EF
	for <buildroot@archiver.kernel.org>; Tue, 18 Jan 2022 10:44:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2120F60D78;
	Tue, 18 Jan 2022 10:44:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YcboyWkgvjxl; Tue, 18 Jan 2022 10:44:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6163460D80;
	Tue, 18 Jan 2022 10:43:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9ADF21BF28D
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 10:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 94DB6405EC
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 10:43:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B7Y0YM45vhi5 for <buildroot@lists.busybox.net>;
 Tue, 18 Jan 2022 10:43:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd10102.aruba.it (smtpcmd10102.aruba.it [62.149.156.102])
 by smtp2.osuosl.org (Postfix) with ESMTP id 29FF9400C6
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 10:43:55 +0000 (UTC)
Received: from localhost.localdomain ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 9lxknDlmTDzPJ9lxmna3NC; Tue, 18 Jan 2022 11:43:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642502634; bh=Hg9OWpIfFCpSIkEFtDUh7Y5ajk/p4wnhBnmgQWpwwkw=;
 h=From:To:Subject:Date:MIME-Version;
 b=LTEYYKyqszaMCDPIQ27X9f4bAqnTeGNczKP1WarJWQJLEvVrRg4Ws2nvp2vR/az+6
 CmVd53IKEiTVREMHmJS2K1JN7IK/tO0KoO4ZNMLZvsJ2s3tViS8Nsg6Tvr/MtvnCPU
 OaqiqNp5ZCdEi5qMIvtriUA70IJxn5GS0VvkM+8kmy510foP+qrgE8vV9T1GQPFTtl
 Ct0Sf81GpQeEy8B/H7toxcAMaHiemqZn4xKFa7pqeV/QnnaVfEI6vdd1UmJ+MlNHRV
 XpUxtoQvL2ZgCJqZbVi1e/v7GO5Za71IHJmlIiAX7Mt1r1xx0ZnhuY1uyR8I96iG1a
 F9vikh6haq2gQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 18 Jan 2022 11:43:10 +0100
Message-Id: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfCDzQHPNaIltGl0rq50eEPgRfGBIvu+QGMabeDoODOsi+MOs85zZDyzHV1I3pGYU9PFFfT8jjyhKciPyrFSmjc9CcTnFRfobw4x0Mq+MxccCvL2uV+rz
 irrnzLV1YHa5vV88a8iJyexJkaeGLYHWUKSEJRgSgYgEjtiOFoWNculICby/2E7A9dW+V8RGiDJCnzRa7DryodTVA2TruaKOmbGu1B444YAc5K+BIX7R+7dy
 iruDdZs5qml9C0mlBYrjUIepcTCV1+IEKazOPA+LsEHnIk8q7QTRTmp/XE6QVqRFoDUYAw33oH6ry9DFpCk27XMxM4gyiFaBaZdlT0vVXW8n7BigbBP83jqP
 fIQQJOnX3iRRGjEoIko/yFRioAachT0MUVdELa1nklXhkeZrz5ykVGz3zeo6zdBCfy/O+8jPTxfFIsiddu3noPrfVUHjEawqk9vfF/fO4TwWJO0WvkDoSUxQ
 FUDq6yrD5Gr4vJLPG3HcG2tl5hxAyQQiPjWkXxLigdbTnQSo70fEPK7iwyt0N+sVqeaaBoTl464SDXD+MpwmRzjBeko1rI/Jsj5PphrpUnYhZGf0PJSiVn+H
 1bzLCOVDiKxzmXDKE5lUUojo5JlggzpQFLGYyFxSYAjzqA7QXt4DbVd1r/cWVn767M2oHR8+qVtE0fo+S0V27cX1fJxJ5tdbAG/BnnRj2k5+F9WxFbmGZR3t
 49EJkh8dYBZWaSVj9FN+4AKmZEIYSUwxbJgLbVK+4NbeSSfg01BwARMNy4fIiJtq9URdtgi/WoYgfUxPqDnRtDXVW1SyfFIpju4Tu0c+hT/wlgJMfdzA5bSD
 pSepx6ksdTA9uXFSHxppt0B7vqRX0Y0h3zHsrEov3hOr9pwSIvvBM1224PGFvA==
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
