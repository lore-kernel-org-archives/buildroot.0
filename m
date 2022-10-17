Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82263C4332F
	for <buildroot@archiver.kernel.org>; Mon, 17 Oct 2022 07:10:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 05A4240A04;
	Mon, 17 Oct 2022 07:10:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05A4240A04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pa5vTEU-EUNT; Mon, 17 Oct 2022 07:10:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D68D409F3;
	Mon, 17 Oct 2022 07:10:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D68D409F3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 07BF91BF3F4
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 07:10:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D50AA416DC
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 07:10:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D50AA416DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bpxU9Lsh08Xy for <buildroot@lists.busybox.net>;
 Mon, 17 Oct 2022 07:10:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B71EC416DB
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2085.outbound.protection.outlook.com [40.107.220.85])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B71EC416DB
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 07:10:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TFipbjFoMjUCqHQeI7cN5cN3py6syTstEqrAAk/AlPzyYdR91M3G5TDVLlrvPVUvuD6HiLEfXWAGD+onyur1Mvt7KjKrwe16fcX/qPV2KN2OL19Xe/F9GzJveu5jxyzK2IigRjfaCY9Trhx62EAsyF9m0ZWKqzlRCE3jrfdIuL9uCwopDZytEoWtYAkST7RvaZ+IDjSumI2qWIAuY1LU816aO29n2V0zewnmquOMdMMyAZ6LYTjRJq/F3DGsAuhm/dEcUZ5EVHL+iu6KQV/6D0xmNkD2uxeydE9/w/c9nBS+5GPI1CsHtKHgNY6L27aPneeBl6BlGUCQMGt0V/L2Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=twkFDOZQxhsxNSN7FLDbkF4CL8OdBvjmoPQFCRxxor4=;
 b=EIIsEMF07eo+B0KcfKj+G38scro9u6jaJxwTA1+2t2mQszzXST1J+MbGzFo2ScKlQQjjAPZgcB5fjTCtXWkCdbzxjBe3Ajza4Aszw1YYaSUx7zbZEI+Jpxwf8ABXlQdME9SHK/qDnzK7d+vX7IOt2XL51ybQUTdX8zppHHdcuF4CThYPyW5i1M02CKZskCKzRtk6yWZutiPDeRQEfgF1Agl7JGweWYtOvV5uC1vOlDw8NWL913i0b2ElVxQrVLXqEI7pAVQq2Z6S5gN0+uB5VcuSVGeOyFFWIRe8nKT93zjN1JdPJH4lf7OiiAp2dQ/96ic9UFxkxZQ7j63b9fJbqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from BN6PR17CA0052.namprd17.prod.outlook.com (2603:10b6:405:75::41)
 by DS7PR12MB6006.namprd12.prod.outlook.com (2603:10b6:8:7d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Mon, 17 Oct
 2022 07:10:08 +0000
Received: from BN8NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:75:cafe::c1) by BN6PR17CA0052.outlook.office365.com
 (2603:10b6:405:75::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.28 via Frontend
 Transport; Mon, 17 Oct 2022 07:10:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT048.mail.protection.outlook.com (10.13.177.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5723.20 via Frontend Transport; Mon, 17 Oct 2022 07:10:07 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 17 Oct
 2022 02:10:06 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 17 Oct
 2022 00:10:05 -0700
Received: from xcoapps68.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Mon, 17 Oct 2022 02:10:05 -0500
To: <buildroot@buildroot.org>
Date: Mon, 17 Oct 2022 01:10:01 -0600
Message-ID: <20221017071002.48266-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT048:EE_|DS7PR12MB6006:EE_
X-MS-Office365-Filtering-Correlation-Id: 844d3fbc-a09c-4766-fb0a-08dab00e9f59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xKOSau7+LRkCInOPR2L8wwRseZsk2xKozYYVzDZN12k9AoAJMnygx0D9gyIYew1j/9lTwfQfR8b4RSjYx7ViB//t83oF4dW/a/BHvJsONBiLtR5toRpHQkEhF0AQDubbWfrvTrQVVDYB7aoP3PHvuUFV8XR9es7j5a9AkCGbxcqKAoAOEI2uJDZfCs8JCC8XHRnltZciZn9dZ0NsbZtdGc11QJ4nXNmrQLmc2IHTK7L/mV0u/z1ExfSEh4VDmjYW6JLxlWuAGyAEZiZq+hABPDITvxpsvZ6mSWWKdkLbUlD0SrrbUv//PFwogCam31ZsHMOgwjzV1RatWvYZ0UCCVArdUJv95/LQmRqA68Nf/lpHYI1jg1RypX+2RYYi68KerR2tVno9n1vBm25+bPbEJjP0pyOOVZQhV0Wc/XKpIa7c8uvXpzqgaSb/MbiTcM7hotYaLK0uAIv91QZ9a9bAAZzHufRg5zZLo/HvAn/WUViC9n0jXuuHnc3UCsU03+CNCi7qeCIcENGiJp2O2jsOFDxryq/s90GSfDFuDCvc4/8UahjKd+pDAqosn8Y7nZYLsdAW1cW78gPnMe0Pu2phhaWvmPN2OYwS5FMPRBOwI2yfmGRm7BOahZrlLmMP4cqZNjL0Qc5bjl5WYHwEswmMAzPaUlUIdcQ8iKrBg8cbv2X/2X+o8HMBXeXsNomE52AP7PMkIbXw9H7A/8KTWiL+rdhlAuW3sf7DHlQ+FrHuL0DpKdnK7KewYQyaaC3lEhE/S+AvpadJVm/TZwO2moWcsJLCmUJ9CJ19OerO/AsHgR3ueeB7F56J5lq8PUBrhBzRFq7glROlEbo3XFRcVbST7FEyaoq87f75xhKDYRA3p29/1wPkyt3t7yUIVC6EGqVRelro80yFt+767v8EQhXe5g==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(376002)(39860400002)(136003)(451199015)(36840700001)(46966006)(40470700004)(36756003)(86362001)(356005)(81166007)(82740400003)(426003)(1076003)(186003)(47076005)(40460700003)(2906002)(5660300002)(40480700001)(44832011)(36860700001)(6666004)(26005)(2616005)(478600001)(336012)(83380400001)(966005)(316002)(6916009)(82310400005)(54906003)(8676002)(4326008)(70206006)(70586007)(41300700001)(8936002)(36900700001)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 07:10:07.5382 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 844d3fbc-a09c-4766-fb0a-08dab00e9f59
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6006
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=twkFDOZQxhsxNSN7FLDbkF4CL8OdBvjmoPQFCRxxor4=;
 b=4ry3+AI4jQkgltL7UcVM4vBeldUwYRqX3jDnKFHnjAY4gm8pXm+lv99pUDLQJ4eJ4JQtuXHGJAu75ulHTIY3jJpOGZhAqITtGY2Qwh9gtHdYWZlpGkEHn8sLTXnaAbPol3EQZRt+uu0wjXhLMALtAOFKiyL/1SENMekCpA9Kd8k=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=4ry3+AI4
Subject: [Buildroot] [PATCH v1 1/2] configs/zynqmp_zcu102_defconfig: fix
 pmufw sw reset
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
Cc: luca.ceresoli@bootlin.com, Neal Frager <neal.frager@amd.com>,
 kris.chaplin@amd.com, wesley@sonifex.co.uk,
 giulio.benetti@benettiengineering.com, michal.simek@amd.com,
 yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch will solve the problem of the pmufw built by the
zynqmp-pmufw-builder where soft resets crash for the zcu102.
Details of the issue can be found here:

https://lore.kernel.org/buildroot/87ilqccu3k.fsf@dell.be.48ers.dk/

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynqmp_zcu102_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index 217fa0814b..66c24c4b64 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
@@ -29,7 +29,7 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/lucaceresoli/zynqmp-pmufw-binaries/raw/v2022.1/bin/pmufw-v2022.1.bin"
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/ubuntu-firmware/raw/v2022.1_22.04_1/xlnx-firmware/zcu102/zcu102_pmufw.elf"
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu102/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
