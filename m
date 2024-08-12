Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B41A6C3DA7F
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 13:02:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDBB8402BD;
	Mon, 12 Aug 2024 13:02:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ONZjEHvbSpJZ; Mon, 12 Aug 2024 13:02:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C2DC402EE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C2DC402EE;
	Mon, 12 Aug 2024 13:02:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 862A01BF301
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 13:02:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 80719400B5
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 13:02:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RIQMtdtmtckb for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 13:02:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 052C340018
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 052C340018
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 052C340018
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 13:02:19 +0000 (UTC)
Received: from pps.filterd (m0346901.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 47CBZGLf025804; Mon, 12 Aug 2024 13:02:15 GMT
Received: from xusxph008rp050.rtx.com (xusxph008rp050.rtx.com [128.13.124.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 40x0tgjt2k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Aug 2024 13:02:15 +0000
Received: from xusxph005rp020.corp.ray.com ([128.13.121.224])
 by xusxph008rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 47CD2Dm1024212
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Aug 2024 13:02:14 GMT
Received: from dtulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph005rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 47CD2Dl5015387
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 12 Aug 2024 13:02:13 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by dtulimr01.rockwellcollins.com (Postfix) with ESMTP id 148A020054AD;
 Mon, 12 Aug 2024 08:02:13 -0500 (CDT)
Mime-Version: 1.0
Date: Mon, 12 Aug 2024 13:02:12 +0000
Message-Id: <D3DYBM9N4T77.1K5PYI39GAQNE@collins.com>
To: "Neal Frager" <neal.frager@amd.com>, <buildroot@buildroot.org>
X-Mailer: aerc 0.17.0-0-g6ea74eb30457
References: <20240812052101.2920141-1-neal.frager@amd.com>
In-Reply-To: <20240812052101.2920141-1-neal.frager@amd.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-12_03,2024-08-12_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-12_03,2024-08-12_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 bulkscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408120097
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 bulkscore=0 adultscore=0 phishscore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408120097
X-Proofpoint-ORIG-GUID: PPCCo-Nsp5L1Aco1Ci6QADeq_5UCMY39
X-Proofpoint-GUID: PPCCo-Nsp5L1Aco1Ci6QADeq_5UCMY39
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-12_03,2024-08-12_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 mlxscore=0 phishscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2407110000 definitions=main-2408120097
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=HNiT1rm/uWzMZAZhHvTzuQZRlColI+PXU9+3Qy2cPJM=;
 b=PU0NfCptmBv41IuebH8w1sRzCqpchjpe9/+9WLJwYZEP2SKw1KniwDhF2Kex/j/8ldMe
 BzTRpWbJpsgCCaVLaHT0NOKl3fl3xmv6p4GhxVniPDh/GAq82cq4+SJtTFY8Cyh2i9Bh
 xmUHgB7Jux/3iAxSut4mMagd6CskRH4vuTkODLTwpUUFnJ4NXvTqZaROVH85Irpg0Dac
 aRsGa6xJ+zt43wGEEPl3svrb4YNWX8ZowOD6mX/nhlsic2J8P2iauMU/cHspTuiNrJtn
 BVMV7COhF+gxX0eJxEyADYwvYrCpokSkKPosZkxX94pRpRymew+pC0zhRr82xVs5/vKn MQ== 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=PU0NfCpt
Subject: Re: [Buildroot] [PATCH v4 1/1] configs/versal_vek280_defconfig: new
 defconfig
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
Cc: michal.simek@amd.com, romain.naour@smile.fr, luca.ceresoli@bootlin.com,
 yann.morin.1998@free.fr, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon Aug 12, 2024 at 5:21 AM UTC, Neal Frager via buildroot wrote:
> This patch adds support for Xilinx Versal VEK280 Evaluation Kit.
>
> VEK280 features can be found here:
> https://www.xilinx.com/products/boards-and-kits/vek280.html
>
> The VEK280 requires a patch for the memory node in the dts file because it is
> not currently correct.  This patch has been applied to the linux-xlnx repo and
> will be included in the 2024.2 release.
>
> Upstream: https://github.com/Xilinx/linux-xlnx/commit/3c7a97d99bdb3dd6b1f36d7d87d3a3c113dfe2ea
>
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Reviewed-by: Brandon Maier <brandon.maier@collins.com>

> ---
> V1->V2:
> - Fixed memory range in dts files for vek280 evaluation board.
> V2->V3:
> - Added Upstream link to vek280 patch.
> V3->V4:
> - Bumped to Linux 6.6.40
> ---
>  DEVELOPERS                                    |  1 +
>  board/versal/readme.txt                       |  4 ++
>  ...rsal-Fix-vek280-memory-configuration.patch | 47 +++++++++++++++++++
>  configs/versal_vek280_defconfig               | 44 +++++++++++++++++
>  4 files changed, 96 insertions(+)
>  create mode 100644 board/versal/vek280/patches/linux/0001-arm64-versal-Fix-vek280-memory-configuration.patch
>  create mode 100644 configs/versal_vek280_defconfig
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 76f7fc5ed6..d07f41fe91 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2403,6 +2403,7 @@ F:	board/zynq/
>  F:	board/zynqmp/
>  F:	boot/xilinx-prebuilt/
>  F:	configs/versal_vck190_defconfig
> +F:	configs/versal_vek280_defconfig
>  F:	configs/versal_vpk180_defconfig
>  F:	configs/zynq_zc702_defconfig
>  F:	configs/zynq_zc706_defconfig
> diff --git a/board/versal/readme.txt b/board/versal/readme.txt
> index 9cf499b35b..4d8406fb1f 100644
> --- a/board/versal/readme.txt
> +++ b/board/versal/readme.txt
> @@ -4,6 +4,7 @@ Xilinx Versal boards:
>  ******************************************
>  Supported Versal Boards:
>  Xilinx VCK190 board
> +Xilinx VEK280 board
>  Xilinx VPK180 board
>  ******************************************
>
> @@ -12,6 +13,9 @@ Evaluation board features can be found here with the links below.
>  VCK190:
>  https://www.xilinx.com/products/boards-and-kits/vck190.html
>
> +VEK280:
> +https://www.xilinx.com/products/boards-and-kits/vek280.html
> +
>  VPK180:
>  https://www.xilinx.com/products/boards-and-kits/vpk180.html
>
> diff --git a/board/versal/vek280/patches/linux/0001-arm64-versal-Fix-vek280-memory-configuration.patch b/board/versal/vek280/patches/linux/0001-arm64-versal-Fix-vek280-memory-configuration.patch
> new file mode 100644
> index 0000000000..d894ad35d1
> --- /dev/null
> +++ b/board/versal/vek280/patches/linux/0001-arm64-versal-Fix-vek280-memory-configuration.patch
> @@ -0,0 +1,47 @@
> +From: Michal Simek <michal.simek@amd.com>
> +Date: Mon, 15 Jul 2024 08:24:57 +0200
> +Subject: [PATCH] arm64: versal: Fix vek280 memory configuration
> +
> +Board has 12GB total but Vivado wizard supports one channel LPDDR4 4GB
> +configuration (2GB low + 2GB high) or two channel LPDDR 8GB configuration
> +(2GB low + 6GB high). Wiring the remaining 4GB LPDDR can be done via board
> +tab but not available as option in wizard. That's why only describe 8GB by
> +default.
> +
> +Signed-off-by: Michal Simek <michal.simek@amd.com>
> +Signed-off-by: Neal Frager <neal.frager@amd.com>
> +Upstream: https://github.com/Xilinx/linux-xlnx/commit/3c7a97d99bdb3dd6b1f36d7d87d3a3c113dfe2ea
> +---
> + arch/arm64/boot/dts/xilinx/versal-vek280-revA.dts | 2 +-
> + arch/arm64/boot/dts/xilinx/versal-vek280-revB.dts | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/arch/arm64/boot/dts/xilinx/versal-vek280-revA.dts b/arch/arm64/boot/dts/xilinx/versal-vek280-revA.dts
> +index 1641dc0b5141..ad5d590318e6 100644
> +--- a/arch/arm64/boot/dts/xilinx/versal-vek280-revA.dts
> ++++ b/arch/arm64/boot/dts/xilinx/versal-vek280-revA.dts
> +@@ -19,7 +19,7 @@ / {
> +
> + 	memory: memory@0 {
> + 		device_type = "memory";
> +-		reg = <0 0 0 0x80000000>, <0x8 0x0 0x7 0x80000000>; /* 32GB */
> ++		reg = <0 0 0 0x80000000>, <0x8 0x80000000 0x1 0x80000000>; /* 2GB + 6GB */
> + 	};
> +
> + 	chosen {
> +diff --git a/arch/arm64/boot/dts/xilinx/versal-vek280-revB.dts b/arch/arm64/boot/dts/xilinx/versal-vek280-revB.dts
> +index fda47cd87b3a..80aae8fa4b11 100644
> +--- a/arch/arm64/boot/dts/xilinx/versal-vek280-revB.dts
> ++++ b/arch/arm64/boot/dts/xilinx/versal-vek280-revB.dts
> +@@ -19,7 +19,7 @@ / {
> +
> + 	memory: memory@0 {
> + 		device_type = "memory";
> +-		reg = <0 0 0 0x80000000>, <0x8 0x0 0x7 0x80000000>; /* 32GB */
> ++		reg = <0 0 0 0x80000000>, <0x8 0x80000000 0x1 0x80000000>; /* 2GB + 6GB */
> + 	};
> +
> + 	chosen {
> +--
> +2.43.0
> +
> diff --git a/configs/versal_vek280_defconfig b/configs/versal_vek280_defconfig
> new file mode 100644
> index 0000000000..5831d4d159
> --- /dev/null
> +++ b/configs/versal_vek280_defconfig
> @@ -0,0 +1,44 @@
> +BR2_aarch64=y
> +BR2_cortex_a72=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
> +BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vek280-revB"
> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +# BR2_TARGET_ROOTFS_TAR is not set
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.10_2024.1)/xlnx_rebase_v2.10_2024.1.tar.gz"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="versal"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
> +BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
> +BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
> +BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2024.01_2024.1)/xlnx_rebase_v2024.01_2024.1.tar.gz"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_versal_virt"
> +BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vek280-revB"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
> +BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
> +BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
> +BR2_TARGET_UBOOT_FORMAT_DTB=y
> +BR2_TARGET_XILINX_PREBUILT=y
> +BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.1"
> +BR2_TARGET_XILINX_PREBUILT_BOARD="vek280"
> +BR2_TARGET_XILINX_PREBUILT_VERSAL=y
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MTOOLS=y
> +BR2_PACKAGE_HOST_BOOTGEN=y
> +BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
> +BR2_GLOBAL_PATCH_DIR="board/versal/vek280/patches board/xilinx/patches"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
