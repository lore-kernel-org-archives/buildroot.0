Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E4DC001B0
	for <buildroot@archiver.kernel.org>; Wed, 16 Aug 2023 09:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F83841598;
	Wed, 16 Aug 2023 09:25:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F83841598
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ExHftD6kygyQ; Wed, 16 Aug 2023 09:25:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B17F41595;
	Wed, 16 Aug 2023 09:25:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B17F41595
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3FD7A1BF310
 for <buildroot@lists.busybox.net>; Wed, 16 Aug 2023 09:24:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2443A82141
 for <buildroot@lists.busybox.net>; Wed, 16 Aug 2023 09:24:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2443A82141
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Er7D4cdj5DfE for <buildroot@lists.busybox.net>;
 Wed, 16 Aug 2023 09:24:37 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E9D4982157
 for <buildroot@buildroot.org>; Wed, 16 Aug 2023 09:24:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9D4982157
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; d="scan'208";a="230013215"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 16 Aug 2023 02:24:30 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 16 Aug 2023 02:24:28 -0700
Received: from jamie-dev.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Wed, 16 Aug 2023 02:24:26 -0700
To: <buildroot@buildroot.org>
Date: Wed, 16 Aug 2023 10:24:36 +0100
Message-ID: <20230816092439.570839-1-jamie.gibbons@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1692177876; x=1723713876;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=L3WS0g2IMpxRWkDqxwvin4/nO/wIbMDO+oUzk2JvjV0=;
 b=gcSJUkRya5an8iyn3y+YEkrkmL4LmBk0EcJQX1UmEozjm2QbWQdOaF4N
 ij21Y//tLDIvtqMOgW45M77mt0nl97Er2kR0GBvdkpKxIfZ+cgi6pb0at
 +VkWoULXh1MR6VLboyfsotks96Vny4T3ukNGK7Jn/f/hZIIjAH4/LG0fy
 9AlXhtypOGR0LukiEfIdwlyOlJTXognZU+Elf15ZZqkPYqgYnwcOi2Efo
 iawjCbitJkngPpa8W5lAyRnhUsap3w04IBE5kpchWd0hfC+M4nDrzTkQ+
 IRiTxD/pzQzvIh4H2qjm+HTaf9uVZBBXG08kWSIXl/uGaIOrp6CWhOlJn
 A==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=gcSJUkRy
Subject: [Buildroot] [PATCH v2 0/3] Update RISC-V Instruction Sets
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

Jamie Gibbons (3):
  arch/Config.in.riscv: update instruction set ext
  configs/microchip_mpfs_icicle_defconfig: update instruction sets
  board/microchip/mpfs_icicle: update post-image script

 arch/Config.in.riscv                      | 15 +++++++++++++++
 board/microchip/mpfs_icicle/post-image.sh |  6 ++++--
 configs/microchip_mpfs_icicle_defconfig   |  5 +----
 3 files changed, 20 insertions(+), 6 deletions(-)

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
