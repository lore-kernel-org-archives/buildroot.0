Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 442F3C001DC
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 06:19:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B679940541;
	Mon, 31 Jul 2023 06:19:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B679940541
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sm1PlTrIrKo1; Mon, 31 Jul 2023 06:19:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC7A9402BC;
	Mon, 31 Jul 2023 06:19:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC7A9402BC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 036021BF3F2
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 06:19:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE1B2402BC
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 06:19:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE1B2402BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zq2Viv09erbg for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 06:19:49 +0000 (UTC)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2062e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8d::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C5C714029B
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 06:19:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5C714029B
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aHPzzTf3KcprqrqajrTT3T5a/v/1EZsj2AJK3jG1/e1JMxwfy1ES67YazmfzLzct4hbQQNAYZT2bhqKAQu0hU/c8si7kfNtE1UHyuvbFxMxufx71+dk9/wSWirYR/6u5EMAolkIWhM48oDHY30TfliWsTRHFVCBXibK6xaBeJFB4XWv70Doh7P/+gQ2ixnlmySSPE+gIIahAzjr20ahLpHT4Z1CH2Hf4/lPPPBMnD0T2VG6ohi5v8pFJTMz/hjl2gM9zEUikNmcSvi25lWA0F+UUE3CHfs3Zb1EhWZMI9aDN8B5+6a2hWoCzqo0y9YFmVqlyFCpYVyvHc3FmscuHiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bz23Z0UWLR3eGO9hZG7OFOfbambLZ9iUjiTIYijEQy4=;
 b=kexl8F8JLrPU9icjzUgyu+6Niv1SoXqqPlVm0pyApYfkdyOMYKJ15qJtflBsMx5PKI71D4vzAlGLfIp34FNqVuHOkWgD91PlvcZoNm33W7/KdGvt3goAC4ruxWkqjlgztb4XaE75f059gdZFjnUSiO2lJLfBoqr/SyFjEV+AO5eM5WmHyu/hYQCV2KIhmV8UVw3fU8uNkTqSnSHis58x3YIKrLN7KAdv1SsFWjTReQuYo9SwHykhrGrUhzzmslPyyAGXE+Z5bRLTtWhBtaYJAQkkSa3Df1tHB0WBRz625oll9tN8bFwlw1w6xZWNq6Ohli/9yHtr3qRl0JPx81OSeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from BN9PR03CA0558.namprd03.prod.outlook.com (2603:10b6:408:138::23)
 by IA1PR12MB6258.namprd12.prod.outlook.com (2603:10b6:208:3e6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Mon, 31 Jul
 2023 06:19:42 +0000
Received: from BN8NAM11FT070.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:138:cafe::6e) by BN9PR03CA0558.outlook.office365.com
 (2603:10b6:408:138::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43 via Frontend
 Transport; Mon, 31 Jul 2023 06:19:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT070.mail.protection.outlook.com (10.13.177.50) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6631.44 via Frontend Transport; Mon, 31 Jul 2023 06:19:42 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 31 Jul
 2023 01:19:42 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Mon, 31 Jul 2023 01:19:41 -0500
To: <buildroot@buildroot.org>
Date: Mon, 31 Jul 2023 07:19:37 +0100
Message-ID: <20230731061937.245062-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT070:EE_|IA1PR12MB6258:EE_
X-MS-Office365-Filtering-Correlation-Id: 1033b052-706e-4770-8e42-08db918e20d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mHaPi8KvjPO8NP8/ouSWFyQGvv5sDmlAiqlAsNzBqg1NLVXa4DlX+YhOYQQFAjLtksXI5okQwoyUsbb3gdNVJ0S3UHKcVH0zmFiE+md0boiQdC0/88GewKPZ5Xf/vQrcR1w3CEbDzoeSd/odkW5U2vsNo0lIylOs8Mfa/Bu9Rss2thRI1f6i515J0cPgs0NY1voK++p0sCFpwKhxD94PrOvSjUf103zyzbCKKx03CRb8J6Xyc4CaHoHDDgrhuZfwIT6QCRcQphS//7gib6E4H5QGXwNhHtDWVCOTH27Jbbj2jcbfc7QV0o3Ib8R7wp8BN9LXLiH+2vYq1mLEYmTHeeP90qXZSGbfFGRpuhnexB4FGVZng7wvzMrujZyB5JiqsBE6VOmbVRxSaI8/0hASCoE0nDNOmkaDD/Eg96yhWnYZj6iLLUGS3TDgGQb+vz+4t9scOsMvCkkzCb7yUDQtGdegMQKop3DLZg7rWj4UI1n4gA46+w+6v0w2rT12pNpBk90gNys5YmgHeRuSfrYTG/Sp7smN+He/LnAfaCPisIvacMH7rIDyuY4b6f2u26xhis0SSumM2z59Q2pSlfNYTEs8VkWb/50Dd/WcJEGGoJxq+mNUA5+FEIoV+WrP7oR3XqPrRu6YIceeYJl/laiEiOyiyGiXo93Me8CTh0MgTiQnsM4IKecNmmKGXanwpIS+o+Q7TLCjOypNNwA3LQ88kQA4owSDAR40l6R2CulWEfztQ3fYh5Qa74dEu6Bvqt8/Tfp8XNUcn+6n9Ttb8+EmCg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(136003)(376002)(346002)(82310400008)(451199021)(36840700001)(46966006)(40470700004)(356005)(81166007)(82740400003)(40480700001)(86362001)(36756003)(40460700003)(966005)(478600001)(6666004)(2616005)(336012)(186003)(1076003)(26005)(8676002)(8936002)(44832011)(5660300002)(70586007)(4326008)(6916009)(70206006)(2906002)(54906003)(41300700001)(316002)(36860700001)(426003)(83380400001)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 06:19:42.4576 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1033b052-706e-4770-8e42-08db918e20d1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT070.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6258
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bz23Z0UWLR3eGO9hZG7OFOfbambLZ9iUjiTIYijEQy4=;
 b=SqpqhbWTlMOZ6yTH2tUAqwqLR3E4thvhP62woGh6ay1ApLRO4wvlTyN+uEMXabqA1JyvO9NESbKeo9vsAcsXkeooNNoO9N8nKm5hdKrL46r08PVfVss8a1qHxQnOhOIVz/spEKB5Gmn9jJlp45j/qtJpZpQ07+Weg4IheEHUUyg=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=SqpqhbWT
Subject: [Buildroot] [PATCH v1 1/1] board/versal: fix atf build failure
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
Cc: michal.simek@amd.com, luca.ceresoli@bootlin.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Binutils 2.39 now warns when a segment has RXW permissions[1]:

aarch64-buildroot-linux-gnu-ld: bl31.elf has a LOAD segment with RWX
permissions.

There is a ticket filed upstream[2], so until that is resolved just
disable the warning.

[1] https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107
[2] https://developer.trustedfirmware.org/T996

Fixes: https://developer.trustedfirmware.org/T996
Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 .../0001-Makefile-no-warn-rwx-segments.patch  | 46 +++++++++++++++++++
 configs/versal_vck190_defconfig               |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 board/versal/patches/arm-trusted-firmware/0001-Makefile-no-warn-rwx-segments.patch

diff --git a/board/versal/patches/arm-trusted-firmware/0001-Makefile-no-warn-rwx-segments.patch b/board/versal/patches/arm-trusted-firmware/0001-Makefile-no-warn-rwx-segments.patch
new file mode 100644
index 0000000000..1a3014ca37
--- /dev/null
+++ b/board/versal/patches/arm-trusted-firmware/0001-Makefile-no-warn-rwx-segments.patch
@@ -0,0 +1,46 @@
+From 9e495d1fffd2c7ae18191fe76702eca6a54c0192 Mon Sep 17 00:00:00 2001
+From: Neal Frager <neal.frager@amd.com>
+Date: Mon, 31 Jul 2023 06:39:41 +0100
+Subject: [PATCH v1 1/1] Makefile: no warn rwx segments
+
+Binutils 2.39 now warns when a segment has RXW permissions[1]:
+
+aarch64-buildroot-linux-gnu-ld: bl31.elf has a LOAD segment with RWX
+permissions.
+
+There is a ticket filed upstream[2], so until that is resolved just
+disable the warning.
+
+[1] https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107
+[2] https://developer.trustedfirmware.org/T996
+
+Upstream-Status: Inappropriate
+
+Signed-off-by: Neal Frager <neal.frager@amd.com>
+---
+ Makefile | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/Makefile b/Makefile
+index 1ddb7b844..77483eec1 100644
+--- a/Makefile
++++ b/Makefile
+@@ -427,6 +427,7 @@ else ifneq ($(findstring gcc,$(notdir $(LD))),)
+ # Pass ld options with Wl or Xlinker switches
+ TF_LDFLAGS		+=	-Wl,--fatal-warnings -O1
+ TF_LDFLAGS		+=	-Wl,--gc-sections
++TF_LDFLAGS		+=	-Wl,--no-warn-rwx-segment
+ ifeq ($(ENABLE_LTO),1)
+ 	ifeq (${ARCH},aarch64)
+ 		TF_LDFLAGS	+=	-flto -fuse-linker-plugin
+@@ -444,6 +445,7 @@ TF_LDFLAGS		+=	$(subst --,-Xlinker --,$(TF_LDFLAGS_$(ARCH)))
+ else
+ TF_LDFLAGS		+=	--fatal-warnings -O1
+ TF_LDFLAGS		+=	--gc-sections
++TF_LDFLAGS		+=	--no-warn-rwx-segment
+ # ld.lld doesn't recognize the errata flags,
+ # therefore don't add those in that case
+ ifeq ($(findstring ld.lld,$(notdir $(LD))),)
+-- 
+2.25.1
+
diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index a393b681c8..fab41a2991 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -39,3 +39,4 @@ BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
 BR2_PACKAGE_HOST_BOOTGEN=y
+BR2_GLOBAL_PATCH_DIR="board/versal/patches"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
