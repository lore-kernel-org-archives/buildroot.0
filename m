Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA28FC27C75
	for <buildroot@archiver.kernel.org>; Thu, 13 Jun 2024 12:33:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73A0460EC4;
	Thu, 13 Jun 2024 12:33:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kB8khoeKb8Ye; Thu, 13 Jun 2024 12:33:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57CED60EFC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57CED60EFC;
	Thu, 13 Jun 2024 12:33:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EAC461BF34E
 for <buildroot@lists.busybox.net>; Thu, 13 Jun 2024 12:33:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D863E60EFC
 for <buildroot@lists.busybox.net>; Thu, 13 Jun 2024 12:33:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PXO4YOf8MMyh for <buildroot@lists.busybox.net>;
 Thu, 13 Jun 2024 12:33:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A20A360EC4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A20A360EC4
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A20A360EC4
 for <buildroot@buildroot.org>; Thu, 13 Jun 2024 12:33:24 +0000 (UTC)
Received: from pps.filterd (m0346901.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 45D9jBOv020915; Thu, 13 Jun 2024 12:33:20 GMT
Received: from xusxph004rp050.rtx.com (xusxph004rp050.rtx.com [128.13.120.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3yqegu96tk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 Jun 2024 12:33:20 +0000
Received: from xusxph004rp020.corp.ray.com ([128.13.120.224])
 by xusxph004rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 45DCXJq6015810
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 Jun 2024 12:33:19 GMT
Received: from dtulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph004rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45DCXIKQ016797
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 13 Jun 2024 12:33:19 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by dtulimr02.rockwellcollins.com (Postfix) with ESMTP id C5BFA3150AE7;
 Thu, 13 Jun 2024 07:33:18 -0500 (CDT)
Date: Thu, 13 Jun 2024 12:33:17 +0000
To: Neal Frager via buildroot <buildroot@buildroot.org>
Message-ID: <ZmrnDcJj3wjCVmyo@bspbox.kirk>
Mail-Followup-To: Neal Frager via buildroot <buildroot@buildroot.org>,
 ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com, yann.morin.1998@free.fr
References: <20240613061423.1737631-1-neal.frager@amd.com>
 <20240613061423.1737631-3-neal.frager@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240613061423.1737631-3-neal.frager@amd.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-13_04,2024-06-13_02,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-13_05,2024-06-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 suspectscore=0
 malwarescore=0 adultscore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406130091
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406130091
X-Proofpoint-GUID: n71hlsvqWweTKjwPKwMKJs_muJjmOIEk
X-Proofpoint-ORIG-GUID: n71hlsvqWweTKjwPKwMKJs_muJjmOIEk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-13_05,2024-06-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 impostorscore=0 malwarescore=0 phishscore=0 mlxlogscore=999 adultscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 clxscore=1015 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406130091
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc : content-type :
 date : from : in-reply-to : message-id : mime-version : references :
 subject : to; s=POD051818;
 bh=zHHIx0oyUfzIotLwDtAD2Vj7GsJCn2lVzYG+l5DxLnM=;
 b=jT/SEP5yYRxmXuQAbwB4HxbUMqd8uTI4o/B9pF2bJy9OauAgKkZHVWdV8r1E1I4Yd43W
 Q/J+yhlTY8ZU5DM8H9jh6v0hUGySFtRsBG8PhbMwn34pkbH4ipp1w1kuDNenkL5fH+AL
 6Tf5//HeE0LNf8sGUMv8IXeX5wn89Y2r+tXgYrN96G5a5U5JDZeLNk2RuO+L7StXcEjS
 iO8qUGKjiGqLOZFctHWSB6a/TcpOqMk6OX15I2zWiuJ48pAg57A2hSCobHiorGteQDwd
 ErBgm2E/YASIlo4GXL+sdCh2CZaer5ydyqCHNVHixKyEp8ZNPLxwrSPzIAZq9ybHyGlD 5Q== 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=jT/SEP5y
Subject: Re: [Buildroot] [PATCH v2 3/5] configs/zynqmp_*: migrate to
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

On 2024.06.13 07:14, Neal Frager via buildroot wrote:
> Migrate zynqmp defconfigs to xilinx-prebuilt.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Reviewed-by: Brandon Maier <brandon.maier@collins.com>

> ---
> V1->V2:
> - no changes
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
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
