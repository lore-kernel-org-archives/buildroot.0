Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A3EAC4332F
	for <buildroot@archiver.kernel.org>; Tue, 22 Nov 2022 05:36:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDF6F81EF6;
	Tue, 22 Nov 2022 05:36:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDF6F81EF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4G2pshNmPEsv; Tue, 22 Nov 2022 05:36:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B16F81EF0;
	Tue, 22 Nov 2022 05:36:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B16F81EF0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2155F1BF33B
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 05:36:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFB3D81EED
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 05:36:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFB3D81EED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cqpFZhB8HahO for <buildroot@lists.busybox.net>;
 Tue, 22 Nov 2022 05:36:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68F1981EF0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 68F1981EF0
 for <buildroot@buildroot.org>; Tue, 22 Nov 2022 05:36:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iohZhKzMn9nYe3FeMyoqXG8G6XjxJoKJlrlL+E1RGKl3r71g8Wyu4LXgifkDihVeQe2xdl1HEtM1ksR4CEueLUag3XBKA7my1RdfG+xl0D4uiExTV3qQ/6XlTw3GfVOTaf1GKJpBtiYZCxnFN0/4h81q+k4zeTAJJnfqx1cPe5xa665mBRzsXYGhMRbEjU1qx8uv5gJ7+6CbjNkNMZLsgCFeDMGZc96mgJ2CUnsoQbVH8ol4E3K1RXYlLKKjn5NAvHoajWzyuKg8XaaNotkSjqrwqfuBGrh05TDh0APgPQJmNDJ3B4h50MCgy4pIpempgYGJtlQTUFnvg5yKrG36JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EvtfyqT8wND4NF7IBQ3a9BBzCPHVgGSJOaowj33XYrQ=;
 b=WOpPg6LlfIEwkMTDuS5xaEsT9jmtZsKQVRLa2lAedkEcqwYrmHkeC/3UEp0maYCf8nWFjED8JX9LJ62Aj4FZItHchHLoynYjJxb4uSTkp8a9/ooU5F0/fcnKWW6//PR90C1mAT60NCOBQPMOlMZND6VwHsCkKgikcvid+Z5WkwgHWK8e7VT1kkmMUesP9dBMMiU2txIQhPetFFj9QhQZqzgCNpDahap5pa1HdnnWtkVixw5TE858MpxYFIah/C0E/YddoJi5DBHz2BvsbhKfWmCOUjHefC6YcXvi81bIDkqa3pGiAUR91x1T3JvsBgv9dBxmiIGy/7lVf3ZsJwKuQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from DM6PR01CA0023.prod.exchangelabs.com (2603:10b6:5:296::28) by
 PH7PR12MB5853.namprd12.prod.outlook.com (2603:10b6:510:1d4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Tue, 22 Nov
 2022 05:36:41 +0000
Received: from CY4PEPF0000C967.namprd02.prod.outlook.com
 (2603:10b6:5:296:cafe::c4) by DM6PR01CA0023.outlook.office365.com
 (2603:10b6:5:296::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9 via Frontend
 Transport; Tue, 22 Nov 2022 05:36:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C967.mail.protection.outlook.com (10.167.241.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.9 via Frontend Transport; Tue, 22 Nov 2022 05:36:40 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 21 Nov
 2022 23:36:39 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 21 Nov
 2022 21:36:19 -0800
Received: from xcoapps68.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 21 Nov 2022 23:36:19 -0600
To: <buildroot@buildroot.org>
Date: Mon, 21 Nov 2022 22:36:11 -0700
Message-ID: <20221122053611.44757-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C967:EE_|PH7PR12MB5853:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d14893d-4dfb-4b0c-25f4-08dacc4b87ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gnS7Pn59bkxygvNytdOb905bwSv9d/7F5fqBwOCfK3miJymRqGasV1l08mFPMjQDHZcvVzXtDXTrl+bHWzUOh/0HrMRPQDdanGBTQHNL+M0cqaNZXi3EKsGjE3fLsb6JaJDkr0TC1BtYxxqh1Z5E/53MSxZcV0IOWMfkKmqmeRzpOkkPlBGz0/KlLSLM0mmzOBqx2/mnh5ROt1qH95u7xigk70mtsZJdiCZEHoQRfrxzvJGsYgpVfE9WbjKP+2udfMBrj94dIJ4uRcAGbSTsZMgxfJ3r6rZ8A6COP7V5jdLIJEUuxJuWvzGgI+O7tmCsPbH23m9JeGNEC3i6CKlfVHT7yiVWPAzlsl4Fso+3Z60Oi3uTJtyyHhVAqxZ+PNybqn9QVi1JZ4Q5FDVkl6qq1HkVkCcOmYB8TPTe67PydBXjm3npB055YC70fkxjQh7UaxIcEM18QYzDZHcr/e9/C6QRAO7X3dzDrJOTb4lWOTfqVRjRXla80d7oKjJxmJQCF7O5cifz5ImIaStZawT1CQir8bmhq/xIOKK8Q4xi/k8QjCCiWcXRpBeqVBhFF9VONLQfVcmVPHsEIQ+WkB/T1h1omx5l8DATGSS1zi6ldoQK5ebWFhvgNbseKof+qZrpMjpuVtvpPIXfJLpC1UXOya0lJpfTlR3gm6M2JO66gluDJEX6uK4+i+uEotAAp4Ye2/Qgk0iMo8Rkb8IsStFCNt+3sncN4Yzq331zOb+Qvgg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(376002)(136003)(39860400002)(451199015)(36840700001)(46966006)(40470700004)(478600001)(36756003)(4326008)(41300700001)(8676002)(82740400003)(356005)(70206006)(81166007)(6916009)(316002)(54906003)(70586007)(186003)(426003)(336012)(40460700003)(36860700001)(83380400001)(1076003)(47076005)(2616005)(26005)(82310400005)(6666004)(40480700001)(86362001)(2906002)(8936002)(4744005)(44832011)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 05:36:40.1511 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d14893d-4dfb-4b0c-25f4-08dacc4b87ff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C967.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5853
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EvtfyqT8wND4NF7IBQ3a9BBzCPHVgGSJOaowj33XYrQ=;
 b=3YS7iEgGL9+oBhADI3ncLjTFYTTQiXX2jm3KFpQuQAt/gaalsSqflKlfOAWyHsyfIHc846oYbC5G+LU0hYFGIM+HD7Aehq971YPdpzzc7QWdWdq9r/nnGPOCeJAkXJNbGC/xqGvB0vtt7aDz7MpUwF08huOqLMhksITFhF7F4bE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=3YS7iEgG
Subject: [Buildroot] [PATCH v2 1/1] boot/uboot/uboot.mk: add stripped
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
---
 boot/uboot/uboot.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 0439ec5e4b..61b3074163 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -54,6 +54,9 @@ endif
 
 ifeq ($(BR2_TARGET_UBOOT_FORMAT_ELF),y)
 UBOOT_BINS += u-boot
+ifeq ($(BR2_aarch64),y)
+UBOOT_BINS += u-boot.elf
+endif
 # To make elf usable for debuging on ARC use special target
 ifeq ($(BR2_arc),y)
 UBOOT_MAKE_TARGET += mdbtrick
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
