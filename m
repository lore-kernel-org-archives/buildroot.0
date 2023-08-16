Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D34C001E0
	for <buildroot@archiver.kernel.org>; Wed, 16 Aug 2023 09:25:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B7C3041594;
	Wed, 16 Aug 2023 09:25:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7C3041594
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kReCG2q7MdAj; Wed, 16 Aug 2023 09:25:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 18CF1415A1;
	Wed, 16 Aug 2023 09:25:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18CF1415A1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3CB971BF310
 for <buildroot@lists.busybox.net>; Wed, 16 Aug 2023 09:24:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B8B982310
 for <buildroot@lists.busybox.net>; Wed, 16 Aug 2023 09:24:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B8B982310
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UpcLVLgOraOw for <buildroot@lists.busybox.net>;
 Wed, 16 Aug 2023 09:24:36 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8DD8282141
 for <buildroot@buildroot.org>; Wed, 16 Aug 2023 09:24:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DD8282141
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; d="scan'208";a="230013214"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 16 Aug 2023 02:24:30 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 16 Aug 2023 02:24:30 -0700
Received: from jamie-dev.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Wed, 16 Aug 2023 02:24:28 -0700
To: <buildroot@buildroot.org>
Date: Wed, 16 Aug 2023 10:24:37 +0100
Message-ID: <20230816092439.570839-2-jamie.gibbons@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230816092439.570839-1-jamie.gibbons@microchip.com>
References: <20230816092439.570839-1-jamie.gibbons@microchip.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1692177876; x=1723713876;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3cuZLXP7WpTczML/Io8CPXiHhGNyL1OqaBFEKaB9x4U=;
 b=2YTMxHFCgKJ/Tx0h9yuLkAiJEjqFE755EZf1Bjkhguek8hZd2YOKGz5E
 7qILtIfG6CekQj7Y8i30ZvtTzeNU4mIG0U23g0cAoszhbv8/gjHH5M5qH
 9EWLm3UHE+J/4g3afbogm7T+pQorclXH7go3bcJN8f1p/8PyqW/qB0MZ6
 DN/ErWs/51f0tYBhrHqNZK6cslVhzooKV4Lioa496nRxr8CArUqrWTC9O
 yHKqJOQMzOk3JPqivMNfPVARWFGhJc5gqtNSwexIEI2sT6KdrqWMfE9RR
 PLH7wSUSdM9RiAawvfNXxkdCcRBUfK0wEBRswK8JT92hrKVbX8BGO7RgY
 g==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=2YTMxHFC
Subject: [Buildroot] [PATCH v2 1/3] arch/Config.in.riscv: update instruction
 set ext
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

Allow a RISC-V G core to support C and V. Copy custom RVC and RVV
instructions from RISC-V custom core to RISC-V general core.

v1 -> v2 changes:
- copied RVC and RVV kconfigs to both riscv_g and riscv_custom

Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
---
 arch/Config.in.riscv | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/Config.in.riscv b/arch/Config.in.riscv
index 3dfbb4165f..48c3236fb6 100644
--- a/arch/Config.in.riscv
+++ b/arch/Config.in.riscv
@@ -35,6 +35,21 @@ config BR2_riscv_g
 	help
 	  General purpose (G) is equivalent to IMAFD.
 
+if BR2_riscv_g
+
+comment "Instruction Set Extensions"
+
+config BR2_RISCV_ISA_CUSTOM_RVC
+	bool "Compressed Instructions (C)"
+	select BR2_RISCV_ISA_RVC
+
+config BR2_RISCV_ISA_CUSTOM_RVV
+	bool "Vector Instructions (V)"
+	select BR2_RISCV_ISA_RVV
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_12
+
+endif
+
 config BR2_riscv_custom
 	bool "Custom architecture"
 	select BR2_RISCV_ISA_RVI
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
