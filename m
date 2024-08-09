Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 682A3C3DA4A
	for <buildroot@archiver.kernel.org>; Fri,  9 Aug 2024 16:30:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B56A8413C;
	Fri,  9 Aug 2024 16:30:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bw9ML-36ls12; Fri,  9 Aug 2024 16:30:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A39284148
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A39284148;
	Fri,  9 Aug 2024 16:30:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B22461BF867
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 16:30:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A002C6132F
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 16:30:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gKbCs7Qopk6Y for <buildroot@lists.busybox.net>;
 Fri,  9 Aug 2024 16:30:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C2FDA612D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2FDA612D3
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C2FDA612D3
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 16:30:31 +0000 (UTC)
Received: from pps.filterd (m0346902.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 479F2Dlr009798; Fri, 9 Aug 2024 16:30:29 GMT
Received: from xusxph009rp050.rtx.com (xusxph009rp050.rtx.com [128.13.125.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 40wndcrwag-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 09 Aug 2024 16:30:29 +0000
Received: from xusxph004rp020.corp.ray.com ([128.13.120.224])
 by xusxph009rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 479GUS1G018301
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 9 Aug 2024 16:30:28 GMT
Received: from ciulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph004rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 479GURZa006324
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 9 Aug 2024 16:30:28 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by ciulimr01.rockwellcollins.com (Postfix) with ESMTP id D6228300042C;
 Fri,  9 Aug 2024 11:30:27 -0500 (CDT)
Date: Fri, 09 Aug 2024 16:30:18 +0000
MIME-Version: 1.0
Message-Id: <20240809-boot-uboot-fix-dependency-on-xilinx-prebuilt-v1-1-7014697db0c6@collins.com>
X-B4-Tracking: v=1; b=H4sIABlEtmYC/x2NwQrCMBBEf6Xs2YW0FY3+iniwzUQXyqYkrURK/
 92ll4HH8GY2KsiCQvdmo4yvFElq0J4aGj8vfYMlGFPnurPz7sZDSguvR0apHDBDA3T8cVKuMol
 WnjOGVaaFL31sPbzvQ7ySTVph0nH3eO77Hw8plol+AAAA
To: buildroot@buildroot.org
X-Mailer: b4 0.14.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-09_12,2024-08-07_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-09_12,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 malwarescore=0
 mlxscore=0 mlxlogscore=692 suspectscore=0 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408090118
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=673 phishscore=0
 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408090118
X-Proofpoint-GUID: sI2q65avdw1TLGB345waKyZq8FSH29OO
X-Proofpoint-ORIG-GUID: sI2q65avdw1TLGB345waKyZq8FSH29OO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-09_13,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 mlxlogscore=763 priorityscore=1501
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408090118
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : message-id :
 mime-version : subject : to; s=POD051818;
 bh=qY8O5L/GSlocQChDm4S1nHPd39uskAIJegt2Us9/PoE=;
 b=bqbCUtBV0f0DeBht58MRaJI4cc276gRxv89+V+euA9qUQAEc3jPL1yj5ioaPMqxLEjjU
 m42WoMbt4szbsZQmo2q7UzTllc5kae4q21L0R1ffXpNU4r0o0QGAIHEi0/PR5byTLvNL
 cCDFZV7tQ/cAONnfg4ERvIagamJs6dZ5nDiK02Yf01VNnjLPhdgWMHIl9CGrMgsty3um
 JrcQ1asYJi/l47qj949bSpVH1E85VTXP4fjHHcZqDEMNNhqS8Kna9ivkCy7YxMCfcHWg
 RIdnRwYxcXhuponyx1R91AtVcIE7XNI2y1KobEAdvnJKotCtO4t0jKoVZFrTvvg+BsIn Nw== 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=bqbCUtBV
Subject: [Buildroot] [PATCH] boot/uboot: fix dependency on xilinx-prebuilt
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
Cc: Brandon Maier <brandon.maier@collins.com>,
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When building with `make -j` and PER_PACKAGE_DIRECTORIES, a race
condition occurs between xilinx-prebuilt and u-boot, resulting in the
following error.

  objcopy -O binary -I elf32-little .../images/pmufw.elf .../images/pmufw.bin
  objcopy: '.../images/pmufw.elf': No such file

U-Boot registers a KCONFIG_FIXUP_CMD that uses the pmufw.elf from
xilinx-prebuilt. But KCONFIG_FIXUP_CMDS does not use the normal
DEPENDENCIES, so xilinx-prebuilt is not guaranteed to have run before
fixup.

Instead move the `objcopy` call out to a PRE_BUILD_HOOK so it will run
after xilinx-prebuilt has finished.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 boot/uboot/uboot.mk | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 45ad1c880f..cdb9f435f7 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -460,13 +460,17 @@ endif #ifneq ($(findstring ://,$(UBOOT_ZYNQMP_PMUFW)),)
 
 endif #BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT
 
-UBOOT_ZYNQMP_PMUFW_BASENAME = $(basename $(UBOOT_ZYNQMP_PMUFW_PATH))
-
+ifeq ($(suffix $(UBOOT_ZYNQMP_PMUFW_PATH)),.elf)
+UBOOT_ZYNQMP_PMUFW_PATH_FINAL = $(basename $(UBOOT_ZYNQMP_PMUFW_PATH)).bin
+define UBOOT_ZYNQMP_PMUFW_CONVERT
+	objcopy -O binary -I elf32-little $(UBOOT_ZYNQMP_PMUFW_PATH) $(UBOOT_ZYNQMP_PMUFW_PATH_FINAL)
+endef
+UBOOT_PRE_BUILD_HOOKS += UBOOT_ZYNQMP_PMUFW_CONVERT
+else
+UBOOT_ZYNQMP_PMUFW_PATH_FINAL = $(UBOOT_ZYNQMP_PMUFW_PATH)
+endif
 define UBOOT_ZYNQMP_KCONFIG_PMUFW
-	$(if $(filter %.elf,$(UBOOT_ZYNQMP_PMUFW_PATH)),
-		objcopy -O binary -I elf32-little $(UBOOT_ZYNQMP_PMUFW_BASENAME).elf $(UBOOT_ZYNQMP_PMUFW_BASENAME).bin
-		$(call KCONFIG_SET_OPT,CONFIG_PMUFW_INIT_FILE,"$(UBOOT_ZYNQMP_PMUFW_BASENAME).bin"),
-		$(call KCONFIG_SET_OPT,CONFIG_PMUFW_INIT_FILE,"$(UBOOT_ZYNQMP_PMUFW_PATH)"))
+	$(call KCONFIG_SET_OPT,CONFIG_PMUFW_INIT_FILE,"$(UBOOT_ZYNQMP_PMUFW_PATH_FINAL)")
 endef
 
 UBOOT_ZYNQMP_PM_CFG = $(call qstrip,$(BR2_TARGET_UBOOT_ZYNQMP_PM_CFG))

---
base-commit: 038af921dc90d54a0bf5dabad8b03327cfe44247
change-id: 20240809-boot-uboot-fix-dependency-on-xilinx-prebuilt-63f18e883df7

Best regards,
-- 
Brandon Maier <brandon.maier@collins.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
