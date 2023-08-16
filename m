Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7DC2C001B0
	for <buildroot@archiver.kernel.org>; Wed, 16 Aug 2023 09:24:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 155A84014B;
	Wed, 16 Aug 2023 09:24:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 155A84014B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T7Cy41e9t4-3; Wed, 16 Aug 2023 09:24:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6142340A16;
	Wed, 16 Aug 2023 09:24:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6142340A16
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 44E551BF310
 for <buildroot@lists.busybox.net>; Wed, 16 Aug 2023 09:24:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B2F482333
 for <buildroot@lists.busybox.net>; Wed, 16 Aug 2023 09:24:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B2F482333
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OshoH62K-q-k for <buildroot@lists.busybox.net>;
 Wed, 16 Aug 2023 09:24:37 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4141782310
 for <buildroot@buildroot.org>; Wed, 16 Aug 2023 09:24:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4141782310
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; d="scan'208";a="230013239"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 16 Aug 2023 02:24:32 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 16 Aug 2023 02:24:31 -0700
Received: from jamie-dev.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Wed, 16 Aug 2023 02:24:30 -0700
To: <buildroot@buildroot.org>
Date: Wed, 16 Aug 2023 10:24:38 +0100
Message-ID: <20230816092439.570839-3-jamie.gibbons@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230816092439.570839-1-jamie.gibbons@microchip.com>
References: <20230816092439.570839-1-jamie.gibbons@microchip.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1692177877; x=1723713877;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=si+BswY1GzWL8jmTgezy1MCOOM+mJKj6EgdRuOu8p8Q=;
 b=RyIp06omGYWZcGSBo1I0f/omNhRM0nzdaa22DE8ZEMNgEEEPwEZPbzDt
 uQAXHjfR1ubq1CNj2nB/2ColdfxUrfsFDM1MbMUXcwS5XH4Vzyc5n/Ugl
 zVu07zDKjEktMXWdxl0BTRIJkh+u45wixXS0Z2HcujekZLdL5b4zDfpA+
 qQQP4Fn7MImY4AwAiAZeDGJRn9g+Wh7OJPlNugDTB+wPbUk8K53a4IA1A
 AEkhb3TNEptlMjIivIHPo8frLgA2wbVbGVwa2y4NFBhViK9Y9+otWBTRi
 HHYfFIqeZHHGTN1vpYV6t8OY2Gyo24rne6ieJi70T2JwVV4NI241fCWk0
 g==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=RyIp06om
Subject: [Buildroot] [PATCH v2 2/3] configs/microchip_mpfs_icicle_defconfig:
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
