Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C2BDC38142
	for <buildroot@archiver.kernel.org>; Fri, 27 Jan 2023 09:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CAB10417AF;
	Fri, 27 Jan 2023 09:44:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CAB10417AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XqBZD2xoqmDv; Fri, 27 Jan 2023 09:44:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B6254178D;
	Fri, 27 Jan 2023 09:44:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B6254178D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 963241BF346
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 09:44:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 629F682350
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 09:44:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 629F682350
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xWX82nWOCq3C for <buildroot@lists.busybox.net>;
 Fri, 27 Jan 2023 09:44:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FD4182345
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2040.outbound.protection.outlook.com [40.107.243.40])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8FD4182345
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 09:44:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BeUl01ZdNohhuya+3YVo+KK7io4JV8sKh8eKW8WpD/ydP23iDshSBiuveLrFP7nPICypjWy4PYWpMWXo+YHHnNPvoRPqPkDaYG/Plyswh8N3y8/+LTQ2ABy7sw3/o9bXnUkM7aGIxkqYcFVZKE7BGJoBogRIRmekRx9oc//StW4VoAUuld48ztsYOnYiA2qUTrH9ED+7QHLA53CZJQtwg645OuO3jjGtTQk+4MWGgjgLhOunNJC+e8y08Vc0IMHGIJvaK/dGQfIwnkpuZAcTZZrvy7E89y2NHKXrdDFEcy7qY/W0S7/kAhbiT1OL6/Osa0I5uzgTIFGS9Pb9IeSibg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vFP0K/hctgMcO3kf1KEeG0OLzyIV90b8OkEDhZhgNKY=;
 b=XYYKkGnL7iVYzkqwCwy5RH/L3Kq0phvj2qJ2hk9qFGUolb5k1mZdl9AsBZj73LNbcfdpHCDLFBBT/Lhsba2h/q7CKmVaKR50L6aHpW5rp+nmAjbDwEFRasEUC71AWiCzWRIh+PHq+N7kdlRxyKVVmikfEF2RtDcrZhXEewu+qiqG+/VPUQNwE2GBNZP4Hz35W5kk0TRbG+8XqvY2q1ChrAX9HBQtX+B7zQ1jYe8j01BI+4w3huZevkI8WUqipNCl9k+DaQEKLt+QLPRqDMlkYKP8JvH1FfaVPh4w+wSrnKYHGSp0057VA/MxPlVgk5MpbMxf0WgRXr1+Q2F3KYk4Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from DS7PR03CA0129.namprd03.prod.outlook.com (2603:10b6:5:3b4::14)
 by IA1PR12MB6164.namprd12.prod.outlook.com (2603:10b6:208:3e8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Fri, 27 Jan
 2023 09:44:19 +0000
Received: from DM6NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b4:cafe::21) by DS7PR03CA0129.outlook.office365.com
 (2603:10b6:5:3b4::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22 via Frontend
 Transport; Fri, 27 Jan 2023 09:44:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT039.mail.protection.outlook.com (10.13.172.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.22 via Frontend Transport; Fri, 27 Jan 2023 09:44:19 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 27 Jan
 2023 03:44:19 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 27 Jan
 2023 01:44:18 -0800
Received: from xirengwts08.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 27 Jan 2023 03:44:17 -0600
To: <buildroot@buildroot.org>
Date: Fri, 27 Jan 2023 09:44:00 +0000
Message-ID: <20230127094400.6267-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230127094400.6267-1-neal.frager@amd.com>
References: <20230127094400.6267-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT039:EE_|IA1PR12MB6164:EE_
X-MS-Office365-Filtering-Correlation-Id: 05ebbe5b-f27e-41ad-d7a8-08db004b101b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q5SLdHPe+mboR5bKSkK/nNk/mS4VYaqY0soaByHOVxsTWEuIP2Bw6LW5otiTWq59gd87ew+ALxS2ytAqrOhqpDv9c4DJpFmRXZJudxKFc2kb4mFgjtsRUGDir3gWFaJp5BWinKd2LMyrvLXwCaK0291Ksb+wHRMcup2FPgj9AAz/TpSWvuP8JD45USBp4ufLwOd3mZLAR1ncwSWUVpmXdefLwkcf2utLHlbBk1ejW4VzMeHP1R6ilYaL6QD85K4LMl1fZOuuEhklGv0R//yZMhv2WmL5HANtwg4w3OkXLjrzfseVEAZGCjOR8wi8Hkk8UMJFXZE2bwgARG23BURj389kM53B7h5o4CjpKojeus/KvyhZK9B+UiGWCq8HHWVzMmcl6lsfT7bBWvkWgH3E+X7WgmHiH0dFPkjHMVOGNEosnpOzdS7mFDMiAeeOQc6RqLI91fuKYL1BZnbl9edGIhRAJXUV/+zq7cmT+3FXFppuey2kXrVIzgnLvLPw/LQGToBURQO5wpeXHdmxU4H9DbXQSjo5ukQ0Vy6Uji+87/O18n3+O3Xjoc8k3F/vc1c0c1bcrsL0kDlVrCmTpVKddPrpy+C4zkEP+JzsGLpkhvubgjgn9uaYK9MCCtaMJUkPVyzT8M7Stmjbr6rGe+2lvtzF8msF/QtgDN0tvfc8VeXhSVWrKHwAyY5iJimutonUXjPPoSeTCemHvtQHcmbLIoSZSjWGpwkLIXxcoQmDjp38BcXc19q0Fzg0Z/ub3w3WA3miH5PFOaIcG5o3inH3OVBFodpDIngalNyAgaeEcUxG8rFqpdDJ+tW8sWIzlPoV
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(39860400002)(136003)(376002)(396003)(451199018)(46966006)(40470700004)(36840700001)(40460700003)(44832011)(356005)(2906002)(4744005)(81166007)(8936002)(1076003)(36860700001)(2616005)(6666004)(86362001)(426003)(83380400001)(186003)(26005)(40480700001)(4326008)(6916009)(70206006)(47076005)(8676002)(70586007)(5660300002)(336012)(36756003)(316002)(82740400003)(54906003)(41300700001)(478600001)(82310400005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 09:44:19.5083 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05ebbe5b-f27e-41ad-d7a8-08db004b101b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6164
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vFP0K/hctgMcO3kf1KEeG0OLzyIV90b8OkEDhZhgNKY=;
 b=dOpZXNdTdKSLXcfNM2v5OEvvMJN2PXNskdtBmd/LrerajvYTPZBIR7TYGTok3gh8MDQQtof+JKbfdlTH6816KPycV+XVrAPLEv297vgY/sw4WwUvDJQ/88wBSplDe43AU7w7eC/KL57hOcZw3KR2QPewjDn3w6dpb4gISXWLCWo=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=dOpZXNdT
Subject: [Buildroot] [PATCH v1 3/3] configs/zynqmp_zcu106_defconfig: use
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

Migrate zcu106_pmufw.elf location from nealfrager github to Xilinx github.
The image is identical, so this patch has zero impact on functionality.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynqmp_zcu106_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index 699e528f32..88295571af 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -29,7 +29,7 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/nealfrager/buildroot-firmware/raw/v2022.2/zcu106/zcu106_pmufw.elf"
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/ubuntu-firmware/raw/2022.2_br_1/zcu106/zcu106_pmufw.elf"
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu106/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
