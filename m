Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E4AC27C5E
	for <buildroot@archiver.kernel.org>; Mon, 10 Jun 2024 14:44:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5734E405BD;
	Mon, 10 Jun 2024 14:44:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yNtqnFteOvA7; Mon, 10 Jun 2024 14:44:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5A8B405C1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5A8B405C1;
	Mon, 10 Jun 2024 14:44:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0713A1BF3C0
 for <buildroot@lists.busybox.net>; Mon, 10 Jun 2024 14:44:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 00D1981A3B
 for <buildroot@lists.busybox.net>; Mon, 10 Jun 2024 14:44:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jQbFuZ03eGfP for <buildroot@lists.busybox.net>;
 Mon, 10 Jun 2024 14:44:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B5D7381004
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5D7381004
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B5D7381004
 for <buildroot@buildroot.org>; Mon, 10 Jun 2024 14:44:37 +0000 (UTC)
Received: from pps.filterd (m0346902.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 45ADE2YG005169; Mon, 10 Jun 2024 14:44:33 GMT
Received: from xusxph004rp050.rtx.com (xusxph004rp050.rtx.com [128.13.120.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3ymjhj6dtw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Jun 2024 14:44:33 +0000
Received: from xusxph008rp020.corp.ray.com ([128.13.124.224])
 by xusxph004rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 45AEiHTP005872
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 10 Jun 2024 14:44:17 GMT
Received: from crulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph008rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45AEiG21003225
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 10 Jun 2024 14:44:17 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by crulimr01.rockwellcollins.com (Postfix) with ESMTP id CC708A5E5;
 Mon, 10 Jun 2024 09:44:16 -0500 (CDT)
Date: Mon, 10 Jun 2024 14:44:16 +0000
To: Neal Frager via buildroot <buildroot@buildroot.org>
Message-ID: <ZmcRQPmxRccLFXnj@bspbox.kirk>
Mail-Followup-To: Neal Frager via buildroot <buildroot@buildroot.org>,
 ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com, yann.morin.1998@free.fr
References: <20240607094705.1962913-1-neal.frager@amd.com>
 <20240607094705.1962913-3-neal.frager@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240607094705.1962913-3-neal.frager@amd.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_02,2024-06-10_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_02,2024-06-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 suspectscore=0
 malwarescore=0 adultscore=0 spamscore=0 mlxlogscore=891 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406100111
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0 bulkscore=0
 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=865 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406100112
X-Proofpoint-ORIG-GUID: y1PzY1B5gLYNAs4zlNQiKI_RgyJVLy3F
X-Proofpoint-GUID: y1PzY1B5gLYNAs4zlNQiKI_RgyJVLy3F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_02,2024-06-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 clxscore=1015
 priorityscore=1501 malwarescore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 adultscore=0 phishscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=964 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2405010000 definitions=main-2406100112
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc : content-type :
 date : from : in-reply-to : message-id : mime-version : references :
 subject : to; s=POD051818;
 bh=fLMWch5rchOCO8ZgJiOdkiKXj7HFg+VQ6fZ7cYUxcb4=;
 b=CCsg8MIruvG1hmsZFjvTx9Au8K3y2OjqgzYszFIqODxLEiLh7t4zsAyjzJjod8HP/35B
 3DnfNRJMMik/8uz5Q9sqSjDGZyHUgLMm6uzkdx+f5L9SUB3XmaV4Tvm5fh8eN+s2LWp3
 j+fhKC3AKrsLtCWvi4Kc+rGXuk2KYtGtRa6Wp08M5pD/sq753OipcYB9KSyoRgdw47Z3
 1x1JCV6T2I46H4VMfySBjzp9X3s0+VnFxF8sFpwDaPfVfSHTAGYZprSipLvd23lRb7sj
 MP5FClSeXa3SUgMYM28cYYqLxnwdsMM1+7PT3UT8LbGkR2Gp0nSWtNZA9UMfBeHeYLrg iQ== 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=CCsg8MIr
Subject: Re: [Buildroot] [PATCH v12 3/3] configs/zynqmp*: build pmufw source
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

Hi Neal,

On Fri, Jun 07, 2024 at 10:47:05AM +0100, Neal Frager via buildroot wrote:
> This patch migrates the zynqmp config files to use the new
> zynqmp-firmware package for building the zynqmp pmufw from source.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
> V4->V7:
>  - no changes
> V7->V8:
>  - bump to xilinx_v2023.2
> V8->V9:
>  - add the new zynqmp defconfigs
>  - add BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH definition
> V9->V10:
>  - no changes
> V10->V11:
>  - BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH is set by zynqmp-firmware
> V11->V12:
>  - BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH is set in each defconfig
> ---
>  configs/zynqmp_kria_kr260_defconfig | 6 +++++-
>  configs/zynqmp_kria_kv260_defconfig | 6 +++++-
>  configs/zynqmp_zcu102_defconfig     | 5 ++++-
>  configs/zynqmp_zcu104_defconfig     | 5 ++++-
>  configs/zynqmp_zcu106_defconfig     | 5 ++++-
>  5 files changed, 22 insertions(+), 5 deletions(-)
> 
> diff --git a/configs/zynqmp_kria_kr260_defconfig b/configs/zynqmp_kria_kr260_defconfig
> index 3bf269ab6b..3f475af882 100644
> --- a/configs/zynqmp_kria_kr260_defconfig
> +++ b/configs/zynqmp_kria_kr260_defconfig
> @@ -31,10 +31,14 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
>  BR2_TARGET_UBOOT_SPL=y
>  BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
>  BR2_TARGET_UBOOT_ZYNQMP=y
> -BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2024.1/kr260-kria/pmufw.elf"
>  BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/kria/kr260/pm_cfg_obj.c"
>  BR2_TARGET_UBOOT_FORMAT_ITB=y
>  BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
> +BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE=y
> +BR2_TARGET_ZYNQMP_FIRMWARE_VERSION="xilinx_v2024.1"
> +BR2_TARGET_ZYNQMP_FIRMWARE_CUSTOM_CFLAGS="-DK26_SOM"
> +BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
> +BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
>  BR2_PACKAGE_HOST_DOSFSTOOLS=y
>  BR2_PACKAGE_HOST_GENIMAGE=y
>  BR2_PACKAGE_HOST_MTOOLS=y
> diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
> index 7b402e032c..313b324a13 100644
> --- a/configs/zynqmp_kria_kv260_defconfig
> +++ b/configs/zynqmp_kria_kv260_defconfig
> @@ -31,10 +31,14 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
>  BR2_TARGET_UBOOT_SPL=y
>  BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
>  BR2_TARGET_UBOOT_ZYNQMP=y
> -BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2024.1/kv260-kria/pmufw.elf"
>  BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/kria/kv260/pm_cfg_obj.c"
>  BR2_TARGET_UBOOT_FORMAT_ITB=y
>  BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
> +BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE=y
> +BR2_TARGET_ZYNQMP_FIRMWARE_VERSION="xilinx_v2024.1"
> +BR2_TARGET_ZYNQMP_FIRMWARE_CUSTOM_CFLAGS="-DK26_SOM"
> +BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
> +BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
>  BR2_PACKAGE_HOST_DOSFSTOOLS=y
>  BR2_PACKAGE_HOST_GENIMAGE=y
>  BR2_PACKAGE_HOST_MTOOLS=y
> diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
> index f40002f6d9..302ad1394e 100644
> --- a/configs/zynqmp_zcu102_defconfig
> +++ b/configs/zynqmp_zcu102_defconfig
> @@ -30,10 +30,13 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
>  BR2_TARGET_UBOOT_SPL=y
>  BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
>  BR2_TARGET_UBOOT_ZYNQMP=y
> -BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2024.1/zcu102-zynqmp/pmufw.elf"
>  BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu102/pm_cfg_obj.c"
>  BR2_TARGET_UBOOT_FORMAT_ITB=y
>  BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
> +BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE=y
> +BR2_TARGET_ZYNQMP_FIRMWARE_VERSION="xilinx_v2024.1"
> +BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
> +BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
>  BR2_PACKAGE_HOST_DOSFSTOOLS=y
>  BR2_PACKAGE_HOST_GENIMAGE=y
>  BR2_PACKAGE_HOST_MTOOLS=y
> diff --git a/configs/zynqmp_zcu104_defconfig b/configs/zynqmp_zcu104_defconfig
> index ef9c9bad49..059858fff6 100644
> --- a/configs/zynqmp_zcu104_defconfig
> +++ b/configs/zynqmp_zcu104_defconfig
> @@ -30,10 +30,13 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
>  BR2_TARGET_UBOOT_SPL=y
>  BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
>  BR2_TARGET_UBOOT_ZYNQMP=y
> -BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2024.1/zcu104-zynqmp/pmufw.elf"
>  BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu104/pm_cfg_obj.c"
>  BR2_TARGET_UBOOT_FORMAT_ITB=y
>  BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
> +BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE=y
> +BR2_TARGET_ZYNQMP_FIRMWARE_VERSION="xilinx_v2024.1"
> +BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
> +BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
>  BR2_PACKAGE_HOST_DOSFSTOOLS=y
>  BR2_PACKAGE_HOST_GENIMAGE=y
>  BR2_PACKAGE_HOST_MTOOLS=y
> diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
> index 07c595436f..39dd5c8ab3 100644
> --- a/configs/zynqmp_zcu106_defconfig
> +++ b/configs/zynqmp_zcu106_defconfig
> @@ -30,10 +30,13 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
>  BR2_TARGET_UBOOT_SPL=y
>  BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
>  BR2_TARGET_UBOOT_ZYNQMP=y
> -BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2024.1/zcu106-zynqmp/pmufw.elf"
>  BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu106/pm_cfg_obj.c"
>  BR2_TARGET_UBOOT_FORMAT_ITB=y
>  BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
> +BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE=y
> +BR2_TARGET_ZYNQMP_FIRMWARE_VERSION="xilinx_v2024.1"
> +BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
> +BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
>  BR2_PACKAGE_HOST_DOSFSTOOLS=y
>  BR2_PACKAGE_HOST_GENIMAGE=y
>  BR2_PACKAGE_HOST_MTOOLS=y
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
> 

Reviewed-by: Brandon Maier <brandon.maier@collins.com>

Thanks,
Brandon Maier
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
