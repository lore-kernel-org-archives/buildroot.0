Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 037D2C001E0
	for <buildroot@archiver.kernel.org>; Tue, 15 Aug 2023 10:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A9B5A40B08;
	Tue, 15 Aug 2023 10:06:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9B5A40B08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hLqJ3QDB6CTz; Tue, 15 Aug 2023 10:06:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E019840BEE;
	Tue, 15 Aug 2023 10:06:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E019840BEE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6F18E1BF2C0
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 10:05:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4680581ECC
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 10:05:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4680581ECC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EWOSAJxjQpsX for <buildroot@lists.busybox.net>;
 Tue, 15 Aug 2023 10:05:52 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AA84781EC8
 for <buildroot@buildroot.org>; Tue, 15 Aug 2023 10:05:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA84781EC8
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; d="scan'208";a="241676372"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 15 Aug 2023 03:05:51 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 15 Aug 2023 03:05:51 -0700
Received: from jamie-dev.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Tue, 15 Aug 2023 03:05:50 -0700
To: <buildroot@buildroot.org>
Date: Tue, 15 Aug 2023 11:05:58 +0100
Message-ID: <20230815100600.297932-2-jamie.gibbons@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230815100600.297932-1-jamie.gibbons@microchip.com>
References: <20230815100600.297932-1-jamie.gibbons@microchip.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1692093952; x=1723629952;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F2TL1WtlovcCKfVNhRhxgr3OkR2MXGnu7oBqZH1iOJU=;
 b=RYxOQqo2xESvyxkkE3WjJvzkZ33rSr2Lm4F5neERDPoWjcgVtAxXPAHD
 OykZWwZMxNwuvAHrh2RPxt2ZdrJ/nIVie7tKtnu531c55yoHuG5YTGs23
 vF+PSgDBhF6152bexkEehpKFN3xOrU7oUr2oKs0im96x2eHe3VMQfli/o
 KdcBh7DFHCKy90DIfWgUR1dAwhuNeMnriNhoEd7B74XTI/AHIz70RJldH
 hNkPkok5DVX08FD9N9Zi3RQNItXCr0vRIkW/MKOVCSs9lTXVvWqJxIL5c
 UJxdH883xeg4ZNNC5dm075sNL9JSYWdaQqb+wgUTi6EeQG75lVoAfRdFE
 w==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=RYxOQqo2
Subject: [Buildroot] [PATCH 1/3] arch/Config.in.riscv: update instruction
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

Allow a RISC-V G core to support C and V. Move custom RVC and RVV
instructions from RISC-V custom core to RISC-V general core.

Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
---
 arch/Config.in.riscv | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/arch/Config.in.riscv b/arch/Config.in.riscv
index 3dfbb4165f..ab839fd8a4 100644
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
@@ -62,15 +77,6 @@ config BR2_RISCV_ISA_CUSTOM_RVD
 	depends on BR2_RISCV_ISA_RVF
 	select BR2_RISCV_ISA_RVD
 
-config BR2_RISCV_ISA_CUSTOM_RVC
-	bool "Compressed Instructions (C)"
-	select BR2_RISCV_ISA_RVC
-
-config BR2_RISCV_ISA_CUSTOM_RVV
-	bool "Vector Instructions (V)"
-	select BR2_RISCV_ISA_RVV
-	select BR2_ARCH_NEEDS_GCC_AT_LEAST_12
-
 endif
 
 choice
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
