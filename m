Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47A86C636D4
	for <buildroot@archiver.kernel.org>; Thu,  2 Feb 2023 13:38:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D57EA6119C;
	Thu,  2 Feb 2023 13:38:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D57EA6119C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DLQi0KjEeMnJ; Thu,  2 Feb 2023 13:38:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3A6A6118E;
	Thu,  2 Feb 2023 13:38:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3A6A6118E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 041C51BF30A
 for <buildroot@lists.busybox.net>; Thu,  2 Feb 2023 13:38:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 811076118E
 for <buildroot@lists.busybox.net>; Thu,  2 Feb 2023 13:38:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 811076118E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NRptQAoWlLn9 for <buildroot@lists.busybox.net>;
 Thu,  2 Feb 2023 13:38:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FC5060B50
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8b::60b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3FC5060B50
 for <buildroot@buildroot.org>; Thu,  2 Feb 2023 13:38:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y+8tUr7Lsh3Xn+vH/dvIuRIoHK8Yq5NcGzxmoJRxBEL3+4dLuhSh+t/gxh+RvSLBelONb6M7wWQcxDrFJUNdL1eZmV6yvVEFlfiiaBZaE+gc61pKeza50cGAonYL1k/6DYeY8PEGz61y5BCTTXHcv2g4nrCGWoly3KNJ6pdkEpIGUoovj/ISyeV2OStKoVIEQ1IKVrC5/DEwKH0KBl64UBMwwASgyBJ+F2UMw5g8ei3e6vgWLznvEDxa9kUdrOOJ2XT94KCgc+8d7KYj1vTydZftKrTytxKk5wcpzRBDmx9go1VA7LpvbpInhBnQAnpO+aI+Bv5H27a1HZ4vxknkbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pdb1WbdiEr4Pb1t0xjXaYsqFc7cEJudCr63/tif1JYQ=;
 b=Cjr+WVwcg60WuHs5qDAUt2bf0NweCDIlj/+Sys7eDy5YRHR71GtgRulcnx7yVnxkvJybUxA86klXHVdIEBJy89fe28lfjbaBJ2GIlzsZi5wyoXfojd+CkQRDQzpUi8zY9YmZHGuDsrHRrKr98UE8bKxtMQA1c74fBLOSECHRgFdOgiheLMuIOF5AWVuASiF1HQ+E1VNKrI5ZzdlbE6atuzBZVZhg4d++DKoVTELxOiCS6eAbWOruP7z67+TA2GOq8F3d5//vTl/iDYwcAtcfK0B2ZjjVDaOSVd9kZ668jmr+WaUOFEtXZVFNHufcJRDbg4iCR7UsNtqmvmj0i1R2GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from DM6PR07CA0070.namprd07.prod.outlook.com (2603:10b6:5:74::47) by
 SJ0PR12MB8091.namprd12.prod.outlook.com (2603:10b6:a03:4d5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.27; Thu, 2 Feb
 2023 13:38:22 +0000
Received: from DM6NAM11FT020.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:74:cafe::87) by DM6PR07CA0070.outlook.office365.com
 (2603:10b6:5:74::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.27 via Frontend
 Transport; Thu, 2 Feb 2023 13:38:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT020.mail.protection.outlook.com (10.13.172.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6064.25 via Frontend Transport; Thu, 2 Feb 2023 13:38:22 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 2 Feb
 2023 07:38:21 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 2 Feb
 2023 07:38:21 -0600
Received: from xirengwts08.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 2 Feb 2023 07:38:20 -0600
To: <buildroot@buildroot.org>
Date: Thu, 2 Feb 2023 13:38:17 +0000
Message-ID: <20230202133817.56293-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT020:EE_|SJ0PR12MB8091:EE_
X-MS-Office365-Filtering-Correlation-Id: d03257c9-863d-4625-6a6b-08db0522c0bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AAul46ODOsoH9wM2y9fIrlkpv6aLbBD4xJpa2ozlIj3RI58WACiVPzF5+zUwViCc7IbWObDEJVAHCBYnnCIkt/A8FWC4ooboOoFSHpSAHSEtSsV4PDqZkmiGc2NLK1UtwqFV/vMIpr4qCHMX9pUlbZKovIQi10ZVBGYlpk3bGNeAZFFLEGzJw0aP/9FxaFXMIgkSyzmKhFgawX8wvXoI1ElbQ5YrcSsPHP31m1zepoQZrf0LNXuVdWTXnFo7WGVLx7A5b8+/iN9sekH+682P1EGrzXVJ/aFwrlkcLXObh2ArpL2xgrdhJtvJ7VxNC6eki4kgHIyoKMf5ByTWUvvaY1efurovFgigIei87TU/z8yjOHj9qDNlvmAiFq9MK6U/L9FHBe+5+TMCrJoHnwLcv6qdRHtZcPCcrcvxx7W3tIZmiH9/ZMbOx2pnc7F3Kf43jSEV6GBgkuOZ8SYMMwbk7+eZgBItGOXm1qpCdoYRuxfI9dQ77IurrdWUwR0Z1rIRnRudR/b/bNautmiU1y+WVC/3MoBj84t3VIeXy2BDue7QLYlLS/4pKEkNpjGy0hCGeoXqD6k+D2CWcEnZBz0JfA9T+tlzEOct9Ywz/+vsEXs+bAzZwArISacI4AOydh3aWzGITo4OzTcm35pmlfsvYXpyN+b9duFcAElYL1k78fHB2WdaRL5hIg0V/dzxZhOQklm20Ln/S9tGyRp5Yq4Cfi46z6CqtYTNEvNvk7p15zFNF1aiziF6+Z9+sXs9NqS6JzEUBOELlcteIVEo47fOSKwNXMlb4GA10e8+4XChrxs=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(136003)(376002)(396003)(346002)(451199018)(40470700004)(36840700001)(46966006)(40460700003)(36860700001)(478600001)(186003)(26005)(54906003)(36756003)(966005)(1076003)(82310400005)(316002)(6666004)(5660300002)(86362001)(2906002)(44832011)(8936002)(4326008)(6916009)(70586007)(70206006)(41300700001)(8676002)(40480700001)(336012)(2616005)(426003)(83380400001)(47076005)(356005)(81166007)(82740400003)(142923001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 13:38:22.2810 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d03257c9-863d-4625-6a6b-08db0522c0bb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT020.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8091
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pdb1WbdiEr4Pb1t0xjXaYsqFc7cEJudCr63/tif1JYQ=;
 b=ymFMIWgZ7kaxoSw5RS/ncH0KsGc5gYyq2GmIok/JLWdpN1ymhU0lOu+GTu4Tu/K513+2aCw1reiypENHJWpZtY15bJTWU5ewzusakyhj0ZESH4uTxJPvRNWQrG5VMHU9csREPmWTO0L5b1kxN1tKNSapJU0YM6tpkwrsVXzlJyk=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ymFMIWgZ
Subject: [Buildroot] [PATCH v1 1/1] board/versal/post-image.sh: do not
 require xilinx/ prefix for .dts files
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
 gsmecher@threespeedlogic.com, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

If using BR2_LINUX_KERNEL_CUSTOM_DTS_PATH to copy .dts files from
buildroot into the linux tree, these .dts files are copied to
arch/arm64/boot. Unfortunately, the post-image.sh script expects to find
them in arch/arm64/boot/xilinx.

This patch does not require the xilinx/ prefix to be present when
symlinking the device-tree to system.dtb where u-boot expects to find
it.

It is effectively applying the below patch for zynqmp to versal as well:
https://patchwork.ozlabs.org/project/buildroot/patch/20230201195956.1758827-1-gsmecher@threespeedlogic.com/

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/versal/post-image.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/versal/post-image.sh b/board/versal/post-image.sh
index f45f29a155..92e65ed3b7 100755
--- a/board/versal/post-image.sh
+++ b/board/versal/post-image.sh
@@ -5,7 +5,7 @@
 # devicetree listed in the config.
 
 FIRST_DT=$(sed -nr \
-               -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/([-_/[:alnum:]\\.]*).*"$|\1|p' \
+               -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="(xilinx/)?([-_/[:alnum:]\\.]*).*"$|\2|p' \
                ${BR2_CONFIG})
 
 [ -z "${FIRST_DT}" ] || ln -fs ${FIRST_DT}.dtb ${BINARIES_DIR}/system.dtb
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
