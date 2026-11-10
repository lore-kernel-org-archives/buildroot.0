Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDDF606A323
	for <buildroot@archiver.kernel.org>; Tue, 10 Nov 2026 17:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=njA5UV2U
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A385812E6;
	Tue, 10 Nov 2026 17:03:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fN0xlxp65h0R; Tue, 10 Nov 2026 17:03:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 33BB3812EC
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794330216;
	b=Yfzv65qJ9k6Q/1REFwoyHQDuTvWFObg0HCBDT9CCKJr6/ItImKsxYQIie/cAwmtuCQbf
	 2YmnW5hH5m4GsXWuLfU7LHlj+0RVIJI5kp8byImYIcC2WMQlcgAjUtf8v3h2BLsa8TqRX
	 daKtVo7B+T8o37xsVkt3chxkESV31RqIvJSA/qhfBCof3bm4bwXYvpNYGbAEEjGg8hAaa
	 ZFFA+hhKrgOp6P4F81UFNKB7EFLUy+Hxu9rRZtHynV5uFXnM6dhUJhHd6UbbXM6hlVl/b
	 JhflwQ1avGKA0yQcnwgF95AH82Mpwid6jAzT3ZY5gcqxLJBLyEzThzLPnwj17wgC95g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794330216;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:X-MS-Exchange-Authentication-Results:Received-SPF:Received:
	 Received:Received:Received:To:Date:Message-ID:X-Mailer:MIME-Version:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=OD6AYmhhKjf4qTQIAwX4qkBfJSOJox96Cnody7zKE/Y=;
	b=BOSsaAfcdWyZMjRahlm6A9wMMpCVAXXY2k7++Kdx4A7VT0WQSemXVgWm1edrTp0cGxJB
	 LMyriOkPLScKdAie5dRR1FheZV6FbTNYYZsJwKupdk4qGDqBRlwGXZE3C9/jORPn8I64t
	 229AvG5UItLJksHM6DBa2mDwqPE9Z4u+AjApaEFMOFVIIXBwHuGf6VKbcMBENd6TyJ6rn
	 BE6EaIjqYOfaDLBn4Uin3oeRoMRoEK0Dm0M2VHwOTkzzs713EA3JXjkyPjXQNkAKtmIvR
	 fX52ZhlXM/xwMhGRH9XjDn3BFxt6gBQRpAtd9BcJLwMnAyVX93nQJh+neeoldfxl3EQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794330216;
	bh=OD6AYmhhKjf4qTQIAwX4qkBfJSOJox96Cnody7zKE/Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=njA5UV2UR6SgSiFLYpk24S/YFIelQJndU7en6D2eba8QBlgq+8A1bT4uT9ablIt5s
	 UrZcz5faI4baOVc2p9YLM210q24MuF7rZdomUb+0+uHQsmpbPJT5TTOzwjjGrb30M1
	 iHRvE6X6Bo3caNq8UcpAqdBOplhGG5D637C7qdMPRq947yzw0MW2k5kb3hJmZOFm37
	 f+qV0Z92WDecNJr2FoHz1fb2HVCQ2v+vhRWXTIJXRppvJd5CMQU53knup6vvgA+YMh
	 409/gM8uEAio+Zp96P/RkyYO558gCTJY1EzkUYtL3MRt5+m5JRjuBbHKfdG+4mkNQk
	 TfGoMTl3KdUpw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33BB3812EC;
	Tue, 10 Nov 2026 17:03:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CA10388
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 17:03:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A2B3400C7
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 17:03:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 05qpfl7Nfe_v for <buildroot@buildroot.org>;
 Tue, 10 Nov 2026 17:03:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 3DCB440048
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=52.101.193.51;
 helo=ch1pr05cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010051.outbound.protection.outlook.com
 [52.101.193.51])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3DCB440048
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 17:03:31 +0000 (UTC)
Received: from MN2PR15CA0043.namprd15.prod.outlook.com (2603:10b6:208:237::12)
 by PH8PR12MB7447.namprd12.prod.outlook.com (2603:10b6:510:215::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 17:02:21 +0000
Received: from BN2PEPF0000A98D.namprd04.prod.outlook.com
 (2603:10b6:208:237:cafe::8d) by MN2PR15CA0043.outlook.office365.com
 (2603:10b6:208:237::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.13 via Frontend Transport; Tue,
 10 Nov 2026 17:02:21 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF0000A98D.mail.protection.outlook.com (10.167.248.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 10 Nov 2026 17:02:20 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 10 Nov
 2026 11:02:20 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 10 Nov
 2026 11:02:20 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Tue, 10 Nov 2026 11:02:19 -0600
To: <buildroot@buildroot.org>
Date: Tue, 10 Nov 2026 17:02:16 +0000
Message-ID: <20261110170216.39432-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A98D:EE_|PH8PR12MB7447:EE_
X-MS-Office365-Filtering-Correlation-Id: c82f4c51-6dd6-493c-08af-08df3f4c625f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|36860700016|82310400026|260925022911599003|260925021311599003|260925021911599003|11063799006|56012099006|261009223027099003|261021123027099003|261026140227099003|261022105027099003|261026121527099003|261102123227099003|261028144727099003|261021121427099003|18002099003|10067099003|13003099007|41080700001;
X-Microsoft-Antispam-Message-Info: 96uKACk6vVhSI7UunT9d7WThGqDJIre1XSnHRvbVJqMuox3QYYD8fvsWnI7eL7rKss9gUOrsEZBQ0mLMBFgjDC9uoGj1VbyHElRoUurlwXptWFMuVGUwZ7Xy8gGQjwcP0DMWI34nIY07TMYsAK2Q4c8olTF5GTcic0aZTjlQYNKA6VFRDs+eumHTvk3Zzt/YzVO9/mrlwr92Vham3EyCf353t1Vdzuwl6J3mHDisJuWVXcjCDY9R2wfJk4I5D/GHeBvp++ARFH2fJ+vJXnks3hkxp5bymSKkOxIpl4ijWgpcDdvveCF7YsGQKSI/x8rjnk7hsQ7h2F+yo4C/45vfnwLfCKjkjUonqIwtRlgpS/512KFnsq9qqESpdFA9d02KTBu7edbFo8ccMkNKoYoMN6y7D/zlua2VpU/ygp1meVQDrosEsFHC7I1c+ZcMU7tetuLHzSsoxCcrTL7zaM2jW54IVVPEBvPYLfgC8VUqqG190cfLNYJ1VoTjMXvaKyts6lPm405Gh8QhhkTthhwpjOdG0aWk7tOHApBrEvv9eQTvWBoRsEMz9EdkTLZHik+iuVvu0V4tqFQwcVE97qbsK4Zma+Svv7SNd6JTbH7abyASrdl8XQjeDCD0Gvfsy/osPgawz2Hqt+Co4Eqa+z23H7vCNfYbB8YVLqPkXl9YCfuqNuVWtLw/2stGbl3/qRfL+uXXeM3arB4Zy54fU2HVTA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(36860700016)(82310400026)(260925022911599003)(260925021311599003)(260925021911599003)(11063799006)(56012099006)(261009223027099003)(261021123027099003)(261026140227099003)(261022105027099003)(261026121527099003)(261102123227099003)(261028144727099003)(261021121427099003)(18002099003)(10067099003)(13003099007)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 47MSjcuGsqsowdyeDWtHdIIG89dj5YpUw+hWVhi78yt7q/aocj1zJ1X11MxeqHKiHejAwuyQkSpr3YVelhlElmARIcnvkpFj050dfoheh0Xxvj4Qzo/H+bGLeyxB+re9XHe2Akd2HxhXREPa+hW62WJNAqZ7Ct6Y9A9mYeArnY01O5AnzMGfd7WTDxtGXPzmB3DWzD3mKD9tznjUsEVYfygZDxxIvsnyfnkMT0EyygTgYmqLN6+tQADBrfd+shFT9xUH/8i33ffZ8i8l/epzCW2W6uNCVTaiN6VVmhy7dsQpZJO1lsWqYVX4BAaxo1d6wAGG5aR0+KadW5ILLGXNHvR2+jR7hu/e5xrO+3e3/XRtDtWO4UwyPXW5bnUW9j66bUB+q44eJY983YPeMxElZn6XiG5nKOVYtA/cLIYxPPPz25lTXptBDqbsWoL7puVB
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 17:02:20.9923 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c82f4c51-6dd6-493c-08af-08df3f4c625f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000A98D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7447
Subject: [Buildroot] [PATCH v1 1/1] package/bootgen: bump to xilinx_v2026.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Neal Frager via buildroot <buildroot@buildroot.org>
Reply-To: Neal Frager <neal.frager@amd.com>
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 Neal Frager <neal.frager@amd.com>, brandon.maier@collins.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, arnout@rnout.be, romain.naour@smile.fr,
 michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Bump bootgen to xilinx_v2026.2 release.

0001-cdo-Fix-incompatible-pointer-types-in-cdoseq_load_cd.patch is no longer
needed as it has been committed upstream:
https://github.com/Xilinx/bootgen/commit/ce2819d3e15f5c3116629f6793d15a942a906eb6

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 ...ible-pointer-types-in-cdoseq_load_cd.patch | 45 -------------------
 package/bootgen/bootgen.hash                  |  2 +-
 package/bootgen/bootgen.mk                    |  2 +-
 3 files changed, 2 insertions(+), 47 deletions(-)
 delete mode 100644 package/bootgen/0001-cdo-Fix-incompatible-pointer-types-in-cdoseq_load_cd.patch

diff --git a/package/bootgen/0001-cdo-Fix-incompatible-pointer-types-in-cdoseq_load_cd.patch b/package/bootgen/0001-cdo-Fix-incompatible-pointer-types-in-cdoseq_load_cd.patch
deleted file mode 100644
index 8c879238c6..0000000000
--- a/package/bootgen/0001-cdo-Fix-incompatible-pointer-types-in-cdoseq_load_cd.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 33f6391e6e87dfd8906899de7e765a48bd51144b Mon Sep 17 00:00:00 2001
-From: Andrew Bradford <andrew.bradford@konsulko.com>
-Date: Mon, 22 Jun 2026 14:48:15 -0400
-Subject: [PATCH] cdo: Fix incompatible-pointer-types in
- cdoseq_load_cdo_from_buffer
-
-GCC 14 promotes -Wincompatible-pointer-types to a hard error, so the
-build fails with:
-
-  utils/src/cdo-load.c:140:14: error: assignment to 'char *' from incompatible pointer type 'uint32_t *' {aka 'unsigned int *'} [-Wincompatible-pointer-types]
-    140 |         data = raw->data;
-        |              ^
-  make: *** [Makefile:81: build/obj/cdo-load.o] Error 1
-
-The function parameter data is char *, but raw->data (struct CdoRawInfo)
-is uint32_t *. The sibling function cdoseq_load_cdo avoids this because
-its local data is void *, which accepts any pointer without a cast.
-
-Add an explicit (char *) cast.
-
-Signed-off-by: Andrew Bradford <andrew.bradford@konsulko.com>
-
-Upstream: https://github.com/Xilinx/bootgen/pull/47
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- utils/src/cdo-load.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/utils/src/cdo-load.c b/utils/src/cdo-load.c
-index cb0ff49..96a479a 100755
---- a/utils/src/cdo-load.c
-+++ b/utils/src/cdo-load.c
-@@ -137,7 +137,7 @@ CdoSequence * cdoseq_load_cdo_from_buffer(char * data, size_t size) {
-     if (data == NULL) goto done;
-     raw = cdoraw_decode(data, size);
-     if (raw != NULL) {
--        data = raw->data;
-+        data = (char *)raw->data;
-         size = raw->size;
-     }
-     if (is_cdo_data(data, size)) {
--- 
-2.47.3
-
diff --git a/package/bootgen/bootgen.hash b/package/bootgen/bootgen.hash
index 007cecfa45..5223a3c7cb 100644
--- a/package/bootgen/bootgen.hash
+++ b/package/bootgen/bootgen.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  23529d4922efd79d201d6b4a3cdaefe5cc9384b55dd56ef916a56f2a0ed7340c  bootgen-xilinx_v2026.1.tar.gz
+sha256  232b1892e9abb3f32567312f48bae47057802c338b26ebd84006a47ab4bdd011  bootgen-xilinx_v2026.2.tar.gz
 sha256  36e278ff2cc9ef95154a923bf4a9450414f358779045ae4f863c8d77fb18dbdb  LICENSE
diff --git a/package/bootgen/bootgen.mk b/package/bootgen/bootgen.mk
index 2e14c625fa..3c053f5564 100644
--- a/package/bootgen/bootgen.mk
+++ b/package/bootgen/bootgen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOOTGEN_VERSION = xilinx_v2026.1
+BOOTGEN_VERSION = xilinx_v2026.2
 BOOTGEN_SITE = $(call github,Xilinx,bootgen,$(BOOTGEN_VERSION))
 HOST_BOOTGEN_DEPENDENCIES = host-openssl host-pkgconf
 BOOTGEN_LICENSE = Apache-2.0
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
