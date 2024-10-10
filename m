Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7626BD24461
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 23:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 416CF81A30;
	Thu, 10 Oct 2024 23:39:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R5HL7aSpCAJN; Thu, 10 Oct 2024 23:39:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B419881FC8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B419881FC8;
	Thu, 10 Oct 2024 23:39:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C35F71BF5B5
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 23:39:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B21F441E03
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 23:39:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R1QvgpLVtL3e for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 23:39:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.249;
 helo=lelv0142.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A285841DF5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A285841DF5
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A285841DF5
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 23:39:30 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49ANdTvX117740;
 Thu, 10 Oct 2024 18:39:29 -0500
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49ANdTEj121398;
 Thu, 10 Oct 2024 18:39:29 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 10
 Oct 2024 18:39:29 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 10 Oct 2024 18:39:29 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49ANdTvp070678;
 Thu, 10 Oct 2024 18:39:29 -0500
Date: Thu, 10 Oct 2024 18:39:23 -0500
MIME-Version: 1.0
Message-ID: <20241010-uboot-bump-v1-2-287ffa07e49e@ti.com>
References: <20241010-uboot-bump-v1-0-287ffa07e49e@ti.com>
In-Reply-To: <20241010-uboot-bump-v1-0-287ffa07e49e@ti.com>
To: <buildroot@buildroot.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1617; i=bb@ti.com;
 h=from:subject:message-id; bh=P7T31y1tLtXUZATk9sj//BambVL04HIJFo9DpgR0YFw=;
 b=owNCWmg5MUFZJlNZPfr9JAAAZ3///v5d/nt83iuX4Mtv/5efx72v+7/evd992un7277z/NSwA
 RmYHamgAANABoDQAAPUND0EAAAaANAA0GgAGQDajTQNqPUZG0mhoaaeTKeUOQ0GIaGRpppoADIN
 AYCaAD1DJowhoeoaaAMmTTIxGjJ6gAabU0BoAA000yAGUHoTammmRoYmhp6Q0NNGmIGgGjQ0DQN
 NAZABoaDQ0A9RoDIGjQMhoGmmjRpkMQBBECRBC70EfXq4QaARSkzZGPawfKYGr5fkVtbQBBEFiY
 FIONYfcBJ7IkDlmjlZdlpXQhuZPk+b8ZTB2UTjCZ5wIPiurw2kMWs+HhP81OZvUh7ON3pdfkg9z
 /bwcUCHpAHG99qIm2hFXeAwfZbGwDzanolQ7zIGreRKo/A3WU33nMnyvVbuk2K4QCsTpquDkK1U
 Er7je7wjXGYyCc8GI/YC/BRvnnq5PUe0pJa0u4BuQHf3imwsJU65kqNnAw7bylvURElhRQqhcCs
 DGbyFRpStODCiMTF5WBdZbCyOrwzmOWACkGaIDagKpFkk3tOuB9UwVtVxD5jVhLzatGJSj9RM/w
 RaLJmyoR2VjmAp9dD2bLItABvtU4BhFEPsdaOtz+0fIQnTxd+AKkbEExyYOPLrzxOcsMkJX+mog
 IsswCmeMFSaZf4u5IpwoSB79fpI
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1728603569;
 bh=KFkwrBZF389kBu1IZNA2xjHARHWlzNeKV7PWFmSAfuQ=;
 h=From:Date:Subject:References:In-Reply-To:To:CC;
 b=l706QfDGvmeTsYW99p+BEzz/TIha7PPO8GSkxKN48cDIk87Cty0bHHaqePLbV/lEb
 +zRQXeZ+Nc2LhJCdoU+shGqSK1tTpivcxdsz59NNLN7Vka6Myj8zzpw21+7yp58tDa
 3llNJU6fE/YwpITLrwON+2nn/XjxXgnblYAWuNLY=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=l706QfDG
Subject: [Buildroot] [PATCH 2/3] boot/ti-k3-r5-loader: add option to include
 GnuTLS
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
From: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Reply-To: Bryan Brattlof <bb@ti.com>
Cc: Xuanhao Shi <X15000177@gmail.com>, Bryan Brattlof <bb@ti.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Newer versions of U-Boot may require the GnuTLS library to be installed
on the host machine before building. Add in an option to select GnuTLS
as a dependency to the ti-k3-r5-loader package

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
 boot/ti-k3-r5-loader/Config.in          | 7 +++++++
 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk | 4 ++++
 2 files changed, 11 insertions(+)

diff --git a/boot/ti-k3-r5-loader/Config.in b/boot/ti-k3-r5-loader/Config.in
index c276528fad50d..4d1661dfeda77 100644
--- a/boot/ti-k3-r5-loader/Config.in
+++ b/boot/ti-k3-r5-loader/Config.in
@@ -144,4 +144,11 @@ config BR2_TARGET_TI_K3_R5_LOADER_SYSFW_ITB
 	  If unsure, use the default sysfw.itb (symlink) generated by
 	  binman.
 
+config BR2_TARGET_TI_K3_R5_LOADER_NEEDS_GNUTLS
+	bool "ti-k3-r5-loader needs GnuTLS"
+	help
+	  Some newer versions of U-Boot require the GnuTLS library
+	  on the host machine. This is typically the case when the
+	  board configuration has CONFIG_TOOLS_MKEFICAPSULE enabled.
+
 endif
diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
index e426f039e021d..07f5f7b33f668 100644
--- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
+++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
@@ -56,6 +56,10 @@ TI_K3_R5_LOADER_DEPENDENCIES = \
 	host-python-yamllint \
 	ti-k3-boot-firmware
 
+ifeq ($(BR2_TARGET_TI_K3_R5_LOADER_NEEDS_GNUTLS),y)
+TI_K3_R5_LOADER_DEPENDENCIES += host-gnutls
+endif
+
 TI_K3_R5_LOADER_MAKE = $(BR2_MAKE)
 TI_K3_R5_LOADER_MAKE_ENV = $(TARGET_MAKE_ENV)
 TI_K3_R5_LOADER_KCONFIG_DEPENDENCIES = \

-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
