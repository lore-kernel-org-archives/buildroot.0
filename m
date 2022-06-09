Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 706CDC43334
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 14:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CBFC41CFD;
	Thu,  9 Jun 2022 14:06:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zKUnsEyGhbjJ; Thu,  9 Jun 2022 14:06:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D422341CF9;
	Thu,  9 Jun 2022 14:06:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4862F1BF378
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 14:06:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4492F40FF8
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 14:06:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vGN5g-FLlzq2 for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 14:06:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20604.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8b::604])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1736F40FC0
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 14:06:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BQu1BGJuTOb2QB4jW6v0/gi2tNiSInTCN1/WT7uZU8yx3MsSkriY56L/1OVuXn4BuO6sb814phtW6CHjdU9tdOCqqJDBZ3pFU27OZw516rjKgcerhpRWkSCUVdZxTF1ezWOzHOvZbBCmRsrli9qMPMSVUUxzrBmetj2vinoK2RhLay6jB1nQF3SD8FvU1RF1mNDrMUd3YQywdXaYvv7PwGQUWzLC93XmrpM6Y8ta3V+eFV51/tBDYXa5/SQIVM70P6107VCw/TkGhrSQRNEmazwFiNew+xzj+Pp+3791Dzb9b1ao3K5QKeL/LjBtmMYsfQiqIpD1V8N+pJl4ExYX/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=URa9qiavL0PtnF1h2/0PFhPiWhChnR7LRWnEIYdHldQ=;
 b=aNmLFcvq8EJ2VZeOBi7bIa8EU3Dkcku+u3R3hj1pw4kf42H6PU3rcZnfnwPJCtyej+n4b9n7f4vHqBML1wOc3nheNvaDLDahpluRhXLxd5DvVERHw/kLldkCaTUyMYUUVinVH+tnsrHo7R2QMQDGTkgMcH+pvSugLwNP2KCID3+TgEzIoIib/H2hwkZzY+fZzWCDnORx/fozc6hL5cev2D1cNTHCB7D42YU1DLtUXlmfl+WuQ9HfOkSg54+9Vu110VTfmCTQ2CZqPhSxvs/GF1HJvKQb7xZfHmTTt7MFlroRKV/rupL6XK2PDQzGuUbZrOkN1phfCrNGML0NI3aWBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=buildroot.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=URa9qiavL0PtnF1h2/0PFhPiWhChnR7LRWnEIYdHldQ=;
 b=R6Q2uiKRMW6qai3RjoHb8/RLeuV5BX2ds/QWeSErj2/JMFcDO4v77WrDnh/1PXzPWwM2SY3EPpidankRlnKHKaWVd0mDVZbi5QXHUVxK3MSzcWQW6La6JKo+V+3zNy5n7HuAPkavgmD2O3iVaxJW/o2L3oO6YbM6PrxYGTV/rbU=
