Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C22FC4332F
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 19:41:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 66C1340CE2;
	Fri,  9 Dec 2022 19:41:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66C1340CE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jtXOUo66R38J; Fri,  9 Dec 2022 19:41:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92D1440142;
	Fri,  9 Dec 2022 19:41:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92D1440142
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 76C9B1BF34F
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 19:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5051641B71
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 19:40:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5051641B71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1k2ejfDnKDjS for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 19:40:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDE7C41B6E
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BDE7C41B6E
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 19:40:56 +0000 (UTC)
Received: from pps.filterd (m0266029.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 2B9JYNRY014730; Fri, 9 Dec 2022 19:40:50 GMT
Received: from xnwpv37.utc.com ([167.17.239.17])
 by mx0a-00105401.pphosted.com with ESMTP id 3mb25krb23-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 09 Dec 2022 19:40:50 +0000
Received: from qusnwafg.utcapp.com (qusnwafg.utcapp.com [10.161.48.103])
 by xnwpv37.utc.com (8.16.1.2/8.16.1.2) with ESMTPS id 2B9JenPu179587
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 9 Dec 2022 19:40:49 GMT
Received: from dtulimr01.rockwellcollins.com ([10.172.224.19])
 by qusnwafg.utcapp.com (8.16.1.2/8.16.1.2) with ESMTPS id 2B9Jenvq021548
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 9 Dec 2022 19:40:49 GMT
X-Received: from kirk.rockwellcollins.lab (kirk.rockwellcollins.lab
 [10.148.204.208])
 by dtulimr01.rockwellcollins.com (Postfix) with ESMTP id A7A4D600DD;
 Fri,  9 Dec 2022 13:40:48 -0600 (CST)
To: buildroot@buildroot.org
Date: Fri,  9 Dec 2022 13:40:43 -0600
Message-Id: <20221209194043.28673-1-brandon.maier@collins.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Proofpoint-GUID: ftpUKwUTxU_GWkzFT29q57lJE40mxoxx
X-Proofpoint-ORIG-GUID: ftpUKwUTxU_GWkzFT29q57lJE40mxoxx
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 impostorscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 phishscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2212090160
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=POD051818; bh=7Egq6vAlL0rMt0UwytOletnkIXN+rUUkgXo1vEwL0UI=;
 b=iOa6gX7i+S/DW3Xy+4zWqGHhd5xMNvFH9x5PHQHSjsUNviQSMANfgr3ulAPLns8vsWGn
 IZaR6SfQ2XXDC37oqyG0Pdul99s/qkwJf8+OzKRGGXbYviDFp823waBpnGlk5IbdFawe
 a4UsWokOo8XEtqZAP4T9LVH2dBUOGpdVdVo9N/HVRoXvofGPYfEYDiQRG7geFmTS3Bgs
 G4aiKP1FkoXxMpFIEaK4MeqzfEjE1UbmiTWBqzlf2yTGk3vAl1ucbMx7yT3Jgl6zwVRu
 6gT5ZnRgGxN64B0n1oVkr3wnQOzbhVUhUrzZPpQ+4zowEjEP/uhgUmYreht5jdkTFBoL 5g== 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=iOa6gX7i
Subject: [Buildroot] [PATCH 1/1] boot/uboot/uboot.mk: support binary
 pm_cfg_obj
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

BR2_TARGET_UBOOT_ZYNQMP_PM_CFG only works with C files, as it always
tries to process them through tools/zynqmp_pm_cfg_obj_convert.py. Rework
the logic so if the pm_cfg_obj isn't a C file, it is provided directly
to U-Boot.

This mimics changes done to the ZYNQMP_PMUFW which had a similar issue.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 boot/uboot/Config.in | 10 ++++++----
 boot/uboot/uboot.mk  | 17 +++++++----------
 2 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index a729280060..75bfaef2a8 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -496,10 +496,8 @@ config BR2_TARGET_UBOOT_ZYNQMP_PM_CFG
 	help
 	  Location of a PMU configuration file.
 
-	  If not empty, Buildroot will convert the PMU configuration
-	  file into a loadable blob and pass it to U-Boot. The blob gets
-	  embedded into the U-Boot SPL and is used to configure the PMU
-	  during board initialization.
+	  If not empty, the blob gets embedded into the U-Boot SPL and
+	  is used to configure the PMU during board initialization.
 
 	  Unlike the PMU firmware, the PMU configuration file is unique
 	  to each board configuration. A PMU configuration file can be
@@ -507,6 +505,10 @@ config BR2_TARGET_UBOOT_ZYNQMP_PM_CFG
 	  the BSP source, for example at
 	    ./psu_cortexa53_0/libsrc/xilpm_v2_4/src/pm_cfg_obj.c
 
+	  If the file is a C source file, Buildroot will convert the PMU
+	  configuration file into a loadable blob before handing off to
+	  U-Boot.
+
 	  Leave this option empty if your PMU firmware has a hard-coded
 	  configuration object or you are loading it by any other means.
 
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 99e80ea5a1..31093992f6 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -406,18 +406,15 @@ endef
 
 UBOOT_ZYNQMP_PM_CFG = $(call qstrip,$(BR2_TARGET_UBOOT_ZYNQMP_PM_CFG))
 ifneq ($(UBOOT_ZYNQMP_PM_CFG),)
-UBOOT_ZYNQMP_PM_CFG_BIN = $(UBOOT_DIR)/pm_cfg_obj.bin
-define UBOOT_ZYNQMP_KCONFIG_PM_CFG
-	$(call KCONFIG_SET_OPT,CONFIG_ZYNQMP_SPL_PM_CFG_OBJ_FILE,"$(UBOOT_ZYNQMP_PM_CFG_BIN)", \
-		$(@D)/.config)
-endef
+UBOOT_ZYNQMP_PM_CFG_PATH = $(shell readlink -f $(UBOOT_ZYNQMP_PM_CFG))
+UBOOT_ZYNQMP_PM_CFG_BASENAME = $(basename $(UBOOT_ZYNQMP_PM_CFG_PATH))
 
-define UBOOT_ZYNQMP_PM_CFG_CONVERT
-	$(UBOOT_DIR)/tools/zynqmp_pm_cfg_obj_convert.py \
-		"$(UBOOT_ZYNQMP_PM_CFG)" \
-		"$(UBOOT_ZYNQMP_PM_CFG_BIN)"
+define UBOOT_ZYNQMP_KCONFIG_PM_CFG
+	$(if $(filter %.c,$(UBOOT_ZYNQMP_PM_CFG_PATH)),
+		$(UBOOT_DIR)/tools/zynqmp_pm_cfg_obj_convert.py $(UBOOT_ZYNQMP_PM_CFG_BASENAME).c $(UBOOT_ZYNQMP_PM_CFG_BASENAME).bin
+		$(call KCONFIG_SET_OPT,CONFIG_ZYNQMP_SPL_PM_CFG_OBJ_FILE,"$(UBOOT_ZYNQMP_PM_CFG_BASENAME).bin"),
+		$(call KCONFIG_SET_OPT,CONFIG_ZYNQMP_SPL_PM_CFG_OBJ_FILE,"$(UBOOT_ZYNQMP_PM_CFG_PATH)"))
 endef
-UBOOT_PRE_BUILD_HOOKS += UBOOT_ZYNQMP_PM_CFG_CONVERT
 endif
 
 UBOOT_ZYNQMP_PSU_INIT = $(call qstrip,$(BR2_TARGET_UBOOT_ZYNQMP_PSU_INIT_FILE))
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
