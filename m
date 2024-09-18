Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC4EECDD552
	for <buildroot@archiver.kernel.org>; Wed, 18 Sep 2024 20:16:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6DC9C40096;
	Wed, 18 Sep 2024 20:16:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 65M24IjpXzQM; Wed, 18 Sep 2024 20:16:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 172C0401F6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 172C0401F6;
	Wed, 18 Sep 2024 20:16:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 13A4C1BF30C
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 20:16:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0242D401F6
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 20:16:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pa1pqLXcRxeo for <buildroot@lists.busybox.net>;
 Wed, 18 Sep 2024 20:16:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DE48440096
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE48440096
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DE48440096
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 20:16:14 +0000 (UTC)
Received: from pps.filterd (m0346909.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48IITF98011990;
 Wed, 18 Sep 2024 20:15:29 GMT
Received: from xusxph009rp050.rtx.com (xusxph009rp050.rtx.com [128.13.125.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 41qyw64bv4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Sep 2024 20:15:28 +0000
Received: from xusxph008rp020.corp.ray.com ([128.13.124.224])
 by xusxph009rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 48IKCoYj029042
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Sep 2024 20:12:51 GMT
Received: from crulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph008rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 48IKCowr016027
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 18 Sep 2024 20:12:50 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by crulimr01.rockwellcollins.com (Postfix) with ESMTP id E5939971F;
 Wed, 18 Sep 2024 15:12:49 -0500 (CDT)
Date: Wed, 18 Sep 2024 20:12:39 +0000
MIME-Version: 1.0
Message-Id: <20240918-ls1046a-frwy-linux-6-6-v1-5-941f6224e052@collins.com>
References: <20240918-ls1046a-frwy-linux-6-6-v1-0-941f6224e052@collins.com>
In-Reply-To: <20240918-ls1046a-frwy-linux-6-6-v1-0-941f6224e052@collins.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-18_14,2024-09-18_01,2024-09-02_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-18_14,2024-09-18_01,2024-09-02_01
X-MHapp-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0
 suspectscore=0 spamscore=0 adultscore=0 mlxscore=0 bulkscore=0
 mlxlogscore=872 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409180132
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=896
 spamscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2408220000
 definitions=main-2409180131
X-Proofpoint-GUID: z4xozsRcbgY6zwpnyJEGzT7CLwmVvfIk
X-Proofpoint-ORIG-GUID: z4xozsRcbgY6zwpnyJEGzT7CLwmVvfIk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-18_14,2024-09-18_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 mlxscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=961 clxscore=1015 malwarescore=0
 lowpriorityscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2408220000 definitions=main-2409180132
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=ufxhBJFzVB76+BgLEJQmKKYBnRscWWSt+QrFD+VHEeg=;
 b=GVQY7Yw7N1/MRerSW+V1Hjz5fzZ1Ng+6ZtSHdWXiubNV7nXFt6aNN7TCDBaHg68E9rfp
 cls1Rtwet+VySSA2qL+fkXc5X30CUdfdaJLPqduMgCDWWd8bIQNhH+zvReinajCjTVWi
 uMgjuEcSNWGaEq6/4+6q8Iuktk12kePT3pG1MwNHnznSeRuNgqMDSwzq7H94E6FUiFoK
 ylPrfZyX/MCwtGTIFDjheOrI2OA7WSo3oaepbvNjEvnmSwg9n3xX6mspNJ+Cx83T81K2
 jAeKn6FLgNCk4AZQLIaV4Q1OhT8hwYzZMs4LfJaIpreC2KsqOLsE8eL0wvKEo5OYAGkb /w== 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=GVQY7Yw7
Subject: [Buildroot] [PATCH 5/5] package/qoriq-rcw: bump to version
 lf-6.6.23-2.0.0
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
From: Brandon Maier via buildroot <buildroot@buildroot.org>
Reply-To: Brandon Maier <brandon.maier@collins.com>
Cc: Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update this package to the same NXP software release as the ls1046a
board.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 board/freescale/ls1028ardb/readme.txt   | 2 +-
 board/freescale/ls1046a-frwy/readme.txt | 2 +-
 package/qoriq-rcw/qoriq-rcw.hash        | 2 +-
 package/qoriq-rcw/qoriq-rcw.mk          | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/freescale/ls1028ardb/readme.txt b/board/freescale/ls1028ardb/readme.txt
index af6af65757bce4296030efb39231e4f3097bf379..6633d60b9013d3fa7350eaef4a6a283d0cb90fc5 100644
--- a/board/freescale/ls1028ardb/readme.txt
+++ b/board/freescale/ls1028ardb/readme.txt
@@ -12,7 +12,7 @@ for the software NXP LSDK (Layerscape Software Development Kit), see
   - https://www.nxp.com/docs/en/user-guide/LSDKUG_Rev21.08.pdf
 
 the components from NXP are:
-  - rcw, LSDK 21.08
+  - rcw, lf-6.6.23-2.0.0
   - atf (fork), lf-6.6.23-2.0.0
   - uboot (fork), lf-6.6.23-2.0.0
   - cadence-dp-firmware (blob), LSDK 20.12
diff --git a/board/freescale/ls1046a-frwy/readme.txt b/board/freescale/ls1046a-frwy/readme.txt
index 1af6fccbf5ebdc09b92f7a3c6e29a1610e43b4f4..4d1e0e1dcd9c0576dad9f96198271633d3d9088b 100644
--- a/board/freescale/ls1046a-frwy/readme.txt
+++ b/board/freescale/ls1046a-frwy/readme.txt
@@ -13,7 +13,7 @@ for the software NXP LSDK (Layerscape Software Development Kit), see
   - https://www.nxp.com/docs/en/user-guide/LSDKUG_Rev21.08.pdf
 
 the components from NXP are:
-  - rcw, LSDK 21.08
+  - rcw, lf-6.6.23-2.0.0
   - atf (fork), lf-6.6.23-2.0.0
   - uboot (fork), lf-6.6.23-2.0.0
   - qoriq-fm-ucode (blob), lf-6.6.23-2.0.0
diff --git a/package/qoriq-rcw/qoriq-rcw.hash b/package/qoriq-rcw/qoriq-rcw.hash
index 2a887d57d45a5159284d2a5bea037d42fe002e0a..1f664842f5eae31680de6d0dcc592621ff72116c 100644
--- a/package/qoriq-rcw/qoriq-rcw.hash
+++ b/package/qoriq-rcw/qoriq-rcw.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f199c10e50bd18d7bed0d60f5b68194240dea4f1aa164cec98332723727a4796  qoriq-rcw-LSDK-21.08.tar.gz
+sha256  52dfb95a3d8e811609dd8a982a5c6f3ba88fac096ea8448a27b571b7c25e3a83  qoriq-rcw-lf-6.6.23-2.0.0.tar.gz
 sha256  68f4b15ecc085729419bc60ca6eeadca5af0237bbfec791e8a79da9c943d42e9  LICENSE
diff --git a/package/qoriq-rcw/qoriq-rcw.mk b/package/qoriq-rcw/qoriq-rcw.mk
index b9c9e99222bc1fbd16e520f4af6e648e107d9deb..c6cfe59a5629bdd46c4ffe7f8cb30c235e51e5d4 100644
--- a/package/qoriq-rcw/qoriq-rcw.mk
+++ b/package/qoriq-rcw/qoriq-rcw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QORIQ_RCW_VERSION = LSDK-21.08
+QORIQ_RCW_VERSION = lf-6.6.23-2.0.0
 QORIQ_RCW_SITE = $(call github,nxp-qoriq,rcw,$(QORIQ_RCW_VERSION))
 QORIQ_RCW_LICENSE = BSD-3-Clause
 QORIQ_RCW_LICENSE_FILES = LICENSE

-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
