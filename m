Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C045C27C53
	for <buildroot@archiver.kernel.org>; Wed, 12 Jun 2024 18:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AFE6404D1;
	Wed, 12 Jun 2024 18:52:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oKDO8UYd6j6C; Wed, 12 Jun 2024 18:52:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF820404D8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF820404D8;
	Wed, 12 Jun 2024 18:52:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F01341BF3D6
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 18:52:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DCFC083A99
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 18:52:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DocKPC7bIUaf for <buildroot@lists.busybox.net>;
 Wed, 12 Jun 2024 18:52:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BB0EE8206E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB0EE8206E
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB0EE8206E
 for <buildroot@buildroot.org>; Wed, 12 Jun 2024 18:52:21 +0000 (UTC)
Received: from pps.filterd (m0346908.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 45CFdOvp011998; Wed, 12 Jun 2024 18:52:16 GMT
Received: from xusxph005rp050.rtx.com (xusxph005rp050.rtx.com [128.13.121.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3yqcgpc3nq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jun 2024 18:52:15 +0000
Received: from xusxph004rp020.corp.ray.com ([128.13.120.224])
 by xusxph005rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 45CIqE7k014513
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jun 2024 18:52:14 GMT
Received: from dtulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph004rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45CIqDA8003434
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 12 Jun 2024 18:52:14 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by dtulimr01.rockwellcollins.com (Postfix) with ESMTP id B7A3F20237F6;
 Wed, 12 Jun 2024 13:52:13 -0500 (CDT)
Date: Wed, 12 Jun 2024 18:52:13 +0000
To: Neal Frager via buildroot <buildroot@buildroot.org>
Message-ID: <ZmnuXb2WQdk1xt9e@bspbox.kirk>
Mail-Followup-To: Neal Frager via buildroot <buildroot@buildroot.org>,
 ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com, yann.morin.1998@free.fr
References: <20240612075559.436482-1-neal.frager@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240612075559.436482-1-neal.frager@amd.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_10,2024-06-12_02,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_10,2024-06-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999
 bulkscore=0 phishscore=0 mlxscore=0 malwarescore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406120134
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406120135
X-Proofpoint-GUID: EGC7Ky-jZrd8euQYWBsRYlNFEH1irRen
X-Proofpoint-ORIG-GUID: EGC7Ky-jZrd8euQYWBsRYlNFEH1irRen
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_10,2024-06-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 spamscore=0
 clxscore=1015 mlxscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406120135
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc : content-type :
 date : from : in-reply-to : message-id : mime-version : references :
 subject : to; s=POD051818;
 bh=X6paWJ6yA7Psqyb1+nt7eV19/cSQBkulFlL0aGC2vcA=;
 b=udPmloGt3Y2ovxDAR24K6U5Ci41jUyFmESjsLXdw+eEesa27lnPc1oZwwtN8IgPuN1Ur
 uZrkcgbw9N3IQpfbp7pByJ+p5eYKjvp4+AZKHdosTDkB8AUj9uK82q6HpTk4/CyRCJsT
 Z8YJjbg09fn47dTDaDCCiHyudxOH1mE2nYgNhBWjOwzjsGnLbcfDKnHWEfSC0c6e4L3j
 qxkIHMTuKoeqUCqQuNzVbbj1AkrH6JZzKwXTkuQanInsHPbqKm+ZKn+DSxGARDbn4rbs
 1Q0yB+0SbfRXZsk1mZxOwiUaZb0eQdKJfRpV/jyUhfyqqB04WgRGPijkyb6XuX7oIRCI PQ== 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=udPmloGt
Subject: Re: [Buildroot] [PATCH v1 1/5] boot/xilinx-prebuilt: new boot
 package
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

On 2024.06.12 08:55, Neal Frager via buildroot wrote:
> This patch add a new boot package for downloading prebuilt firmware for Xilinx
> versal and zynqmp evaluation boards.
> 
> It solves the problem of being able to verify the hash when downloading a
> prebuilt zynqmp pmufw.elf binary.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>  DEVELOPERS                                    |  2 +
>  .../xilinx-prebuilt/xilinx-prebuilt.hash      |  2 +
>  boot/Config.in                                |  1 +
>  boot/xilinx-prebuilt/Config.in                | 40 +++++++++++++++++++
>  boot/xilinx-prebuilt/xilinx-prebuilt.mk       | 39 ++++++++++++++++++
>  5 files changed, 84 insertions(+)
>  create mode 100644 board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash
>  create mode 100644 boot/xilinx-prebuilt/Config.in
>  create mode 100644 boot/xilinx-prebuilt/xilinx-prebuilt.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index cf48e01037..93627a0064 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2335,8 +2335,10 @@ F:	package/qt5/qt5opcua/
>  
>  N:	Neal Frager <neal.frager@amd.com>
>  F:	board/versal/
> +F:	board/xilinx/
>  F:	board/zynq/
>  F:	board/zynqmp/
> +F:	boot/xilinx-prebuilt/
>  F:	configs/versal_vck190_defconfig
>  F:	configs/zynq_zc702_defconfig
>  F:	configs/zynq_zc706_defconfig
> diff --git a/board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash b/board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash
> new file mode 100644
> index 0000000000..c955cd79f5
> --- /dev/null
> +++ b/board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256  7abcba4e0e44e3a4adf9c1f971d918575226d7604dfd64a386baaa00c1c6c35f  xilinx-prebuilt-xilinx_v2024.1.tar.gz
> diff --git a/boot/Config.in b/boot/Config.in
> index 87e1b7c00e..1378a04d19 100644
> --- a/boot/Config.in
> +++ b/boot/Config.in
> @@ -23,5 +23,6 @@ source "boot/ti-k3-boot-firmware/Config.in"
>  source "boot/ti-k3-r5-loader/Config.in"
>  source "boot/uboot/Config.in"
>  source "boot/vexpress-firmware/Config.in"
> +source "boot/xilinx-prebuilt/Config.in"
>  
>  endmenu
> diff --git a/boot/xilinx-prebuilt/Config.in b/boot/xilinx-prebuilt/Config.in
> new file mode 100644
> index 0000000000..ec38e41993
> --- /dev/null
> +++ b/boot/xilinx-prebuilt/Config.in
> @@ -0,0 +1,40 @@
> +config BR2_TARGET_XILINX_PREBUILT
> +	bool "xilinx-prebuilt"
> +	depends on BR2_aarch64
> +	help
> +	  Pre-built firmware files for Xilinx boards.
> +
> +	  https://github.com/Xilinx/soc-prebuilt-firmware
> +
> +if BR2_TARGET_XILINX_PREBUILT
> +
> +config BR2_TARGET_XILINX_PREBUILT_VERSION
> +	string "prebuilt version"
> +	default "xilinx_v2024.1"
> +	help
> +	  Release version of Xilinx firmware.
> +	  Must be xilinx_v2023.1 or newer.
> +
> +config BR2_TARGET_XILINX_PREBUILT_BOARD
> +	string "board name"
> +	default "zcu102"
> +	help
> +	  Name of Xilinx target board.
> +	  Used for installing the appropriate firmware.
> +
> +choice
> +	bool "family variant"
> +	default BR2_TARGET_XILINX_PREBUILT_ZYNQMP
> +
> +config BR2_TARGET_XILINX_PREBUILT_ZYNQMP
> +	bool "zynqmp"
> +
> +config BR2_TARGET_XILINX_PREBUILT_KRIA
> +	bool "kria"
> +
> +config BR2_TARGET_XILINX_PREBUILT_VERSAL
> +	bool "versal"
> +
> +endchoice
> +
> +endif # BR2_TARGET_XILINX_PREBUILT
> diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.mk b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
> new file mode 100644
> index 0000000000..98dd18da0d
> --- /dev/null
> +++ b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
> @@ -0,0 +1,39 @@
> +################################################################################
> +#
> +# xilinx-prebuilt
> +#
> +################################################################################
> +
> +XILINX_PREBUILT_VERSION = $(call qstrip,$(BR2_TARGET_XILINX_PREBUILT_VERSION))
> +XILINX_PREBUILT_SITE = $(call github,Xilinx,soc-prebuilt-firmware,$(XILINX_PREBUILT_VERSION))
> +XILINX_PREBUILT_LICENSE = MIT
> +XILINX_PREBUILT_LICENSE_FILES = LICENSE
> +XILINX_PREBUILT_INSTALL_TARGET = NO
> +XILINX_PREBUILT_INSTALL_IMAGES = YES
> +
> +ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL),y)
> +define XILINX_PREBUILT_INSTALL_IMAGES_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/$(BR2_TARGET_XILINX_PREBUILT_BOARD)-versal/plm.elf \
> +		$(BINARIES_DIR)/plm.elf
> +	$(INSTALL) -D -m 0755 $(@D)/$(BR2_TARGET_XILINX_PREBUILT_BOARD)-versal/psmfw.elf \
> +		$(BINARIES_DIR)/psmfw.elf
> +	$(INSTALL) -D -m 0755 $(@D)/$(BR2_TARGET_XILINX_PREBUILT_BOARD)-versal/*.pdi \
> +		$(BINARIES_DIR)/vpl_gen_fixed.pdi
> +endef
> +endif #BR2_TARGET_XILINX_PREBUILT_VERSAL
> +
> +ifeq ($(BR2_TARGET_XILINX_PREBUILT_ZYNQMP),y)
> +define XILINX_PREBUILT_INSTALL_IMAGES_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/$(BR2_TARGET_XILINX_PREBUILT_BOARD)-zynqmp/pmufw.elf \
> +		$(BINARIES_DIR)/pmufw.elf
> +endef
> +endif #BR2_TARGET_XILINX_PREBUILT_ZYNQMP
> +
> +ifeq ($(BR2_TARGET_XILINX_PREBUILT_KRIA),y)
> +define XILINX_PREBUILT_INSTALL_IMAGES_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/$(BR2_TARGET_XILINX_PREBUILT_BOARD)-kria/pmufw.elf \
> +		$(BINARIES_DIR)/pmufw.elf
> +endef
> +endif #BR2_TARGET_XILINX_PREBUILT_KRIA
> +
> +$(eval $(generic-package))
> -- 
> 2.25.1

Looks like a good fix to the hashing issue!

Reviewed-by: Brandon Maier <brandon.maier@collins.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
