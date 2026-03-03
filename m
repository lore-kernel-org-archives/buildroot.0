Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8004EDA68E
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 15:48:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A034D611CD;
	Tue,  3 Mar 2026 15:48:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CBk_ifspR5Vy; Tue,  3 Mar 2026 15:48:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB37660AAE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772552883;
	bh=KShr8a+rpIsWkw0Hp6wVl5zSFF8XN94/KbPSZvmETYk=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=s+LgqR6MTRxR2jAZoSyDXNSZkrEqjj/RNarc5ONShYMc7mg4nkLTHcgcAF94Yx+lc
	 Kj4PzqYUP9EzAa2M+NmbF/nqyNz9UsMmW4fsFcYKAZB27moYgQzhdabCVlnbRjZhjr
	 bWuoQMIA2Hk2KZ/98DiEeYZyLAw1/f0dw6KOjVrw0whw/vwJTI0QstXQkSL0sLH9p0
	 Q3E6+aDsidWCvvftNvoVEan8m5QKkp16sk+is3qoW9+eQOO+x/YA1g/NdQxWagCIF6
	 6k0D9Mc3dSgHx6xU4u0YekLh+pGZIHQG3xZmdeuVgP3sBq+7DKI2/dGlBlLn3L3YT5
	 wUJyylwugoImA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB37660AAE;
	Tue,  3 Mar 2026 15:48:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id ACA0F231
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 15:48:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E77F4087A
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 15:48:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nVLdeFLyrvN7 for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 15:48:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c10d::3;
 helo=sn4pr0501cu005.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 02F434083B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02F434083B
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c10d::3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 02F434083B
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 15:48:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YhL+pjUx9N7byjLkUyS7FfEXUJiQCJFE/8Yp7D8/ox9wH5U1PoRggGUBcjrZaPVfF4ckAmLlujNlK1LWfSM3fDZrqY6x1QAEqMe3ULsINZKZJPL8HyLa12ocTkCZJQPmCnya/2MEu3Y8JWM40ERabYlMMdmvCzIzy5r0vL8N+zn1u/C/o5wRTHqZ9/ZUIxzyt+EHxKl8edJEMKleWXI0inzbv5XmwOmFE1ofGT3m3oTWZHco2luSqZ5oGklow4t4T3YUZ14Zx61BNBmVdydsv0INSHhVv6WY+i/s5R6GXvRqJh/h9Ib66hZpkQSti0ap7bR91QgOhIVCYqfFv7IhIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6/yHGZYI/KMqE25h5SIXQOLk1M5qeaH4KZpy7xKJkpU=;
 b=yodGx7L4hKorVZtCp0A2pvPzaVC0UBpvdS5xM85qW+45WKT335WYBU+CJtcIkrFu+RE/oH6p3mC69S0F0518SNyg7tBjmLbi9LH+rCwg4lpk+UWZlFy5n2asMcD4C+SL1H27rLrhBPrQREM671S8/Qff6aTnWgkyiqdkrglM0L/KuDExfJMMEa1MEBQtsdfTIqaE702lnaLABiuJU3dkmQRrURhIFXro0sYeBQY1j/DCVaaq2OVIUjhSdLV9F94hdW3NafHDV7Si7tZyvGNg+uwJWMeXGpwPNb/tQcQRpqnF5Jn6pBi/0kFYmznAw2f1ElAN1FoztCrsPAUWxODeZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ0PR05CA0065.namprd05.prod.outlook.com (2603:10b6:a03:332::10)
 by MN2PR12MB4302.namprd12.prod.outlook.com (2603:10b6:208:1de::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 15:47:26 +0000
Received: from SJ5PEPF000001CE.namprd05.prod.outlook.com
 (2603:10b6:a03:332:cafe::fd) by SJ0PR05CA0065.outlook.office365.com
 (2603:10b6:a03:332::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.18 via Frontend Transport; Tue,
 3 Mar 2026 15:47:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF000001CE.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Tue, 3 Mar 2026 15:47:25 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 3 Mar
 2026 09:47:23 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 3 Mar
 2026 09:47:23 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 3 Mar 2026 09:47:22 -0600
To: <buildroot@buildroot.org>
Date: Tue, 3 Mar 2026 15:47:16 +0000
Message-ID: <20260303154716.2122822-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260303154716.2122822-1-neal.frager@amd.com>
References: <20260303154716.2122822-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CE:EE_|MN2PR12MB4302:EE_
X-MS-Office365-Filtering-Correlation-Id: aa1b20e7-f43f-4673-7de0-08de793c2b00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|7416014|376014|41080700001; 
X-Microsoft-Antispam-Message-Info: 1azeBIoWZ7y8dTdRe2pQjb7zu9x6tq6k6aqBF7YAoAOl6WQ4ex9hZej1BjcwwOrFbYFWLQHRyPztXAI0DFG5gYccfZqPeiYXps8VYIkYEucjrzd2gS9fTfW1TIpdg7zireSNwZFFCKlDE6pYA4s8C4xKDi2DQUTAiYHT00HrC+dv7o67JX4X+C4GNWSk9W+X9XIlH68+ntjo0zxnK/Q7upZss0V76D8SxDeeZvbuRneWgNWIpQasQayz6XTEWvbybDj3S0j0NFEXRiZlc9RGOvG2C/7UBDkJsa31A1iQA8VbtllqGRLv6ToWIOLFrSq1Ai4MV9KEmeWEcucqA88iaE5o7z0mL0aACWtPRRNpGI8Myd8J9IRR0nvsnoLg5BGeSjzCJoC7+PTzHyTaBYVGUwkMDU73493lxYA7uoIpYufY7dgzpNH6EWAndBcdLrHvDIwD9IZ6fdmbcM1p/EEMDCKxOS+STgv+FlT3yeScNBQ2HAKJFpkE34GcMr9zZcRKpbiYiMaZaatZ69PLQA3OLpU4eLX3z2oHxLMKipDqT7xLj1e07SKF0/OBvMOh4Jy+SgPlBHPDUUd7DJPVhSV81+TOZmsePGXJOtWUSvMVD+qLvI+FTf+Kdj9syHL+f3cMTIkKFJHy0d8MK8FG25PF48fmsg1u3FTVjNfVmND4KS69/kILN8ouvtpWWInHWqJg7229hNytEWfL0is941R0QMu8MNOQQkewPBiVBikASFmaQyutyOsHLq9W6k+ieWm2n613448+Tu0CED7Runoo+XrSoxIkZyU/jFsNvcjhBPKZt5ykK9lD2lMh3OU/bD5N4cGTx993BYjWOEWe82sfST62SPRVY+a4bZ8pTPtzNk4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: vfx1FiY6Ur9WfpXbKcM9lvYRzbpwElHj3ARRsXs7hydPOe1xAycja0EXbDFwxAXzIXwQbXbRjUAsGz8ublrS84Z4l1h7lkLTNHA/FODgisrCXCwzu9NbufOChQ8ooQ2DlevgbgunkI0YCoE0wc/F2nyoevChE8VQaFpRYyZeIYaraWCb4/IaN2gih1RXKjzaS8dzphy8Fo2ETOxu0OmQYAThl4Odt4tshK28BakWqMXv+8KdROVC3Z2BP2/OOHMYN2Y2hxg8tZPa7jwBUKOlZBfYmG5hfxqr4Djnbjreo4MM7Q5+KnUTPbgeTABcsIeEvr50W7huBkTUgh2ieoE7TTXjPRdO9I2Bty+keou0PrI4w+7on34uYsnI+WBTVcmhv8ZIHyqeyHZeyvwsmL6yo0mcJFYwM2l83y1lODp5YHUT7C2T2cQfxFFLMNQaZapO
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 15:47:25.8625 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa1b20e7-f43f-4673-7de0-08de793c2b00
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4302
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6/yHGZYI/KMqE25h5SIXQOLk1M5qeaH4KZpy7xKJkpU=;
 b=dinsmY2kOuSp2I52/YXuq0cxeTfmRtzxFfPKUxQOR9sUvquZhWU/b+tSP0xRMqtFDbvqSqUlcHK4hWOVGZ8eVlaI1JH7GhQSPr+jjPs+qY6it4nYc7lDfwXM9sUfp8VLOIhuSe7bR19a4NQQZTIWhb3r8iZwVv256QkjVnoM7yo=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=dinsmY2k
Subject: [Buildroot] [PATCH v1 3/3] board/versal/post-image.sh: use
 LINUX_DTBS variable
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
 yann.morin@orange.com, brandon.maier@collins.com, ju.o@free.fr,
 Neal Frager <neal.frager@amd.com>, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

By switching to the LINUX_DTBS variable, the post-image.sh script can now
work regardless of whether a user is using BR2_LINUX_KERNEL_INTREE_DTS_NAME
or the BR2_LINUX_KERNEL_CUSTOM_DTS_DIR for custom hardware. This simplifies
the transition users will make when migrating from a versal evaluation board
to a versal custom platform.

To keep the example post-image script as simple as possible, it assumes that
the first DTB in the LINUX_DTBS list is the one for creating the system.dtb
filename that u-boot will use for booting. Users are free to implement their
own post-image scripts for use cases with multiple DTBs.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/versal/post-image.sh | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/board/versal/post-image.sh b/board/versal/post-image.sh
index 3242e4384a..455ba57975 100755
--- a/board/versal/post-image.sh
+++ b/board/versal/post-image.sh
@@ -2,13 +2,8 @@
 
 # By default U-Boot loads DTB from a file named "system.dtb", so
 # let's use a symlink with that name that points to the *first*
-# devicetree listed in the config.
-
-FIRST_DT=$(sed -nr \
-               -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="(xilinx/)?([-_/[:alnum:]\\.]*).*"$|\2|p' \
-               "${BR2_CONFIG}")
-
-[ -z "${FIRST_DT}" ] || ln -fs "${FIRST_DT}.dtb" "${BINARIES_DIR}/system.dtb"
+# devicetree in the LINUX_DTBS list.
+ln -fs "${BINARIES_DIR}/$(basename ${LINUX_DTBS})" "${BINARIES_DIR}/system.dtb"
 
 BOARD_DIR="$(dirname "$0")"
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
