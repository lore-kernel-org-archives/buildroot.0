Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D26CDD553
	for <buildroot@archiver.kernel.org>; Wed, 18 Sep 2024 20:12:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 683F4411DE;
	Wed, 18 Sep 2024 20:12:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3jqBezZaBwIw; Wed, 18 Sep 2024 20:12:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6096400AB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6096400AB;
	Wed, 18 Sep 2024 20:12:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5D4BB1BF30C
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 20:12:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4BBCB427AD
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 20:12:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RT2djhssmtnm for <buildroot@lists.busybox.net>;
 Wed, 18 Sep 2024 20:12:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EE4BF4266D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE4BF4266D
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EE4BF4266D
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 20:12:51 +0000 (UTC)
Received: from pps.filterd (m0346909.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48IITF8d011990;
 Wed, 18 Sep 2024 20:12:51 GMT
Received: from xusxph004rp050.rtx.com (xusxph004rp050.rtx.com [128.13.120.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 41qyw64bub-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Sep 2024 20:12:51 +0000
Received: from xusxph004rp020.corp.ray.com ([128.13.120.224])
 by xusxph004rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 48IKConj028306
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Sep 2024 20:12:50 GMT
Received: from crulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph004rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 48IKCnRC014827
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 18 Sep 2024 20:12:49 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by crulimr01.rockwellcollins.com (Postfix) with ESMTP id CCBB3971B;
 Wed, 18 Sep 2024 15:12:49 -0500 (CDT)
Date: Wed, 18 Sep 2024 20:12:36 +0000
MIME-Version: 1.0
Message-Id: <20240918-ls1046a-frwy-linux-6-6-v1-2-941f6224e052@collins.com>
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
X-MHapp-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999 mlxscore=0
 malwarescore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2408220000
 definitions=main-2409180132
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2408220000
 definitions=main-2409180131
X-Proofpoint-GUID: 9_SIWr0n7csj1qiIVzdAqwZl_X3pzaK7
X-Proofpoint-ORIG-GUID: 9_SIWr0n7csj1qiIVzdAqwZl_X3pzaK7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-18_14,2024-09-18_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 mlxscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 clxscore=1015 malwarescore=0
 lowpriorityscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2408220000 definitions=main-2409180132
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=jpPEgiDYxZNJKWzzBBNDMAW32TGVceFH85dzJpZkOhM=;
 b=WchrUiAkXVEt0cMyTimysclr30S+Aj8qZxTTCvlhGBkxU2SVY4oBnnrj0pHJmpu9LHSt
 aZ8WSQpXZ11tzOG6yGzir0TMrkYt8NajiiR5oxAm6iAJqb6usGQBsGdozuTXp82FBxOi
 qXprfF/jNL38k7q8fhy6k34DseAqE4PWaJxn9u1FM55GlW9Np388wecnmxh9MWgjmN6S
 0keTOfvzRyl/8f57cpFcNQ4+OWRD6tW7+ut4b4M6CiQjuTUMPZsUgPXaJ0gnUWtbGhCt
 7joXHKJW4TmEC2ZHnM49fd/lB8RacW/10Ltca3xu5kr0OawphjfFOwn6uWphx0IR7qZo KQ== 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=WchrUiAk
Subject: [Buildroot] [PATCH 2/5] configs/ls1046a-frwy: update to Linux 6.6
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

Update Linux, U-Boot, and TF-A to the latest versions used by NXP's
Yocto project.

Drop the patches from board/freescale/common as the TF-A patches are
upstream.

The updated Linux kernel increases the rootfs size to 122MB so we bump
the rootfs size slightly to match.

Yocto project: https://github.com/nxp-qoriq/yocto-sdk/tree/scarthgap

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/7803199902
Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash |  2 +-
 board/freescale/ls1046a-frwy/patches/linux/linux.hash      |  2 +-
 board/freescale/ls1046a-frwy/patches/uboot/uboot.hash      |  2 +-
 board/freescale/ls1046a-frwy/readme.txt                    |  6 +++---
 configs/ls1046a-frwy_defconfig                             | 14 +++++++-------
 5 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/board/freescale/ls1046a-frwy/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/ls1046a-frwy/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 17c409530da290baae620085a1fb364355810cb5..f9af28ab3cf55e70d34f7aac509c74a22ad53f53 100644
--- a/board/freescale/ls1046a-frwy/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/freescale/ls1046a-frwy/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  0dda154c335e1a50c727601e698b6a0827e3f92308873b373449fb888df5acfd  atf-LSDK-21.08.tar.gz
+sha256  4f4dc78bfb5b7391a65ae0f83856661071f666ac2bf6a9380fddbe376a8bdaaa  atf-lf-6.6.23-2.0.0.tar.gz
diff --git a/board/freescale/ls1046a-frwy/patches/linux/linux.hash b/board/freescale/ls1046a-frwy/patches/linux/linux.hash
index bd5e29d026cf25f30bc9c686e7e0e89722b31f2c..e038c2286237cfef64bf4d922c74586e2bcaaf94 100644
--- a/board/freescale/ls1046a-frwy/patches/linux/linux.hash
+++ b/board/freescale/ls1046a-frwy/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  6db58cf91b98f7fc279f341279a5d43d4069fb56a660a34209aba6af53ea2b57  linux-LSDK-21.08.tar.gz
+sha256  6d592722e004516309f8ce33e654f1322e4d1f0f33567acb86ca19229176fd9e  linux-lf-6.6.23-2.0.0.tar.gz
diff --git a/board/freescale/ls1046a-frwy/patches/uboot/uboot.hash b/board/freescale/ls1046a-frwy/patches/uboot/uboot.hash
index d0cc110fdd018677217b8e859a9a68657bcbbe4a..a5ccd82b2b0d85df13b0763bf4606efd2613c696 100644
--- a/board/freescale/ls1046a-frwy/patches/uboot/uboot.hash
+++ b/board/freescale/ls1046a-frwy/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  6279c161ad8a218b549e6631be969b74f358cf01a20103953ccaf3bb14185ac2  u-boot-LSDK-21.08.tar.gz
+sha256  a2bcd7a34d4908ffbadfea731d0f0fd20f19a31cff6ff6310980e7f6743ceb24  u-boot-lf-6.6.23-2.0.0.tar.gz
diff --git a/board/freescale/ls1046a-frwy/readme.txt b/board/freescale/ls1046a-frwy/readme.txt
index fbcfdb1b857814c109235b0aed6f5533cce856a6..846e4ebfe30940c45f5f68dcbc62d26134f4ab48 100644
--- a/board/freescale/ls1046a-frwy/readme.txt
+++ b/board/freescale/ls1046a-frwy/readme.txt
@@ -14,10 +14,10 @@ for the software NXP LSDK (Layerscape Software Development Kit), see
 
 the components from NXP are:
   - rcw, LSDK 21.08
-  - atf (fork), LSDK 21.08
-  - uboot (fork), LSDK 21.08
+  - atf (fork), lf-6.6.23-2.0.0
+  - uboot (fork), lf-6.6.23-2.0.0
   - qoriq-fm-ucode (blob), LSDK 21.08
-  - linux (fork), LSDK 21.08
+  - linux (fork), lf-6.6.23-2.0.0
 
 Build
 =====
diff --git a/configs/ls1046a-frwy_defconfig b/configs/ls1046a-frwy_defconfig
index 51abf2a8c686d34a87eab193d283433c3f8e4ae5..180aa75381693d2c35b6e363e96d3464669c9134 100644
--- a/configs/ls1046a-frwy_defconfig
+++ b/configs/ls1046a-frwy_defconfig
@@ -3,12 +3,12 @@ BR2_aarch64=y
 BR2_cortex_a72=y
 
 # patches
-BR2_GLOBAL_PATCH_DIR="board/freescale/ls1046a-frwy/patches board/freescale/common/patches"
+BR2_GLOBAL_PATCH_DIR="board/freescale/ls1046a-frwy/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 
 # Toolchain
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel, a 6.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
 # System configuration
 BR2_TARGET_GENERIC_HOSTNAME="ls1046afrwy"
@@ -22,7 +22,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/freescale/ls1046a-frwy/genimage.cfg"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,linux,LSDK-21.08)/linux-LSDK-21.08.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,linux,lf-6.6.23-2.0.0)/linux-lf-6.6.23-2.0.0.tar.gz"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm64/configs/lsdk.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -32,13 +32,13 @@ BR2_LINUX_KERNEL_INSTALL_TARGET=y
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
 # BR2_TARGET_ROOTFS_TAR is not set
 
 # Bootloaders
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,atf,LSDK-21.08)/atf-LSDK-21.08.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,atf,lf-6.6.23-2.0.0)/atf-lf-6.6.23-2.0.0.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="ls1046afrwy"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_RCW=y
@@ -48,7 +48,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin bl2_sd.pbl"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,u-boot,LSDK-21.08)/u-boot-LSDK-21.08.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,u-boot,lf-6.6.23-2.0.0)/u-boot-lf-6.6.23-2.0.0.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="ls1046afrwy_tfa"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 

-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
