Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05041C433FE
	for <buildroot@archiver.kernel.org>; Tue, 22 Nov 2022 10:21:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B2DA81FA8;
	Tue, 22 Nov 2022 10:21:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B2DA81FA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mU7nnGBy-nxS; Tue, 22 Nov 2022 10:21:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2207D81EAC;
	Tue, 22 Nov 2022 10:21:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2207D81EAC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 886321BF4E6
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 10:21:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 478B94007A
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 10:21:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 478B94007A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KX7VNmb5m4r2 for <buildroot@lists.busybox.net>;
 Tue, 22 Nov 2022 10:20:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18AE940043
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2062f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8b::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 18AE940043
 for <buildroot@buildroot.org>; Tue, 22 Nov 2022 10:20:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YOm23FgVFiwRWPTVAT9whCdDpWwMNmOpwctBNsMLqV31SH7osKsv6lu2O1ck5TQBEah7PGS1qMhIL/FzeKHQ4v0ral/89to5rTLdTbrzE4SjujHOWuie/kwVn6TpwedfzY5Up/mk+C8gZAXU3BH0GtDWsGvKqNT2oZIG0YZImPJNpgw56s+7RpcyX2/i5yRujRpOc4t+byQy1Vo0Kfvzt/xZblH0dKzXbp7WoBOtQqtdNi12bP/Oequdis/i5kenole1vPXQvvAP0DuQEWk7o7tZqBOyucfRI5m9nf1DQ+xXHnlIuHNaCNMLW1KlRIIWyHrG1NPdIvb0y7bYwC3jDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iqtRRmKQtD22HMhEfJY1Whi5Ur40Cp3evNLX8Q+eWig=;
 b=jB/59YY0quze+7t7N7KMgbdTxwye2AtVNe7FJWWKAEyfGTDZYxWI/yM+ghPJAap0EtptdO0Y66MbXdSMhGphJd+arKlQVtoNLE5cU/RUlPMoiBeSli67Qrlnt0b2/DoDguTQVItjMesAzQak9ydvMQKKWwlkKN/mUvJJIgHYCD7yawG+3FVVeBWhdCcsD5RJjkUjxN1osHNpR2t4kLR9eKAVt2GmCh0Cbstv4ILP7w1XoruvBZYyuDjOGb/NH4wBitZVHpK8ktabadymvLA+g7kKrLbGZv0UpEabmZTEOftar2cZzT03vC6OXZCmjZ1OjIcglygeYW7Sbgl5ysvyDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from BN9PR03CA0988.namprd03.prod.outlook.com (2603:10b6:408:109::33)
 by DM4PR12MB5183.namprd12.prod.outlook.com (2603:10b6:5:396::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.19; Tue, 22 Nov
 2022 10:20:54 +0000
Received: from BL02EPF0000EE3C.namprd05.prod.outlook.com
 (2603:10b6:408:109:cafe::a) by BN9PR03CA0988.outlook.office365.com
 (2603:10b6:408:109::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15 via Frontend
 Transport; Tue, 22 Nov 2022 10:20:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0000EE3C.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5813.11 via Frontend Transport; Tue, 22 Nov 2022 10:20:52 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 22 Nov
 2022 04:20:50 -0600
Received: from xcoapps68.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 22 Nov 2022 04:20:43 -0600
To: <buildroot@buildroot.org>
Date: Tue, 22 Nov 2022 03:20:25 -0700
Message-ID: <20221122102025.62704-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000EE3C:EE_|DM4PR12MB5183:EE_
X-MS-Office365-Filtering-Correlation-Id: 31ec2e50-bb88-4779-632c-08dacc733c1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U44GD/tZCPNqsR9klx9oYXndPlqijv3Ctz8HfX5hpeHp7MKIKdrIISZ964oWDvVcyHqgvNNziqNSddTBvkxQaHWHFoJqDTQlxd9pDuH/yHR4EyfH8uzO0T/GYxOry9jO/8/3V6Rsl1OwvyjLEvC9aRYg+7zLj8dLvILdau3lsrZQ3MTrhwQsZTt2f7R8Fn5EyavJUGKOh5WTTsFIUnvifWD9iaqsv1FoKtUh4CiwZCDdz3PQy7Pfz4ayeZRZg43XR9Y1h3kKjIlspUN4FbU/7h3eLyTjASsXka/9qrPOQfqSXXP579N/yhFoSpTyFz5pTlx2aq7JokqNRxvKedDCEOWNWLDwMV3kon3DC/wH2WUFzCZEQiJsidEUCs7uNEHSoIsXJE3l8P7qQ7OpGh54VxwtkytFeTX69pMantOjWW5O7rymEC1EfxFWObq7oCizHREEqSw07uJXG2RL+dcYMQvvdKgvlbQ6S2AM2xJhlAqTA7LU3URzr4xdIefzfOWQFpgbeo41bYj8tGjxzREF/LMV36eiUc5B+ZNVg6RlYk6Le1Ep0RMLjYqHKgekTk2pxf3fg1qXz/fIoAEzVm7xWexJ8i/QH3EZHVs2rgH/YqCWg/qZU5YUaQ/+rzUzfR0wZ2BNd3Aw0B9lHGh0xQequna06mlpRFwae/X4rkKNq2rg8cuhMeR5EI+E1nhiW/T8MRR4Q4Ns9Mv2+oiho6oEv1X56rFsp8ITgSRRaxzjxAM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(376002)(346002)(39860400002)(451199015)(40470700004)(36840700001)(46966006)(478600001)(6666004)(81166007)(6916009)(54906003)(41300700001)(26005)(4326008)(1076003)(8936002)(186003)(70206006)(2906002)(47076005)(336012)(8676002)(426003)(82310400005)(2616005)(356005)(5660300002)(36860700001)(83380400001)(86362001)(70586007)(44832011)(40480700001)(36756003)(40460700003)(316002)(82740400003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 10:20:52.7808 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31ec2e50-bb88-4779-632c-08dacc733c1e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0000EE3C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5183
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iqtRRmKQtD22HMhEfJY1Whi5Ur40Cp3evNLX8Q+eWig=;
 b=qdCfyuz27LgEF6+rdE1utQhg+2Nd/vGK+M8oOxTfEModBX81CeS8qIcPzXJf3wAOTcI5gaZHZR8xxC82Ei12jBTpxSnMAXR5OdXqTiRLhtAqXOq+9ZusEJUEjZ0evUrmCe3UPpocddiVXJnO8I8Dw02aMHy/+6R/3NkvNT2OCbQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=qdCfyuz2
Subject: [Buildroot] [PATCH v3 1/1] boot/uboot/uboot.mk: add stripped
 u-boot.elf support
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
From: Neal Frager via buildroot <buildroot@buildroot.org>
Reply-To: Neal Frager <neal.frager@amd.com>
Cc: luca.ceresoli@bootlin.com, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

If a user requests a u-boot binary in elf format,
they may actually want the stripped u-boot.elf version.
This patch provides the stripped u-boot.elf binary.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
  - reduced scope to only 64-bit ARM arch platforms
  - non-ARM platforms may not have a u-boot.elf by default
V2->V3:
  - test and verify u-boot.elf exists before copying
---
 boot/uboot/uboot.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 0439ec5e4b..0d9f13aa4b 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -53,7 +53,7 @@ UBOOT_BINS += u-boot.dtb
 endif
 
 ifeq ($(BR2_TARGET_UBOOT_FORMAT_ELF),y)
-UBOOT_BINS += u-boot
+UBOOT_BINS += u-boot u-boot.elf
 # To make elf usable for debuging on ARC use special target
 ifeq ($(BR2_arc),y)
 UBOOT_MAKE_TARGET += mdbtrick
@@ -369,7 +369,8 @@ endef
 
 define UBOOT_INSTALL_IMAGES_CMDS
 	$(foreach f,$(UBOOT_BINS), \
-			cp -dpf $(@D)/$(f) $(BINARIES_DIR)/
+		$(if (test -f $(@D)/$(f)), \
+			cp -dpf $(@D)/$(f) $(BINARIES_DIR))/
 	)
 	$(if $(BR2_TARGET_UBOOT_FORMAT_NAND),
 		cp -dpf $(@D)/u-boot.sb $(BINARIES_DIR))
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