Received: from BN6PR2001CA0003.namprd20.prod.outlook.com
 (2603:10b6:404:b4::13) by DM6PR02MB6842.namprd02.prod.outlook.com
 (2603:10b6:5:223::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Thu, 9 Jun
 2022 14:05:59 +0000
Received: from BN1NAM02FT057.eop-nam02.prod.protection.outlook.com
 (2603:10b6:404:b4:cafe::ca) by BN6PR2001CA0003.outlook.office365.com
 (2603:10b6:404:b4::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12 via Frontend
 Transport; Thu, 9 Jun 2022 14:05:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT057.mail.protection.outlook.com (10.13.2.165) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5332.12 via Frontend Transport; Thu, 9 Jun 2022 14:05:59 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 9 Jun 2022 07:05:00 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 9 Jun 2022 07:05:00 -0700
Envelope-to: buildroot@buildroot.org, luca@lucaceresoli.net,
 giulio.benetti@benettiengineering.com, peter@korsgaard.com,
 michal.simek@amd.com, wesley@sonifex.co.uk,
 yann.morin.1998@free.fr, neal.frager@amd.com
Received: from [172.25.185.186] (port=36204 helo=xcoapps69.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <neal.frager@xilinx.com>)
 id 1nzImS-000GMW-Jg; Thu, 09 Jun 2022 07:05:00 -0700
From: Neal Frager <neal.frager@xilinx.com>
To: <buildroot@buildroot.org>
Date: Thu, 9 Jun 2022 08:04:49 -0600
Message-ID: <20220609140449.210030-4-neal.frager@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609140449.210030-1-neal.frager@xilinx.com>
References: <20220609140449.210030-1-neal.frager@xilinx.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 61227c24-59f8-4a68-a1ee-08da4a212df9
X-MS-TrafficTypeDiagnostic: DM6PR02MB6842:EE_
X-Microsoft-Antispam-PRVS: <DM6PR02MB6842863B1295B7C2B806FA15D7A79@DM6PR02MB6842.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BsO2cacf84btxsHw2wvRId79JklxuegAKMMFvgNy6+rVbpMeU5fi7dN7KjI3MT2AQfVfvthfCKebrNdMvC+ldus0Gli1wdtg8QUZtSAI3fkbHbyX7M6v5gbfD3IDmdAky0Nu6m05K41RhujOJyV2/hxYOwF32G0+StI5ATr9Z+hX6teH/2KAupKjcwzxclPdlHwaPN+JThKIoZV0Vz01A/X/VECDT1bRt3kPgMh30X1NqgGNtEGKwxtNsJeP38uKSIDTtw/2cfEPJUU2s6TivQDUJEt2J5L7Ck11Cn6xavdHJBEoa3c01bfPPltkOjaqnq6k7FSe6+ELIcQg5TGW1FFS1x/s62AcQr1sve6yR7eqTq5Q64N0ffB8XUkyXpT5qjKTOog36+IlzcMnRN/nwtA6vAIf6x0UXHhSczOM4iqZegd26HDWc32+Z/GyBI/6mlMn+veoHfaPDNZE6dhTNXdtAeSz4nXGiVkAX6nF9en/BxNIx5+hlPv9RGIz/vEK1ThqCu6HzASdXUZ0IfylOTMIbuEGZZx5LWwuykfKn5leAEmVzhl7KaA+8r56CxGkGtZYwObFu5RAiH1tF1ePNz0XrPkWcHmxa8HhLFrbOKCevmgNXr3usQBsEDoQR4QPzUqhbxYiliMAlUkmVZ+HLrHEHDGzOBQK9KdlkA1tfa+5EnPhPTjbruwI0AckRZ4I2c/eW6HJ7JpmuPbaUCCz/nbqdmEJWvtIMdNHNu1U8qssQ6FlKWV+0oXL9S/54/ry
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(26005)(36756003)(1076003)(6916009)(6666004)(7696005)(186003)(316002)(54906003)(40460700003)(508600001)(2616005)(8676002)(70586007)(70206006)(4326008)(356005)(83380400001)(82310400005)(9786002)(2906002)(8936002)(4744005)(44832011)(5660300002)(426003)(336012)(36860700001)(47076005)(7636003)(102446001)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 14:05:59.0494 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61227c24-59f8-4a68-a1ee-08da4a212df9
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT057.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6842
Subject: [Buildroot] [PATCH v2 4/4] board/zynqmp/post-build.sh: remove
 unnecessary if
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
Cc: Neal Frager <neal.frager@amd.com>, wesley@sonifex.co.uk,
 luca@lucaceresoli.net, giulio.benetti@benettiengineering.com,
 michal.simek@amd.com, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Neal Frager <neal.frager@amd.com>

Now that all of the extlinux.conf files have been removed,
it is no longer necessary to check if the file exists.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/zynqmp/post-build.sh | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/board/zynqmp/post-build.sh b/board/zynqmp/post-build.sh
index 7387576414..0713bd1b05 100755
--- a/board/zynqmp/post-build.sh
+++ b/board/zynqmp/post-build.sh
@@ -7,15 +7,10 @@ BOARD_DIR="$(dirname $0)"
 CONSOLE=$2
 ROOT=$3
 
-FILE=${BOARD_DIR}/extlinux.conf
-if test -f "${FILE}"; then
-  install -m 0644 -D "${FILE}" "${BINARIES_DIR}/extlinux.conf"
-else
-  mkdir -p "${BINARIES_DIR}"
-  cat <<-__HEADER_EOF > "${BINARIES_DIR}/extlinux.conf"
+mkdir -p "${BINARIES_DIR}"
+cat <<-__HEADER_EOF > "${BINARIES_DIR}/extlinux.conf"
 	label linux
 	  kernel /Image
 	  devicetree /system.dtb
 	  append console=${CONSOLE} root=/dev/${ROOT} rw rootwait
 	__HEADER_EOF
-fi
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
