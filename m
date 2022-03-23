Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36693C433F5
	for <buildroot@archiver.kernel.org>; Wed, 23 Mar 2022 16:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADB99613D3;
	Wed, 23 Mar 2022 16:54:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I38xVc6rlIjd; Wed, 23 Mar 2022 16:54:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D944F613D4;
	Wed, 23 Mar 2022 16:54:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8505E1BF4DA
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 16:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7FBD7418AD
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 16:54:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LjKHil02Xbus for <buildroot@lists.busybox.net>;
 Wed, 23 Mar 2022 16:53:59 +0000 (UTC)
X-Greylist: delayed 07:59:08 by SQLgrey-1.8.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (unknown
 [IPv6:2a01:111:f400:fe5b::6f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 53BE5408C8
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 16:53:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HBbX4ws4Q4e5DqPQfGCJ/l+e5josdpHlRIfIql1GmO4UyVYOCZrfSLLyV/EkNJ6pV4W6MV1HgodSv+ONl9ORqdkVlowlDYwiGmCPrBqLM6fyda1JlSzDQ0V6xCD6b6CHUhA+ItJ2ulhOBDyFvJytjL+OdVwFmBaXJcbdcw8VmOWJrzltjSGZzIXnrPg3VrAjPmHH50e+GaBYQwSIHFQkHewsNlwImNXFmO2awwB0DuCg5H9nIiOQGa8PrOdPviOKUkTHirQnn4gOQg83pFGIx19m3+b6c7hPJJWSYfC1u2N1PNaD2aST+VKyhw7RAinK3UYmsfKAkHEJw/Su90MVyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tXPVey82x+wUAnh+OZsL16AeRVaydYXntsvv7uSJvBA=;
 b=FU+l8YJ2hN8W44+hu9CtnvRUp7GrWTrb2BzKBxQLK+ft9pz9qlfA/7Oe/8hnpJLE/2GckrFWj3NEOrgCwY8qlVQ47puFdbaeQ5rRP5uyT0cYMXnNKRVuJbc9VOvmpulErq1nPmBeKlMlY2r7oDIXP+qo04BPH0zR85FUFyLUIj7Tw707hNTzRuSdw4aBHyI8pXcgXMm+xbXQjKBPhqc/VcS9ub6qpWY8Iytc5V+JiD87nXMLjUkC5tTZxR7FwHM4XUTCOOop0oSfDiLdq+cS+5/QTBmu6GkxZnyOBImT+yTC1AAjtWIeKlxwPE5PZq12f3zBR8vX7p08DDoJNrYt6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.62.198) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tXPVey82x+wUAnh+OZsL16AeRVaydYXntsvv7uSJvBA=;
 b=Hc4qdy0gVrtWUJz3IPRBnkpdVQN3NRXCjBawgppPQjqAENJ8RbaQGMzyx4k2YOVCFCKhGtkn76dZ2fnl0OO9IXNdEdrMN+pA7PuTY2kn5/P14laxtBzU9G7Ha3JgilLh8Rq84wZREBi0hGOyYe31AbVf0RVVqOxD5Ak19MNu7JU=
Received: from SA9P223CA0026.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:26::31)
 by CH0PR02MB7996.namprd02.prod.outlook.com (2603:10b6:610:105::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.19; Wed, 23 Mar
 2022 07:20:58 +0000
Received: from SN1NAM02FT0035.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:26:cafe::d1) by SA9P223CA0026.outlook.office365.com
 (2603:10b6:806:26::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.22 via Frontend
 Transport; Wed, 23 Mar 2022 07:20:57 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.62.198) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.62.198 as permitted sender)
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0035.mail.protection.outlook.com (10.97.4.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5102.17 via Frontend Transport; Wed, 23 Mar 2022 07:20:56 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 23 Mar 2022 00:20:54 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 23 Mar 2022 00:20:54 -0700
Envelope-to: buildroot@buildroot.org, peter@korsgaard.com, neal.frager@amd.com
Received: from [172.25.185.186] (port=53388 helo=xcoapps69.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <neal.frager@amd.com>)
 id 1nWvIc-0002aM-9w; Wed, 23 Mar 2022 00:20:54 -0700
To: <buildroot@buildroot.org>
Date: Wed, 23 Mar 2022 01:20:29 -0600
Message-ID: <20220323072029.260340-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1ea699c-5413-4d59-945a-08da0c9dac59
X-MS-TrafficTypeDiagnostic: CH0PR02MB7996:EE_
X-Microsoft-Antispam-PRVS: <CH0PR02MB79968B7DED956223D5DF7642F0189@CH0PR02MB7996.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lPiW6ghCvbkcWU3gnldyTOcChvgkNk+V9zov7LfR5S4SR/tJEhSah34gOww/J/YGoEc5doSlkk3PgcXTN3ka8NVF+mMLDBoDnztsPI8+ZVJGDHQ+MJxDMUzdrn8CT/zg1yI34LZZQvC7A0KQ1jo9dzgX4nUQqQ+cW0OoHFbHa4L3MFFTGb2KLQ39Zf/+/T59vAcbHYEcSvUABHBILskq+XbP9xaf2qUfMwEer+AebDCxqZzC67+bLFY+6MEbc0qymO6dtxTnOjO4cYJTYVmREa+33vH/tGrXJYMzmc3B2G+YmfJHhha3MuBwpYZdyMjjTx+aE+mQtnyPi0cUNB+shj0b7WmdTRZKkNeIeHtox4X9JsmJY2Q9BbktLPY5pWqCFmk1FSs6/VwNgTmDULrONgPvOokcjOCJKtbP1xwrhevIWeYggoi3cqfmr9Q4BHZQ59uPFT14eoUephw84NBN0jAmovVM9kW1Y+cFliaft73m/hrytqw2t4n8ABUsc6o5ctsPqtSDaOh6Wcn3rZYby/4vSXvZWNsvSgt4Zu4IcgDuOPWnsVT7qDc8xaWtmd/uq0y5EwQ9OZnADVBIF0cwbPyAbe/nQaj2T0OzcYn7szNWMEkItQUPaluxTtEq63lxrmKqukLN8ILL/xoaJDXnhN1Jkk/X5cbr2Qa2QEmt+UiMdaae8PwKc174PVVMhX9paelESTK3DGQbulSg2dsKAA==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(336012)(83380400001)(35950700001)(4744005)(316002)(6916009)(70586007)(508600001)(36756003)(70206006)(47076005)(54906003)(4326008)(8676002)(2616005)(86362001)(26005)(9786002)(40460700003)(15650500001)(6666004)(82310400004)(8936002)(356005)(7636003)(1076003)(5660300002)(2906002)(44832011)(102446001);
 DIR:OUT; SFP:1022; 
X-OriginatorOrg: xilinx.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2022 07:20:56.6515 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1ea699c-5413-4d59-945a-08da0c9dac59
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0035.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR02MB7996
Subject: [Buildroot] [PATCH v1 1/1] DEVELOPERS: update email address
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
Cc: Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch updates my email address in the DEVELOPERS file.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 942bb8fe9c..58ed4f81cd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2089,7 +2089,7 @@ F:	package/libevdev/
 F:	package/pkg-qmake.mk
 F:	package/qt5/qt5opcua/
 
-N:	Neal Frager <neal.frager@xilinx.com>
+N:	Neal Frager <neal.frager@amd.com>
 F:	board/zynqmp/
 F:	configs/zynqmp_zcu102_defconfig
 
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
