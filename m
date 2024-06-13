Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37CA6C27C4F
	for <buildroot@archiver.kernel.org>; Thu, 13 Jun 2024 12:33:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F192560775;
	Thu, 13 Jun 2024 12:33:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ck_6GFh_MCOn; Thu, 13 Jun 2024 12:33:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C53456100D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C53456100D;
	Thu, 13 Jun 2024 12:33:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8B9841BF34E
 for <buildroot@lists.busybox.net>; Thu, 13 Jun 2024 12:33:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7821E40962
 for <buildroot@lists.busybox.net>; Thu, 13 Jun 2024 12:33:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BM7An1QhkuQl for <buildroot@lists.busybox.net>;
 Thu, 13 Jun 2024 12:33:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6D92640958
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D92640958
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6D92640958
 for <buildroot@buildroot.org>; Thu, 13 Jun 2024 12:33:10 +0000 (UTC)
Received: from pps.filterd (m0346902.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 45DCPJ5I013722; Thu, 13 Jun 2024 12:33:06 GMT
Received: from xusxph004rp050.rtx.com (xusxph004rp050.rtx.com [128.13.120.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3yr0rt82je-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 Jun 2024 12:33:06 +0000
Received: from xusxph005rp020.corp.ray.com ([128.13.121.224])
 by xusxph004rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 45DCX4ee015376
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 Jun 2024 12:33:05 GMT
Received: from dtulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph005rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45DCX4Ou026867
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 13 Jun 2024 12:33:04 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by dtulimr02.rockwellcollins.com (Postfix) with ESMTP id 23D0D3110E3A;
 Thu, 13 Jun 2024 07:33:04 -0500 (CDT)
Date: Thu, 13 Jun 2024 12:33:03 +0000
To: Neal Frager via buildroot <buildroot@buildroot.org>
Message-ID: <Zmrm_6fVELJjaZq3@bspbox.kirk>
Mail-Followup-To: Neal Frager via buildroot <buildroot@buildroot.org>,
 ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com, yann.morin.1998@free.fr
References: <20240613061423.1737631-1-neal.frager@amd.com>
 <20240613061423.1737631-2-neal.frager@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240613061423.1737631-2-neal.frager@amd.com>
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 adultscore=0
 spamscore=0 bulkscore=0 phishscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406130091
X-Proofpoint-GUID: lYy2FD9j6eoCVJUaTNujJHVEldpwgtvo
X-Proofpoint-ORIG-GUID: lYy2FD9j6eoCVJUaTNujJHVEldpwgtvo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-13_04,2024-06-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 mlxlogscore=999 impostorscore=0 priorityscore=1501 clxscore=1015
 mlxscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406130091
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc : content-type :
 date : from : in-reply-to : message-id : mime-version : references :
 subject : to; s=POD051818;
 bh=AXhlAerwsj1BIZF+3U/Fkv0oZwgsM4KUDzAL0DqsPl4=;
 b=X5RumFD/9H4b9arNPRyONBJUOXlHnlPpNc9q50+y2wH07Sj8SHt2lmfluYKZpxaq8l3l
 56wCDJ/wlBAhTwdJ5+ayLB/SyeuWUH7I1aUTnAYLoWcJg2Frix13jGEuCJEvDItS6pO6
 cIeA1aonensHmtQDE6sI4pb+5J4HMCfoi4C675skh3ePCxyKSeL70KXOvXJvLB966zgO
 2Br7TKlRaAvIsg+b+UeyP7aCsqWuXr8FKiJhbmqrgl+xt5/rsrithIFH8BXGSScMYnH3
 m/qZ3AbUUBTgmQ5kAdlvXMkOKhuV6hMnmC9mA0046Tw5LYg1tdoYWJMZvDS3imRd7VvF wQ== 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=X5RumFD/
Subject: Re: [Buildroot] [PATCH v2 2/5] boot/uboot.mk: new zynqmp pmufw
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

Hi Neal,

On 2024.06.13 07:14, Neal Frager via buildroot wrote:
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
> V1->V2:
> - Config.in: depends on BR2_TARGET_XILINX_PREBUILT_ZYNQMP ||
>   BR2_TARGET_XILINX_PREBUILT_KRIA
> - uboot.mk: moved endif to after ifneq statement to simplify logic

Thank you!

Reviewed-by: Brandon Maier <brandon.maier@collins.com>

> ---
>  boot/uboot/Config.in | 16 ++++++++++++++++
>  boot/uboot/uboot.mk  |  9 ++++++++-
>  2 files changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index d0901edc9d..41e372939b 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -512,9 +512,25 @@ config BR2_TARGET_UBOOT_ZYNQMP
>  
>  if BR2_TARGET_UBOOT_ZYNQMP
>  
> +config BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT
> +	bool "xilinx-prebuilt pmufw.elf"
> +	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
> +	depends on BR2_TARGET_XILINX_PREBUILT_ZYNQMP || BR2_TARGET_XILINX_PREBUILT_KRIA
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
> index b9f165f041..19f4cdb557 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -436,6 +436,10 @@ endef
>  
>  ifeq ($(BR2_TARGET_UBOOT_ZYNQMP),y)
>  
> +ifeq ($(BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT),y)
> +UBOOT_DEPENDENCIES += xilinx-prebuilt
> +UBOOT_ZYNQMP_PMUFW_PATH = $(BINARIES_DIR)/pmufw.elf
> +else
>  UBOOT_ZYNQMP_PMUFW = $(call qstrip,$(BR2_TARGET_UBOOT_ZYNQMP_PMUFW))
>  
>  ifneq ($(findstring ://,$(UBOOT_ZYNQMP_PMUFW)),)
> @@ -444,7 +448,10 @@ BR_NO_CHECK_HASH_FOR += $(notdir $(UBOOT_ZYNQMP_PMUFW))
>  UBOOT_ZYNQMP_PMUFW_PATH = $(UBOOT_DL_DIR)/$(notdir $(UBOOT_ZYNQMP_PMUFW))
>  else ifneq ($(UBOOT_ZYNQMP_PMUFW),)
>  UBOOT_ZYNQMP_PMUFW_PATH = $(shell readlink -f $(UBOOT_ZYNQMP_PMUFW))
> -endif
> +endif #ifneq ($(findstring ://,$(UBOOT_ZYNQMP_PMUFW)),)
> +
> +endif #BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT
> +
>  UBOOT_ZYNQMP_PMUFW_BASENAME = $(basename $(UBOOT_ZYNQMP_PMUFW_PATH))
>  
>  define UBOOT_ZYNQMP_KCONFIG_PMUFW
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
