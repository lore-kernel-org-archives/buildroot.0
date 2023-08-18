Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F506C05052
	for <buildroot@archiver.kernel.org>; Fri, 18 Aug 2023 10:43:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0E0D8405C;
	Fri, 18 Aug 2023 10:43:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0E0D8405C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ugLQTMsN_c5a; Fri, 18 Aug 2023 10:43:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31ABA84061;
	Fri, 18 Aug 2023 10:43:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31ABA84061
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8AC9E1BF364
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 10:42:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E7F961122
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 10:42:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E7F961122
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mBUGGcv2jxON for <buildroot@lists.busybox.net>;
 Fri, 18 Aug 2023 10:42:53 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1F3B861095
 for <buildroot@buildroot.org>; Fri, 18 Aug 2023 10:42:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F3B861095
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="76387"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 18 Aug 2023 03:42:51 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 18 Aug 2023 03:42:50 -0700
Received: from jamie-dev.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Fri, 18 Aug 2023 03:42:49 -0700
To: <buildroot@buildroot.org>
Date: Fri, 18 Aug 2023 11:42:58 +0100
Message-ID: <20230818104301.403429-1-jamie.gibbons@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1692355372; x=1723891372;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aJeYX8s1iMc9BCwuAS18vKdK6WqV1fBImUHR7DUKdSY=;
 b=AGUvSEOBx7Ty3Z/cH3o8tLWSWxOueMtwBJYS1O+KUPizf2nNkGqUA+5f
 KsS4GAl6tRS+y0b15vcFC6hIBsXk9uKVAB0Pw2UtFJvpUuBMngUIktr7q
 yJAIQcLLw4Qc75qGdzowvNn6Xg4ok5OQBXJTrCy4BfSDLo8ZWVNi3sXpI
 T5eDvxACbJwBM9GvDUNETX9KyToMMvFBoPLVCZUstuFB570PMWel7GKOA
 gcazDUJPRdlMyizrrUzJBpDKWFEDOiv5ZFaOo5ro9nhleBS6PhHGTSWwk
 WIq/7Q0zVREvmoI1Hn+HwhxhLbQIF0NwcLFQT1uJTQSuaUPAQ/BIQZEap
 g==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=AGUvSEOB
Subject: [Buildroot] [PATCH v3 0/3] Update RISC-V Instruction Sets
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

As per an earlier discussion with Thomas Petazzoni, we have decided that
it best to update the RISC-V instruction sets. This patch series updates
the kconfig to allow C and V to be selected as part of the general
purpose instruction set, thus allowing IMAFD + C and IMAFD + V to be a
part of a general purpose selection and keeping configurations as
custom.
With this I have updated the microchip_mpfs_icicle_defconfig to make use
of these changes.
Finally, I have included a fix to the post-image script to allow an
sdcard.img to be built for the Microchip MPFS Icicle kit. When merging,
some changes were made that broke this. The hss-payload-generator tool
looks for the u-boot.bin image in the directory this command is run
from. This binary file is located in the output images directory. All
changes to this script were made to try to ensure optimise paths and
methods while achieving a working solution.
This patch set is indended to be applied to the next branch as that is
where the Microchip Icicle kit patch series has previously been applied.

Looking forward to your feedback.

Regards,
Jamie.

v1 -> v2 changes:
- copied RVC and RVV kconfigs to both riscv_g and riscv_custom

v2 -> v3 changes:
- removed duplicate menu options

Jamie Gibbons (3):
  arch/Config.in.riscv: update instruction set ext
  configs/microchip_mpfs_icicle_defconfig: update instruction sets
  board/microchip/mpfs_icicle: update post-image script

 arch/Config.in.riscv                      | 8 ++++----
 board/microchip/mpfs_icicle/post-image.sh | 6 ++++--
 configs/microchip_mpfs_icicle_defconfig   | 5 +----
 3 files changed, 9 insertions(+), 10 deletions(-)

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
