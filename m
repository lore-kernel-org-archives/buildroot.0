Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA2DC433EF
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 07:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0659083495;
	Fri, 13 May 2022 07:15:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uBrjzgSjRPHV; Fri, 13 May 2022 07:15:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1049782733;
	Fri, 13 May 2022 07:15:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DF6B21BF357
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 07:15:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB94F40120
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 07:15:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EZ1vLib1d_7A for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 07:15:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20617.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::617])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 398CC405BD
 for <buildroot@buildroot.org>; Fri, 13 May 2022 07:15:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oP9UHW2FH7q62hJetBGA49wxDuLu1Wy6hCAIV1PpMcfV+vQ+SY3SvNQN/1CHJJq5GsM9wcbnY5CrkWQx1s3oUmNdQ84JT2zVyoCFP/WeZXKdwNK5rmUJ6O3TLFdRYnPG73iZ32kLoALHZ3Vv3QftVmStz/ji+pwWSQdVj1yMQttwpKzgVCTYGvAdjP9eOX34foooxr5ccS7/CLvtxDccFhtZataVvQTCEimixaJVs9lXD/DWAqSYPo26JJZ2W/Sn/c9KmntVRxP+HaajFNGu/YaIhmPCE/uI9Yynd83qshvt9sy3jCQBDHcl6qy3jBIV3d2gfIqSfwrmroPNyNyzkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AQNYJamuAwL7PqZhatZJGpCYkaL59JPVq1u0Z3Ax9OU=;
 b=QvINwU79JuvjhVgh2ZbbFn4HhPSNosJxtUDoylVpg2wiHi2CsuyY7qwQGKLzA0yEAtflYA+YNoyuNkJXF9iozbGhvewXg19Z8Ot1n5Ji6+AjmcJE/EQO/niWn4Qw7i5G5ViRFRxNwAqyd4WmID7jYxwrxVF9VOzZfkrjL8+y2ECZoQ/dP4IXvfApdUShzGalEy9b/7FLgyYVMCLQvVhtcee6/ZGajZw981mysPB2fNuSpSFc8qA3S4jqWDyXv6n54HAaacQBOvx3b5Ksy560bVzA0heUnlaAbLh42B+93JEBvFUEkxSVE1Q0S7fkLFz/lFxBm5FilpwqPwc4Y/jDrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.62.198) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AQNYJamuAwL7PqZhatZJGpCYkaL59JPVq1u0Z3Ax9OU=;
 b=VN6icxgsf7VMxLSM5wRzU6QFMGwJHFHYIXCDsi22jBzd5EKCkE/q5+kF6qk6L8lYRtoNBEl8rIFfYBvmRvcgJbK3/VWCW6rRLtr6bZUMax3UgIU4NBUMzidvQ/1vOi+l1tcryN32vUyW1PJxQLn7csuFG83eI/jsfeo5a+HVnFw=
Received: from BN9PR03CA0157.namprd03.prod.outlook.com (2603:10b6:408:f4::12)
 by DM8PR02MB7992.namprd02.prod.outlook.com (2603:10b6:8:15::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Fri, 13 May
 2022 07:15:18 +0000
Received: from BN1NAM02FT050.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:f4:cafe::ed) by BN9PR03CA0157.outlook.office365.com
 (2603:10b6:408:f4::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13 via Frontend
 Transport; Fri, 13 May 2022 07:15:18 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.62.198) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.62.198 as permitted sender)
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT050.mail.protection.outlook.com (10.13.2.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5250.13 via Frontend Transport; Fri, 13 May 2022 07:15:17 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 13 May 2022 00:15:17 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 13 May 2022 00:15:16 -0700
Envelope-to: buildroot@buildroot.org, luca@lucaceresoli.net,
 giulio.benetti@benettiengineering.com, peter@korsgaard.com,
 michal.simek@amd.com, wesley@sonifex.co.uk, neal.frager@amd.com
Received: from [172.25.185.186] (port=60776 helo=xcoapps69.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <neal.frager@amd.com>)
 id 1npPVl-0005H2-5l; Fri, 13 May 2022 00:14:53 -0700
To: <buildroot@buildroot.org>
Date: Fri, 13 May 2022 01:14:44 -0600
Message-ID: <20220513071444.2966858-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220513071444.2966858-1-neal.frager@amd.com>
References: <20220513071444.2966858-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2a6b98d-c2da-4a05-638d-08da34b05591
X-MS-TrafficTypeDiagnostic: DM8PR02MB7992:EE_
X-Microsoft-Antispam-PRVS: <DM8PR02MB7992509C7125D0A2E3964145F0CA9@DM8PR02MB7992.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y8oGUBlFIIzowQZn2j6uG3fNqKY2FW1ZJ+iSNQb0aSKn+dNe1DTn5CaL5PGEv762fkykrO6PRFI8a1MFITiqQMiMOssdEzckdKwTrcw9VGu/KG5fcAUIZXQ7DHTE2xeGDjAu7pWaY65BNdodPjDfKWa9hsIH3TNwmhPGAWL/OVlQUZ8MSzxBRab1ajZgWgopsoER3q/XL7IB5PYryueqIEvwhyNEi8pfxSH5mQVSprn7D+luMypCMtvhZI9RWmORBUzvJRb+nlWIQJMKQVGdMmcHRneCaC2Q38FUnajeg2fanYP/RDyqpR3rPPcmZPZ03j3uKzuLQU9z2ClySwDLvulS3lsyfX/CU7mkltfdBWhcLV2kis4Zh7hffhdiZWW8on7UqTJQrK1ayyIq8wNsyMlmHz0GHyd9bN9icK5Z9CTrDhQ14NRKPAdSIZfpe8r7aEnd77hWMj9NGB2qkkHwmx35SRAKVDpNFR+2eW+BoHCu2B3aa5Wmt7E3HfuI+VqSmx2CETme5qwvPiXuv5M8n27v6GGTbtbvD38Q68bomXwzHGMi9a48gtoudnmxeVLl8uAZYTclcSmYng5xARRGW4tWNk/fg1o8QFYD7fcpNu7FGxFiKywyVeSdSinizmgwR6QGxB+4rC8F8aqtmvGz7mbUKq5MP6U+t1gQ/jO2smMHCzb5E8ij7mvm4bT/6MzsymzdatYiVr0SuZ2VICdoog==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(4744005)(336012)(70206006)(70586007)(86362001)(26005)(47076005)(5660300002)(35950700001)(44832011)(508600001)(40460700003)(54906003)(8936002)(9786002)(356005)(36756003)(82310400005)(4326008)(2616005)(7636003)(6916009)(2906002)(316002)(8676002)(6666004)(1076003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2022 07:15:17.9420 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2a6b98d-c2da-4a05-638d-08da34b05591
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT050.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR02MB7992
Subject: [Buildroot] [PATCH v1 3/3] configs/zynqmp_kria_kv260_defconfig:
 build atf with uart1 console
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
Cc: wesley@sonifex.co.uk, Neal Frager <neal.frager@amd.com>,
 luca@lucaceresoli.net, giulio.benetti@benettiengineering.com,
 michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch fixes an ATF issue by building the ATF for uart1 instead
of uart0 for the Kria KV260 Starter Kit.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynqmp_kria_kv260_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index d4a72a0d19..cc01fb9155 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -16,6 +16,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.6_2022.1)/xlnx_rebase_v2.6_2022.1.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="ZYNQMP_CONSOLE=cadence1"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
