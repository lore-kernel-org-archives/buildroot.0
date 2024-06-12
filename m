Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C54DC27C53
	for <buildroot@archiver.kernel.org>; Wed, 12 Jun 2024 19:02:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE7C640506;
	Wed, 12 Jun 2024 19:02:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FLh0hah4gWFT; Wed, 12 Jun 2024 19:02:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E787404D1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E787404D1;
	Wed, 12 Jun 2024 19:02:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 13BE11BF3D6
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 19:02:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F058E404D1
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 19:02:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4gjHpZjEn1Ae for <buildroot@lists.busybox.net>;
 Wed, 12 Jun 2024 19:02:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AAF00404CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AAF00404CE
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AAF00404CE
 for <buildroot@buildroot.org>; Wed, 12 Jun 2024 19:02:51 +0000 (UTC)
Received: from pps.filterd (m0346908.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 45CFdMvu011851; Wed, 12 Jun 2024 19:02:46 GMT
Received: from xusxph008rp050.rtx.com (xusxph008rp050.rtx.com [128.13.124.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3yqcgpc7nm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jun 2024 19:02:45 +0000
Received: from xusxph009rp020.corp.ray.com ([128.13.125.224])
 by xusxph008rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 45CJ2iYE007739
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jun 2024 19:02:45 GMT
Received: from dtulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph009rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45CJ2hdJ005497
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 12 Jun 2024 19:02:44 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by dtulimr01.rockwellcollins.com (Postfix) with ESMTP id BBE9F20237F5;
 Wed, 12 Jun 2024 14:02:43 -0500 (CDT)
Date: Wed, 12 Jun 2024 19:02:43 +0000
To: Neal Frager via buildroot <buildroot@buildroot.org>
Message-ID: <Zmnw02UInwrQx3f_@bspbox.kirk>
Mail-Followup-To: Neal Frager via buildroot <buildroot@buildroot.org>,
 ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com, yann.morin.1998@free.fr
References: <20240612075559.436482-1-neal.frager@amd.com>
 <20240612075559.436482-2-neal.frager@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240612075559.436482-2-neal.frager@amd.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_10,2024-06-12_02,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_10,2024-06-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 suspectscore=0
 adultscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406120136
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999
 phishscore=0 mlxscore=0 bulkscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406120136
X-Proofpoint-GUID: Bks9Wbl-oE00nOsMnSddLUVoRf5mGvtK
X-Proofpoint-ORIG-GUID: Bks9Wbl-oE00nOsMnSddLUVoRf5mGvtK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_10,2024-06-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 spamscore=0
 clxscore=1015 mlxscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406120136
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc : content-type :
 date : from : in-reply-to : message-id : mime-version : references :
 subject : to; s=POD051818;
 bh=ATzhHDbpSRDh8XettuZTphwxSHncSGmEMSTg8YUjb80=;
 b=L/JF7rXgU4NzhJAo/1WElstJ5TMZr/3OrCIMFKkWFdSVhfkwsyuqCzZVkY2/gIYLQ45k
 ILt5oDRB9BjSgxB/TYmszqZo8yW3vIK1rDepmaM6vRy7U2KcMZAD8doEmDEVaWCxzUwU
 Olb9CqcyiG0AB2SNJ3fJ5o06Tr2+9mT7TIUc+PUtsOLPygD3TyXrPbDw5wTjVfTiQoLv
 G9NFl+gLgzyJUlSB6TyDEN++24/fW7VqhQx0roXw31/aXlksn2jqYshsgYYs1FvImcmD
 EAfYNseOEXjCyAlV23JyUSNOhLbBGjsk04tLOPjnstHGxFpfJ2zQzDc7b1fYrjP6row2 lA== 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=L/JF7rXg
Subject: Re: [Buildroot] [PATCH v1 2/5] boot/uboot.mk: new zynqmp pmufw
 prebuilt option
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
> The new BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT option will enable u-boot to
> use the xilinx-prebuilt package for downloading a pmufw.elf that gets included
> in the generated boot.bin.
> 
> If the BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT option is enabled, then the
> BR2_TARGET_UBOOT_ZYNQMP_PMUFW config for downloading a prebuilt pmufw will
> be ignored.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>  boot/uboot/Config.in | 16 ++++++++++++++++
>  boot/uboot/uboot.mk  |  5 +++++
>  2 files changed, 21 insertions(+)
> 
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index d0901edc9d..9d275e8611 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -512,9 +512,25 @@ config BR2_TARGET_UBOOT_ZYNQMP
>  
>  if BR2_TARGET_UBOOT_ZYNQMP
>  
> +config BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT
> +	bool "xilinx-prebuilt pmufw.elf"
> +	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
> +	depends on BR2_TARGET_XILINX_PREBUILT

Since this is a ZynqMP only option. Shouldn't this depend on the
Xilinx-prebuilt ZynqMP choice?

  depends on BR2_TARGET_XILINX_PREBUILT_ZYNQMP

> +	help
> +	  Use xilinx-prebuilt boot package for downloading prebuilt zynqmp
> +	  pmufw.elf from https://github.com/Xilinx/soc-prebuilt-firmware repo.
> +
> +	  U-Boot build process will generate a boot.bin (to be loaded by the
> +	  ZynqMP boot ROM) containing both the U-Boot SPL and the PMU firmware
> +	  in the Xilinx-specific boot format.
> +
> +	  If this option is selected, the BR2_TARGET_UBOOT_ZYNQMP_PMUFW
> +	  prebuilt option will be ignored.
> +
>  config BR2_TARGET_UBOOT_ZYNQMP_PMUFW
>  	string "PMU firmware location"
>  	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
> +	depends on !BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT
>  	help
>  	  Location of a PMU firmware binary.
>  
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index b9f165f041..5d12c6283b 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -436,7 +436,12 @@ endef
>  
>  ifeq ($(BR2_TARGET_UBOOT_ZYNQMP),y)
>  
> +ifeq ($(BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT),y)
> +UBOOT_DEPENDENCIES += xilinx-prebuilt
> +UBOOT_ZYNQMP_PMUFW = $(BINARIES_DIR)/pmufw.elf
> +else
>  UBOOT_ZYNQMP_PMUFW = $(call qstrip,$(BR2_TARGET_UBOOT_ZYNQMP_PMUFW))
> +endif #BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT
>  
>  ifneq ($(findstring ://,$(UBOOT_ZYNQMP_PMUFW)),)

The `endif` should be moved to cover this ifneq statement. That way when
xilinx-prebuilt is enabled it doesn't do the "://" and readlink checks.

>  UBOOT_EXTRA_DOWNLOADS += $(UBOOT_ZYNQMP_PMUFW)
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
