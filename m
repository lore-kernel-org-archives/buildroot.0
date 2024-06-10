Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C36C27C55
	for <buildroot@archiver.kernel.org>; Mon, 10 Jun 2024 13:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F136B40873;
	Mon, 10 Jun 2024 13:12:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cwRMjqTLfYWy; Mon, 10 Jun 2024 13:12:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37FA04085A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37FA04085A;
	Mon, 10 Jun 2024 13:12:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 558D81BF4E4
 for <buildroot@lists.busybox.net>; Mon, 10 Jun 2024 13:12:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4EB8E4085A
 for <buildroot@lists.busybox.net>; Mon, 10 Jun 2024 13:12:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d36hf3YysYbh for <buildroot@lists.busybox.net>;
 Mon, 10 Jun 2024 13:12:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DFCE74064C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFCE74064C
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DFCE74064C
 for <buildroot@buildroot.org>; Mon, 10 Jun 2024 13:12:38 +0000 (UTC)
Received: from pps.filterd (m0346910.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 45ADCYIb024921; Mon, 10 Jun 2024 13:12:34 GMT
Received: from xusxph008rp050.rtx.com (xusxph008rp050.rtx.com [128.13.124.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3ymg0pwsw8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Jun 2024 13:12:34 +0000
Received: from xusxph008rp020.corp.ray.com ([128.13.124.224])
 by xusxph008rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 45ADCPkw011065
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 10 Jun 2024 13:12:25 GMT
Received: from crulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph008rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45ADCOtJ019414
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 10 Jun 2024 13:12:24 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by crulimr02.rockwellcollins.com (Postfix) with ESMTP id 7FDEE3003A9E;
 Mon, 10 Jun 2024 08:12:24 -0500 (CDT)
Date: Mon, 10 Jun 2024 13:12:24 +0000
To: Neal Frager via buildroot <buildroot@buildroot.org>
Message-ID: <Zmb7uMNqFU1ihhVg@bspbox.kirk>
Mail-Followup-To: Neal Frager via buildroot <buildroot@buildroot.org>,
 ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com, yann.morin.1998@free.fr
References: <20240607094705.1962913-1-neal.frager@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240607094705.1962913-1-neal.frager@amd.com>
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
 definitions=main-2406100100
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0 bulkscore=0
 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406100100
X-Proofpoint-ORIG-GUID: ADDN56vToamcIJsT3n-NTij3-egfZzW1
X-Proofpoint-GUID: ADDN56vToamcIJsT3n-NTij3-egfZzW1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_02,2024-06-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 suspectscore=0 mlxscore=0 malwarescore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 bulkscore=0 mlxlogscore=999 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406100100
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc : content-type :
 date : from : in-reply-to : message-id : mime-version : references :
 subject : to; s=POD051818;
 bh=4JZEg2c7uejSmQPxQneWCs864DCuLQ/U2dlB4XwmfjU=;
 b=rOwKGDXHOO9DoCbj/p5NNl6gYsKnaPavL7GGMb1Q8XmYoWuW6z3cSAksJf0H/P4pW0W2
 keUkQrt+QZnGeaeppk1uToVLAiKhIevb233MQIEFlcEobz8xILteLqhsJfyTC815kmYi
 meeb18C+wZAPYkARUAbtYNS4ZyInPmeodWDIdugdEhUYkKSmA1g//Ayl4nHIE21cFxu+
 gW+hMgnxhrb4zkK60BqMDHoAdhGdUdER+fA7jSnsSgSp2TxfxalOiGfH1JtPqOIYuN+J
 Uepbrpj3ugeqxXv6CgL09VQZi71cKeQW/qcMHA/1n43H3J3GeeVvYpEOYXklarUpVPUL 8w== 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=rOwKGDXH
Subject: Re: [Buildroot] [PATCH v12 1/3] boot/zynqmp-firmware: new boot
 firmware
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

On Fri, Jun 07, 2024 at 10:47:03AM +0100, Neal Frager via buildroot wrote:
> This patch adds a new boot firmware to buildroot for building the zynqmp pmufw.
> It requires the toolchain-bare-metal package that includes a bare-metal
> binutils, gcc and newlib which can be built for the microblaze architecture.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
> V1->V2:
>  - builds a bare-metal gcc toolchain instead of requiring an external
>    microblaze toolchain
> V2->V3:
>  - corrected custom cflags option
>  - added support for xilinx_v2022.2 version
>  - added zynqmp-firmware.hash
> V3->V4:
>  - no changes
> V4->V5:
>  - reduced all lines to <80 chars
> V5->V6:
>  - migrated to toolchain-bare-metal-buildroot
> V6->V7:
>  - removed patch numbers
>  - changed dependency to toolchain-bare-metal-buildroot
>  - removed hash since version is configurable
> V7->V9:
>  - no changes
> V9->V10:
>  - removed patches for supporting versions older than xilinx_v2023.2
> V10->V11:
>  - set default BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH to
>    "microblazeel-xilinx-elf" to avoid stand-alone build failure
> V11->V12:
>  - replace select BR2_TOOLCHAIN_BARE_METAL_BUILDROOT with depends
>  - change variable name for check-package warning
> ---
>  DEVELOPERS                              |  1 +
>  boot/Config.in                          |  1 +
>  boot/zynqmp-firmware/Config.in          | 25 +++++++++++++++++++
>  boot/zynqmp-firmware/zynqmp-firmware.mk | 33 +++++++++++++++++++++++++
>  4 files changed, 60 insertions(+)
>  create mode 100644 boot/zynqmp-firmware/Config.in
>  create mode 100644 boot/zynqmp-firmware/zynqmp-firmware.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index cf48e01037..f3ff2cbbd5 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2337,6 +2337,7 @@ N:	Neal Frager <neal.frager@amd.com>
>  F:	board/versal/
>  F:	board/zynq/
>  F:	board/zynqmp/
> +F:	boot/zynqmp-firmware/
>  F:	configs/versal_vck190_defconfig
>  F:	configs/zynq_zc702_defconfig
>  F:	configs/zynq_zc706_defconfig
> diff --git a/boot/Config.in b/boot/Config.in
> index 87e1b7c00e..64b1c8c420 100644
> --- a/boot/Config.in
> +++ b/boot/Config.in
> @@ -23,5 +23,6 @@ source "boot/ti-k3-boot-firmware/Config.in"
>  source "boot/ti-k3-r5-loader/Config.in"
>  source "boot/uboot/Config.in"
>  source "boot/vexpress-firmware/Config.in"
> +source "boot/zynqmp-firmware/Config.in"
>  
>  endmenu
> diff --git a/boot/zynqmp-firmware/Config.in b/boot/zynqmp-firmware/Config.in
> new file mode 100644
> index 0000000000..478d58d552
> --- /dev/null
> +++ b/boot/zynqmp-firmware/Config.in
> @@ -0,0 +1,25 @@
> +config BR2_TARGET_ZYNQMP_FIRMWARE
> +	bool "zynqmp-firmware"
> +	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH = "microblazeel-xilinx-elf"
> +	help
> +	  This package builds the PMU Firmware application required
> +	  to run U-Boot and Linux in the Zynq MPSoC devices.
> +
> +if BR2_TARGET_ZYNQMP_FIRMWARE
> +
> +comment "zynqmp-firmware needs a bare metal toolchain for tuple microblazeel-xilinx-elf"
> +	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH != "microblazeel-xilinx-elf"
> +
> +config BR2_TARGET_ZYNQMP_FIRMWARE_VERSION
> +	string "firmware version"
> +	default "xilinx_v2024.1"
> +	help
> +	  Release version of zynqmp firmware.
> +	  Only versions xilinx_v2023.2 and newer are supported.
> +
> +config BR2_TARGET_ZYNQMP_FIRMWARE_CUSTOM_CFLAGS
> +	string "custom cflags"
> +	help
> +	  Adds additional CFLAGS for building zynqmp firmware.
> +
> +endif # BR2_TARGET_ZYNQMP_FIRMWARE
> diff --git a/boot/zynqmp-firmware/zynqmp-firmware.mk b/boot/zynqmp-firmware/zynqmp-firmware.mk
> new file mode 100644
> index 0000000000..dafb2dbe55
> --- /dev/null
> +++ b/boot/zynqmp-firmware/zynqmp-firmware.mk
> @@ -0,0 +1,33 @@
> +################################################################################
> +#
> +# zynqmp-firmware
> +#
> +################################################################################
> +
> +ZYNQMP_FIRMWARE_VERSION = $(call qstrip,$(BR2_TARGET_ZYNQMP_FIRMWARE_VERSION))
> +ZYNQMP_FIRMWARE_SITE = \
> +	$(call github,Xilinx,embeddedsw,$(ZYNQMP_FIRMWARE_VERSION))
> +ZYNQMP_FIRMWARE_LICENSE = MIT

In the license.txt there are other SPDX licenses types.

  $ grep SPDX license.txt | awk '{print $1 " " $2}' | sort | uniq
  SPDX-License-Identifier: BSD-2-Clause
  SPDX-License-Identifier: BSD-3-Clause
  SPDX-License-Identifier: GPL-2.0
  SPDX-License-Identifier: MIT

Should these be added?

From https://github.com/Xilinx/embeddedsw/blob/master/license.txt

> +ZYNQMP_FIRMWARE_LICENSE_FILES = license.txt
> +ZYNQMP_FIRMWARE_INSTALL_IMAGES = YES
> +ZYNQMP_FIRMWARE_INSTALL_TARGET = NO
> +ZYNQMP_FIRMWARE_DEPENDENCIES = toolchain-bare-metal-buildroot
> +
> +CUSTOM_CFLAGS = $(call qstrip,$(BR2_TARGET_ZYNQMP_FIRMWARE_CUSTOM_CFLAGS))
> +ZYNQMP_FIRMWARE_CFLAGS = "-Os -flto -ffat-lto-objects $(CUSTOM_CFLAGS)"
> +
> +define ZYNQMP_FIRMWARE_BUILD_CMDS
> +	$(MAKE) -C $(@D)/lib/sw_apps/zynqmp_pmufw/src \
> +		COMPILER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
> +		ARCHIVER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc-ar \
> +		CC=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
> +		CFLAGS=$(ZYNQMP_FIRMWARE_CFLAGS)
> +endef
> +
> +ZYNQMP_FIRMWARE = $(@D)/lib/sw_apps/zynqmp_pmufw/src/executable.elf
> +
> +define ZYNQMP_FIRMWARE_INSTALL_IMAGES_CMDS
> +	$(INSTALL) -D -m 0755 $(ZYNQMP_FIRMWARE) $(BINARIES_DIR)/pmufw.elf
> +endef
> +
> +$(eval $(generic-package))
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
> 

Thanks,
Brandon Maier
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
