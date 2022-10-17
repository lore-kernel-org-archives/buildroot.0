Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09902C433FE
	for <buildroot@archiver.kernel.org>; Mon, 17 Oct 2022 07:10:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A5BD340A0E;
	Mon, 17 Oct 2022 07:10:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5BD340A0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c_MBE3wVCwct; Mon, 17 Oct 2022 07:10:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CFE2A40A09;
	Mon, 17 Oct 2022 07:10:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CFE2A40A09
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9865B1BF3F4
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 07:10:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 384A5416DC
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 07:10:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 384A5416DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xpsxl7Le3uEe for <buildroot@lists.busybox.net>;
 Mon, 17 Oct 2022 07:10:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F214B416DB
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2051.outbound.protection.outlook.com [40.107.92.51])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F214B416DB
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 07:10:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hvc3Izx6Y53aSrd5jA/DQZeCbCZw1ciWWus/H5N4+02rkD6+/KjC2fsZ+icI7Vg1vJGYNMCC6pidk9jOLfMsx0Z87RMC7cq9/7WvukzYTfdvVbxynSYk3gGGv2wDLFIbHir6AOubK4rzhzCVBBXwdGbm6vE3BAdYrVHQJLyMy3WLS5qKddoKhUrUhQhvRaMuxZ07YoMGhQjn0wPeUqNLi+02vVhxHLK4RjSgT968wvX5u/Aap+1kqEq5lCEmFBMgAJ8XQqqeXoZDCakqm3ZxMtp6emZuL1k3hZNfbLqYols7QofMZc0DVSZImcam35ufLlb2JzbuFX05FeUh5jaBRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4wwSDLaM9l4J/Nz4/mJMP4/H7AwwCKRM6scBo4RaxEk=;
 b=Xn0hfAWJxhxlet3Rw4vxPzNuBzDcvMyz+RTfa8x6yUe7U1Uq4cjk5zPabnKx+ZEIdipzzNfrNB/T5xnZ/4QT3phFckmUfp3JuQnboHouBRSbhDPTqXllrldaU+gEeBbX0+IkrWmwnceRto/lHFUp67zoRcScVrE1HItVD62A1ewSF7iMlzcORxeHmfZAl6y9+gAdblKaLtoxPpxzua6nU9MZAYfOu8PMkbFPQilnjVDuWxFpzT2X1BQMXogQ6QNGFzZp1b7aK6x4sTJwi3eb6z+ZtwlWAc9DsrTSQzkXXaUTte3/rw0ORFc26WNDC5wWWsZIjNkQK4xM9Wt5YCcoJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from BN9PR03CA0199.namprd03.prod.outlook.com (2603:10b6:408:f9::24)
 by BN9PR12MB5355.namprd12.prod.outlook.com (2603:10b6:408:104::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Mon, 17 Oct
 2022 07:10:22 +0000
Received: from BN8NAM11FT007.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f9:cafe::a4) by BN9PR03CA0199.outlook.office365.com
 (2603:10b6:408:f9::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.31 via Frontend
 Transport; Mon, 17 Oct 2022 07:10:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT007.mail.protection.outlook.com (10.13.177.109) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5723.20 via Frontend Transport; Mon, 17 Oct 2022 07:10:22 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 17 Oct
 2022 02:10:21 -0500
Received: from xcoapps68.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Mon, 17 Oct 2022 02:10:20 -0500
To: <buildroot@buildroot.org>
Date: Mon, 17 Oct 2022 01:10:02 -0600
Message-ID: <20221017071002.48266-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221017071002.48266-1-neal.frager@amd.com>
References: <20221017071002.48266-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT007:EE_|BN9PR12MB5355:EE_
X-MS-Office365-Filtering-Correlation-Id: 94645f3d-05e3-4787-d0b7-08dab00ea7fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9eUaHykwJf/hDZjdkbVRtl6N0jqZtxdcNcAYXLJILd6+dkFSHoMm7Oeq1VOI0Tk5OUT0x92ExOmtlDo2Zf+v98yn06N4Jb1RG4DjNtcS4GBwPEqtpSzA9LAjdStwpbvDMePQKMohBPFNYQ567QeWgwJVVS/fiH8Al7vkbQtw5i0zEN6mHdNQLyK7ivmo/XuzqQQfWABxc3qwxOKPOsxNGAm+J06dQG4pP6TfbQA+lmcRUADXH/w/iFz9lWdqo5flIy5iwbeq2i9gAoSO5hzi0I6A3c6d8RqC6vnZZV8QkChpQdF2IyTV/WyDBSGt5YKNUaGl7BsfEfV+VdosndSnyiSOgYGDqIrnsbKmkQPLa7ViaSKHL+90a1JO9w7yrabc3bsqmLe97qii4OzeOfm9l8fdgkiKolZUMxq5rW14lX6qKm+jBUbhaEHyInIbcMLmncwUUR+Mkryp8EV1VWY/4fQeh5krNtcXcmIMjrdPNj7e75yCbGGgclfo4gLgEqNrIfk525ib5xLYeTl12zG74sX5KDpGfylSFreUdYqLPZRsxGOaLiKFtHUPgw65FtGgGohSSCwPfcAukjSqpWoCYAYiydTLyFmlagEbnckz6N4PCYleAlWN5kqpitVEXUzLcBGaHO56/evdxcBqNZsH4yv7RCEIS4InA1Xtn1i7lFgp2CEMhhUgZg38IOK8M51ejeaIckZ6VMqdPuGp6DmdOiTPrDNN7gWxsJJzsulfJ6qjH5a1ItYebZ1eKou36jcQSEI3piRp+LuMBl7wl9AsADwIg2V7DquNbdmWhaiQ3h4bR+WL+9URu7Dh2E252qAlQEn93xzMpU7GUiIWIYgzany5uQfZ+0PQ/23qanJdj/yKW131DvLiyT/i+bRKgOx8Q79+huKlK6AmxeGtk58KJg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39860400002)(346002)(396003)(376002)(451199015)(46966006)(40470700004)(36840700001)(36756003)(36860700001)(86362001)(2906002)(5660300002)(44832011)(82740400003)(336012)(2616005)(1076003)(186003)(426003)(47076005)(81166007)(356005)(83380400001)(26005)(316002)(966005)(478600001)(54906003)(6916009)(70586007)(70206006)(82310400005)(8936002)(40480700001)(41300700001)(4326008)(6666004)(40460700003)(8676002)(36900700001)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 07:10:22.0206 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94645f3d-05e3-4787-d0b7-08dab00ea7fb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT007.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5355
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4wwSDLaM9l4J/Nz4/mJMP4/H7AwwCKRM6scBo4RaxEk=;
 b=WdL8GyDddvbT6W79MAPh/9Vxxt5eNJ7RbFCCooqO5v61/YGi95Hk9ZaFuN2FQCzo7qWtR5VoIEd3ZBFiw3DIWAXZsfCIo+nAc8uT6QoAg/jcsRxo4JoypKv5NTpBMOYP3GDdCERgrEUKKTV2himwsZ6KRTAMrY+4tMd6QU5ZzY8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=WdL8GyDd
Subject: [Buildroot] [PATCH v1 2/2] configs/zynqmp_zcu106_defconfig: fix
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
zynqmp-pmufw-builder where soft resets crash for the zcu106.
Details of the issue can be found here:

https://lore.kernel.org/buildroot/87ilqccu3k.fsf@dell.be.48ers.dk/

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynqmp_zcu106_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index 3d98dffe01..896fea0ab2 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -29,7 +29,7 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/lucaceresoli/zynqmp-pmufw-binaries/raw/v2022.1/bin/pmufw-v2022.1.bin"
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/ubuntu-firmware/raw/v2022.1_22.04_1/xlnx-firmware/zcu106/zcu106_pmufw.elf"
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu106/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
