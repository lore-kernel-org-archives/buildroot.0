Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA97C27C53
	for <buildroot@archiver.kernel.org>; Wed, 12 Jun 2024 19:04:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 486EF40514;
	Wed, 12 Jun 2024 19:04:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HV4u8PBUgYCL; Wed, 12 Jun 2024 19:04:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99132404F9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99132404F9;
	Wed, 12 Jun 2024 19:04:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CCD6C1BF369
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 19:04:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B7F91404F9
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 19:04:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jp-Gq6K5flqt for <buildroot@lists.busybox.net>;
 Wed, 12 Jun 2024 19:04:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3A2B5404D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A2B5404D8
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3A2B5404D8
 for <buildroot@buildroot.org>; Wed, 12 Jun 2024 19:04:21 +0000 (UTC)
Received: from pps.filterd (m0346907.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 45CFeWIv024332; Wed, 12 Jun 2024 19:04:17 GMT
Received: from xusxph005rp050.rtx.com (xusxph005rp050.rtx.com [128.13.121.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3yq8606bkq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jun 2024 19:04:17 +0000
Received: from xusxph009rp020.corp.ray.com ([128.13.125.224])
 by xusxph005rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 45CJ4F6D025305
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jun 2024 19:04:16 GMT
Received: from crulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph009rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45CJ4FEn007793
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 12 Jun 2024 19:04:15 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by crulimr01.rockwellcollins.com (Postfix) with ESMTP id 416919A43;
 Wed, 12 Jun 2024 14:04:15 -0500 (CDT)
Date: Wed, 12 Jun 2024 19:04:15 +0000
To: Neal Frager via buildroot <buildroot@buildroot.org>
Message-ID: <ZmnxL570U3YP2AXv@bspbox.kirk>
Mail-Followup-To: Neal Frager via buildroot <buildroot@buildroot.org>,
 ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com, yann.morin.1998@free.fr
References: <20240612075559.436482-1-neal.frager@amd.com>
 <20240612075559.436482-3-neal.frager@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240612075559.436482-3-neal.frager@amd.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_10,2024-06-12_02,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_10,2024-06-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=911
 bulkscore=0 phishscore=0 mlxscore=0 malwarescore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406120136
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=885
 phishscore=0 mlxscore=0 bulkscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406120136
X-Proofpoint-GUID: p5pLM-thnhSBLam3KzRhj82evgenroYP
X-Proofpoint-ORIG-GUID: p5pLM-thnhSBLam3KzRhj82evgenroYP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_10,2024-06-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 adultscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 mlxlogscore=984 suspectscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406120136
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc : content-type :
 date : from : in-reply-to : message-id : mime-version : references :
 subject : to; s=POD051818;
 bh=YLuxVc7mp+Yd+k5Jb8gZEFYXvc3eyHi2RLEakAiNUIM=;
 b=ijPHX95P17j+smRItXZu3gaRHnEHNdQnFTuvjQ8GBCDxnp2tKxobPcULKE6nrrYR9oge
 o9C6RTLaTgGj+AtlTmdtyG/vh86PC3sruCP5Tigz/fjGEv4sM2891oEr1PJXW2Fu0bT9
 RcNAK8jLU74QnsHXb9UQeDEDZknv2Q3RZlpmGJfB2my1juUzc08GyrEV3ygj3cfbSNDE
 PRcjOkzbUKQ5h7trbH355USdJebooL6A+enDiBG/vyc1cphSgoqysB6msPk/b2sNHjWq
 jws+KMy1i/KSGTqcxOS+ZGiT8MaK6MfQook360TGIWW5jtccEiHAAk4ukMXGwtDOfAxt wg== 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=ijPHX95P
Subject: Re: [Buildroot] [PATCH v1 3/5] configs/zynqmp_*: migrate to
 xilinx-prebuilt
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
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2024.06.12 08:55, Neal Frager via buildroot wrote:
> Migrate zynqmp defconfigs to xilinx-prebuilt.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>  .checkpackageignore                 | 5 -----
>  configs/zynqmp_kria_kr260_defconfig | 8 +++++++-
>  configs/zynqmp_kria_kv260_defconfig | 8 +++++++-
>  configs/zynqmp_zcu102_defconfig     | 8 +++++++-
>  configs/zynqmp_zcu104_defconfig     | 8 +++++++-
>  configs/zynqmp_zcu106_defconfig     | 8 +++++++-
>  6 files changed, 35 insertions(+), 10 deletions(-)
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index eea412d01d..6d0011a299 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -362,11 +362,6 @@ configs/visionfive_defconfig lib_defconfig.ForceCheckHash
>  configs/wandboard_defconfig lib_defconfig.ForceCheckHash
>  configs/warp7_defconfig lib_defconfig.ForceCheckHash
>  configs/zynqmp_kria_kd240_defconfig lib_defconfig.ForceCheckHash
> -configs/zynqmp_kria_kr260_defconfig lib_defconfig.ForceCheckHash
> -configs/zynqmp_kria_kv260_defconfig lib_defconfig.ForceCheckHash
> -configs/zynqmp_zcu102_defconfig lib_defconfig.ForceCheckHash
> -configs/zynqmp_zcu104_defconfig lib_defconfig.ForceCheckHash
> -configs/zynqmp_zcu106_defconfig lib_defconfig.ForceCheckHash
>  linux/5.10.162-cip24-rt10/0001-arch-microblaze-mm-init.c-fix-build.patch lib_patch.Upstream
>  package/18xx-ti-utils/0001-plt.h-fix-build-with-gcc-10.patch lib_patch.Upstream
>  package/4th/0001-avoid-regen-during-install.patch lib_patch.Upstream
> diff --git a/configs/zynqmp_kria_kr260_defconfig b/configs/zynqmp_kria_kr260_defconfig
> index 3bf269ab6b..b7b5b4d432 100644
> --- a/configs/zynqmp_kria_kr260_defconfig
> +++ b/configs/zynqmp_kria_kr260_defconfig
> @@ -31,10 +31,16 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
>  BR2_TARGET_UBOOT_SPL=y
>  BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
>  BR2_TARGET_UBOOT_ZYNQMP=y
> -BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2024.1/kr260-kria/pmufw.elf"
> +BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT=y
>  BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/kria/kr260/pm_cfg_obj.c"
>  BR2_TARGET_UBOOT_FORMAT_ITB=y
>  BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
> +BR2_TARGET_XILINX_PREBUILT=y
> +BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.1"
> +BR2_TARGET_XILINX_PREBUILT_BOARD="kr260"
> +BR2_TARGET_XILINX_PREBUILT_KRIA=y
>  BR2_PACKAGE_HOST_DOSFSTOOLS=y
>  BR2_PACKAGE_HOST_GENIMAGE=y
>  BR2_PACKAGE_HOST_MTOOLS=y
> +BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
> +BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
> diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
> index 7b402e032c..a16da66e38 100644
> --- a/configs/zynqmp_kria_kv260_defconfig
> +++ b/configs/zynqmp_kria_kv260_defconfig
> @@ -31,10 +31,16 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
>  BR2_TARGET_UBOOT_SPL=y
>  BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
>  BR2_TARGET_UBOOT_ZYNQMP=y
> -BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2024.1/kv260-kria/pmufw.elf"
> +BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT=y
>  BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/kria/kv260/pm_cfg_obj.c"
>  BR2_TARGET_UBOOT_FORMAT_ITB=y
>  BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
> +BR2_TARGET_XILINX_PREBUILT=y
> +BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.1"
> +BR2_TARGET_XILINX_PREBUILT_BOARD="kv260"
> +BR2_TARGET_XILINX_PREBUILT_KRIA=y
>  BR2_PACKAGE_HOST_DOSFSTOOLS=y
>  BR2_PACKAGE_HOST_GENIMAGE=y
>  BR2_PACKAGE_HOST_MTOOLS=y
> +BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
> +BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
> diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
> index f40002f6d9..faee93b1c6 100644
> --- a/configs/zynqmp_zcu102_defconfig
> +++ b/configs/zynqmp_zcu102_defconfig
> @@ -30,10 +30,16 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
>  BR2_TARGET_UBOOT_SPL=y
>  BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
>  BR2_TARGET_UBOOT_ZYNQMP=y
> -BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2024.1/zcu102-zynqmp/pmufw.elf"
> +BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT=y
>  BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu102/pm_cfg_obj.c"
>  BR2_TARGET_UBOOT_FORMAT_ITB=y
>  BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
> +BR2_TARGET_XILINX_PREBUILT=y
> +BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.1"
> +BR2_TARGET_XILINX_PREBUILT_BOARD="zcu102"
> +BR2_TARGET_XILINX_PREBUILT_ZYNQMP=y
>  BR2_PACKAGE_HOST_DOSFSTOOLS=y
>  BR2_PACKAGE_HOST_GENIMAGE=y
>  BR2_PACKAGE_HOST_MTOOLS=y
> +BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
> +BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
> diff --git a/configs/zynqmp_zcu104_defconfig b/configs/zynqmp_zcu104_defconfig
> index ef9c9bad49..466527695b 100644
> --- a/configs/zynqmp_zcu104_defconfig
> +++ b/configs/zynqmp_zcu104_defconfig
> @@ -30,10 +30,16 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
>  BR2_TARGET_UBOOT_SPL=y
>  BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
>  BR2_TARGET_UBOOT_ZYNQMP=y
> -BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2024.1/zcu104-zynqmp/pmufw.elf"
> +BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT=y
>  BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu104/pm_cfg_obj.c"
>  BR2_TARGET_UBOOT_FORMAT_ITB=y
>  BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
> +BR2_TARGET_XILINX_PREBUILT=y
> +BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.1"
> +BR2_TARGET_XILINX_PREBUILT_BOARD="zcu104"
> +BR2_TARGET_XILINX_PREBUILT_ZYNQMP=y
>  BR2_PACKAGE_HOST_DOSFSTOOLS=y
>  BR2_PACKAGE_HOST_GENIMAGE=y
>  BR2_PACKAGE_HOST_MTOOLS=y
> +BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
> +BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
> diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
> index 07c595436f..686b7f9f94 100644
> --- a/configs/zynqmp_zcu106_defconfig
> +++ b/configs/zynqmp_zcu106_defconfig
> @@ -30,10 +30,16 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
>  BR2_TARGET_UBOOT_SPL=y
>  BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
>  BR2_TARGET_UBOOT_ZYNQMP=y
> -BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2024.1/zcu106-zynqmp/pmufw.elf"
> +BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT=y
>  BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu106/pm_cfg_obj.c"
>  BR2_TARGET_UBOOT_FORMAT_ITB=y
>  BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
> +BR2_TARGET_XILINX_PREBUILT=y
> +BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.1"
> +BR2_TARGET_XILINX_PREBUILT_BOARD="zcu106"
> +BR2_TARGET_XILINX_PREBUILT_ZYNQMP=y
>  BR2_PACKAGE_HOST_DOSFSTOOLS=y
>  BR2_PACKAGE_HOST_GENIMAGE=y
>  BR2_PACKAGE_HOST_MTOOLS=y
> +BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
> +BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
> -- 
> 2.25.1

Reviewed-by: Brandon Maier <brandon.maier@collins.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
