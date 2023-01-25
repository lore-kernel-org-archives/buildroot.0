Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B42C27C76
	for <buildroot@archiver.kernel.org>; Wed, 25 Jan 2023 18:55:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 91175408E5;
	Wed, 25 Jan 2023 18:55:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91175408E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hBHQtaWWjyHd; Wed, 25 Jan 2023 18:55:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D577440291;
	Wed, 25 Jan 2023 18:55:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D577440291
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D55B61BF39D
 for <buildroot@lists.busybox.net>; Wed, 25 Jan 2023 18:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE77081C81
 for <buildroot@lists.busybox.net>; Wed, 25 Jan 2023 18:55:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE77081C81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MKMYhMSmushR for <buildroot@lists.busybox.net>;
 Wed, 25 Jan 2023 18:55:53 +0000 (UTC)
X-Greylist: delayed 00:27:21 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72D7D81C6F
Received: from mx07-0015a003.pphosted.com (mx07-0015a003.pphosted.com
 [185.132.183.227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 72D7D81C6F
 for <buildroot@buildroot.org>; Wed, 25 Jan 2023 18:55:53 +0000 (UTC)
Received: from pps.filterd (m0242864.ppops.net [127.0.0.1])
 by mx08-0015a003.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30PHFeIM007475
 for <buildroot@buildroot.org>; Wed, 25 Jan 2023 12:28:29 -0600
Received: from mail.entrust.com ([204.124.82.48])
 by mx08-0015a003.pphosted.com (PPS) with ESMTPS id 3n8dm6gqwx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Wed, 25 Jan 2023 12:28:29 -0600
Received: from CMSPEX01.corporate.datacard.com (192.168.211.51) by
 cmspex01.corporate.datacard.com (192.168.211.51) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.7; Wed, 25 Jan 2023 12:28:28 -0600
Received: from hellboy.vlan2200.datacard.com (10.2.200.109) by
 CMSPEX01.corporate.datacard.com (192.168.211.51) with Microsoft SMTP Server
 id 15.2.1118.7 via Frontend Transport; Wed, 25 Jan 2023 12:28:28 -0600
To: <buildroot@buildroot.org>
Date: Wed, 25 Jan 2023 12:28:18 -0600
Message-ID: <20230125182818.566214-1-jerry.kooyman@entrust.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Proofpoint-GUID: lMvrtvhCyt3_8Vpgl9BlU66izzfHj1VD
X-Proofpoint-ORIG-GUID: lMvrtvhCyt3_8Vpgl9BlU66izzfHj1VD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-25_11,2023-01-25_01,2022-06-22_01
X-Proofpoint-Spam-Reason: orgsafe
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=entrust.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=mail1; bh=15af/qJv5KvzoZTBwRIBgbrfePx2KegSApBPJdoZu6U=;
 b=g0nyPU5RtVKMr1wNIpDAcUazM8xWea4z5O7T0hfRNFMGjINypC8eW0GsgS3JQtd/BD2l
 xjm53mnPWe7cSXGsTRR/zxv65OQv/bPnVeGPwKLeP8NUyFnB9aN/YXV48h3pcLrzLRlY
 1xRtOPzzyoOIRgWLofqqqbABIrZorjKlU1p/fTby8nqlnS+tZnpz7DZyhsjuXJ7/jJ8n
 rc9LAl2QJQsVcjbsnBNQqsFIIVBoCoJAi9+n3cvIaTvwRNx0fQ2Uc2OHq0Iz+cgnhbPz
 fhJTkPXe7+5fMBDOdgECK9N+s+utP71kCAxhhojdNlZQoVSXpvMwzQhnzdhkSO+SWPuW Bw== 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=entrust.com header.i=@entrust.com
 header.a=rsa-sha256 header.s=mail1 header.b=g0nyPU5R
Subject: [Buildroot] [PATCH] boot/uboot: add BR2_TARGET_UBOOT_NEEDS_XXD
 option
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
From: Jerry Kooyman via buildroot <buildroot@buildroot.org>
Reply-To: jerry.kooyman@entrust.com
Cc: Jerry Kooyman <jerry.kooyman@entrust.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Jerry Kooyman <jerry.kooyman@entrust.com>

A host dependency to xxd is required if the U-Boot board
configuration has CONFIG_USE_DEFAULT_ENV_FILE enabled. So
introduce a new BR U-Boot config option BR2_TARGET_UBOOT_NEEDS_XXD
to solve this problem. xxd is provided by host-vim.
---
 boot/uboot/Config.in | 8 ++++++++
 boot/uboot/uboot.mk  | 4 ++++
 2 files changed, 12 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index a729280060..282418c3ed 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -198,6 +198,14 @@ config BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX
 	  This is typically the case when the board configuration
 	  has CONFIG_TOOLS_MKEFICAPSULE enabled.
 
+config BR2_TARGET_UBOOT_NEEDS_XXD
+	bool "U-Boot needs xxd"
+	help
+	  Select this option if your U-Boot board configuration
+	  requires xxd to be available on the host. This is
+	  typically the case when the board configuration has
+	  CONFIG_USE_DEFAULT_ENV_FILE enabled.
+
 config BR2_TARGET_UBOOT_NEEDS_ATF_BL31
 	bool "U-Boot needs ATF BL31"
 	depends on BR2_TARGET_ARM_TRUSTED_FIRMWARE
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 99e80ea5a1..4eae8e95c3 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -239,6 +239,10 @@ ifeq ($(BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX),y)
 UBOOT_DEPENDENCIES += host-util-linux
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_NEEDS_XXD),y)
+UBOOT_DEPENDENCIES += host-vim
+endif
+
 # prior to u-boot 2013.10 the license info was in COPYING. Copy it so
 # legal-info finds it
 define UBOOT_COPY_OLD_LICENSE_FILE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
