Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F6DC27C75
	for <buildroot@archiver.kernel.org>; Thu, 13 Jun 2024 12:33:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8D996102A;
	Thu, 13 Jun 2024 12:33:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u3DpULm1ph0Q; Thu, 13 Jun 2024 12:33:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5FCE61010
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5FCE61010;
	Thu, 13 Jun 2024 12:33:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B48F61BF34E
 for <buildroot@lists.busybox.net>; Thu, 13 Jun 2024 12:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF72760F19
 for <buildroot@lists.busybox.net>; Thu, 13 Jun 2024 12:33:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0NsIn5wPMVAF for <buildroot@lists.busybox.net>;
 Thu, 13 Jun 2024 12:33:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8152D606D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8152D606D0
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8152D606D0
 for <buildroot@buildroot.org>; Thu, 13 Jun 2024 12:33:48 +0000 (UTC)
Received: from pps.filterd (m0346905.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 45DBHL0p023076; Thu, 13 Jun 2024 12:33:44 GMT
Received: from xusxph009rp050.rtx.com (xusxph009rp050.rtx.com [128.13.125.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3yq14uq9eh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 Jun 2024 12:33:43 +0000
Received: from xusxph005rp020.corp.ray.com ([128.13.121.224])
 by xusxph009rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 45DCXgYb006428
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 Jun 2024 12:33:42 GMT
Received: from ciulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph005rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45DCXgf5027721
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 13 Jun 2024 12:33:42 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by ciulimr01.rockwellcollins.com (Postfix) with ESMTP id EE0E03026073;
 Thu, 13 Jun 2024 07:33:41 -0500 (CDT)
Date: Thu, 13 Jun 2024 12:33:41 +0000
To: Neal Frager via buildroot <buildroot@buildroot.org>
Message-ID: <ZmrnJSnDKpdPsJxl@bspbox.kirk>
Mail-Followup-To: Neal Frager via buildroot <buildroot@buildroot.org>,
 ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com, yann.morin.1998@free.fr
References: <20240613061423.1737631-1-neal.frager@amd.com>
 <20240613061423.1737631-5-neal.frager@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240613061423.1737631-5-neal.frager@amd.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-13_04,2024-06-13_02,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-13_05,2024-06-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 mlxlogscore=999
 malwarescore=0 phishscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406130091
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 adultscore=0
 spamscore=0 bulkscore=0 phishscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406130091
X-Proofpoint-GUID: -dowfxsSif3aODMwzvy_AVcPB0fg_3bi
X-Proofpoint-ORIG-GUID: -dowfxsSif3aODMwzvy_AVcPB0fg_3bi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-13_04,2024-06-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015
 mlxlogscore=999 impostorscore=0 mlxscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2405010000 definitions=main-2406130090
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc : content-type :
 date : from : in-reply-to : message-id : mime-version : references :
 subject : to; s=POD051818;
 bh=ChPgOH5dSs7jWJlR9Dds6g4BKrVB3xWznN1g+cDEnS8=;
 b=IFMOvhX69f2CPjiBA5TzU8l9KTndGsNTx7LCShK/sye+l9wJfnFGtoZmD8eAFV1fiQIk
 X6eKEJUF2qw9MAYHfGONrzoTkR4vQAAz/1ZKfq3aIrXpyPOJr6wYDeZyqeCls5NbvGoj
 tSFd6RwizxMtJ+0KV6QmIg/7XBaQ1YPTAjHHllMbsnOW8I5jjX4+XIElo1u8NiGjk4LF
 wPES2iIeixGYXGio3uBYjOyO/9Nf0RDxERQ70+KV2Jkipsdw3uvzIXBO96ABalGnC74N
 ZKC3G5uArb8uDSWkvRR3XG08ZORLYHEoEC7uoUOU1Sk/dc97klVcqbgP2TAuYcaKxI8F 8Q== 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=IFMOvhX6
Subject: Re: [Buildroot] [PATCH v2 5/5] package/versal-firmware: remove
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

On 2024.06.13 07:14, Neal Frager via buildroot wrote:
> This patch removes the package/versal-firmware as this package is replaced
> by the boot/xilinx-prebuilt target boot firmware package.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Reviewed-by: Brandon Maier <brandon.maier@collins.com>

> ---
> V1->V2:
>  - no changes
> ---
>  DEVELOPERS                                    |  1 -
>  .../versal-firmware/versal-firmware.hash      |  2 --
>  package/Config.in                             |  1 -
>  package/versal-firmware/Config.in             | 24 -------------------
>  package/versal-firmware/versal-firmware.mk    | 21 ----------------
>  5 files changed, 49 deletions(-)
>  delete mode 100644 board/xilinx/patches/versal-firmware/versal-firmware.hash
>  delete mode 100644 package/versal-firmware/Config.in
>  delete mode 100644 package/versal-firmware/versal-firmware.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 93627a0064..e5706e493b 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2352,7 +2352,6 @@ F:	package/binutils-bare-metal/
>  F:	package/bootgen/
>  F:	package/gcc-bare-metal/
>  F:	package/newlib-bare-metal/
> -F:	package/versal-firmware/
>  F:	toolchain/toolchain-bare-metal-buildroot/
>  
>  N:	Nicola Di Lieto <nicola.dilieto@gmail.com>
> diff --git a/board/xilinx/patches/versal-firmware/versal-firmware.hash b/board/xilinx/patches/versal-firmware/versal-firmware.hash
> deleted file mode 100644
> index c4d745f22c..0000000000
> --- a/board/xilinx/patches/versal-firmware/versal-firmware.hash
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -# Locally calculated
> -sha256  7abcba4e0e44e3a4adf9c1f971d918575226d7604dfd64a386baaa00c1c6c35f  versal-firmware-xilinx_v2024.1.tar.gz
> diff --git a/package/Config.in b/package/Config.in
> index 1b6a5b0dab..13af2978dd 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -460,7 +460,6 @@ menu "Firmware"
>  	source "package/sunxi-boards/Config.in"
>  	source "package/ts4900-fpga/Config.in"
>  	source "package/ux500-firmware/Config.in"
> -	source "package/versal-firmware/Config.in"
>  	source "package/wilc-firmware/Config.in"
>  	source "package/wilink-bt-firmware/Config.in"
>  	source "package/zd1211-firmware/Config.in"
> diff --git a/package/versal-firmware/Config.in b/package/versal-firmware/Config.in
> deleted file mode 100644
> index 01daefd204..0000000000
> --- a/package/versal-firmware/Config.in
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -config BR2_PACKAGE_VERSAL_FIRMWARE
> -	bool "versal-firmware"
> -	depends on BR2_aarch64
> -	help
> -	  Pre-built firmware files for Xilinx Versal boards.
> -
> -	  https://github.com/Xilinx/soc-prebuilt-firmware
> -
> -if BR2_PACKAGE_VERSAL_FIRMWARE
> -
> -config BR2_PACKAGE_VERSAL_FIRMWARE_VERSION
> -	string "firmware version"
> -	default "xilinx_v2023.1"
> -	help
> -	  Release version of Versal firmware.
> -
> -config BR2_PACKAGE_VERSAL_FIRMWARE_BOARD
> -	string "board name"
> -	default "vck190"
> -	help
> -	  Name of Versal target board.
> -	  Used for installing the appropriate firmware.
> -
> -endif # BR2_PACKAGE_VERSAL_FIRMWARE
> diff --git a/package/versal-firmware/versal-firmware.mk b/package/versal-firmware/versal-firmware.mk
> deleted file mode 100644
> index 1ced259be1..0000000000
> --- a/package/versal-firmware/versal-firmware.mk
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -################################################################################
> -#
> -# versal-firmware
> -#
> -################################################################################
> -
> -VERSAL_FIRMWARE_VERSION = $(call qstrip,$(BR2_PACKAGE_VERSAL_FIRMWARE_VERSION))
> -VERSAL_FIRMWARE_SITE = $(call github,Xilinx,soc-prebuilt-firmware,$(VERSAL_FIRMWARE_VERSION))
> -VERSAL_FIRMWARE_LICENSE = MIT
> -VERSAL_FIRMWARE_LICENSE_FILES = LICENSE
> -VERSAL_FIRMWARE_INSTALL_TARGET = NO
> -VERSAL_FIRMWARE_INSTALL_IMAGES = YES
> -
> -define VERSAL_FIRMWARE_INSTALL_IMAGES_CMDS
> -	$(foreach f,plm.elf psmfw.elf vpl_gen_fixed.pdi,\
> -		$(INSTALL) -D -m 0755 $(@D)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)-versal/$(f) \
> -			$(BINARIES_DIR)/$(f)
> -	)
> -endef
> -
> -$(eval $(generic-package))
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
