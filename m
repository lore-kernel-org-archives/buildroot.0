Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5838AC27C79
	for <buildroot@archiver.kernel.org>; Thu, 20 Jun 2024 14:34:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FAAF811B1;
	Thu, 20 Jun 2024 14:34:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TQb4UkX7-tf4; Thu, 20 Jun 2024 14:34:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B71D3846E9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B71D3846E9;
	Thu, 20 Jun 2024 14:34:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1AF9A1BF3EB
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 14:34:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0547A42F0B
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 14:34:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p3S5Hzoz0oKP for <buildroot@lists.busybox.net>;
 Thu, 20 Jun 2024 14:34:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8864042DB5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8864042DB5
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8864042DB5
 for <buildroot@buildroot.org>; Thu, 20 Jun 2024 14:34:46 +0000 (UTC)
Received: from pps.filterd (m0346905.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 45K9EFgT008090; Thu, 20 Jun 2024 14:34:42 GMT
Received: from xusxph004rp050.rtx.com (xusxph004rp050.rtx.com [128.13.120.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3yv53c00c7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Jun 2024 14:34:42 +0000
Received: from xusxph009rp020.corp.ray.com ([128.13.125.224])
 by xusxph004rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 45KEYfBI011966
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Jun 2024 14:34:41 GMT
Received: from dtulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph009rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45KEYflY011849
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 20 Jun 2024 14:34:41 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by dtulimr02.rockwellcollins.com (Postfix) with ESMTP id E03DC3026D48;
 Thu, 20 Jun 2024 09:34:40 -0500 (CDT)
Date: Thu, 20 Jun 2024 14:34:40 +0000
To: Neal Frager via buildroot <buildroot@buildroot.org>
Message-ID: <ZnQ-ABlbATmee1fi@bspbox.kirk>
Mail-Followup-To: Neal Frager via buildroot <buildroot@buildroot.org>,
 andy.a.kennedy@collins.com, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>, michal.simek@amd.com,
 yann.morin.1998@free.fr
References: <20240619101343.1240550-1-neal.frager@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240619101343.1240550-1-neal.frager@amd.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-20_07,2024-06-20_04,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-20_07,2024-06-20_04,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 spamscore=0 adultscore=0 bulkscore=0 mlxscore=0 mlxlogscore=563
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406200104
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 mlxscore=0 mlxlogscore=537 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406200104
X-Proofpoint-GUID: YrIkE2sHJbU5pgpApKIOOSx36et1hGC9
X-Proofpoint-ORIG-GUID: YrIkE2sHJbU5pgpApKIOOSx36et1hGC9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-20_07,2024-06-20_04,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 clxscore=1015
 mlxscore=0 bulkscore=0 phishscore=0 impostorscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 mlxlogscore=637 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2405010000 definitions=main-2406200104
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc : content-type :
 date : from : in-reply-to : message-id : mime-version : references :
 subject : to; s=POD051818;
 bh=IG2VfkRviqLaELT5B6V9F8D4PwS9WZSrGAp/rd7My/A=;
 b=tmbLpwzc5scgtu0I73AMiw5lI0mi2u+24XrCcRrHRbMhdiH8sJismO+YSP9MuwJZPRIv
 n35HGOaA3+wWtE4TdyVqCKuoZVyflQkkvEm0BZyniUsWe1qJrMfmTMbaYWhPtOtwV36c
 k0393iA3zj8s1OBm2cUF+Kb3TJRrWfIEVILFqTKDHKIdDcpqCaoIcLRW64N8Ihrdqd6z
 RT9X0NTNgJlkRILpBqr4Z4K8hQOsGTgzLS/T/I1qRW4OqoN08uRkQTFty0YwJfu9DjdH
 kziW/8K2eswJBgVcmW1mKoD0YceUur/xTfOBsvFLptaBiRNNYXDiHw2vSTKJ2LJLhCAf jA== 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=tmbLpwzc
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/versal_vpk180_defconfig: new
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
Cc: andy.a.kennedy@collins.com, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>, michal.simek@amd.com,
 yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

On 2024.06.19 11:13, Neal Frager via buildroot wrote:
> This patch adds support for Xilinx Versal VPK180 Evaluation Kit.
> 
> VPK180 features can be found here:
> https://www.xilinx.com/products/boards-and-kits/vpk180.html
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Booted this on a VPK180, everything looks good. Thanks!

Reviewed-by: Brandon Maier <brandon.maier@collins.com>
Tested-by: Brandon Maier <brandon.maier@collins.com>

> ---
>  DEVELOPERS                      |  1 +
>  board/versal/readme.txt         | 16 +++++++-----
>  configs/versal_vpk180_defconfig | 44 +++++++++++++++++++++++++++++++++
>  3 files changed, 55 insertions(+), 6 deletions(-)
>  create mode 100644 configs/versal_vpk180_defconfig
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 8bfd36f1d8..708a02162a 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2341,6 +2341,7 @@ F:	board/zynq/
>  F:	board/zynqmp/
>  F:	boot/xilinx-prebuilt/
>  F:	configs/versal_vck190_defconfig
> +F:	configs/versal_vpk180_defconfig
>  F:	configs/zynq_zc702_defconfig
>  F:	configs/zynq_zc706_defconfig
>  F:	configs/zynqmp_kria_kd240_defconfig
> diff --git a/board/versal/readme.txt b/board/versal/readme.txt
> index 9f234be620..9cf499b35b 100644
> --- a/board/versal/readme.txt
> +++ b/board/versal/readme.txt
> @@ -1,16 +1,20 @@
> +This document describes the Buildroot support for the following
> +Xilinx Versal boards:
> +
>  ******************************************
> -Xilinx VCK190 board - Versal
> +Supported Versal Boards:
> +Xilinx VCK190 board
> +Xilinx VPK180 board
>  ******************************************
>  
> -This document describes the Buildroot support for the VCK190
> -board by Xilinx, based on Versal.  It has been tested with the 
> -VCK190 production board.
> -
> -Evaluation board features can be found here with the link below.
> +Evaluation board features can be found here with the links below.
>  
>  VCK190:
>  https://www.xilinx.com/products/boards-and-kits/vck190.html
>  
> +VPK180:
> +https://www.xilinx.com/products/boards-and-kits/vpk180.html
> +
>  
>  How to build it
>  ===============
> diff --git a/configs/versal_vpk180_defconfig b/configs/versal_vpk180_defconfig
> new file mode 100644
> index 0000000000..253a6d2cff
> --- /dev/null
> +++ b/configs/versal_vpk180_defconfig
> @@ -0,0 +1,44 @@
> +BR2_aarch64=y
> +BR2_cortex_a72=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
> +BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vpk180-revA"
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
> +BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vpk180-revA"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
> +BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
> +BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
> +BR2_TARGET_UBOOT_FORMAT_DTB=y
> +BR2_TARGET_XILINX_PREBUILT=y
> +BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.1"
> +BR2_TARGET_XILINX_PREBUILT_BOARD="vpk180"
> +BR2_TARGET_XILINX_PREBUILT_VERSAL=y
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MTOOLS=y
> +BR2_PACKAGE_HOST_BOOTGEN=y
> +BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
> +BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
