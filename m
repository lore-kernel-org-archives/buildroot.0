Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B71DEC433EF
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 14:05:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46796610F1;
	Thu,  9 Jun 2022 14:05:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fNQY5K9NpPFP; Thu,  9 Jun 2022 14:05:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B5DA60EA2;
	Thu,  9 Jun 2022 14:05:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6A4441BF378
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 14:05:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 59AB883F81
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 14:05:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CtfKUJ7BpXMb for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 14:05:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 321FF83F86
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 14:05:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P90qXHLqXdI8IFxgIXSm+qizRu3DxbgOBOMZ1+EK5ne1R1XVQl/5ORcdpmnjPWGowS8o9p1siPSxLFy7TZFBwzsVKrZ/uuBunc7cIV/c4RNOaVoK1PM/KwOHlvje5jaqDC2StbxD+1F2A2Ed/LAoChq5roGfm41r7haQ7MkrE+tyuo174BYABDKp+A8kixP1l0SD27JUP5zF77S2h2DWaVMggPvAdppX7TS/M8o0Ol+Vqd11Nq3cD1Tbt/qvMvXjYJwteFrChSYeuzv/enpuZaJweLlVTP2AlLZ6+Ju2xN1lBDPm85rDHNm/sQOUlkrfKdKaP6+NEUoa/WTbb3uRbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rBW7/bR4ThISYy/NqxxdqHNGFi+rX1nN2Z9eak0zieE=;
 b=VcH/FKVSCXNMkl8w41b1u+zFbGHG/wyA9hQXL+tYFyquph4/JFzMiZOz920qQIcGe4icShZ20wn0YKth/nQKiVtMXn+z65SDFN2rUC1JbiQfZNiuLwlzxhRm+h4hFsunAgNF/K1L7Dy7SpTMMzdo51qbxyQEeCXBglmx/SioX9pJvuzwRhW7628B06RgWh73WOa4CivG4KLkbeMbTL+UNC0wUx2wtPOBtTsvP3KB45pTN5t4HKy4ufyB9b6RHTRz/d6OztVNqEVqJAgKg6QmLXMue5lP8xv/RrbwAb0K69d5hYrU/k3U3JO2aGxeGgSCOfXx7eUxD8EjlYPLtduH5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=buildroot.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rBW7/bR4ThISYy/NqxxdqHNGFi+rX1nN2Z9eak0zieE=;
 b=Lip/PeGPLcAUiRx9FXoQ8gC7Y4oZGlWjYQS6yQPRUvzKdwHYCTv82wsRoJhGARLZ2hzjWV3tgYMaCW+6VCPZDWNwIPef+YnVswLa6MwNGyLar0wLJzTRuT/xcEHIWwMKBTH1AGZatuYJIyD9pOOuHnL06O2HJM1CiZNTwzh87oI=
