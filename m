Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DD61C27C53
	for <buildroot@archiver.kernel.org>; Wed, 12 Jun 2024 19:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58734404D8;
	Wed, 12 Jun 2024 19:06:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bRuU2DQxA-Ss; Wed, 12 Jun 2024 19:06:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E897F40555
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E897F40555;
	Wed, 12 Jun 2024 19:06:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1928D1BF369
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 19:06:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 065A383AE4
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 19:06:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rq4gi3OmHJ3A for <buildroot@lists.busybox.net>;
 Wed, 12 Jun 2024 19:06:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C6AC582F9E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6AC582F9E
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C6AC582F9E
 for <buildroot@buildroot.org>; Wed, 12 Jun 2024 19:06:03 +0000 (UTC)
Received: from pps.filterd (m0346904.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 45CG1PUw007381; Wed, 12 Jun 2024 19:06:00 GMT
Received: from xusxph004rp050.rtx.com (xusxph004rp050.rtx.com [128.13.120.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3yqeu4tdm4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jun 2024 19:05:59 +0000
Received: from xusxph009rp020.corp.ray.com ([128.13.125.224])
 by xusxph004rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 45CJ5w7e018053
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jun 2024 19:05:58 GMT
Received: from ciulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph009rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45CJ5whA010760
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 12 Jun 2024 19:05:58 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by ciulimr01.rockwellcollins.com (Postfix) with ESMTP id 3F409300D4EE;
 Wed, 12 Jun 2024 14:05:58 -0500 (CDT)
Date: Wed, 12 Jun 2024 19:05:58 +0000
To: Neal Frager via buildroot <buildroot@buildroot.org>
Message-ID: <ZmnxlqXT7SlWsqXC@bspbox.kirk>
Mail-Followup-To: Neal Frager via buildroot <buildroot@buildroot.org>,
 ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com, yann.morin.1998@free.fr
References: <20240612075559.436482-1-neal.frager@amd.com>
 <20240612075559.436482-5-neal.frager@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240612075559.436482-5-neal.frager@amd.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_10,2024-06-12_02,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_10,2024-06-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 suspectscore=0
 malwarescore=0 adultscore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406120136
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999
 phishscore=0 mlxscore=0 bulkscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406120136
X-Proofpoint-GUID: aNBi7DHcjcT7PLaIHvY7weZxS6vrkJTD
X-Proofpoint-ORIG-GUID: aNBi7DHcjcT7PLaIHvY7weZxS6vrkJTD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_10,2024-06-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 mlxscore=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0
 impostorscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2405010000 definitions=main-2406120136
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc : content-type :
 date : from : in-reply-to : message-id : mime-version : references :
 subject : to; s=POD051818;
 bh=GNhb/k23nvmBl3O8q1BG3siFzYGHpT+qiUBf6qHxJ54=;
 b=KUqt16yfrmfl5/GocPeKBQCU2kyLesMbln2/m7GLIR2cBeDe7jA05vPENfiOrhsObDTe
 F4oFaaBtsDi1QYTwIlVqJiUaByAAa25jQ249+VealSzU6Rx6Vu2ZwJRUkPITwhsNItRj
 Rz6EIbnyfqYg58Xeml7pOdWcuTDgdaLTiimGAvJ95N+oC7FMK+Ba+NwqYGYz5Zx7nCky
 zOAmz1IXc/zcu48s9BrG8cKwP+wUbakrpEn3bnGp4XSlCAMrDqkwGOFfvw6Z9FRckDNy
 lTryoKsJ19Hj3H/wU4wuBySb+1o0aMGIoCIggL/TFmzi1TUZDIbXbzAqmHkYu5NHgOAW 9w== 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=KUqt16yf
Subject: Re: [Buildroot] [PATCH v1 5/5] package/versal-firmware: remove
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

On 2024.06.12 08:55, Neal Frager via buildroot wrote:
> This patch removes the package/versal-firmware as this package is replaced
> by the boot/xilinx-prebuilt target boot firmware package.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
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

Reviewed-by: Brandon Maier <brandon.maier@collins.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
