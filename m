Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93347EE4996
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 11:30:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D33381E7D;
	Mon, 21 Aug 2023 11:30:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D33381E7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B1OXKZoYMtB3; Mon, 21 Aug 2023 11:30:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 910AB8191E;
	Mon, 21 Aug 2023 11:30:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 910AB8191E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 100381BF361
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 11:30:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EAB5181948
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 11:30:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAB5181948
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 80hBDSfj20UW for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 11:30:24 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1C9978149A
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 11:30:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C9978149A
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; d="scan'208";a="230871621"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 21 Aug 2023 04:30:23 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 21 Aug 2023 04:30:23 -0700
Received: from jamie-dev.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Mon, 21 Aug 2023 04:30:21 -0700
To: <buildroot@buildroot.org>
Date: Mon, 21 Aug 2023 12:30:32 +0100
Message-ID: <20230821113034.2749571-1-jamie.gibbons@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1692617424; x=1724153424;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AKx3GSKQjaonMbxd19pw3LS7jcNLhME3i40IVDcyO+0=;
 b=U5+et8cRPMx5kjwNmXhvIvOO8Mz2PPdGiRdYM/Lp8vW5wWyDd6/32IA3
 sNEnkSdWHluCKAMno2zmgCcUo+8X+jdE1PEeSTPptNcly7eTkajRSlSvy
 /E5ySTPqEBEL/zVb+yaprmKH5/gAHLYRGJU5bM1ODaHEg++BLQYoyibAe
 9xXNWaey33j7hKgOUB+pv6R9NkkkG3XIUZCXPOPzwb3pH5j/KTvi8WYQU
 NnZa1ePEwAbZIqFsyhOOsXfutk6CV58JT5FbQwePREDkcKCmm2DEwm/C8
 yeKeL+K7ywCoOQZ7udWTHfMQNXKpHGe3/TMAdB23qHkogpBpBzPJs+RVl
 Q==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=U5+et8cR
Subject: [Buildroot] [PATCH 0/2] Fixes for Microchip MPFS Icicle
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
From: Jamie Gibbons via buildroot <buildroot@buildroot.org>
Reply-To: Jamie Gibbons <jamie.gibbons@microchip.com>
Cc: Conor Dooley <Conor.Dooley@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Valentina Fernandez Alanis <Valentina.FernandezAlanis@microchip.com>, Jamie
 Gibbons <jamie.gibbons@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

This patch series updates the microchip_mpfs_icicle_defconfig due to the
latest update to the RISC-V instruction sets, renaming the RVC kconfig.
Secondly, I have included a fix to the post-image script to allow an
sdcard.img to be built for the Microchip MPFS Icicle kit. When merging,
some changes were made that broke this. The hss-payload-generator tool
looks for the u-boot.bin image in the directory this command is run
from. This binary file is located in the output images directory. All
changes to this script were made to try to ensure optimise paths and
methods while achieving a working solution. Thanks to Yann for suggestions
for optimisation.
This patch set is indended to be applied to the next branch as that is
where the Microchip Icicle kit patch series has previously been applied.

Looking forward to your feedback.

Regards,
Jamie.

Jamie Gibbons (2):
  board/microchip/mpfs_icicle: update post-image script
  configs/microchip_mpfs_icicle_defconfig: update RVC config option

 board/microchip/mpfs_icicle/post-image.sh | 19 ++++++++++++-------
 configs/microchip_mpfs_icicle_defconfig   |  2 +-
 2 files changed, 13 insertions(+), 8 deletions(-)

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
