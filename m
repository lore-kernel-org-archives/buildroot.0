Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B43C6C52D7C
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 14:22:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ECA7A40EC5;
	Thu, 15 Aug 2024 14:22:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ksl_j0QrwOC; Thu, 15 Aug 2024 14:22:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7848940EC4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7848940EC4;
	Thu, 15 Aug 2024 14:22:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3FBCC1BF591
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 14:22:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D78940E9C
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 14:22:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tB_jSdtA_KMg for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 14:22:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2978940DD5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2978940DD5
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2978940DD5
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 14:22:37 +0000 (UTC)
Received: from pps.filterd (m0346902.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 47F4Amu4001590; Thu, 15 Aug 2024 14:22:33 GMT
Received: from xusxph008rp050.rtx.com (xusxph008rp050.rtx.com [128.13.124.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 410dbvtujp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Aug 2024 14:22:33 +0000
Received: from xusxph004rp020.corp.ray.com ([128.13.120.224])
 by xusxph008rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 47FEMVFK023542
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Aug 2024 14:22:32 GMT
Received: from ciulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph004rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 47FEMVpK032229
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 15 Aug 2024 14:22:31 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by ciulimr02.rockwellcollins.com (Postfix) with ESMTP id 2DFA61003BBA;
 Thu, 15 Aug 2024 09:22:31 -0500 (CDT)
Date: Thu, 15 Aug 2024 14:22:30 +0000
MIME-Version: 1.0
Message-Id: <20240815-boot-uboot-clean-for-pmufw-v1-1-3f0d9909c0b4@collins.com>
References: <20240815-boot-uboot-clean-for-pmufw-v1-0-3f0d9909c0b4@collins.com>
In-Reply-To: <20240815-boot-uboot-clean-for-pmufw-v1-0-3f0d9909c0b4@collins.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-15_06,2024-08-15_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-15_06,2024-08-15_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 phishscore=0
 suspectscore=0 mlxlogscore=866 adultscore=0 bulkscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408150103
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0 bulkscore=0
 spamscore=0 mlxlogscore=834 malwarescore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408150103
X-Proofpoint-GUID: WT_3VCrG56PwvJSU2zCmj66EMBBvBC7K
X-Proofpoint-ORIG-GUID: WT_3VCrG56PwvJSU2zCmj66EMBBvBC7K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-15_06,2024-08-15_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 priorityscore=1501 mlxscore=0 suspectscore=0 impostorscore=0
 mlxlogscore=940 clxscore=1015 lowpriorityscore=0 malwarescore=0
 bulkscore=0 spamscore=0 phishscore=0 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408150104
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=b4IKxbpg7XVvdldJmtpaYd+MCHUdNZgUrHB3RSSFd5Y=;
 b=WpVqp4ppuaLxu7zp1BFtrZbT6IoRoPr9yzmo+gatcV0CfmjxS911bX5byQW11sXSANm1
 wPw79pdp8QcKwt2OU/VEdZpDMyfrwGsbkHJLLsXU8/pqGAPz9JWaF49EfAyHtJnhqcpf
 9PE/fVt2cdyXqE+Im5Qhgow8ZULHhhZ8mkxCqU1lRPZXwBjZYUSReJtEr2xuRPo41Tjf
 AD6tI5Lk2yqttnremYbTpUGHj7v+Wc4tn0K2WWZa8ReAqYMiPB44yG9kU9jA/diCI5zs
 mANEfti3dqmPuh4VXhIQU9qizK8p8SdMBLntni/0/dMznietA2kbgdoPTjmiQDd8rbTa 7w== 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=WpVqp4pp
Subject: [Buildroot] [PATCH 1/2] boot/uboot: avoid setting PMUFW_INIT_FILE
 when not used
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
 Brandon Maier <brandon.maier@collins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The CONFIG_PMUFW_INIT_FILE is always set, even when
BR2_TARGET_UBOOT_ZYNQMP_PMUFW is an empty string, which prevents a user
from setting this directly in their U-Boot defconfig or frag.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 boot/uboot/uboot.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index cdb9f435f7..9de0776ace 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -469,9 +469,12 @@ UBOOT_PRE_BUILD_HOOKS += UBOOT_ZYNQMP_PMUFW_CONVERT
 else
 UBOOT_ZYNQMP_PMUFW_PATH_FINAL = $(UBOOT_ZYNQMP_PMUFW_PATH)
 endif
+
+ifneq ($(UBOOT_ZYNQMP_PMUFW_PATH_FINAL),)
 define UBOOT_ZYNQMP_KCONFIG_PMUFW
 	$(call KCONFIG_SET_OPT,CONFIG_PMUFW_INIT_FILE,"$(UBOOT_ZYNQMP_PMUFW_PATH_FINAL)")
 endef
+endif
 
 UBOOT_ZYNQMP_PM_CFG = $(call qstrip,$(BR2_TARGET_UBOOT_ZYNQMP_PM_CFG))
 ifneq ($(UBOOT_ZYNQMP_PM_CFG),)

-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