Received: from BN1PR10CA0013.namprd10.prod.outlook.com (2603:10b6:408:e0::18)
 by CO6PR02MB8722.namprd02.prod.outlook.com (2603:10b6:303:135::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Thu, 9 Jun
 2022 14:04:56 +0000
Received: from BN1NAM02FT007.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:e0:cafe::aa) by BN1PR10CA0013.outlook.office365.com
 (2603:10b6:408:e0::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.17 via Frontend
 Transport; Thu, 9 Jun 2022 14:04:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT007.mail.protection.outlook.com (10.13.3.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5332.12 via Frontend Transport; Thu, 9 Jun 2022 14:04:56 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 9 Jun 2022 07:04:53 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 9 Jun 2022 07:04:53 -0700
Envelope-to: buildroot@buildroot.org, luca@lucaceresoli.net,
 giulio.benetti@benettiengineering.com, peter@korsgaard.com,
 michal.simek@amd.com, wesley@sonifex.co.uk,
 yann.morin.1998@free.fr, neal.frager@amd.com
Received: from [172.25.185.186] (port=36204 helo=xcoapps69.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <neal.frager@xilinx.com>)
 id 1nzImL-000GMW-6j; Thu, 09 Jun 2022 07:04:53 -0700
From: Neal Frager <neal.frager@xilinx.com>
To: <buildroot@buildroot.org>
Date: Thu, 9 Jun 2022 08:04:46 -0600
Message-ID: <20220609140449.210030-1-neal.frager@xilinx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb57b377-b53c-4d60-b190-08da4a210867
X-MS-TrafficTypeDiagnostic: CO6PR02MB8722:EE_
X-Microsoft-Antispam-PRVS: <CO6PR02MB8722408663AC11DC5B29FDF4D7A79@CO6PR02MB8722.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b5hN7DAdlb4R50hrmLdPLDivU6Kat08vaY1ea7baIQRz/amENqRyAD8+1KfpHPcx+SN/mSO0xxj1F+xFHngFBpT/G+SOsxMfW/6vP9n8fAmUK12Swa4dz8NiYV2qshKgarsGUHq89oLyh6JQmIUsNqt/0zq9QThJNogof+WG9kbo7xrEOuX5oJrsaimy9shYzeu6BDOZSaPotywe+z0poQwmyZ1+FzO1ZfC/kOnjXwLrArvsh0yE64cITml1PuwrqbY6rUZVK7brH5GS4NAn0vrqCAzU0f775C35ATPSIIV9f9ctf614db+2Qma/A3j/9aRhOjbm7vExXGeCj0oHog9aZ4CQfNgB6mDvmVgdxKNO91fTgy7GypIhCBdGGR5gOWstWKn7llp/kxv/exAmfxgbQKpX7yXj9+/grEYI/DXnl8cuJw+igGg9exwnTOeCkiMK0ZYM68JAyQQngd7dOPPEz12+V6GU8+0o8ApZRea3MCpr6EQClqiKmwOfCgOQbTrDzKHStaHykxu04BXnE3TMq4FFmLG/6obgkQVHkGSLwfXPBmiIr3VfHCtAVw9Fqu7j7/Ux46dJOEAMDmrLigcWGPK4rkgBJq8iT2BATGY99EZ5D8VZD2YEfg5KuY0mmQlRjQ1Tk37LkUWhCJLVLvA+F3aNRGpiFnxYWdqw+3wJTrcnOz1SP93UGVBBydKnFVp/zA/ttuMKbY07hK8kTpZlWR6lyfIM7K0X9IeYWMDbeFWOV6z8NTUahBrTeMUH
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(1076003)(6916009)(5660300002)(54906003)(2616005)(36756003)(44832011)(36860700001)(2906002)(186003)(40460700003)(356005)(7636003)(9786002)(8676002)(70586007)(47076005)(4326008)(70206006)(508600001)(82310400005)(26005)(316002)(426003)(336012)(6666004)(7696005)(8936002)(83380400001)(102446001)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 14:04:56.0173 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb57b377-b53c-4d60-b190-08da4a210867
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT007.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR02MB8722
Subject: [Buildroot] [PATCH v2 1/4] board/zynqmp/post-build.sh:
 auto-generate extlinux.conf
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

This patch uses the BR2_ROOTFS_POST_SCRIPT_ARGS to auto-generate the
extlinux.conf file, so developers will only need to modify the
board_defconfig file to change the console and boot file system locations.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
  - generates extlinux.conf directly in output/images directory
  - uses "cat <<-" option to remove leading tabs
---
 board/zynqmp/post-build.sh | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/board/zynqmp/post-build.sh b/board/zynqmp/post-build.sh
index 9fd8bbf2c8..7387576414 100755
--- a/board/zynqmp/post-build.sh
+++ b/board/zynqmp/post-build.sh
@@ -4,5 +4,18 @@
 # in the binaries directory
 
 BOARD_DIR="$(dirname $0)"
+CONSOLE=$2
+ROOT=$3
 
-install -m 0644 -D $BOARD_DIR/extlinux.conf $BINARIES_DIR/extlinux.conf
+FILE=${BOARD_DIR}/extlinux.conf
+if test -f "${FILE}"; then
+  install -m 0644 -D "${FILE}" "${BINARIES_DIR}/extlinux.conf"
+else
+  mkdir -p "${BINARIES_DIR}"
+  cat <<-__HEADER_EOF > "${BINARIES_DIR}/extlinux.conf"
+	label linux
+	  kernel /Image
+	  devicetree /system.dtb
+	  append console=${CONSOLE} root=/dev/${ROOT} rw rootwait
+	__HEADER_EOF
+fi
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
