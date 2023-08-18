Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1474C05052
	for <buildroot@archiver.kernel.org>; Fri, 18 Aug 2023 10:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 610898405F;
	Fri, 18 Aug 2023 10:42:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 610898405F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4iRj5BTMbsUy; Fri, 18 Aug 2023 10:42:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C08108405C;
	Fri, 18 Aug 2023 10:42:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C08108405C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 42B8B1BF364
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 10:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 155D761531
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 10:42:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 155D761531
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3aPHoFhRdkRy for <buildroot@lists.busybox.net>;
 Fri, 18 Aug 2023 10:42:53 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6537D61122
 for <buildroot@buildroot.org>; Fri, 18 Aug 2023 10:42:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6537D61122
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="76395"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 18 Aug 2023 03:42:52 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 18 Aug 2023 03:42:52 -0700
Received: from jamie-dev.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Fri, 18 Aug 2023 03:42:51 -0700
To: <buildroot@buildroot.org>
Date: Fri, 18 Aug 2023 11:42:59 +0100
Message-ID: <20230818104301.403429-2-jamie.gibbons@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230818104301.403429-1-jamie.gibbons@microchip.com>
References: <20230818104301.403429-1-jamie.gibbons@microchip.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1692355373; x=1723891373;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bodJqdz90cvdwSEisyPnokQvCur/5tE+igQDu2oHXAk=;
 b=CnezbJj2N2bTtGb53WwBYhktcoNKJEKVNk9UY/z1E5TQIShzy4zBiXnf
 94hi6F8G0unpKc4b1JyLh/3gMZlLDsWD955v/rjqvfvJJoqwsd3Z7toPI
 7SRO7OLgzvc9AZHi+bYUoqDy0cjPND7BI/DlMbandMmMup9B/lI0B2URM
 zfPo60b4lJ09l3/UIwHAjKZfGPGt0cQC8iy+81tK3uj7FfBG/P7fqku3H
 FvHXVWd/F95bO4Qq+AZanCEcM0Sc18Bv8byBwMbZmxiG1hRNnYKVnX/2N
 DQOvHOI1rPOjHeAkTTkMMi8AvcTbKHusZRQuiUHaURRG/4Fb8HqGpiX3s
 w==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=CnezbJj2
Subject: [Buildroot] [PATCH v3 1/3] arch/Config.in.riscv: update instruction
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

Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
---

v1 -> v2 changes:
- copied RVC and RVV kconfigs to both riscv_g and riscv_custom

v2 -> v3 changes:
- removed duplicate menu options

 arch/Config.in.riscv | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/Config.in.riscv b/arch/Config.in.riscv
index 3dfbb4165f..df8499c7a0 100644
--- a/arch/Config.in.riscv
+++ b/arch/Config.in.riscv
@@ -41,10 +41,10 @@ config BR2_riscv_custom
 
 endchoice
 
-if BR2_riscv_custom
-
 comment "Instruction Set Extensions"
 
+if BR2_riscv_custom
+
 config BR2_RISCV_ISA_CUSTOM_RVM
 	bool "Integer Multiplication and Division (M)"
 	select BR2_RISCV_ISA_RVM
@@ -62,6 +62,8 @@ config BR2_RISCV_ISA_CUSTOM_RVD
 	depends on BR2_RISCV_ISA_RVF
 	select BR2_RISCV_ISA_RVD
 
+endif
+
 config BR2_RISCV_ISA_CUSTOM_RVC
 	bool "Compressed Instructions (C)"
 	select BR2_RISCV_ISA_RVC
@@ -71,8 +73,6 @@ config BR2_RISCV_ISA_CUSTOM_RVV
 	select BR2_RISCV_ISA_RVV
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_12
 
-endif
-
 choice
 	prompt "Target Architecture Size"
 	default BR2_RISCV_64
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
