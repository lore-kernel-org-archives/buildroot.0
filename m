Return-Path: <SRS0=trv6=NC=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E0A9C4338F
	for <buildroot@archiver.kernel.org>; Wed, 11 Aug 2021 17:30:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 750756101D
	for <buildroot@archiver.kernel.org>; Wed, 11 Aug 2021 17:30:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 750756101D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lucaceresoli.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C225608BF;
	Wed, 11 Aug 2021 17:30:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7ruWcGR-QY3b; Wed, 11 Aug 2021 17:30:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76A686078D;
	Wed, 11 Aug 2021 17:30:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 97B6E1BF398
 for <buildroot@lists.busybox.net>; Wed, 11 Aug 2021 17:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8725540304
 for <buildroot@lists.busybox.net>; Wed, 11 Aug 2021 17:30:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Cqv651iWDfy for <buildroot@lists.busybox.net>;
 Wed, 11 Aug 2021 17:29:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net
 [89.40.174.40])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 346F540228
 for <buildroot@buildroot.org>; Wed, 11 Aug 2021 17:29:55 +0000 (UTC)
Received: from [77.244.183.192] (port=63506 helo=[192.168.178.41])
 by hostingweb31.netsons.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <luca@lucaceresoli.net>)
 id 1mDs37-001rTg-1s; Wed, 11 Aug 2021 19:29:53 +0200
To: Alvaro Gamez Machado <alvaro.gamez@hazent.com>,
 buildroot <buildroot@buildroot.org>
References: <20210805084754.18710-1-alvaro.gamez@hazent.com>
From: Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <19eb59d6-5d3d-7522-1912-ada7f80a7aee@lucaceresoli.net>
Date: Wed, 11 Aug 2021 19:29:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210805084754.18710-1-alvaro.gamez@hazent.com>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - buildroot.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id:
 luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: Re: [Buildroot] [PATCH v2] configs/digilent_genesys_zu_defconfig:
 add Digilent Genesys ZU board (ZynqMP SoC)
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi Alvaro,

On 05/08/21 10:47, Alvaro Gamez Machado wrote:
> This adds support the Digilent Genesys ZU development board.
> 
> Signed-off-by: Alvaro Gamez Machado <alvaro.gamez@hazent.com>
> 
> ---
> v1 -> v2:
> 
> * Clarify boot process of zynqmp on README
> * Note upstream source of YYLOC patch for kernel
> * Minimize psu_init_gpl.c using uboot's tool
> * Explain on its file how to generate a FIT image containing an FPGA bitfile
> * Explain existance of uboot environment file and add example of how to define
>   a generic UIO device
> 
> Signed-off-by: Alvaro Gamez Machado <alvaro.gamez@hazent.com>
> ---
>  ...ve-redundant-YYLOC-global-declaratio.patch |    54 +
>  .../0001-uboot-add-genesys-zu.patch           |    10 +
>  board/digilent/genesys-zu/GenesysZU.dts       |  1655 +
>  board/digilent/genesys-zu/README.txt          |   110 +
>  board/digilent/genesys-zu/genimage.cfg        |    28 +
>  board/digilent/genesys-zu/image.its           |    59 +
>  board/digilent/genesys-zu/kernel_defconfig    |   414 +
>  board/digilent/genesys-zu/pm_cfg_obj.c        |   630 +
>  board/digilent/genesys-zu/post-image.sh       |    10 +
>  board/digilent/genesys-zu/psu_init_gpl.c      |   985 +
>  board/digilent/genesys-zu/psu_init_gpl.h      | 37545 ++++++++++++++++

Sorry I forgot to mention it while reviewing v1, but psu_init_gpl.h is
not required at all, so just drop it.

> diff --git a/board/digilent/genesys-zu/GenesysZU.dts b/board/digilent/genesys-zu/GenesysZU.dts
> new file mode 100644
> index 0000000000..ddeba4b715
> --- /dev/null
> +++ b/board/digilent/genesys-zu/GenesysZU.dts

As you mentioned in the v1 discussion, a large part of this dts file is
just copied from zynqmp.dtsi in the kernel sources. You should really
replace all of that code with #include "zynqmp.dtsi" and have only the
board-specific code here.

> diff --git a/board/digilent/genesys-zu/genimage.cfg b/board/digilent/genesys-zu/genimage.cfg
> new file mode 100644
> index 0000000000..eeecfee37d
> --- /dev/null
> +++ b/board/digilent/genesys-zu/genimage.cfg
> @@ -0,0 +1,28 @@
> +image boot.vfat {
> +	vfat {
> +		files = {
> +			"boot.bin",
> +			"u-boot.itb",
> +			"GenesysZU.dtb",

Why is the dtb file both in FAT and in image.ub?

-- 
Luca
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
