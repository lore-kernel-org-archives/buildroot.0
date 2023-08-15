Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E13C0015E
	for <buildroot@archiver.kernel.org>; Tue, 15 Aug 2023 10:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4087340BE9;
	Tue, 15 Aug 2023 10:05:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4087340BE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vI1gOJ1rkaOl; Tue, 15 Aug 2023 10:05:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 850BA40B08;
	Tue, 15 Aug 2023 10:05:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 850BA40B08
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 725C11BF2C0
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 10:05:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B17A40BDE
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 10:05:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B17A40BDE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5HOW27-ZRUUz for <buildroot@lists.busybox.net>;
 Tue, 15 Aug 2023 10:05:51 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2EC5E400E7
 for <buildroot@buildroot.org>; Tue, 15 Aug 2023 10:05:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2EC5E400E7
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; d="scan'208";a="229000192"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 15 Aug 2023 03:05:50 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 15 Aug 2023 03:05:49 -0700
Received: from jamie-dev.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Tue, 15 Aug 2023 03:05:48 -0700
To: <buildroot@buildroot.org>
Date: Tue, 15 Aug 2023 11:05:57 +0100
Message-ID: <20230815100600.297932-1-jamie.gibbons@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1692093950; x=1723629950;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0/VlsjqtP+F3LYmAR6LEN03Det30He0owrIYIOjQBf0=;
 b=qTMy+2eqXeIbEveNRJnpk/prE8X2BgF+bF8W0MAAF0uL5T8jRxrKtTdW
 6w+axGWOadSYjrTaH0/IIuR5rmbpCaGuocutyl9hU14PH2QR3mzztsJGc
 J/zw8GR/vnJEvS6wwI2s6kWL0VlKDHCDeqv5hwycEb+BdgBVQ80hpmHGH
 2wbgg7m3zFiWhxFh8ERvZ/3kznf+bwtLFQcjEIvW3KKcUfBh0dm1q5lAg
 816P2VpWHsRNq/0S/5HfNi+O8La/XvAlDQ4UMYFeCdM7aT2OOcGVtD7gN
 SME5Ug/1VD1PbflXRQK7+8urGPXaOwyM+KpdZsUCzCl7gWgdyYla2d6ck
 Q==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=qTMy+2eq
Subject: [Buildroot] [PATCH 0/3] Update RISC-V Instruction Sets
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
part of a general purpose selection and keeping other configurations as
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

Jamie Gibbons (3):
  arch/Config.in.riscv: update instruction set ext
  configs/microchip_mpfs_icicle_defconfig: update instruction sets
  board/microchip/mpfs_icicle: update post-image script

 arch/Config.in.riscv                      | 24 ++++++++++++++---------
 board/microchip/mpfs_icicle/post-image.sh |  6 ++++--
 configs/microchip_mpfs_icicle_defconfig   |  5 +----
 3 files changed, 20 insertions(+), 15 deletions(-)

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
