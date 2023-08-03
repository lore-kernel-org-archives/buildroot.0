Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BED9C04A6A
	for <buildroot@archiver.kernel.org>; Thu,  3 Aug 2023 05:04:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 727E461306;
	Thu,  3 Aug 2023 05:04:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 727E461306
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6crK97VRqEuS; Thu,  3 Aug 2023 05:04:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3CDF61311;
	Thu,  3 Aug 2023 05:04:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3CDF61311
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A7D531BF30F
 for <buildroot@lists.busybox.net>; Thu,  3 Aug 2023 05:04:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E3FC6401E8
 for <buildroot@lists.busybox.net>; Thu,  3 Aug 2023 05:03:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3FC6401E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TkKPsr0pXtup for <buildroot@lists.busybox.net>;
 Thu,  3 Aug 2023 05:03:53 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::600])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E32AD401D6
 for <buildroot@buildroot.org>; Thu,  3 Aug 2023 05:03:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E32AD401D6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QChKD7x55DC6gDu5PjT+Wlf+PhuTXCVrO14upXPeCH9LEy56i1pDCsqgMtHHQpC1OfqK64WSamZKnyP5YbB/WXAM6qkG6iaDfZbNWTtPvAN9c119N68TD6c9WMPf7gsdGKIDmMvKADY5QKAijxM/LDCW1nEGtAkMRyvj9OKmLKCc+v8dcgwU+P/Lkj/j1esWiVVgaxvO5Cg1pqJnbM+k3rRCyi8pQWf3XTszlzSis+p3GuJDI1GCyOfpj7XkhW81pdGxKF8vAgHHUBhg6DQatR5PTYRjMiVqFhBSz06ds7XYiNnEWzKNrIBgL54luutLb6c1rXea/x47vo99xDWGZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K8mGg2L9SHW4B5wmOrFQV8ZGmH8EzPV43o2lmcIInVk=;
 b=arfVEmCy5aamd4sR8juB1wZU2zKlPGOgE+rn1qVp6Pa0qw8Y6iUgpkpTv2diV+2zcgxrJqNm3mSJeSPqLlB8DFfnRl/z0NfagEHRF8La5Vbh/HKq8TsfrdQByUYssYzne6rd5vJrFCEqcO4AQNlonzDrD7GQ9hUuDySy8gjKA/gg+ZEiBUWAuLUEqbJCzylHzzkCe//hbH0K3yKaXcFSo+lzafuWnS/ULwAp8++rLXF7ygRwdohGrwIGz886czITA9C13PyPwPqIVJ6LIrJWKNVFOeb0wjc1RxCB/k0VAVkEWhj25QHzzQgknUQsvtpIsZLokGoRKghsJhq64lRjQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from SA1P222CA0140.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c2::23)
 by DS0PR12MB8198.namprd12.prod.outlook.com (2603:10b6:8:f2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 05:03:48 +0000
Received: from SN1PEPF0002636C.namprd02.prod.outlook.com
 (2603:10b6:806:3c2:cafe::4f) by SA1P222CA0140.outlook.office365.com
 (2603:10b6:806:3c2::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.19 via Frontend
 Transport; Thu, 3 Aug 2023 05:03:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002636C.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6652.19 via Frontend Transport; Thu, 3 Aug 2023 05:03:47 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 3 Aug
 2023 00:03:47 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 3 Aug
 2023 00:03:47 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Thu, 3 Aug 2023 00:03:46 -0500
To: <buildroot@buildroot.org>
Date: Thu, 3 Aug 2023 06:03:39 +0100
Message-ID: <20230803050339.1347725-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636C:EE_|DS0PR12MB8198:EE_
X-MS-Office365-Filtering-Correlation-Id: 63b204a0-b987-4c0f-be2b-08db93df0544
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pijOi++CvvyXpte3nqxZLVsHxEU/mks/mxyuDRKD1VYWYZsf5ZX9aPk+TKIFdlpvQGV6cTT9f/0aPZJkPvE1S0hbcwWlF3OT2r+x9V00NPoG9wkTNAX7l8T2FH2tDsM3SEFhtP6UNlhw9KY/irsVj27CPceSiHb6EFIl4vMJHaDYuECmyN90DrFoAjONwVNYqLofy9Yzyp2lQqOucb2xM9u1ELWgGo59x8pH8K10x70di2FDAjPWpl05vds5c67IaXNosKsMTt4w2XzJ/w3jJFxLZZLxcy2/py2J+RPV4GXLnWclJrQ3i8zYBU/yVCMj/B4wO1/6Mjij8b5kBsqGHymOH1aDOEaKahBy9uzmKEVLLmHG3fO7iffC9jRFsTTj1Uo0eJi3TisBDFu+gyGi1ncMFpZLs6PO9gmrhILvsaXeHc2iKL1YsLz5PjfYVGynZgvlWHg38d1ean3POO0weoGspBKBb9sYMMV6l7H2mJ24GOqLHsiKdXKp0z/46KOpDNGBZARkv/dR/kov0F9Mf13g6MVsnpRG59fob1598zARiBOCb7ou2cPqIRJIawzEVG4dh6E5DVjD97qRF2b3obEX8C4IJN13M2Pu6BbwDT5jKWZJpznOQAm9fXl3y1O2czz/OrOmDJ/FV56p/7JTrM6p8c0uV2pVGpqG5mK7Z1d8cGnkMNgjBUWE+Fx1jDjv9ZeiOiOAdK5yPBmHZHonT5x6Gw5jmN44AD57fFFrVctWVWRkcvTrpMGGmw6gYB/0oXIcsMjy6EnF8DQ7CfsfFA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(396003)(39860400002)(346002)(376002)(82310400008)(451199021)(40470700004)(46966006)(36840700001)(40460700003)(426003)(2616005)(336012)(1076003)(26005)(186003)(83380400001)(47076005)(36860700001)(4744005)(316002)(70206006)(70586007)(2906002)(4326008)(6916009)(5660300002)(44832011)(41300700001)(8676002)(8936002)(6666004)(478600001)(54906003)(40480700001)(356005)(81166007)(82740400003)(36756003)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 05:03:47.7813 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63b204a0-b987-4c0f-be2b-08db93df0544
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8198
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K8mGg2L9SHW4B5wmOrFQV8ZGmH8EzPV43o2lmcIInVk=;
 b=WqRI24uzafNunIHWujmqlylKFkC7F3u3HpcXuZZsWwxP17hNNR8o/sWib+M5ZHRUlrg/QbkZBagQfrZJxqKpesmWqzPxbIZTw/9kWaVAEvUjjBbD/fjRreNVHVtB2wH1a7/mXk14SSil4GqRkRhDxg3IiLk6oJD5VGVbkJqpN64=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=WqRI24uz
Subject: [Buildroot] [PATCH v1 1/1] DEVELOPERS: sort entries of Neal Frager
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
Cc: thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 DEVELOPERS | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 5023ecd775..575f14d7f8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2182,12 +2182,11 @@ N:	Neal Frager <neal.frager@amd.com>
 F:	board/versal/
 F:	board/zynq/
 F:	board/zynqmp/
-F:	board/zynqmp/kria/
 F:	configs/versal_vck190_defconfig
-F:	configs/zynq_zc706_defconfig
+F:	configs/zynqmp_kria_kv260_defconfig
 F:	configs/zynqmp_zcu102_defconfig
 F:	configs/zynqmp_zcu106_defconfig
-F:	configs/zynqmp_kria_kv260_defconfig
+F:	configs/zynq_zc706_defconfig
 F:	package/bootgen/
 F:	package/versal-firmware/
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
