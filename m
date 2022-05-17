Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C2B1C433EF
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 18:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27DE640CDA;
	Tue, 17 May 2022 18:39:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GpnHe52ewH2n; Tue, 17 May 2022 18:39:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28F08405E2;
	Tue, 17 May 2022 18:39:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 024791BF855
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 18:39:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E4C3B83EDF
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 18:39:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VLtsbte0Mpku for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 18:39:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E3F2083ECE
 for <buildroot@buildroot.org>; Tue, 17 May 2022 18:39:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kBn3/30Ha6g7oGt3tYgVARMcZspE4rU+7j1zP+itmWiyHKVI75YuY+3OAdeqELtxoiZUWlnDOwi1132SL4YBO7mjKEjMnpU6gPVqUDLzD4iHcnK1/1pIK7ZzfKdvO5Vnq4L792zkFGfUHhyKJvJUOQmFNW4FRBF8mxreglRTFUqG1Kcj5CP/irAlttKEebDC8GdgB52jvY1aKKX/unyl7XU4F9U8pzpVBtAJRPqe50pCxAIufFA9Gs+KKYnM3lXnWr4cCJO40p7JzUrKOeYHy7mG1CrxF3Tsy6CQv4YrVU7GIKr+hMRNzOEzpPvrwsW97/n+Ns4iKk40QrwfG4OfZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q9KYM7fWMyg19WpNFsMSfbocZpO7HqPerdgBKb5hxBg=;
 b=MoNQdO4SEvdw/YfNsobnjJy2kOszEJdzjBdoz7arZlZ6lLS2IMMvTnq0M+tugiU0Ra7tmEVeYTBazORGvCeWYA3cMh9QNaG9PBKYYYVmWClQHvGEA/AswACgMj4rfGEiad7K1wOx0u34zg7Kd4zWTWCq0glRbZ3krUXO1nGC0bUiy0diBKeHmkdz0EqeY6zygeC69AnsrzBuFFC0/19DxsDD34C1GnWTwGB81CwxJta7doiOhlsCo6cJqOBKOzbhUOThujnXxpJL9OyBCaSr5VqzPqOu0O5Nc6qVTN0AmUrvrxQ8mJPSs0nUEhku3mT1XDXu4MCw5PAhvIzpa9OzEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.62.198) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q9KYM7fWMyg19WpNFsMSfbocZpO7HqPerdgBKb5hxBg=;
 b=WXrYKb3BnokQVrUVG+a6cAEBy1dkxQn45CjZoHNxpnNJiB0tu1QBwZSdhLbZtdB3uNjWUBfFDnXrL6iHDC1Poa9Ki4+rcJXaMrpsQVA6G35kYG1U5CgNRdO+NbEttE5pV6grdZ8777uHCCHw+BqUO0dREIDHEpQxW6GpjV2AMWI=
Received: from BN9PR03CA0419.namprd03.prod.outlook.com (2603:10b6:408:111::34)
 by BL0PR02MB4946.namprd02.prod.outlook.com (2603:10b6:208:28::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Tue, 17 May
 2022 18:39:14 +0000
Received: from BN1NAM02FT019.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:111:cafe::dc) by BN9PR03CA0419.outlook.office365.com
 (2603:10b6:408:111::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18 via Frontend
 Transport; Tue, 17 May 2022 18:39:14 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.62.198) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.62.198 as permitted sender)
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT019.mail.protection.outlook.com (10.13.3.187) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5250.13 via Frontend Transport; Tue, 17 May 2022 18:39:13 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 17 May 2022 11:39:12 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 17 May 2022 11:39:12 -0700
Envelope-to: buildroot@buildroot.org, luca@lucaceresoli.net,
 giulio.benetti@benettiengineering.com, peter@korsgaard.com,
 michal.simek@amd.com, wesley@sonifex.co.uk, neal.frager@amd.com
Received: from [172.25.185.186] (port=33564 helo=xcoapps69.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <neal.frager@amd.com>)
 id 1nr26C-000BUP-89; Tue, 17 May 2022 11:39:12 -0700
