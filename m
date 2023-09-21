Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE1BE7D0AB
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 21:57:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 256AF400FB;
	Thu, 21 Sep 2023 21:57:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 256AF400FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1udBC2qSCfrj; Thu, 21 Sep 2023 21:57:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 231854187E;
	Thu, 21 Sep 2023 21:57:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 231854187E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E1DC01BF3DB
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 21:57:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C83144188D
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 21:57:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C83144188D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2kvTESy9sinW for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 21:57:09 +0000 (UTC)
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C4350400FB
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 21:57:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C4350400FB
Received: from pps.filterd (m0346902.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38LI6EO3019432; Thu, 21 Sep 2023 21:57:06 GMT
Received: from xusxph009rp050.rtx.com (xusxph009rp050.rtx.com [128.13.125.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3t8ttmjdky-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Sep 2023 21:57:05 +0000
Received: from xusxph004rp020.corp.ray.com ([128.13.120.224])
 by xusxph009rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 38LLv4vJ013984
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Sep 2023 21:57:05 GMT
Received: from crulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph004rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 38LLutwk005615
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 21 Sep 2023 21:57:04 GMT
X-Received: from bspbox.kirk (kirk.rockwellcollins.lab [10.148.204.208])
 by crulimr01.rockwellcollins.com (Postfix) with ESMTP id 64B3E605CF;
 Thu, 21 Sep 2023 16:56:55 -0500 (CDT)
To: buildroot@buildroot.org
Date: Thu, 21 Sep 2023 21:56:32 +0000
Message-ID: <20230921215633.34828-3-brandon.maier@collins.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230921215633.34828-1-brandon.maier@collins.com>
References: <20230921215633.34828-1-brandon.maier@collins.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-21_19,2023-09-21_01,2023-05-22_02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-21_19,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 mlxlogscore=796 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2309210190
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0 mlxscore=0
 bulkscore=0 mlxlogscore=716 adultscore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2309210190
X-Proofpoint-ORIG-GUID: EH3lRBm1gt9YONFIYQswE4-QF-WiuOjc
X-Proofpoint-GUID: EH3lRBm1gt9YONFIYQswE4-QF-WiuOjc
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 adultscore=0 mlxlogscore=877 spamscore=0 phishscore=0
 bulkscore=0 mlxscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2309180000 definitions=main-2309210190
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=POD051818;
 bh=CTm+Trj3YtyV2SgZ2NN0y4XuJjFNqI9ghYmoapPDjN8=;
 b=r4nmn+ui/Yz+Hl78ERCSTE9xPFu0P/nCitxTNj9Cq6foe1sr0lr9dQ3R1KUgStRB4jdo
 3sCOjlhkY5+7TD9+lPe7/eMnTHpyPYhXsm3JqcP1CoqqPiStxe+bqpdWP9/3ucqzZoBV
 EzUN1wL072P7tBAUsGbsJpjo5Yyh2QmkmimLYD+Fzmv3tpeBocVoZB1adjyoQ1bT47ca
 htfcIAo8RSlZM/N8OY0QjfCrnjjb5Fso89z50PqteaYP3dFUWH8G7wrqOCNSmv7Huw/J
 HrvIgQmFqBbweh+d9m8BJRx9/2dgVzfS9yx3JKHhCXqMPv46fuEjMPj0CD9nQ1XXdqcZ XQ== 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=r4nmn+ui
Subject: [Buildroot] [PATCH 3/4] package/qoriq-fm-ucode: add package for
 QorIQ FMan microcode
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabio Estevam <festevam@gmail.com>, Gilles Talis <gilles.talis@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Stephane Viau <stephane.viau@oss.nxp.com>,
 Maeva Manuel <maeva.manuel@oss.nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package provides firmware needed for the LS1046A-FRWY Ethernet.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/qoriq-fm-ucode/Config.in           | 21 +++++++++++++++++++++
 package/qoriq-fm-ucode/qoriq-fm-ucode.hash |  3 +++
 package/qoriq-fm-ucode/qoriq-fm-ucode.mk   | 20 ++++++++++++++++++++
 5 files changed, 46 insertions(+)
 create mode 100644 package/qoriq-fm-ucode/Config.in
 create mode 100644 package/qoriq-fm-ucode/qoriq-fm-ucode.hash
 create mode 100644 package/qoriq-fm-ucode/qoriq-fm-ucode.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index e8b78a8d46..e1f0c1cf1b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -513,6 +513,7 @@ F:	package/iftop/
 F:	package/ncdu/
 
 N:	Brandon Maier <brandon.maier@collins.com>
+F:	package/qoriq-fm-ucode/
 F:	package/vmtouch/
 
 N:	Brock Williams <brock@cottonwoodcomputer.com>
diff --git a/package/Config.in b/package/Config.in
index e8dbadadf3..41ead47fac 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -443,6 +443,7 @@ menu "Firmware"
 	source "package/murata-cyw-fw/Config.in"
 	source "package/odroidc2-firmware/Config.in"
 	source "package/qcom-db410c-firmware/Config.in"
+	source "package/qoriq-fm-ucode/Config.in"
 	source "package/rcw-smarc-sal28/Config.in"
 	source "package/rpi-firmware/Config.in"
 	source "package/sunxi-boards/Config.in"
diff --git a/package/qoriq-fm-ucode/Config.in b/package/qoriq-fm-ucode/Config.in
new file mode 100644
index 0000000000..224e7fde32
--- /dev/null
+++ b/package/qoriq-fm-ucode/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_QORIQ_FM_UCODE
+	bool "qoriq-fm-ucode"
+	help
+	  These are the microcode families of the Frame Manager hardware
+	  block in QorIQ products. Specific platforms require specific
+	  binaries, and those also have to further match specific
+	  software versions (Frame Manager Driver -- FMD).
+
+	  https://github.com/nxp-qoriq/qoriq-fm-ucode
+
+if BR2_PACKAGE_QORIQ_FM_UCODE
+
+config BR2_PACKAGE_QORIQ_FM_UCODE_PLATFORM
+	string "Platform"
+	help
+	  This option specifies which platform's microcode to use.
+
+	  This string should match a file in qoriq-fm-ucode of the form
+	  "fsl_fman_ucode_${PLATFORM}*.bin".
+
+endif
diff --git a/package/qoriq-fm-ucode/qoriq-fm-ucode.hash b/package/qoriq-fm-ucode/qoriq-fm-ucode.hash
new file mode 100644
index 0000000000..5c664356c0
--- /dev/null
+++ b/package/qoriq-fm-ucode/qoriq-fm-ucode.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  2e431dd726c4aa1db558931d80b318149abdf71fec6e39de9d5aa33399df1fb1  qoriq-fm-ucode-LSDK-21.08.tar.gz
+sha256  7a223031d76339df0e4e5a94d193a270fb9963d42b577aa42fe130a4657f3e17  NXP-Binary-EULA.txt
diff --git a/package/qoriq-fm-ucode/qoriq-fm-ucode.mk b/package/qoriq-fm-ucode/qoriq-fm-ucode.mk
new file mode 100644
index 0000000000..239ab0d3c3
--- /dev/null
+++ b/package/qoriq-fm-ucode/qoriq-fm-ucode.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# qoriq-fm-ucode
+#
+################################################################################
+
+QORIQ_FM_UCODE_VERSION = LSDK-21.08
+QORIQ_FM_UCODE_SITE = $(call github,nxp-qoriq,qoriq-fm-ucode,$(QORIQ_FM_UCODE_VERSION))
+QORIQ_FM_UCODE_LICENSE = NXP Binary EULA
+QORIQ_FM_UCODE_LICENSE_FILES = NXP-Binary-EULA.txt
+QORIQ_FM_UCODE_REDISTRIBUTE = NO
+QORIQ_FM_UCODE_INSTALL_IMAGES = YES
+QORIQ_FM_UCODE_INSTALL_TARGET = NO
+
+define QORIQ_FM_UCODE_INSTALL_IMAGES_CMDS
+	cp $(@D)/fsl_fman_ucode_$(BR2_PACKAGE_QORIQ_FM_UCODE_PLATFORM)*.bin \
+		$(BINARIES_DIR)
+endef
+
+$(eval $(generic-package))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
