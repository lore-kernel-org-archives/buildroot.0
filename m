Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21508C433FE
	for <buildroot@archiver.kernel.org>; Mon,  7 Nov 2022 13:15:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7703A60A92;
	Mon,  7 Nov 2022 13:15:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7703A60A92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rMSaa53lT1VK; Mon,  7 Nov 2022 13:15:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EF2D60A81;
	Mon,  7 Nov 2022 13:15:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EF2D60A81
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5B5891BF29F
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 13:15:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 16B67405CD
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 13:15:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16B67405CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VsKyGoYrNFTT for <buildroot@lists.busybox.net>;
 Mon,  7 Nov 2022 13:15:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3AAB400D6
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2073.outbound.protection.outlook.com [40.107.220.73])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E3AAB400D6
 for <buildroot@buildroot.org>; Mon,  7 Nov 2022 13:15:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ERwFndfQeFspUFLG1+7jwOw3uKTmHDA/oG1kUTtGPQTSRc7tiyDWU0yOoqZH4gNwAB9EX2ARPHwn0sqNu4tZQ3WT2/3YzbM+DRun8DGRgtDcEtZ7Uira+/kWzcKSCMhNa3N90jTJA02+FaWrHwITNoUL+tldO3wdlxaco3Qjq0y3CFsDgwdLH47gJr1ASS+bcgXZe5XjpczzTNzWq5aebNRr2Fq70trLJ4UOCAm6/dnXUUwjeQduqiVSBADjwmifPMPOwtViSWtgr6wRFMhYlKjNJ7RyqB0SrHq9e6PWdi2JmanRYHHy67LPQ+Xi/fN0lBSb8h/94bVgYJW9jklwPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T+Aw1Ocon92d5e6i4naJ+BKv27BuYD3nIyiPxVW8Kug=;
 b=NyDHTtIPrbW0H3aSqAmf8gqSAcwPAD/pSYv0WXrMvgIOhyzNeg/iGsfJowkHA5+lmGwbcHT6fH8GmuGND6VVc0e5H3Uw5bNWbmb1Auix3moVkezVwZdebTzL2lzszRAYHTTuGQ10tt0E6YsSI6PuuHpASH5jcYY/aXpzoriYvJyhHrHCw68Q0AA8FlY5SJxxIXmV+2KnllMuwi65xANwf9kzKuMqE7pnaSdjnss6aqqxwl5CUOXpEj551Iq7O21/FJprrxRRjRtuTWsdGA+51OUfXxlRCuzyqfTepxBBc1jM7AQXvy9C6zaq40WmmsQW1zoeI+DC8m45qFnGwwdklg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from MW4PR04CA0363.namprd04.prod.outlook.com (2603:10b6:303:81::8)
 by IA1PR12MB7758.namprd12.prod.outlook.com (2603:10b6:208:421::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Mon, 7 Nov
 2022 13:15:49 +0000
Received: from CO1NAM11FT112.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:81:cafe::ba) by MW4PR04CA0363.outlook.office365.com
 (2603:10b6:303:81::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.25 via Frontend
 Transport; Mon, 7 Nov 2022 13:15:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT112.mail.protection.outlook.com (10.13.174.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5791.20 via Frontend Transport; Mon, 7 Nov 2022 13:15:48 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 7 Nov
 2022 07:15:47 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 7 Nov
 2022 05:15:19 -0800
Received: from xcoapps68.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Mon, 7 Nov 2022 07:15:19 -0600
To: <buildroot@buildroot.org>
Date: Mon, 7 Nov 2022 06:15:16 -0700
Message-ID: <20221107131516.18488-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT112:EE_|IA1PR12MB7758:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d2bbdf8-d016-47f8-0a89-08dac0c22fe1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O6j7GlXQ5qMubgy5sTBUyJ6QuExKLRt4maasDCYyC536DlxvOcboJ6/DkjfkhaO6Ymw3i55fwy+moiEicQrOiovgdOFtSVSeKjVWy7hchR9PVQxiJwSxnKv7vO+K50jORhHO2qdwls+OSjNFS5qRynhpklaWlpM5+T9yzodsUt4C8jhfXcd1NWw55MjpHybTWuZleefv56+Vzx7bBw3aOC20Mjk5LXosm7LIvBCW/jONANYmfJ/0sTbatO3dFG/0b98hmhN23sZY8K2GCWrK2sVA0yVbxEPkMHqSQj/WK3pY1VqAw9F2KHA0OtDL7eqwOKQLE4lsvboUJ2B5gkW9JH7RvRN+sVOcSMPHiNnr05ARhJ1/KTYnFDkY3Z1CXS1gErGSLMsNjv8Y9/tTi5B+tQdYiZdpXiBvICmo2kEC3XGn2Aaw+Q6VgOaj4B6wns2ns9AHemPApy8jGbTvTCO+2G686f2vM28oAXfucRWw+nnpDzNxkmvoA9AwMu/wgrP/BR1s8aAT0eU+fWAsRxW+058p802i6UJhMlyjRwYmXU5SM1kdGdP++lFCKKc8LTcd1A94BSlbQUOAzaWI5MBmXdqAvxuq50Mi12kuWJTQVCJaf/zgqh6F3uyCU2SISRXCZwUtP8XUkPZk+HKIp21TgQPrmImONmrpvZK6jHgWjTB02ysJt1TNNG2jJY5H3xIwcBeak1gPXWBLvEB4I7sLO9Rt19n9uzshOqaj00lrOq7861Yep8JHaqVS6aRn/H0xswAnyjJfcTFvFSm3nuBzcEG7Mk9O/YDG3rkyGHF4/RaW8JvMmTkN+cNhIenYfUh9
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(396003)(136003)(39860400002)(451199015)(40470700004)(36840700001)(46966006)(36756003)(6916009)(40460700003)(54906003)(86362001)(8676002)(2906002)(4326008)(70206006)(70586007)(316002)(36860700001)(47076005)(83380400001)(426003)(2616005)(336012)(82310400005)(1076003)(186003)(356005)(40480700001)(478600001)(81166007)(26005)(6666004)(44832011)(82740400003)(5660300002)(8936002)(41300700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2022 13:15:48.4093 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d2bbdf8-d016-47f8-0a89-08dac0c22fe1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT112.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7758
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T+Aw1Ocon92d5e6i4naJ+BKv27BuYD3nIyiPxVW8Kug=;
 b=HLJTfT0GCNgtwTV4c1GLgHq4ODd4aqRIcR1hSa+zURg1AIYmrP6OdWQnyrOa23ePnlpDCsMaGEqlWYF4GS+NWSEPnrSqlN/3DQIi5dmJlJu4JjZYazG1LW/JUTwhwCTZAs0/aas26/HPox27ssfXrCRLJS4BhgXtBkErGH4km2g=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=HLJTfT0G
Subject: [Buildroot] [PATCH v1 1/1] configs/zynqmp_kria_kv260_defconfig: use
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS
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
Cc: luca.ceresoli@bootlin.com, wesley@sonifex.co.uk,
 thomas.petazzoni@bootlin.com, Neal
 Frager <neal.frager@amd.com>, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch migrates the u-boot device tree definition
from uboot.fragment files to use BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS
instead for the zynqmp_kria_kv260_defconfig.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/zynqmp/kria/kv260/uboot.fragment | 1 -
 configs/zynqmp_kria_kv260_defconfig    | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/zynqmp/kria/kv260/uboot.fragment b/board/zynqmp/kria/kv260/uboot.fragment
index 874eb470ac..33c074ab8d 100644
--- a/board/zynqmp/kria/kv260/uboot.fragment
+++ b/board/zynqmp/kria/kv260/uboot.fragment
@@ -1,4 +1,3 @@
-CONFIG_DEFAULT_DEVICE_TREE="zynqmp-smk-k26-revA"
 CONFIG_SYS_SPI_U_BOOT_OFFS=0xF80000
 CONFIG_DTB_RESELECT=y
 CONFIG_MULTI_DTB_FIT=y
diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index 25bab4cbb4..522dc79e6c 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -25,6 +25,7 @@ BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2022.01_2022.1)/xlnx_rebase_v2022.01_2022.1.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/zynqmp/kria/kv260/uboot.fragment"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-smk-k26-revA"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_SPL=y
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