To: <buildroot@buildroot.org>
Date: Tue, 17 May 2022 12:38:40 -0600
Message-ID: <20220517183842.1389395-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cdf61359-cec2-4571-291c-08da38348a6d
X-MS-TrafficTypeDiagnostic: BL0PR02MB4946:EE_
X-Microsoft-Antispam-PRVS: <BL0PR02MB4946D79872DDDA23485F37ABF0CE9@BL0PR02MB4946.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ou2gcAEj+DUAZYVq3nqKz9EH3XkcmcVB64aKkp+K+HDvRlcSi2AUg5E1Ndj1Os5Fvl/pTYyH1gINdlDotDmcNKf3hZkO07k1AtEn3S3WdUsXazkC/zGMWCAcXYh6vB51lHuK+GA4QnG5q6a+jZA5nfnPI2UTcBWOqX4cYHqOGyEzEkTYZJ4qkCpZA4Mf4E+PB6PvY+sWMFnQqEX7VOlPu25YXChrMCXafzZhJMy7gXGXu/mAjHtKNDqFE2vmEdo9Yd2yHVoYtdy4906k2sj1ue2eSWtq+ZcSI7cmAof13clC9TiiUTrla0Epj5lB29MAJSh6Db/GMpk5qsqcyMPdHF9dH2GakjrpnDstpunMSXUivf0KSRSSNgpJwwImGHtmW+1HlXHiOQIIfm7Lww30wHcbhiztPfZmMYj3Uvr3ZIZPgZuPQr/HKZY8tcG5icOL2MG58SQlQNW2Haj9gm4LgLr/Wvb1dIlVjlMVCcZsNaX+s7cETVj7c6jvdmGXBhej1lZQprvLKmhxtcyiYqYU5/3EOwwtHKVHcghRtyn4BPYs2M4TGHFnhas7W1NZxTyqXg6jqc+Spk9IG0SYo+vKvLFfyzMSVNGL7gAEuKtoGjFKQ9P7MZwwfJGijT3t7WIQp4ufRDqLN+p/arzOW/VpIA5EV10fgG/uCdgPpX5P6kgAAd2YT5097t0+YQdjqIRsgUtkRZfcE9zLe99H2YgV+Wb2cJkhS4EFAtcxGTrJ2wfNamoRgfNZm3Y2z3smDOAFJQ2Rm9Ng4bsQTNpKNq1bLLWs3pw7SL9AylREKYFGo44=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(5660300002)(2906002)(83380400001)(44832011)(966005)(6666004)(316002)(40460700003)(508600001)(8936002)(9786002)(70206006)(70586007)(8676002)(336012)(1076003)(47076005)(4326008)(54906003)(36756003)(82310400005)(2616005)(26005)(86362001)(6916009)(7636003)(356005)(35950700001)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 18:39:13.6804 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cdf61359-cec2-4571-291c-08da38348a6d
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT019.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4946
Subject: [Buildroot] [PATCH v4 1/3] board/zynqmp/kria/readme.txt: improve
 documentation for qspi programming
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

This patch improves the documentation for kria k26 som qspi programming.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
V2->V3:
  - fixes boot.bin file name spelling error
V3->V4:
  - improved documentation to use $filesize
---
 board/zynqmp/kria/readme.txt | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/board/zynqmp/kria/readme.txt b/board/zynqmp/kria/readme.txt
index a3a4b5e65a..977e88491c 100644
--- a/board/zynqmp/kria/readme.txt
+++ b/board/zynqmp/kria/readme.txt
@@ -56,23 +56,39 @@ Where 'sdX' is the device node of the SD.
 
 Eject the SD card, insert it in the board, and power it up.
 
-How to write the boot.bn to QSPI boot flash
-===========================================
+How to write the boot.bin and u-boot.itb to QSPI boot flash
+==========================================================
 
 The Kria SOMs are preconfigured to boot initially from QSPI.
 This makes these boards different from other ZynqMP boards
-in that the boot.bin needs to be flashed into the QSPI boot
-flash such that the U-Boot SPL can then load all of the
-remaining images from the SD card.
+in that the boot.bin and u-boot.itb files need to be flashed 
+into the QSPI boot flash such that U-Boot can then load all 
+of the remaining images from the SD card.
 
 In addition, the KV260 Starter Kit QSPI comes pre-flashed with
 a utility designed to make updating the QSPI flash memory
 easier.
 
-Instructions for using these utilities to update the boot.bin
+Instructions for using these utilities to update the files
 in QSPI flash can be found on the wiki link below.
 
 https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/1641152513/Kria+K26+SOM#Boot-Firmware-Updates
 
+Additionally, it is possible to use u-boot for updating the
+QSPI with new boot.bin and u-boot.itb images with the u-boot
+commands below:
+
+Flashing u-boot.itb:
+    $ sf probe
+    $ fatload mmc 1 0x1000000 u-boot.itb
+    $ sf erase 0xf80000 +$filesize
+    $ sf write 0x1000000 0xf80000 $filesize
+
+Flashing boot.bin:
+    $ sf probe
+    $ fatload mmc 1 0x1000000 boot.bin
+    $ sf erase 0x200000 +$filesize
+    $ sf write 0x1000000 0x200000 $filesize
+
 It is possible to boot the Buildroot generated SD card image without
 updating the QSPI boot.bin image, so this is an optional step.
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
