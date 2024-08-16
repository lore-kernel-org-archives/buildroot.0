Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A608C531DC
	for <buildroot@archiver.kernel.org>; Fri, 16 Aug 2024 16:37:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC16684156;
	Fri, 16 Aug 2024 16:37:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xngMyBE1K7Hy; Fri, 16 Aug 2024 16:37:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4B2D8445B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4B2D8445B;
	Fri, 16 Aug 2024 16:37:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B01F71BF5A7
 for <buildroot@lists.busybox.net>; Fri, 16 Aug 2024 16:37:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B50B40509
 for <buildroot@lists.busybox.net>; Fri, 16 Aug 2024 16:37:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R5BWv2BIrrhJ for <buildroot@lists.busybox.net>;
 Fri, 16 Aug 2024 16:37:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7AB47404F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7AB47404F9
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7AB47404F9
 for <buildroot@buildroot.org>; Fri, 16 Aug 2024 16:37:38 +0000 (UTC)
Received: from pps.filterd (m0346910.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 47GF1VqZ001263; Fri, 16 Aug 2024 16:37:33 GMT
Received: from xusxph009rp050.rtx.com (xusxph009rp050.rtx.com [128.13.125.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 411mb6apew-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Aug 2024 16:37:33 +0000
Received: from xusxph004rp020.corp.ray.com ([128.13.120.224])
 by xusxph009rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 47GGbVOD016134
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Aug 2024 16:37:31 GMT
Received: from ciulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph004rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 47GGbVuo009595
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 16 Aug 2024 16:37:31 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by ciulimr01.rockwellcollins.com (Postfix) with ESMTP id 46F303003B7A;
 Fri, 16 Aug 2024 11:37:31 -0500 (CDT)
Date: Fri, 16 Aug 2024 16:37:30 +0000
MIME-Version: 1.0
Message-Id: <20240816-zynqmp-kria-defconfig-add-missing-uboot-build-dep-v1-1-30867a0e6f72@collins.com>
X-B4-Tracking: v=1; b=H4sIAEqAv2YC/x2NQQrCMBAAv1L27EITqhW/Ih6S7iYu2iRmrailf
 zd4HBhmVlCuwgqnboXKL1HJqYHZdTBdXYqMQo3B9nboj+aA3096zAVvVRwShymnIBEdEc6iKin
 i4nN+ol/kTs0o6PzoeLRmsLSH1i2Vg7z/z/Nl234O4WfJgwAAAA==
To: buildroot@buildroot.org
X-Mailer: b4 0.14.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-16_11,2024-08-16_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-16_11,2024-08-16_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=2 mlxlogscore=173
 mlxscore=2 phishscore=0
 malwarescore=0 adultscore=0 spamscore=2 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408160117
X-Proofpoint-Spam-Details: rule=notspam policy=default score=3 suspectscore=0
 phishscore=0 bulkscore=0
 spamscore=3 mlxlogscore=145 malwarescore=0 mlxscore=3 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408160117
X-Proofpoint-ORIG-GUID: sbtDvS3zscA5vYyt-OseV8C7JXcVyJgY
X-Proofpoint-GUID: sbtDvS3zscA5vYyt-OseV8C7JXcVyJgY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-16_11,2024-08-16_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 bulkscore=0 spamscore=0
 malwarescore=0 mlxlogscore=234 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408160117
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : message-id :
 mime-version : subject : to; s=POD051818;
 bh=m0Id4ISUXHpzie2KUputEYIel8XtGcu438uwOCZlnoo=;
 b=nmPdiZjM1pmldfWPsEN3UNBx5WpXdPsqMoNgQVsRxO8pq/FyrmZsbtnQ3q79E3iL8qdI
 YxPbxMjAOF1ptu2BdAjJpnLJ/aedDHBRwfLFgE9bJApXaJIhI3uTfv8nC8WGBAO4GJy5
 XjLbLdmeyCv8vJPhSNa6DVwPL76l5HY1OoyaZ5qfnZdihxm8TuBXfczmBuiXmYMymRL5
 8S/1sj0++q/S63YJzM+304CRkZdykxcTtPdsPnHRnUSrRqkILZiSJbX0Fh54iFctrAcn
 7JzDOiCd4xwsWZvkGOsj+v4pCyo8Mu1AzsHULZ1ZPiSwXRpK9FxxSPzJi+MJUst/ePtp Kw== 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=nmPdiZjM
Subject: [Buildroot] [PATCH] configs/zynqmp_kria_*_defconfig: add missing
 U-Boot build dependency
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Brandon Maier <Brandon.Maier@collins.com>

When building these boards with BR2_PER_PACKAGE_DIRECTORIES enabled,
the following error occurs from U-Boot.

  tools/mkeficapsule.c:18:10: fatal error: uuid/uuid.h: No such file or directory
     18 | #include <uuid/uuid.h>
        |          ^~~~~~~~~~~~~

The U-Boot defconfig these boards use 'xilinx_zynqmp_kria' enables
CONFIG_EFI_CAPSULE_ON_DISK, which requires util-linux.

This doesn't fail when BR2_PER_PACKAGE_DIRECTORIES is disabled. This
is because host-e2fsprogs requires host-util-linux, and
host-util-linux always builds before host-uboot when single-threaded.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 configs/zynqmp_kria_kd240_defconfig | 1 +
 configs/zynqmp_kria_kr260_defconfig | 1 +
 configs/zynqmp_kria_kv260_defconfig | 1 +
 3 files changed, 3 insertions(+)

diff --git a/configs/zynqmp_kria_kd240_defconfig b/configs/zynqmp_kria_kd240_defconfig
index dff49b9837..ce76805638 100644
--- a/configs/zynqmp_kria_kd240_defconfig
+++ b/configs/zynqmp_kria_kd240_defconfig
@@ -28,6 +28,7 @@ BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-smk-k24-revA"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
+BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
diff --git a/configs/zynqmp_kria_kr260_defconfig b/configs/zynqmp_kria_kr260_defconfig
index 24fdea9c30..21d01e5f2a 100644
--- a/configs/zynqmp_kria_kr260_defconfig
+++ b/configs/zynqmp_kria_kr260_defconfig
@@ -28,6 +28,7 @@ BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-smk-k26-revA"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
+BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index a16da66e38..f83ef35be3 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -28,6 +28,7 @@ BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-smk-k26-revA"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
+BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y

---
base-commit: c025a655c6adba41df0d8cba0009bbfd5a95ac24
change-id: 20240816-zynqmp-kria-defconfig-add-missing-uboot-build-dep-ab7ae72142d5

Best regards,
-- 
Brandon Maier <brandon.maier@collins.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
