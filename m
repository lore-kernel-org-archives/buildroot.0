Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD888C433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 11:26:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 811F44034A;
	Sun,  6 Feb 2022 11:26:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id snUiX2syTag4; Sun,  6 Feb 2022 11:26:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3B3040345;
	Sun,  6 Feb 2022 11:26:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 26CE81BF5F8
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 11:26:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 23514814AB
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 11:26:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tHa33S8LumBr for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 11:26:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0642.aruba.it (smtpcmd0642.aruba.it [62.149.156.42])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61FC181491
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 11:26:26 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id GfgVnJtALX0z7GfgVnKneL; Sun, 06 Feb 2022 12:26:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644146784; bh=26xtAAz6wbXrmkBklJo2Q+Pbi9Zif3UIP9+MX6hDSaI=;
 h=From:To:Subject:Date:MIME-Version;
 b=hdwG5B8FFwdjaVRBaV+3TbD8HD9T9OiO2Ze8249PI2CVhbijw2P11eM0PZTa6jagr
 tF3bboqXAZzyO0NRGtRFmbswKAnefW3Vx04f72ZMoG6LFPnflFg88+viz6zU+IZqAy
 UOw+n/5aNslmYdmUXhU4aRb98HoT9TE2Kct5V9KpR8u1ks+z7OX1aw5yL7MFM/VDRA
 AQ5Wps5RvReiKH/ZDLcO5xUyLe0zWCslLLQGos9fJRlx/ICcLt3bF3Hfb0/lTQQ3OI
 neNsxwdV17O5RNozORo5bdWmHdJphOuhoQ4P8Ire1PtJvlTrIthGcELX6mHeSfJb7s
 3LDdWut2MkFLg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  6 Feb 2022 12:26:18 +0100
Message-Id: <20220206112620.1637342-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220206115156.6042cc1b@windsurf>
References: <20220206115156.6042cc1b@windsurf>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfGDc2pGoCgkAkq/xcou+GZ6NrsarKugaWETG8vu22rbzqFPqtsm6tzK2snZ3b5mnzfXTofvCIKvJon6vKDYBXvQi9m4fJU5X3+JO3xsg5ZPey7Rg8xS6
 SNFRNKAOult5FRfJqNYqWrfBgFLixWLEDgASN0SntDgmxxA2RPPuhP5BWjmOG/O/NJcqUVHHwzuwz5Wzmw8yaCw2Ms+7J4+S+j/b/iKl1pjfhQiB5uPrRRsJ
 Cn51PyHMO3ZZR6is7KJuSqnZE1meU78grat3/ME8ooqLQ6ple/c2Jq2lnE/3aSwyDL1Bffuwgiq2dBIkNgf+h8SghySsgSylsy5OSHKBRhgl+ofPkFgdmEw+
 F9JzOzlspxJ5T23t7Oe8zMSVa4kw39fudWcpoPyEbVFhDWND6t0=
Subject: [Buildroot] [PATCH v3 0/2] Fix gitlab CI build failure due to
 missing HOST_ dependencies
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
Cc: Eugen Hristev <eugen.hristev@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patchset fixes the gitlab build failure due to HOST_ dependencies(uboot/linux).

V1->V2:
* add missing host openssl for linux on microchip_sama7g5ek_mmc_defconfig/_dev_defconfig
V2->V3:
* add specific custom linux version as suggested by Thomas

Giulio Benetti (2):
  configs/microchip_sama7g5ek_mmc_defconfig: set custom linux version to
    5.15.21 and add host openssl for linux
  configs/microchip_sama7g5ek_mmc_dev_defconfig: set custom linux
    version to 5.15.21 and add host openssl for linux

 configs/microchip_sama7g5ek_mmc_defconfig     | 4 ++++
 configs/microchip_sama7g5ek_mmc_dev_defconfig | 4 ++++
 2 files changed, 8 insertions(+)

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
