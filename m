Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F8C2C4332F
	for <buildroot@archiver.kernel.org>; Mon, 21 Nov 2022 20:17:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAF0840306;
	Mon, 21 Nov 2022 20:17:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAF0840306
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hkP_5uYE-LOZ; Mon, 21 Nov 2022 20:17:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8072409B6;
	Mon, 21 Nov 2022 20:17:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8072409B6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8C6C21BF34D
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 20:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 670BD60F1B
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 20:17:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 670BD60F1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rm-Mie4tuK3D for <buildroot@lists.busybox.net>;
 Mon, 21 Nov 2022 20:17:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DB4A60BF0
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1DB4A60BF0
 for <buildroot@buildroot.org>; Mon, 21 Nov 2022 20:17:08 +0000 (UTC)
Received: from pps.filterd (m0072139.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 2ALK8JE1015666; Mon, 21 Nov 2022 20:17:05 GMT
Received: from xnwpv37.utc.com ([167.17.239.17])
 by mx0a-00105401.pphosted.com with ESMTP id 3kywyrsa7q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Nov 2022 20:17:04 +0000
Received: from qusnwady.utcapp.com (QUSNWADY.utcapp.com [10.161.48.89])
 by xnwpv37.utc.com (8.16.1.2/8.16.1.2) with ESMTPS id 2ALKH2m1148316
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Nov 2022 20:17:03 GMT
Received: from dtulimr01.rockwellcollins.com ([10.172.224.19])
 by qusnwady.utcapp.com (8.16.1.2/8.16.1.2) with ESMTPS id 2ALKH2kV015638
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 21 Nov 2022 20:17:02 GMT
X-Received: from kirk.rockwellcollins.lab (kirk.rockwellcollins.lab
 [10.148.204.208])
 by dtulimr01.rockwellcollins.com (Postfix) with ESMTP id 1B844600DD;
 Mon, 21 Nov 2022 14:17:02 -0600 (CST)
To: buildroot@buildroot.org
Date: Mon, 21 Nov 2022 14:16:38 -0600
Message-Id: <20221121201638.30951-1-brandon.maier@collins.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Proofpoint-GUID: UfSnFNhlFxf1BzBU5ppSAwJ-6zyTQJIW
X-Proofpoint-ORIG-GUID: UfSnFNhlFxf1BzBU5ppSAwJ-6zyTQJIW
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=989 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1011 phishscore=0 adultscore=0
 suspectscore=0 malwarescore=0 mlxscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211210153
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=POD051818; bh=9+3vT/TBrYapWmzzcONxzSkZmlVEEC2tITUSS9Lf4Hc=;
 b=jz5u8S491rePGw89U5QGQFOHJK/QelDyx6NejISPs6fXfJx447cx0CcGMkGupZ97Siey
 9cnwVF/vDx6XnBe+UaI1NzxWnmLbOrjakpopLD/t2j1DL1baCHGKoRYa9Pif39cdFzJg
 KCgEupqU96d2efGJEBKr6dyGC7v5xe7Hy+aMsU3slU4LX/yPJVNs88Od4HBpOa2g2uCA
 vfqkeYvawTgSnepi37sB/q4qsleiWtAe5vfm19b5/Unx6JDbj3aEFH1+fCUY+JC3ielA
 xcOtwxzh8tV3B04CXyATJSsOVvU5VvOUpG4g3uT+hzPlffr1Ez1Z/V3hv1C9UPuO2Bdk /Q== 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=jz5u8S49
Subject: [Buildroot] [PATCH 1/1] boot/uboot/uboot.mk: fix zynqmp without
 pmufw
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Brandon Maier <brandon.maier@collins.com>, Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit d07e6b70 (boot/uboot/uboot.mk: add pmufw.elf support) broke
configurations where the UBOOT_ZYNQMP_PMUFW was blank. Previously it
would set the U-Boot CONFIG_PMUFW_INIT_FILE to the blank string, but now
it will set it to ".bin" which causes U-Boot to fail to build.

To fix, disable all the pmufw code if the UBOOT_ZYNQMP_PMUFW is blank.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 boot/uboot/uboot.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 0439ec5e4b..b86248e1f7 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -383,6 +383,7 @@ endef
 ifeq ($(BR2_TARGET_UBOOT_ZYNQMP),y)
 
 UBOOT_ZYNQMP_PMUFW = $(call qstrip,$(BR2_TARGET_UBOOT_ZYNQMP_PMUFW))
+ifneq ($(UBOOT_ZYNQMP_PMUFW),)
 
 ifneq ($(findstring ://,$(UBOOT_ZYNQMP_PMUFW)),)
 UBOOT_EXTRA_DOWNLOADS += $(UBOOT_ZYNQMP_PMUFW)
@@ -398,6 +399,7 @@ define UBOOT_ZYNQMP_KCONFIG_PMUFW
 		objcopy -O binary -I elf32-little $(UBOOT_ZYNQMP_PMUFW_BASENAME).elf $(UBOOT_ZYNQMP_PMUFW_BASENAME).bin)
 	$(call KCONFIG_SET_OPT,CONFIG_PMUFW_INIT_FILE,"$(UBOOT_ZYNQMP_PMUFW_BASENAME).bin")
 endef
+endif # UBOOT_ZYNQMP_PMUFW
 
 UBOOT_ZYNQMP_PM_CFG = $(call qstrip,$(BR2_TARGET_UBOOT_ZYNQMP_PM_CFG))
 ifneq ($(UBOOT_ZYNQMP_PM_CFG),)
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
