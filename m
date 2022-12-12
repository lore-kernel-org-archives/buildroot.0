Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA1F4C4332F
	for <buildroot@archiver.kernel.org>; Mon, 12 Dec 2022 18:49:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34B0A60B48;
	Mon, 12 Dec 2022 18:49:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34B0A60B48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h7fkZWfRV18F; Mon, 12 Dec 2022 18:49:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72BD960BEF;
	Mon, 12 Dec 2022 18:49:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72BD960BEF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2E4891BF287
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 18:49:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07F54415F5
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 18:49:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07F54415F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 24_DTlvhuOvE for <buildroot@lists.busybox.net>;
 Mon, 12 Dec 2022 18:49:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBB54415EC
Received: from mx0a-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BBB54415EC
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 18:49:34 +0000 (UTC)
Received: from pps.filterd (m0081755.ppops.net [127.0.0.1])
 by mx0b-00105401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 2BCImYIP027184
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 18:49:33 GMT
Received: from xnwpv36.utc.com ([167.17.239.16])
 by mx0b-00105401.pphosted.com with ESMTP id 3md3sepyg9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 18:49:33 +0000
Received: from qusnwafg.utcapp.com (qusnwafg.utcapp.com [10.161.48.103])
 by xnwpv36.utc.com (8.16.1.2/8.16.1.2) with ESMTPS id 2BCInW4X189888
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 18:49:32 GMT
Received: from crulimr02.rockwellcollins.com ([10.172.224.19])
 by qusnwafg.utcapp.com (8.16.1.2/8.16.1.2) with ESMTPS id 2BCInWoQ024639
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 18:49:32 GMT
X-Received: from kirk.rockwellcollins.lab (kirk.rockwellcollins.lab
 [10.148.204.208])
 by crulimr02.rockwellcollins.com (Postfix) with ESMTP id E213D6017C;
 Mon, 12 Dec 2022 12:49:31 -0600 (CST)
To: buildroot@buildroot.org
Date: Mon, 12 Dec 2022 12:49:25 -0600
Message-Id: <20221212184925.11578-1-brandon.maier@collins.com>
X-Mailer: git-send-email 2.38.2
MIME-Version: 1.0
X-Proofpoint-GUID: Tmr8p6LsgPg_G8TkZkqSWjpu_AstpCHd
X-Proofpoint-ORIG-GUID: Tmr8p6LsgPg_G8TkZkqSWjpu_AstpCHd
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 mlxlogscore=740 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212120169
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=POD051818; bh=KJa/hLal0XNFEocf4wXENIv7xrQ04UhwIj1dbHTnCIo=;
 b=GfUMMU9ngUZCNVpiDYlVK7HFcvWjoODL7b1A09pmfe3P7HRwYB9CEYbLKsmnIO07D5Ub
 uqIm5k+qBOG5WURJaK/q31JAZBxibWLg5kH1OdZy2i4lg44HZIV2iW1HNj2xSv3bD4Lb
 G8pOg3Wzqg8vcKeY94B1idG3cfWsdErHzXDD2REofVAObIc/8JBi9MKdROAalLNO0pOb
 pGx0tFBIIGK2Lj/poB3LRLjGTtyxiP8L75kVKUIOgJi2Ov+Tqd/7oC+dS/HMX08XiDFF
 LDdjTPsjfgWniCntLcXx/ceoyH+uKv7CPmSsq94IkygLuT/DUQORGOy3P1c+elORHl/2 Jw== 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=GfUMMU9n
Subject: [Buildroot] [PATCH 1/1] package/mtd: add lsmtd option
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

lsmtd is a new utility added in v2.1.0[1].

[1] http://git.infradead.org/mtd-utils.git/commit/c26ce774a7209012c0505ee841d54898c6665e20

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 package/mtd/Config.in | 3 +++
 package/mtd/mtd.mk    | 1 +
 2 files changed, 4 insertions(+)

diff --git a/package/mtd/Config.in b/package/mtd/Config.in
index c45dd1e2b7..3ba48da645 100644
--- a/package/mtd/Config.in
+++ b/package/mtd/Config.in
@@ -71,6 +71,9 @@ config BR2_PACKAGE_MTD_JFFS2DUMP
 	bool "jffs2dump"
 	select BR2_PACKAGE_MTD_JFFS_UTILS
 
+config BR2_PACKAGE_MTD_LSMTD
+	bool "lsmtd"
+
 config BR2_PACKAGE_MTD_MKFSJFFS2
 	bool "mkfs.jffs2"
 	select BR2_PACKAGE_MTD_JFFS_UTILS
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 6e266a8760..db2b104586 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -94,6 +94,7 @@ MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_UNLOCK)	+= flash_unlock
 MTD_TARGETS_$(BR2_PACKAGE_MTD_FTL_CHECK)	+= ftl_check
 MTD_TARGETS_$(BR2_PACKAGE_MTD_FTL_FORMAT)	+= ftl_format
 MTD_TARGETS_$(BR2_PACKAGE_MTD_JFFS2DUMP)	+= jffs2dump
+MTD_TARGETS_$(BR2_PACKAGE_MTD_LSMTD)		+= lsmtd
 MTD_TARGETS_$(BR2_PACKAGE_MTD_MKFSJFFS2)	+= mkfs.jffs2
 MTD_TARGETS_$(BR2_PACKAGE_MTD_MTD_DEBUG)	+= mtd_debug
 MTD_TARGETS_$(BR2_PACKAGE_MTD_MTDPART)		+= mtdpart
-- 
2.38.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
