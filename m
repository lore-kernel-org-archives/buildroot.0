Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFDBBC27C55
	for <buildroot@archiver.kernel.org>; Mon, 10 Jun 2024 14:43:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5311D405A7;
	Mon, 10 Jun 2024 14:43:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WqWeDSEvJjTu; Mon, 10 Jun 2024 14:43:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5291405B6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5291405B6;
	Mon, 10 Jun 2024 14:42:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3C1C41BF3C0
 for <buildroot@lists.busybox.net>; Mon, 10 Jun 2024 14:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 28502405B6
 for <buildroot@lists.busybox.net>; Mon, 10 Jun 2024 14:42:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vvZsb2j57wnP for <buildroot@lists.busybox.net>;
 Mon, 10 Jun 2024 14:42:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 97B11405A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97B11405A7
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 97B11405A7
 for <buildroot@buildroot.org>; Mon, 10 Jun 2024 14:42:55 +0000 (UTC)
Received: from pps.filterd (m0346902.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 45ADE5sO005396; Mon, 10 Jun 2024 14:42:52 GMT
Received: from xusxph008rp050.rtx.com (xusxph008rp050.rtx.com [128.13.124.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3ymjhj6d75-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Jun 2024 14:42:52 +0000
Received: from xusxph009rp020.corp.ray.com ([128.13.125.224])
 by xusxph008rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 45AEgolR028615
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 10 Jun 2024 14:42:50 GMT
Received: from dtulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph009rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45AEgnEx022377
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 10 Jun 2024 14:42:50 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by dtulimr01.rockwellcollins.com (Postfix) with ESMTP id 910C520054B7;
 Mon, 10 Jun 2024 09:42:49 -0500 (CDT)
Date: Mon, 10 Jun 2024 14:42:49 +0000
To: Neal Frager via buildroot <buildroot@buildroot.org>
Message-ID: <ZmcQ6YDoNj6i0Vs9@bspbox.kirk>
Mail-Followup-To: Neal Frager via buildroot <buildroot@buildroot.org>,
 ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com, yann.morin.1998@free.fr
References: <20240607094705.1962913-1-neal.frager@amd.com>
 <20240607094705.1962913-2-neal.frager@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240607094705.1962913-2-neal.frager@amd.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_02,2024-06-10_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_02,2024-06-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 suspectscore=0
 adultscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406100111
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999
 phishscore=0 mlxscore=0 bulkscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406100112
X-Proofpoint-ORIG-GUID: yV-Ni6YvjkcAquUkuj6aiNL7iZVNdvhk
X-Proofpoint-GUID: yV-Ni6YvjkcAquUkuj6aiNL7iZVNdvhk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_02,2024-06-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 clxscore=1015
 priorityscore=1501 malwarescore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 adultscore=0 phishscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2405010000 definitions=main-2406100111
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc : content-type :
 date : from : in-reply-to : message-id : mime-version : references :
 subject : to; s=POD051818;
 bh=Yl8Wt59U3nOCUIkaBX9ZRxzDS5FYTn+YrhOwTaKzTtQ=;
 b=sEv3wlUIc8rFOP4PwE6Ddl5PoDN1kqy3brpho8eWAminq6B/BxeRNbdWoMz8FvhR1NTz
 bSGS70u26Q6C6NKJw1b3DwovYmjbG4et0Qt6gG1OdI7qipH/iFH11t7yt1b1EUtqsb9N
 uaj7HPPmWI/TwCACyJCEEey9eE4lvAjoZsNpv/1FkgfoJRNbEqYW39j3NFfhnaLdVHZf
 kGODHflfgJ8gLzQVw5HowTGkRGujflSzcVkU3z0cd/LXl7IIZfmvmvY85Sex5Nbr2ZG0
 vBTPulyLWDhIud429bGwNjlceUZsDF7dqaVIQ+hIKbuKYNg4TSrDtiHO1MbyPihwFm+a nQ== 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=sEv3wlUI
Subject: Re: [Buildroot] [PATCH v12 2/3] boot/uboot.mk: new zynqmp pmufw
 build option
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

On Fri, Jun 07, 2024 at 10:47:04AM +0100, Neal Frager via buildroot wrote:
> The new BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE option will enable u-boot to
> use the zynqmp-firmware package for building a pmufw.elf that gets included in
> the generated boot.bin.
> 
> If the BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE option is enabled, then the
> BR2_TARGET_UBOOT_ZYNQMP_PMUFW config for downloading a prebuilt pmufw will
> be ignored.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
> V1->V2:
>  - patch is now backwards compatible for users already using the
>    BR2_TARGET_UBOOT_ZYNQMP_PMUFW config for downloading a prebuilt pmufw
> V2->V3:
>  - no changes
> V3->V4:
>  - BR2_TARGET_UBOOT_ZYNQMP_PMUFW removed when
>    BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE selected
> V4->V12:
>  - no changes
> ---
>  boot/uboot/Config.in | 19 +++++++++++++++++--
>  boot/uboot/uboot.mk  |  5 +++++
>  2 files changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index d0901edc9d..f0c26af25c 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -512,11 +512,26 @@ config BR2_TARGET_UBOOT_ZYNQMP
>  
>  if BR2_TARGET_UBOOT_ZYNQMP
>  
> +config BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE
> +	bool "Build zynqmp PMU firmware from source"
> +	select BR2_TARGET_ZYNQMP_FIRMWARE
> +	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
> +	help
> +	  This option instructs u-boot to build the zynqmp pmufw using
> +	  the zynqmp-firmware package.  u-boot will then include this
> +	  pmufw.elf in the generated boot.bin.
> +
> +	  If this option is selected, the BR2_TARGET_UBOOT_ZYNQMP_PMUFW
> +	  prebuilt option will be ignored.
> +
> +	  This feature requires U-Boot >= 2018.07.
> +
>  config BR2_TARGET_UBOOT_ZYNQMP_PMUFW
> -	string "PMU firmware location"
> +	string "Pre-built zynqmp PMU firmware location"
>  	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
> +	depends on !BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE
>  	help
> -	  Location of a PMU firmware binary.
> +	  Location of a pre-built PMU firmware binary.
>  
>  	  If not empty, instructs the U-Boot build process to generate
>  	  a boot.bin (to be loaded by the ZynqMP boot ROM) containing
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index b9f165f041..18c02a4430 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -436,7 +436,12 @@ endef
>  
>  ifeq ($(BR2_TARGET_UBOOT_ZYNQMP),y)
>  
> +ifeq ($(BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE),y)
> +UBOOT_DEPENDENCIES += zynqmp-firmware
> +UBOOT_ZYNQMP_PMUFW = $(BINARIES_DIR)/pmufw.elf
> +else
>  UBOOT_ZYNQMP_PMUFW = $(call qstrip,$(BR2_TARGET_UBOOT_ZYNQMP_PMUFW))
> +endif #BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE
>  
>  ifneq ($(findstring ://,$(UBOOT_ZYNQMP_PMUFW)),)
>  UBOOT_EXTRA_DOWNLOADS += $(UBOOT_ZYNQMP_PMUFW)
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

Looks good, given Yann's fixups

Reviewed-by: Brandon Maier <brandon.maier@collins.com>

Thanks,
Brandon Maier
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
