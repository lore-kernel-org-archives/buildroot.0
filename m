Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF5EC001DE
	for <buildroot@archiver.kernel.org>; Fri, 18 Aug 2023 10:43:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6143B811F6;
	Fri, 18 Aug 2023 10:43:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6143B811F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DWe9-zWbr4sy; Fri, 18 Aug 2023 10:43:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A902780EE8;
	Fri, 18 Aug 2023 10:43:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A902780EE8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 071241BF364
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 10:43:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D577C61095
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 10:43:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D577C61095
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6pfrdex3o9Ki for <buildroot@lists.busybox.net>;
 Fri, 18 Aug 2023 10:43:30 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 31BF46068A
 for <buildroot@buildroot.org>; Fri, 18 Aug 2023 10:43:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31BF46068A
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="70809"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 18 Aug 2023 03:43:29 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 18 Aug 2023 03:42:54 -0700
Received: from jamie-dev.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Fri, 18 Aug 2023 03:42:52 -0700
To: <buildroot@buildroot.org>
Date: Fri, 18 Aug 2023 11:43:00 +0100
Message-ID: <20230818104301.403429-3-jamie.gibbons@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230818104301.403429-1-jamie.gibbons@microchip.com>
References: <20230818104301.403429-1-jamie.gibbons@microchip.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1692355410; x=1723891410;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=si+BswY1GzWL8jmTgezy1MCOOM+mJKj6EgdRuOu8p8Q=;
 b=hQr/DIY39JweuM7W9UCmNbfIqq/0/53bM6Ivxcnm8HF3/FnVJqL38T69
 zI9BpbCEOotbXtu7vWtow4BTylo0RSndNGsyu9r6qGa/3ZIjBgTsbKbDc
 QN7l9KHERj8md7VkBTVFmcajoDl94S/P8cIjzdauPuS8QUcFxCCBk3GG5
 Ov9DItcL9h47mv+5oL/N5XQIbYKepdi9itdv1yMbqBdvQf36wBEOTr4so
 VE9Yu7Jq8xC9PddXC/TUGq4mcPPGQiETNA1pnaUadYpBeMLbzVs4iJ0JX
 dAPFmmup7IbsE2+mFVwp1q1E6ZbbEZjobv0Ui/KYmDmZOVjuLY1P8LZT4
 Q==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=hQr/DIY3
Subject: [Buildroot] [PATCH v3 2/3] configs/microchip_mpfs_icicle_defconfig:
 update instruction sets
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

Update the instruction sets for MPFS icicle kit to mirror the
configuration update, i.e. It is now classed as a RISC-V G core with
support for C, IMAFDC.

Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
---
 configs/microchip_mpfs_icicle_defconfig | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/configs/microchip_mpfs_icicle_defconfig b/configs/microchip_mpfs_icicle_defconfig
index b2568cae6a..a3b3093982 100644
--- a/configs/microchip_mpfs_icicle_defconfig
+++ b/configs/microchip_mpfs_icicle_defconfig
@@ -1,8 +1,5 @@
 BR2_riscv=y
-BR2_riscv_custom=y
-BR2_RISCV_ISA_CUSTOM_RVM=y
-BR2_RISCV_ISA_CUSTOM_RVF=y
-BR2_RISCV_ISA_CUSTOM_RVD=y
+BR2_riscv_g=y
 BR2_RISCV_ISA_CUSTOM_RVC=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 BR2_TARGET_GENERIC_HOSTNAME="mpfs_icicle"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
