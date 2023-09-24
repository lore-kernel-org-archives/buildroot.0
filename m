Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9728BCE7A8A
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 15:14:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5025F408C5;
	Sun, 24 Sep 2023 15:14:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5025F408C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ljWJw_RZjMUM; Sun, 24 Sep 2023 15:14:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5852041572;
	Sun, 24 Sep 2023 15:14:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5852041572
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 11F941BF3E8
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 15:13:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D809781E2C
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 15:13:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D809781E2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FoReDZod4bKE for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 15:13:26 +0000 (UTC)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20623.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8d::623])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E2DB681E28
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 15:13:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2DB681E28
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TYQuinyNrQQZctKTEcqSDY7DgnE8sqsE7tDnBHsra0Wf3QVuCR2JuAnUphqINClGgtLCG9sCRTs2pvu428tIpVnrcwt261qCoNoyr6w3IlXuyxbCp86jjUPIQKBkimiZ3ejNAtifa4gipH3NX4mpgZz7bjcEBjLYN5Gyy3LeSXniTvtN3xdE3bgPagCs+E/LBx54TFkY36rgwzUdVutMt+HT4kF4niw/2H0Aq0T/dZ4QUAQTwAVZWFWsCVlY0ccFcSXi03i+HATP6ywkscN0HXeo35hm17krDtLMM859zUmQs7bJwyBseKq+jcQxe87JlJSxaF3JKnGMArxSgNamvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zXvfGTp7eJ2uUHXHQ2T/5A5Ums5LLX56u7BeVkTIXbs=;
 b=gfMglusOt0XdxxOqt4YX0Sdf4qYpNgW4Qks6wONV1dtXWPUBf5JsO/+oBWHXUxOWowZfv4gm7kJs3A9iumoG17neFEXjDAvbsRtLTcprGRZSjlWX4VTaiq4G0Drf5tNHrCuS+VIII24MzV2Vb58Mm4qf1WDJDJ2HmqeBfKZ/q9h4AYNurENX/alSs9dxJg3QlHSIaUUA3YxFKimaN3Uxs/e2C21pUmnNtOQo0F0Nu0NxYKFaejQRDNI7/IIRzavngTGQFY+SGI87SbgX6plOiRT3UImUX4t0mOxtJj3FDkd1z+MMhUftWsBJPyqcvywEIvEURfuwfa5wd772CnwJKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from DM6PR02CA0068.namprd02.prod.outlook.com (2603:10b6:5:177::45)
 by CYXPR12MB9426.namprd12.prod.outlook.com (2603:10b6:930:e3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Sun, 24 Sep
 2023 15:13:21 +0000
Received: from DS2PEPF00003440.namprd02.prod.outlook.com
 (2603:10b6:5:177:cafe::2b) by DM6PR02CA0068.outlook.office365.com
 (2603:10b6:5:177::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.35 via Frontend
 Transport; Sun, 24 Sep 2023 15:13:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF00003440.mail.protection.outlook.com (10.167.18.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Sun, 24 Sep 2023 15:13:20 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sun, 24 Sep
 2023 10:13:19 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sun, 24 Sep
 2023 10:13:19 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Sun, 24 Sep 2023 10:13:18 -0500
To: <buildroot@buildroot.org>
Date: Sun, 24 Sep 2023 16:12:04 +0100
Message-ID: <20230924151205.2099293-9-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230924151205.2099293-1-neal.frager@amd.com>
References: <20230924151205.2099293-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003440:EE_|CYXPR12MB9426:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d83d806-812b-4e42-3827-08dbbd10c9ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yBRFcnSMh2PBYw/UpYbDlSQSb8k2a9gs+kld6DDGg5KbMi81Gnm7AUSlvqFrFnrcQwU2Xw+BoPRnKG76dM3hMtS6vJZzLq6+9F4ju7+I1OD8D3650+NLmYklVhPR7MH4bjNE1zSTbxA+mUkfbDu/inZ4S+dLSkuC7xd911H/8YI0XUmre4Ij4ITxDU5828W8Ob3tXMUuClr3kACvnOjJkNWvcjN9OELI9ATRX4jS77SWQRwAI8kAaOSrxHRwHLBIvknc1T+T9mFg7tJOj8ZIhM2/2nr7PhQs48jYxtg4N+t6NnWt4IvnzivK7bgZnKpGFimHiOImyg6+zPz6rhvZJOzPK6Lgqmwojj7fdEhLa8koL7fp5wMxLHBHMjjDBWuxLecR96DavdI9BvSd1o7L4sZleLVArHRzh8I5jKw/BUMq9SnGGh8zguXWywXm4WyNqhpyUqEiPplcAZmXoUnz10H3dgLRcj7lov5A3FpJj1bo5j4UZqqz7I+CtHjRBVSuihKr5YhNdv6qz1XDXGj6qhsi7szhZBYE49nvU/yJ5N7ihaV1aZdBmO+Hg2niuQkABelX++5oyhYYOyLXo7QvDPlLOKZxUGJSd04HijqFlmfctDrfYpl05Ske+A1cOh9i6Sfvo22xlMIxYbWn5e7kZj6q1NJfTRKR68xlra9RUI0HdHjSoWCIWGzlJUZx9LqJcrSBot0KHdPWTliRAYchzDD2T6veOiAh9O1rc54yZrzGGKMzD06Jf0J34Tgic3FiA3b32Knndr1L1y/h4+jZPg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(39860400002)(136003)(376002)(346002)(230922051799003)(1800799009)(451199024)(82310400011)(186009)(36840700001)(40470700004)(46966006)(478600001)(6666004)(44832011)(8936002)(83380400001)(70206006)(54906003)(70586007)(8676002)(316002)(6916009)(5660300002)(40460700003)(2616005)(26005)(426003)(36860700001)(4326008)(36756003)(40480700001)(82740400003)(86362001)(47076005)(2906002)(41300700001)(1076003)(336012)(81166007)(356005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2023 15:13:20.3040 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d83d806-812b-4e42-3827-08dbbd10c9ae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003440.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9426
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zXvfGTp7eJ2uUHXHQ2T/5A5Ums5LLX56u7BeVkTIXbs=;
 b=A/s/TQCOQUazokSOPMrL9rWTN69yKqjz2fcYuchTB9FjEdQDVMDUkttq4bCQ7vaSpvtUXBG5m3a810KIhEeq0E1drXksMT1ViJPIB0qknox6xZBEDaEEBd0+cgvTe2n6OEjCb1pD5f1AwTHqJrbXLaQfj/PcHyDNDH2BbEL9r1g=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=A/s/TQCO
Subject: [Buildroot] [PATCH v4 09/10] configs/versal_vck190_defconfig: build
 plm and psmfw source
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

This patch migrates the versal_vck190_defconfig to use the new
versal-firmware package for building the versal plm and psmfw from source.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/versal_vck190_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index e30bb35b74..78eaa02a28 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -32,9 +32,9 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
 BR2_TARGET_UBOOT_FORMAT_DTB=y
-BR2_PACKAGE_VERSAL_FIRMWARE=y
-BR2_PACKAGE_VERSAL_FIRMWARE_VERSION="xilinx_v2023.1"
-BR2_PACKAGE_VERSAL_FIRMWARE_BOARD="vck190"
+BR2_TARGET_VERSAL_FIRMWARE=y
+BR2_TARGET_VERSAL_FIRMWARE_VERSION="xilinx_v2023.1"
+BR2_TARGET_VERSAL_FIRMWARE_PDI="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2023.1/vck190-versal/vpl_gen_fixed.pdi"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
