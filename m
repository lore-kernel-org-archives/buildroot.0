Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD81EC54EAA
	for <buildroot@archiver.kernel.org>; Fri, 27 Jan 2023 09:44:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D06A611F1;
	Fri, 27 Jan 2023 09:44:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D06A611F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bl9SjrnMls_q; Fri, 27 Jan 2023 09:44:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A564D60B8C;
	Fri, 27 Jan 2023 09:44:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A564D60B8C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DB9BA1BF346
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 09:44:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C0B0282350
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 09:44:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0B0282350
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q2jAcVPn3UAq for <buildroot@lists.busybox.net>;
 Fri, 27 Jan 2023 09:44:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99C1482345
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 99C1482345
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 09:44:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RrfElW25cZouTY6FSnDfa8NiFIrHwRRobNReD8Ji5Qht5FbhVMRlVs5jjkYAorgIRfM90KMiWHDl/acq6QE+Rkc7maLusvdM0GQH6mLYvGY9GzVL5hmWmEAUwq5CjJxNSD0FFrRk2Eul3nSxo2VeiR+UiMmp11xBz3CD1QZkpWX1hv5dA9Slpy6ZsMvtiJjs5txiKGCV+iBB9ktH8FLnABtEhak4EHSaLrDrWX1pswa1pg4uE8wtJJfbEZfQmVMFepz81gEFM6s2fDqHG6PvraDvWd1sA38fs9qVSKI5VMONnI1C34lbQ/dCEbkjw/PHlOQtg9hUZ80FwgK6xGv+GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q52aJPaz3nzDgPIUuO30/GFbII1F/HBktyC6iXigrZw=;
 b=c5KHptzvzMGZumOtr1m0UronJCbcoo4tG16NKxMVgP3tXKCNW4h3y1XYw1PLpoRuVUxVLb8txqKLI2nlaELfQtxXEV6v5kj8XXMyg0QSzSoeXUEBNvq8QdWlrZzSnhFCLJTVWwWDY/rMwVtvKt0dGR5eeaQO7GhApyUkbN9T58gTJ2+5U65GXZjQWD6wD6EiXqdwv5n0QDISml4G+unUXg5QJeeLffC6thNJok/udFsb35IelAmtOrTAf7yciKxAd3ph6hXuu/eUBKvys77Pi7GpQqIbtQPYipJ1I1nFI1MilB5bYUn6TFZGf0nmICFw17Ts7Q1fLiLbnuumUXU+Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from BN0PR02CA0048.namprd02.prod.outlook.com (2603:10b6:408:e5::23)
 by PH0PR12MB7815.namprd12.prod.outlook.com (2603:10b6:510:28a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Fri, 27 Jan
 2023 09:44:11 +0000
Received: from BN8NAM11FT106.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e5:cafe::f8) by BN0PR02CA0048.outlook.office365.com
 (2603:10b6:408:e5::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.23 via Frontend
 Transport; Fri, 27 Jan 2023 09:44:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT106.mail.protection.outlook.com (10.13.177.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.22 via Frontend Transport; Fri, 27 Jan 2023 09:44:10 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 27 Jan
 2023 03:44:09 -0600
Received: from xirengwts08.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 27 Jan 2023 03:44:08 -0600
To: <buildroot@buildroot.org>
Date: Fri, 27 Jan 2023 09:43:58 +0000
Message-ID: <20230127094400.6267-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT106:EE_|PH0PR12MB7815:EE_
X-MS-Office365-Filtering-Correlation-Id: c77b7d10-a335-4cf1-5682-08db004b0a99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G1Z6YlSTuucz7IpbtuYAN3d0XU+PRtOOphJY8hCoWqKgDFZcjyWvfhZhIdKylZAqNu0uL2npGV95SnXW0s1MHBbAy8TDOTYdkXg+YgKloaEtDTc+OLEOhnhXZBcFUlaWniy61Ihf4Q+SBbWtyal3RSnnnmtVxW1NfZ3S1YM4+ECbUnRbGfOHb0A81cpSJjghUqEVDzhYlRiTjVoNwxYrkas8r0xHWsy8vddTP/EyxDxzHPigW+8q3qvHYYJUTVgE/krU3gU/MIsjndR0O3ppm8PQWFauMIOQEAnZFYikeoUjRefV9wjLnS620a0Zp8cYm7BpIOiiKO31cmRsb8RW0mcXLCdeoDqFVOhsENDmqZ2jJnsH9ptWr9QuEQ8ZTSjnM6kU8/NnU3Dkqe7YnsF+0kZ+rSwaoQCYV++n+hUZbMdBAadNyMTgbnyVmwHn/lpY+dj5YZG9Ekb02RJifl9FL6g2HsPFj3mA7zSk3tbvOo5xwOssHbqiMsGLHNPf885CMJARCGCvz69Jo502pq2SjL2/RPAKIIozphpQiayZ1Dcvy7jLb+1WKmzvY+QqoHVHBhmyeAPIYc2dk1apabQfSluel3Z5GC4aBrPlB5GMxMH+Q4e93kx0gA0+Ki/TDJMhbjwDjbmgb4Ry6lEhocjk+FDotudOzoyRKYTzdu0uEeJ71dXhMPWRODrWUv3GB7FhbNEooDCUTUl4l9io1VmcxBvw0tF6C9QsnyBugss3xt3BqrOxsPLbQrOiiNqyoL+Nxkiw5yJWSrMTwOfEwNAIxph5LAGZgEhEXvHwqghekB/lyRYQLplZeITIGRylEWFp
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(376002)(346002)(396003)(136003)(451199018)(46966006)(36840700001)(40470700004)(54906003)(44832011)(2906002)(478600001)(26005)(6666004)(1076003)(5660300002)(2616005)(186003)(426003)(336012)(316002)(83380400001)(47076005)(8936002)(36860700001)(82740400003)(81166007)(82310400005)(356005)(70586007)(70206006)(86362001)(40480700001)(41300700001)(8676002)(40460700003)(4326008)(6916009)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 09:44:10.2956 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c77b7d10-a335-4cf1-5682-08db004b0a99
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT106.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7815
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q52aJPaz3nzDgPIUuO30/GFbII1F/HBktyC6iXigrZw=;
 b=ZUquXhhb7bTz2rFerN0ONZAwp8Rz0VuN/MQeQQKeFjpZQbpjM2L8KVWlWQOwozISAv/GeEeEIN7uGJYLrwtX4S/ItBp2UYXc6fvEHXpA5YCd08oVHAxPE3k6uKZbznlHfY6sPoYWdl5rFWbBOq3VrNtQd0x7pAHO8IS1oXlRMkY=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ZUquXhhb
Subject: [Buildroot] [PATCH v1 1/3] configs/zynqmp_kria_kv260_defconfig: use
 Xilinx github for pmufw.elf
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
Cc: terry.oneal@amd.com, luca.ceresoli@bootlin.com, kris.chaplin@amd.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Migrate kv260_pmufw.elf location from nealfrager github to Xilinx github.
The image is identical, so this patch has zero impact on functionality.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynqmp_kria_kv260_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index 94631da034..e180d5e7e7 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -31,7 +31,7 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/nealfrager/buildroot-firmware/raw/v2022.2/kv260/kv260_pmufw.elf"
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/ubuntu-firmware/raw/2022.2_br_1/kv260/kv260_pmufw.elf"
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/kria/kv260/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
