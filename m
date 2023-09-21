Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1992DE7D0AE
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 21:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1DD640CAA;
	Thu, 21 Sep 2023 21:56:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1DD640CAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r6xhAc4go2YF; Thu, 21 Sep 2023 21:56:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C535A400FB;
	Thu, 21 Sep 2023 21:56:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C535A400FB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0A3AC1BF3DB
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 21:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D72E483CE8
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 21:56:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D72E483CE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MxX_pI-SP8Uu for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 21:56:50 +0000 (UTC)
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8FEEB83CE5
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 21:56:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FEEB83CE5
Received: from pps.filterd (m0346902.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38LI6DuI019228; Thu, 21 Sep 2023 21:56:48 GMT
Received: from xusxph009rp050.rtx.com (xusxph009rp050.rtx.com [128.13.125.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3t8ttmjdjc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Sep 2023 21:56:47 +0000
Received: from xusxph009rp020.corp.ray.com ([128.13.125.224])
 by xusxph009rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 38LLukcO013913
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Sep 2023 21:56:46 GMT
Received: from crulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph009rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 38LLuk8A024952
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 21 Sep 2023 21:56:46 GMT
X-Received: from bspbox.kirk (kirk.rockwellcollins.lab [10.148.204.208])
 by crulimr01.rockwellcollins.com (Postfix) with ESMTP id 59A60605CF;
 Thu, 21 Sep 2023 16:56:46 -0500 (CDT)
To: buildroot@buildroot.org
Date: Thu, 21 Sep 2023 21:56:30 +0000
Message-ID: <20230921215633.34828-1-brandon.maier@collins.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-21_19,2023-09-21_01,2023-05-22_02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-21_19,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2309210190
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0
 malwarescore=0 mlxscore=0 phishscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309210189
X-Proofpoint-ORIG-GUID: tY44Yxu7hvo6e3DahduX7p53Q5rJF53x
X-Proofpoint-GUID: tY44Yxu7hvo6e3DahduX7p53Q5rJF53x
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 impostorscore=0 clxscore=1011 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 adultscore=0 mlxlogscore=999 spamscore=0 phishscore=0
 bulkscore=0 mlxscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2309180000 definitions=main-2309210190
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=POD051818; bh=49zgEDxO/R1eDlAFg8TPKL4lLC0HVmOzwVo6cpe0v1s=;
 b=hdIEcpcawf6QqwpesFtWoXi3RQ1DVrnWedsguMT2+iRtl6WDuhNw+MtDpDKs80VOmKsC
 hpCVCa2YzmBydF15DMlTT3UKtFSS30q+5gjVoDE8m4K7rV4yWEnISpINTOm/e1bj6Env
 PKAD2pnVFGAg6/kyzVztDX1fEDEidYFi484RNxMJCCYsfQnLcvPN5JQ/VRM6q9xKrVvb
 cM0fQAyDjaxnNOz71AAWDtvJBiUhB163b+25lXRiBRNR+OC30wC1a6eUK/IwN7TYJOAJ
 JvZ9XK2+AYtmHqOnp/QsOZ0o98u5pwTKziI89ool5xI/VxLic2lprqj8GYK4ZB/JTWNo PA== 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=hdIEcpca
Subject: [Buildroot] [PATCH 1/4] board/freescale: fix arm-trusted-firmware
 for binutils 2.39+
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

The NXP arm-trusted-firmware forks use an older version of ATF that will
error with "LOAD segment with RWX permissions". Similar patches are
present in boot/arm-trusted-firmware/ for older ATF versions.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 ...dd-support-for-new-binutils-versions.patch | 61 +++++++++++++++++++
 configs/freescale_imx8mmevk_defconfig         |  1 +
 configs/freescale_imx8mnevk_defconfig         |  1 +
 configs/freescale_imx8mpevk_defconfig         |  1 +
 configs/freescale_imx8mqevk_defconfig         |  1 +
 configs/freescale_imx8qmmek_defconfig         |  1 +
 configs/freescale_imx8qxpmek_defconfig        |  1 +
 configs/ls1028ardb_defconfig                  |  3 +
 8 files changed, 70 insertions(+)
 create mode 100644 board/freescale/common/patches/arm-trusted-firmware/0001-feat-build-add-support-for-new-binutils-versions.patch

diff --git a/board/freescale/common/patches/arm-trusted-firmware/0001-feat-build-add-support-for-new-binutils-versions.patch b/board/freescale/common/patches/arm-trusted-firmware/0001-feat-build-add-support-for-new-binutils-versions.patch
new file mode 100644
index 0000000000..335c18553a
--- /dev/null
+++ b/board/freescale/common/patches/arm-trusted-firmware/0001-feat-build-add-support-for-new-binutils-versions.patch
@@ -0,0 +1,61 @@
+From 0f75b03c008eacb9818af3a56dc088e72a623d17 Mon Sep 17 00:00:00 2001
+From: Marco Felsch <m.felsch@pengutronix.de>
+Date: Wed, 9 Nov 2022 12:59:09 +0100
+Subject: [PATCH] feat(build): add support for new binutils versions
+
+Users of GNU ld (BPF) from binutils 2.39+ will observe multiple instaces
+of a new warning when linking the bl*.elf in the form:
+
+  ld.bfd: warning: stm32mp1_helper.o: missing .note.GNU-stack section implies executable stack
+  ld.bfd: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
+  ld.bfd: warning: bl2.elf has a LOAD segment with RWX permissions
+  ld.bfd: warning: bl32.elf has a LOAD segment with RWX permissions
+
+These new warnings are enbaled by default to secure elf binaries:
+ - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107
+ - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=0d38576a34ec64a1b4500c9277a8e9d0f07e6774
+
+Fix it in a similar way to what the Linux kernel does, see:
+https://lore.kernel.org/all/20220810222442.2296651-1-ndesaulniers@google.com/
+
+Following the reasoning there, we set "-z noexecstack" for all linkers
+(although LLVM's LLD defaults to it) and optional add
+--no-warn-rwx-segments since this a ld.bfd related.
+
+Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
+Signed-off-by: Robert Schwebel <r.schwebel@pengutronix.de>
+Change-Id: I9430f5fa5036ca88da46cd3b945754d62616b617
+Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
+Upstream: https://github.com/ARM-software/arm-trusted-firmware/commit/1f49db5f25cdd4e43825c9bcc0575070b80f628c
+---
+ Makefile | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 1ddb7b844..470956b19 100644
+--- a/Makefile
++++ b/Makefile
+@@ -416,6 +416,8 @@ endif
+ 
+ GCC_V_OUTPUT		:=	$(shell $(CC) -v 2>&1)
+ 
++TF_LDFLAGS		+=	-z noexecstack
++
+ # LD = armlink
+ ifneq ($(findstring armlink,$(notdir $(LD))),)
+ TF_LDFLAGS		+=	--diag_error=warning --lto_level=O1
+@@ -442,7 +444,10 @@ TF_LDFLAGS		+=	$(subst --,-Xlinker --,$(TF_LDFLAGS_$(ARCH)))
+ 
+ # LD = gcc-ld (ld) or llvm-ld (ld.lld) or other
+ else
+-TF_LDFLAGS		+=	--fatal-warnings -O1
++# With ld.bfd version 2.39 and newer new warnings are added. Skip those since we
++# are not loaded by a elf loader.
++TF_LDFLAGS		+=	$(call ld_option, --no-warn-rwx-segments)
++TF_LDFLAGS		+=	-O1
+ TF_LDFLAGS		+=	--gc-sections
+ # ld.lld doesn't recognize the errata flags,
+ # therefore don't add those in that case
+-- 
+2.30.2
+
diff --git a/configs/freescale_imx8mmevk_defconfig b/configs/freescale_imx8mmevk_defconfig
index dcb4b42540..ca5c308da6 100644
--- a/configs/freescale_imx8mmevk_defconfig
+++ b/configs/freescale_imx8mmevk_defconfig
@@ -1,6 +1,7 @@
 BR2_aarch64=y
 BR2_ARM_FPU_VFPV3=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+BR2_GLOBAL_PATCH_DIR="board/freescale/common/patches"
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh board/freescale/common/imx/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/imx8mm-evk.dtb"
diff --git a/configs/freescale_imx8mnevk_defconfig b/configs/freescale_imx8mnevk_defconfig
index 0653978d91..ac73bea769 100644
--- a/configs/freescale_imx8mnevk_defconfig
+++ b/configs/freescale_imx8mnevk_defconfig
@@ -1,6 +1,7 @@
 BR2_aarch64=y
 BR2_ARM_FPU_VFPV3=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+BR2_GLOBAL_PATCH_DIR="board/freescale/common/patches"
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh board/freescale/common/imx/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/imx8mn-ddr4-evk.dtb"
diff --git a/configs/freescale_imx8mpevk_defconfig b/configs/freescale_imx8mpevk_defconfig
index 5a72406b67..913c190d87 100644
--- a/configs/freescale_imx8mpevk_defconfig
+++ b/configs/freescale_imx8mpevk_defconfig
@@ -1,6 +1,7 @@
 BR2_aarch64=y
 BR2_ARM_FPU_VFPV3=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+BR2_GLOBAL_PATCH_DIR="board/freescale/common/patches"
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh board/freescale/common/imx/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/imx8mp-evk.dtb"
diff --git a/configs/freescale_imx8mqevk_defconfig b/configs/freescale_imx8mqevk_defconfig
index e3f88dc44c..79375d7f88 100644
--- a/configs/freescale_imx8mqevk_defconfig
+++ b/configs/freescale_imx8mqevk_defconfig
@@ -1,6 +1,7 @@
 BR2_aarch64=y
 BR2_ARM_FPU_VFPV3=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+BR2_GLOBAL_PATCH_DIR="board/freescale/common/patches"
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh board/freescale/common/imx/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/imx8mq-evk.dtb"
diff --git a/configs/freescale_imx8qmmek_defconfig b/configs/freescale_imx8qmmek_defconfig
index 75777646df..0fc3fe7b07 100644
--- a/configs/freescale_imx8qmmek_defconfig
+++ b/configs/freescale_imx8qmmek_defconfig
@@ -1,6 +1,7 @@
 BR2_aarch64=y
 BR2_ARM_FPU_VFPV4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+BR2_GLOBAL_PATCH_DIR="board/freescale/common/patches"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh board/freescale/common/imx/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/fsl-imx8qm-mek.dtb"
 BR2_LINUX_KERNEL=y
diff --git a/configs/freescale_imx8qxpmek_defconfig b/configs/freescale_imx8qxpmek_defconfig
index ce8f6b7c84..47a2104d5b 100644
--- a/configs/freescale_imx8qxpmek_defconfig
+++ b/configs/freescale_imx8qxpmek_defconfig
@@ -2,6 +2,7 @@ BR2_aarch64=y
 BR2_cortex_a35=y
 BR2_ARM_FPU_VFPV3=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+BR2_GLOBAL_PATCH_DIR="board/freescale/common/patches"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyLP0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh board/freescale/common/imx/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/fsl-imx8qxp-mek.dtb"
diff --git a/configs/ls1028ardb_defconfig b/configs/ls1028ardb_defconfig
index a46b94511a..d92c543b44 100644
--- a/configs/ls1028ardb_defconfig
+++ b/configs/ls1028ardb_defconfig
@@ -2,6 +2,9 @@
 BR2_aarch64=y
 BR2_cortex_a72=y
 
+# patches
+BR2_GLOBAL_PATCH_DIR="board/freescale/common/patches"
+
 # Toolchain
 # Linux headers same as kernel, a 5.10 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
