Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BDA5C4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 07:36:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 379D380C66;
	Mon,  4 Dec 2023 07:36:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 379D380C66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kE1uRHSBjWBe; Mon,  4 Dec 2023 07:36:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4338281EA4;
	Mon,  4 Dec 2023 07:36:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4338281EA4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6CEDD1BF33C
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 07:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 385ED60B12
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 07:35:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 385ED60B12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RpGYqIKMLoQy for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 07:35:20 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2214960AEE
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 07:35:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2214960AEE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iEdfTzX//lTrbs/tmvoIwqnVx3RAbN272T2DIZlyDdKtalknlNUaXULKMC+/uU2VdI/pQiz1XGZOTRgV03tTNIlSBhVPR8oNIx8wTH5kAb5fSjbJj8hMWbZftIj1oITfcMhX+4RDi1NRE9NCeFtKw3iFa8lm4O5hGdpGJZ3SzEgGh87nYu7S9w/mkNZEuE3+fs1hIownao/pldXDC92qqICJ+r7BEPxdlsrI08ejCwQxmX+Bu1BS+IOI513JBqy15dgO+Qlh4uJGlhUz62NRP4p4W5HlUNOqOs4m3u4e1VkIWeSfsZd08u+z/Dd4QXsCH8x2gRnNmwBfybTNhdNqIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=md3+GMxnPPVjCFXrm2HLk5iZMiYtezxZExmp53SuRMk=;
 b=mtcOE/mXcaFc3iDRSE/gy7co56adZDwkX9aTDDhvuvq5w9KJemJMiKZSbgbvzRCKrTSRP9dXD0NPBqDyE+hfHBCc0LxFNPXLiz3QVeZoqrmaDabMvTs/aXh0Rdp/nHGyuWui43fb/vdx2Zkb2Awe7E+tPaOhuhXg4dpwol9kU6lk5Nec9vroez+qWv0mooduNvsQPYJQitDlmiYdOyG+rtN5ai3c59fotbCRu0L7SMlR8T9txQbMIyonId3B57xNlUWmjplOrUGTssdrfuLkF9uUUSl0TV8EZDEaOiPITXmTh6+H2AZHKt/oksssj5ZDALeq60qp6DdJVgZk5GuFNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH2PR05CA0053.namprd05.prod.outlook.com (2603:10b6:610:38::30)
 by IA0PR12MB7578.namprd12.prod.outlook.com (2603:10b6:208:43d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Mon, 4 Dec
 2023 07:35:15 +0000
Received: from DS2PEPF0000343C.namprd02.prod.outlook.com
 (2603:10b6:610:38:cafe::ff) by CH2PR05CA0053.outlook.office365.com
 (2603:10b6:610:38::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.22 via Frontend
 Transport; Mon, 4 Dec 2023 07:35:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF0000343C.mail.protection.outlook.com (10.167.18.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Mon, 4 Dec 2023 07:35:14 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 4 Dec
 2023 01:35:14 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 4 Dec
 2023 01:35:14 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Mon, 4 Dec 2023 01:35:13 -0600
To: <buildroot@buildroot.org>
Date: Mon, 4 Dec 2023 07:34:41 +0000
Message-ID: <20231204073443.1543587-9-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231204073443.1543587-1-neal.frager@amd.com>
References: <20231204073443.1543587-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343C:EE_|IA0PR12MB7578:EE_
X-MS-Office365-Filtering-Correlation-Id: 586eb0aa-bb54-4624-12fb-08dbf49b8e76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Omlj6T0q9+udfnICVvwmggvx0d+pJL3NXdl0Z/sMUrCkbaKQl7YZcyBIYqeZ5xl+4tBbuGF8Ph832U7UPQQKHRXHgrZiJIUgjffIH2ogIXFg3HOyqAVrUJBe5A9+fr8p7kP2x2HxhyQ5rEvGzlMvqKUqoTjrf8QwuZyNgq60X4sdtkVjNLc83TImQ2b7IEjBrNvOBwkopH3PA6MUE2ubOR3AnuPtUCIEUk4OaAJl9gdy+8EFzEk7bvtCN8t2HX8c8Noow1Dy+BHehQNRvGYHQSzTU8apQqvHNvn+MiqyCcAVphFL6jC6SQW5L4q+LZxbEtKiZEU5ZZvhF7NsdzobeYcf5bgbEclLscHHp+O3cXPht/5w0/Igpp0n9I8kW+cp29DxYf5LQw8U4JgM+ofE3gbKyaPVuz74tsEolCFJKStfYYLhHOG9JuH0ybdsJOhWZoAkynxyC8mRFrZin9/jTiKhpJvyI1NTIBvdeq69tKBnimn7Wi7omwPuBRAat9lslkTUaFpIW1u/uIETK590yyIca70EAFXQtu85L5aiC1H6iN1Do0eC4HB824J9jJapvJAGDxNmuboKrn3gSqpewaufj8+2aiuJoWOltKZyuUrvnUYYR4nlNgImsX83g8Drhd7qU6dh+jUrn9eJfKsZ99RixYqqsQ4sVDPBPOvDXT3eSbKGhgdCVOmOMlGi3hFCFS6t9tTItPztzoXxPCnafK36mNMy0jz+QGg9AwmUe4f4KCLcbV7yIesxgK5/Uhd+OJb6VgOk/hSvI7afNJMrTA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(396003)(136003)(39860400002)(376002)(230922051799003)(1800799012)(186009)(82310400011)(64100799003)(451199024)(46966006)(40470700004)(36840700001)(36756003)(70586007)(41300700001)(26005)(1076003)(40480700001)(86362001)(81166007)(356005)(47076005)(83380400001)(426003)(70206006)(36860700001)(5660300002)(82740400003)(336012)(44832011)(2906002)(2616005)(478600001)(8676002)(8936002)(4326008)(6666004)(40460700003)(54906003)(6916009)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 07:35:14.9486 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 586eb0aa-bb54-4624-12fb-08dbf49b8e76
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7578
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=md3+GMxnPPVjCFXrm2HLk5iZMiYtezxZExmp53SuRMk=;
 b=2MvTHddHqaP/U9Bp6y1JbE+9vnSsxdWIJljdGME52VCGQABH983E6bnxS3OKTSyXacobXuC/w84xEBJj8nxELMZXM+UaxuGFgQ+FMJgfBecrVM2WsxrgRt/wjURwjMvJV/glO/d7OlZ3HgucInWUZvuHP3h4WLvOIgWSKLiux2U=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=2MvTHddH
Subject: [Buildroot] [PATCH v8 09/10] configs/versal_vck190_defconfig: build
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
V4->V5:
 - bootgen is selected automatically now
V5->V7:
 - no changes
V7->V8:
 - bump to xilinx_v2023.2
---
 configs/versal_vck190_defconfig | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index e30bb35b74..1e2fa6d21f 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -32,11 +32,10 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
 BR2_TARGET_UBOOT_FORMAT_DTB=y
-BR2_PACKAGE_VERSAL_FIRMWARE=y
-BR2_PACKAGE_VERSAL_FIRMWARE_VERSION="xilinx_v2023.2"
-BR2_PACKAGE_VERSAL_FIRMWARE_BOARD="vck190"
+BR2_TARGET_VERSAL_FIRMWARE=y
+BR2_TARGET_VERSAL_FIRMWARE_VERSION="xilinx_v2023.2"
+BR2_TARGET_VERSAL_FIRMWARE_PDI="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2023.2/vck190-versal/vpl_gen_fixed.pdi"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-BR2_PACKAGE_HOST_BOOTGEN=y
 BR2_GLOBAL_PATCH_DIR="board/versal/patches"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
