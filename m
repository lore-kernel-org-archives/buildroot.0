Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62695CDB474
	for <buildroot@archiver.kernel.org>; Fri, 20 Oct 2023 11:44:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1789D70529;
	Fri, 20 Oct 2023 11:44:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1789D70529
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 55TsUD7_EE7N; Fri, 20 Oct 2023 11:44:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C64C70520;
	Fri, 20 Oct 2023 11:44:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C64C70520
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 10EC21BF3A9
 for <buildroot@lists.busybox.net>; Fri, 20 Oct 2023 11:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF0B070505
 for <buildroot@lists.busybox.net>; Fri, 20 Oct 2023 11:43:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF0B070505
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T1I8QkxJe2Zm for <buildroot@lists.busybox.net>;
 Fri, 20 Oct 2023 11:43:25 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20614.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::614])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 72C1570368
 for <buildroot@buildroot.org>; Fri, 20 Oct 2023 11:43:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72C1570368
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iJW5DUR1x00RsKeaguQjLzvY1FTU1w555CBOOUhu0Pzo5lLSXla3/YFy0z6I09TM2JJMN4aYV4m9gX6nWGiEctOhlUhM3+3/tZpKiCgaPF2p6z/16U6aEM7oF3VEnccGmkiU/ZnNINR5cseKG40hHFr/MNuxn7TSR8JZ+GhF/aenpYzk1b6xrWOZfg3xIPrD52SMyISEvSaOOYyGexiZciFzHBa6M3OkURZAYNbVERWLwWG49JMcx99KuxTCf1o7uI0MxWj1pfbBoagOVKLiiL4N1FtlzRVs2IlltPfKJsf8cc1/kFcFVnM78n/Dt6NRgZoqZRvxCTB+jKeEOLJkzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EDxtn+opHMgUqnAQ1ziTyFyj5zZ4tWjSNPmEWOqO/ik=;
 b=DkK0YvvZ+cF3wQaAjIZPTeonGPpPwe+ZVUZwjoiDO06LMAnHmdz3CjeAn/y6Uom9YhBTvSZXZdUsFUTPekQ5sNC6U4DZKAJ7CHrtLxYgEloc4GFN4e1EQAOdPMb4llGyaBXtF0hucRh7bzdVGs/ApiOjEBGLptgtNC44rc95oICT2mxmDRmUtQ0KlnFvLzge61bhsxSpMTwinL83/m48C59uZ8hFkYlyHqUO5yRgSQ49TmHRa1T+75M2z+HhdWRJ5GjqofWtps8PGhYC5Rl0zxcsrER/04nru2nQpfKwapyO0mAfIzE5ibeK/WEsXayLpkANBCrkSuCL91fw/YRQ9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from SA0PR11CA0022.namprd11.prod.outlook.com (2603:10b6:806:d3::27)
 by PH0PR12MB8005.namprd12.prod.outlook.com (2603:10b6:510:26c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24; Fri, 20 Oct
 2023 11:43:22 +0000
Received: from SN1PEPF0002636A.namprd02.prod.outlook.com
 (2603:10b6:806:d3:cafe::d5) by SA0PR11CA0022.outlook.office365.com
 (2603:10b6:806:d3::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26 via Frontend
 Transport; Fri, 20 Oct 2023 11:43:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002636A.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6907.20 via Frontend Transport; Fri, 20 Oct 2023 11:43:22 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 20 Oct
 2023 06:43:17 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 20 Oct
 2023 04:43:12 -0700
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 20 Oct 2023 06:43:11 -0500
To: <buildroot@buildroot.org>
Date: Fri, 20 Oct 2023 12:42:33 +0100
Message-ID: <20231020114236.4129636-7-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231020114236.4129636-1-neal.frager@amd.com>
References: <20231020114236.4129636-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636A:EE_|PH0PR12MB8005:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a80496a-096b-4c6c-d72f-08dbd161c3b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D6rzi3kTtVtZFilfkiPwdUB6nWJY2nX6iiTnV1K/BdR7tkBhp8FuEDncLQpBywnyKk+aDjMdKYQhTFOZSaZRfowCqdJ7B5hPDVRQbu3KtTS6Nep90krjtCcPvONeIMa52UgRnxTSHub0jZweYnedtAOhXEsffJNERqWqZ3ZhRbsOkzEglr2X+SPeX0jTHNnvdsFz7dEXdAa7FG7Z3PcxNKpfyEVroCH6QQv8p6+9k5I41SVU1ZvaeDpBmoz/emU2h4+Oacc0WCIALiuoSoBVfrWYjUTibtochsuBKnUPN5HO5GdFiZVlpsAAi2tmn8FN4Q29SwdVnE/o6lIGIsdcmQnSLZjxDkYP9ZJqotbdfqywBZu7NEOeKShW5gwLXDQsQJzzwWdU1F8+Dg6XNDj5GMWf/rh8JsSx0rrL+PuIQYuCZwq92Zm1Uz+67tSZ/SjBBAJ4lMzEVuvEyI09/hN4pjbOEMU6VEnKyFaoBiiWnrBK4E7q9paFg+rVEpRd97L0aTIql9NeOgQG7jx7hgr52EK5Ld1N6DGBSKJKz7Wo1AvqHAe1+AQv/gum5+kJL2UkP0b4rYxpkKgycZl9CRFoKb69Crj2vJLYi3RxqHZv1YCsm4J1NSGbWdb93UCPAYJUQa1/jUcMPFCfx0M1wd3u9Cf5k9NR8haOcYAXJ6VKZFaoOzwIZFXQwE8JQTLQfU/8EbPiTk1pJEJkgrBXb5ktYeK8/fN8XPCVvWCo4Krr4gEr6ncOqcxf9avTK/QjKM4WtNy7w4NzdJRjYW0nvnyCDqUetai7LqRsHZx8Ci/akJo=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(376002)(346002)(39860400002)(136003)(230922051799003)(186009)(82310400011)(64100799003)(1800799009)(451199024)(40470700004)(36840700001)(46966006)(36860700001)(356005)(336012)(426003)(26005)(82740400003)(47076005)(40460700003)(5660300002)(83380400001)(316002)(4326008)(44832011)(86362001)(8676002)(54906003)(70206006)(8936002)(1076003)(6916009)(70586007)(41300700001)(478600001)(6666004)(2906002)(40480700001)(81166007)(2616005)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 11:43:22.7379 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a80496a-096b-4c6c-d72f-08dbd161c3b6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8005
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EDxtn+opHMgUqnAQ1ziTyFyj5zZ4tWjSNPmEWOqO/ik=;
 b=MEcQTSYGfxtncUgZBuPvDgSO5gUsWNGq5v+vAkT0dwIzt0wY2rG4Crd5oG9bfYZ9uRLmr1sovegzaxrZgUlJWignRqSsgyE8kyFi0bw5SfoLnShUmvupOzIZN3HxKjQyVPtGYBCSyVLw18yLxv1fiZg0tc8G4zOE+jz7JiMfx3A=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=MEcQTSYG
Subject: [Buildroot] [PATCH v6 07/10] configs/zynqmp*: build pmufw source
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
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch migrates the zynqmp config files to use the new
zynqmp-firmware package for building the zynqmp pmufw from source.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V4->V6:
 - no changes
---
 configs/zynqmp_kria_kv260_defconfig | 4 +++-
 configs/zynqmp_zcu102_defconfig     | 3 ++-
 configs/zynqmp_zcu106_defconfig     | 3 ++-
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index 78b62a9ff8..5e0c820ba7 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -32,7 +32,9 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2023.1/kv260-kria/pmufw.elf"
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE=y
+BR2_TARGET_ZYNQMP_FIRMWARE_VERSION="xilinx_v2023.1"
+BR2_TARGET_ZYNQMP_FIRMWARE_CUSTOM_CFLAGS="-DBOARD_SHUTDOWN_PIN=2 -DBOARD_SHUTDOWN_PIN_STATE=0 -DENABLE_EM -DENABLE_MOD_OVERTEMP -DENABLE_DYNAMIC_MIO_CONFIG -DENABLE_IOCTL -DCONNECT_PMU_GPO_2_VAL=0"
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/kria/kv260/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index 18230cf89b..6674fc6dfb 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
@@ -30,7 +30,8 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2023.1/zcu102-zynqmp/pmufw.elf"
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE=y
+BR2_TARGET_ZYNQMP_FIRMWARE_VERSION="xilinx_v2023.1"
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu102/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index 21f41a2d8f..201d3daeda 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -30,7 +30,8 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2023.1/zcu106-zynqmp/pmufw.elf"
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE=y
+BR2_TARGET_ZYNQMP_FIRMWARE_VERSION="xilinx_v2023.1"
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu106/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
