Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C13C433FE
	for <buildroot@archiver.kernel.org>; Tue,  8 Nov 2022 14:54:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7FFA9408EF;
	Tue,  8 Nov 2022 14:54:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7FFA9408EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ST7Tv5-GEwfB; Tue,  8 Nov 2022 14:54:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B146402F3;
	Tue,  8 Nov 2022 14:54:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B146402F3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 84ACE1BF271
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 14:54:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5FC6080BF4
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 14:54:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FC6080BF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uTXlGJUd1Qs4 for <buildroot@lists.busybox.net>;
 Tue,  8 Nov 2022 14:54:33 +0000 (UTC)
X-Greylist: delayed 00:11:15 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 463D480BDE
Received: from mx07-0015a003.pphosted.com (mx07-0015a003.pphosted.com
 [185.132.183.227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 463D480BDE
 for <buildroot@buildroot.org>; Tue,  8 Nov 2022 14:54:33 +0000 (UTC)
Received: from pps.filterd (m0242864.ppops.net [127.0.0.1])
 by mx08-0015a003.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A8DpDoC005548
 for <buildroot@buildroot.org>; Tue, 8 Nov 2022 08:43:16 -0600
Received: from mail.entrust.com ([204.124.82.48])
 by mx08-0015a003.pphosted.com (PPS) with ESMTPS id 3kpnp5fctc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Tue, 08 Nov 2022 08:43:15 -0600
Received: from CMSPEX01.corporate.datacard.com (192.168.211.51) by
 cmspex01.corporate.datacard.com (192.168.211.51) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.7; Tue, 8 Nov 2022 08:43:14 -0600
Received: from hellboy.vlan2200.datacard.com (10.2.200.109) by
 CMSPEX01.corporate.datacard.com (192.168.211.51) with Microsoft SMTP Server
 id 15.2.1118.7 via Frontend Transport; Tue, 8 Nov 2022 08:43:14 -0600
To: <buildroot@buildroot.org>
Date: Tue, 8 Nov 2022 08:43:07 -0600
Message-ID: <20221108144308.1795042-1-jerry.kooyman@entrust.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Proofpoint-GUID: XMwcN19aLe6SB1b5dSFPEAcD3dCYfoi_
X-Proofpoint-ORIG-GUID: XMwcN19aLe6SB1b5dSFPEAcD3dCYfoi_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-07_11,2022-11-08_01,2022-06-22_01
X-Proofpoint-Spam-Reason: orgsafe
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=entrust.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=mail1; bh=XWxMjJ3BfUewRsfm8YoGIvOnFNGVMxd6lI872BBGwO0=;
 b=mnvh29pOGaXZfSpMEcFVjqS9RlYLCiruPLBs22FqpQ1rFgDJOXo4yaGsQMdpxNzlSXVY
 E/nmFQDdYC4rjN6tG0A2byWXRYlKygh+kBKTynmLucrPy+uBe93Cft6vYbpqcvSjTaOB
 x4fd4uOrhR1nEcDAOMYinGWvBjv+x+su09FGdZiyUBGLUntSYQku6tJ17IUIIaxXTDCn
 Nbl3s/5rpEtrzfaK73zdaWqhq9/jkKociEmeQBjlMxp/AMcuZYO3VyaWx8g2x9+1B3kJ
 HZs2ZWkKDbpKHIR8Y4qcjjWGAKmdhNdD7I945psk5FNpV5WNVaY9PYD6XqmH2Ht5IJLL ZQ== 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=entrust.com header.i=@entrust.com
 header.a=rsa-sha256 header.s=mail1 header.b=mnvh29pO
Subject: [Buildroot] [PATCH] boot/uboot: add BR2_TARGET_UBOOT_NEEDS_VIM
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

A host dependency to vim is required if the
U-Boot board configuration has CONFIG_USE_DEFAULT_ENV_FILE enabled. So
introduce a new BR U-Boot config option BR2_TARGET_UBOOT_NEEDS_VIM
to solve this problem.
---
 boot/uboot/Config.in | 8 ++++++++
 boot/uboot/uboot.mk  | 4 ++++
 2 files changed, 12 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 557472b58b..b0f546000e 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -198,6 +198,14 @@ config BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX
 	  This is typically the case when the board configuration
 	  has CONFIG_TOOLS_MKEFICAPSULE enabled.
 
+config BR2_TARGET_UBOOT_NEEDS_VIM
+	bool "U-Boot needs vim"
+	help
+	  Select this option if your U-Boot board configuration
+	  requires vim to be available on the host. This is
+	  typically the case when the board configuration has
+	  CONFIG_USE_DEFAULT_ENV_FILE enabled.
+
 config BR2_TARGET_UBOOT_NEEDS_ATF_BL31
 	bool "U-Boot needs ATF BL31"
 	depends on BR2_TARGET_ARM_TRUSTED_FIRMWARE
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 0439ec5e4b..a64d3a2c2c 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -235,6 +235,10 @@ ifeq ($(BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX),y)
 UBOOT_DEPENDENCIES += host-util-linux
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_NEEDS_VIM),y)
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
