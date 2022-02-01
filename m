Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 289BFC433F5
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 23:04:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B5EE4404BB;
	Tue,  1 Feb 2022 23:04:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5SRHG8ZYWHUU; Tue,  1 Feb 2022 23:04:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A8BEB404ED;
	Tue,  1 Feb 2022 23:04:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E6D281BF3BE
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 23:04:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA9E2404ED
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 23:04:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hUyIE-As88Oo for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 23:04:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-sp1.aruba.it (smtpcmd01-sp1.aruba.it [62.149.158.218])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7CC89400CC
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 23:04:17 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id F2C7n0nERroAhF2C7nakQW; Wed, 02 Feb 2022 00:04:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643756655; bh=gZuea64yRAlKWBdLU8iHghKUvz79l9LqXlgYn84u4xc=;
 h=From:To:Subject:Date:MIME-Version;
 b=X6ISjB4At4QCEIXdbPjkygiZ5y/AlHKhBmZFdwR2zwBByHkycGfs4Nqy+APskQvST
 yk9Uaxc9i/jHb9JzDlZAAZMsX9tnWmUbOK5q/eOBSkROcB6k0u8eMKkCFfXpjhus4L
 xgAthN+P5DwxWtoRihIjwPjpmqkYdmFvn9zUddhtpGXpY1IYppM3ZR11r2AcDL5bk1
 4ermydp9ivLG2cAau+Dnkn7xxJzv1pjaHEu2EujOyTt1OPmu3XV83YvsGUJL4JZsYV
 mkDxmKPoH4Q3+Fq2506Aes71VfjxFqCb5a+rLUv9/evTOwVzLpd6k5VC1xyL4DKAOZ
 UARhKlvajFF2A==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed,  2 Feb 2022 00:04:08 +0100
Message-Id: <20220201230414.4144930-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfES/iIUDlDPmCtcSdr171gYpahfcnfBmYiyXINelPSyR70t5Q9ZBaBqw6ItrAJ5WmUKQaSVCFtw/48Ma7rmRT1Ylaot5p52mFHxfkufxo0Fosfu4YZNG
 Zpweb2NTluR/LA7mLCP5L/o/lDS5AwGtSfh8YPg7N0N8L6Mfrr94jl0W9SW6iQz0E/vzi8mPS4LlwI8BYrwKH2c+X2My6Ecn4g2rNGtqr8fGosPpqnCdNdmu
 omVOB6ggFIeDgw140Z7/hgqkxLmbSJW4LOeKmoKyR/dbkCREibElQR4iwHxhfrTBEBEoGFssioXPlwReZT3Mo6I/OnwjZ/QHRr6e8wbCqvW336urBZltysQF
 wR/ur70/gm4we+8vtIrajAJju6IwXXTAmEZuk2YZbFckqQ9yTmGdhXepZv3b+nyHtrJIgPdp+gayG3tsxh85pKqfvrnw1A==
Subject: [Buildroot] [PATCH v2 0/6] Fix gitlab CI build failure due to
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
 Lothar Felten <lothar.felten@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patchset fixes the gitlab build failure due to HOST_ dependencies(uboot/linux).

V1->V2:
* add missing host openssl for linux on microchip_sama7g5ek_mmc_defconfig/_dev_defconfig

Giulio Benetti (6):
  configs/bananapi_m2_ultra_defconfig: u-boot needs host python3 and
    host openssl
  configs/beaglev_defconfig: linux needs host openssl
  configs/microchip_sama5d2_icp_mmc_defconfig: linux needs host openssl
  configs/microchip_sama5d2_icp_mmc_dev_defconfig: linux needs host
    openssl
  configs/microchip_sama7g5ek_mmc_defconfig: add missing
    BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15 and host openssl for
    linux
  configs/microchip_sama7g5ek_mmc_dev_defconfig: add missing
    BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15 and host openssl for
    linux

 configs/bananapi_m2_ultra_defconfig             | 2 ++
 configs/beaglev_defconfig                       | 1 +
 configs/microchip_sama5d2_icp_mmc_defconfig     | 1 +
 configs/microchip_sama5d2_icp_mmc_dev_defconfig | 1 +
 configs/microchip_sama7g5ek_mmc_defconfig       | 2 ++
 configs/microchip_sama7g5ek_mmc_dev_defconfig   | 2 ++
 6 files changed, 9 insertions(+)

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
