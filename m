Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 142D8EB64DC
	for <buildroot@archiver.kernel.org>; Mon, 17 Jul 2023 16:51:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BC7D60C01;
	Mon, 17 Jul 2023 16:51:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BC7D60C01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Oudq_dVOZqLY; Mon, 17 Jul 2023 16:51:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99A8160BBF;
	Mon, 17 Jul 2023 16:51:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99A8160BBF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D9CAB1BF338
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 16:50:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 965FD60BBF
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 16:50:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 965FD60BBF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sv-74_xhBPMK for <buildroot@lists.busybox.net>;
 Mon, 17 Jul 2023 16:50:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72AA0608D8
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 72AA0608D8
 for <buildroot@buildroot.org>; Mon, 17 Jul 2023 16:50:58 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 55B0C320095B;
 Mon, 17 Jul 2023 12:50:57 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 17 Jul 2023 12:50:57 -0400
X-ME-Sender: <xms:b3G1ZC7SxkkmR8Kjikq4hPPWZuJDIJFiEkI6RJ0gy4V_LR38LDTN1w>
 <xme:b3G1ZL7t2viGxMG0PYGxqWGvJ1hddgfbA3pDpT6VEjx7AOryO_Vn_Ipk-9Ma8gLjP
 qzImEokTn706Uo0KXo>
X-ME-Received: <xmr:b3G1ZBdGWI0nAw8kBm9RFF_5A_WxtJVrKwef1-vU1y6wcTSZfb_IVgHzLBXoNSxPCh_0TJcDYehFCLhwBWCJ-w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrgedvgddutdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfhgfhffvvefuffgjkfggtgesthdtredttdertdenucfhrhhomhepffgrvhhi
 ugcutfgvrghvvghruceomhgvsegurghvihgurhgvrghvvghrrdgtohhmqeenucggtffrrg
 htthgvrhhnpeffiedvtdekgeevhefhudeitdeuvddtgffftedtueelffffkeetgfdtjeev
 uedvleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmvgesuggrvhhiughrvggrvhgvrhdrtghomh
X-ME-Proxy: <xmx:b3G1ZPLtpVE99S0F1CdY1upnypBrUEa2a-_FkogcTf6yvmZkPsn6ow>
 <xmx:b3G1ZGKAyUr3jjovVtutd9OakwQyeR4g52WRglTctMqq81KTQlM5gQ>
 <xmx:b3G1ZAxSYrgF9h-zLq8qB-C8AcpLoGvIASF_Ie0JY4EjtdlrdAJuVg>
 <xmx:cHG1ZLGJ4vv-SkHQJORnW87786dhd3XAUvQCWaDdv7Ynf_FOQBFzuQ>
Feedback-ID: i67e946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Jul 2023 12:50:54 -0400 (EDT)
References: <20230703160149.2302949-1-dario.binacchi@amarulasolutions.com>
User-agent: mu4e 1.10.4; emacs 28.2
From: David Reaver <me@davidreaver.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon, 17 Jul 2023 09:48:11 -0700
In-reply-to: <20230703160149.2302949-1-dario.binacchi@amarulasolutions.com>
Message-ID: <86ttu2qy6p.fsf@davidreaver.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=davidreaver.com; 
 h=cc:cc:content-type:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1689612656; x=
 1689699056; bh=X7Bla6KU//YHkkS1+yXbBHqSIcSjJooCAYVo6iJNYao=; b=V
 TSUdyWABA4XtyR9MVpB3ntVmsPF5mkR+XervEIsVe/PPyNO3PK7VK7pXgv9f9Ryz
 +dUu+zEGVE4qN09q9nBZbXJAX8aAmBXLf46rODakt1XaqfNr8ZDDQSVEaqbGhaoC
 U3DtfPwokaHxB1nANe9CdJItDWT6LC9zbujXiiNbWstN0k8lluWg6jsY2FQ6AYDO
 e2gdGGZl323r9mIzge7uqJ464sVbQkxnEpgiIB69J57/oKjhE0flDvDDO+tc2mB8
 CoqW8LoSFfIAXMeCcheMbnkcW7zXqruEvfH/xtjRcMEKxQHgdOjc6KDBKbZaoOW/
 71CR3YmQS7KG5dSH6K3BA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1689612656; x=1689699056; bh=X7Bla6KU//YHk
 kS1+yXbBHqSIcSjJooCAYVo6iJNYao=; b=z4EeSnTBYpg5utRXlJ3EDjeaX/5Jp
 8gYP76iUIJtCEyB05O2f+wLhlnMjDEiV/Inppzk3qcy4DM1Lq82DdjW+yL4n0oqM
 TKHW2bkSZ0OuvVwKfTcypEVGcZpqUbzASi+G6dDftS+7PHpCtEOx1QnaR7ZZKWgB
 NLNwk4w9HhxlvpAs2r8MdoFd1H7vfTC9xD37MSMHGtd6I00Cee/OQi/r442x4G90
 kuYOo4T0xlwMfbd0tXUV5tWknBK4Odx9cPwSLEllIiVVhT6iXjKuLiXzIQ3GqdTC
 yhAVgIpNcEPAMi5UuHa56nSKeMVWYv2RtmytZ+KS0TpIzBcsj4s9oiNsw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=davidreaver.com
 header.i=@davidreaver.com header.a=rsa-sha256 header.s=fm3 header.b=VTSUdyWA; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=z4EeSnTB
Subject: Re: [Buildroot] [PATCH 1/2] boot/u-boot: fix u-boot.stm32 creation
 on newer version
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
Cc: Bartosz Bilas <b.bilas@grinn-global.com>, Simon Doppler <dopsi@dopsi.ch>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


Dario Binacchi <dario.binacchi@amarulasolutions.com> writes:

> As reported in commit [1] of the U-Boot project, the config.mk file has
> been suppressed in order to use binman to manage FIT generation.
>
> The added configuration option allows the creation of the u-boot.stm32
> image for both recent versions of U-Boot, which use binman, and older
> versions.
>
> [1] 5564b4cd4d5c69 ("stm32mp: add binman support for STM32MP15x")
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  boot/uboot/Config.in                            | 10 ++++++++++
>  boot/uboot/uboot.mk                             |  2 ++
>  configs/avenger96_defconfig                     |  1 +
>  configs/olimex_stmp157_olinuxino_lime_defconfig |  1 +
>  configs/stm32mp157a_dk1_defconfig               |  1 +
>  configs/stm32mp157c_dk2_defconfig               |  1 +
>  configs/stm32mp157c_odyssey_defconfig           |  1 +
>  7 files changed, 17 insertions(+)
>
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index 085397d03d0c..ab0aaf2939f9 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -395,6 +395,16 @@ config BR2_TARGET_UBOOT_FORMAT_STM32
>  	bool "u-boot.stm32"
>  	depends on BR2_arm
>
> +if BR2_TARGET_UBOOT_FORMAT_STM32
> +config BR2_TARGET_UBOOT_BUILD_FORMAT_STM32_LEGACY
> +	bool "Legacy build (u-boot.stm32 target)"
> +	help
> +	  Select this option if you use U-Boot with version older than
> +	  2022.01), so that we use the old build target. Otherwise,
> +	  binman application is called to create the stm32 binary
> +	  format.
> +endif
> +
>  config BR2_TARGET_UBOOT_FORMAT_CUSTOM
>  	bool "Custom (specify below)"
>  	help
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 4eae8e95c373..0b4b355a6c34 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -133,8 +133,10 @@ endif
>
>  ifeq ($(BR2_TARGET_UBOOT_FORMAT_STM32),y)
>  UBOOT_BINS += u-boot.stm32
> +ifeq ($(BR2_TARGET_UBOOT_BUILD_FORMAT_STM32_LEGACY),y)
>  UBOOT_MAKE_TARGET += u-boot.stm32
>  endif
> +endif
>
>  ifeq ($(BR2_TARGET_UBOOT_FORMAT_CUSTOM),y)
>  UBOOT_BINS += $(call qstrip,$(BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME))
> diff --git a/configs/avenger96_defconfig b/configs/avenger96_defconfig
> index d2c1b9013ef2..1f8e7a50d1e7 100644
> --- a/configs/avenger96_defconfig
> +++ b/configs/avenger96_defconfig
> @@ -30,5 +30,6 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.07"
>  BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
>  # BR2_TARGET_UBOOT_FORMAT_BIN is not set
>  BR2_TARGET_UBOOT_FORMAT_STM32=y
> +BR2_TARGET_UBOOT_BUILD_FORMAT_STM32_LEGACY=y
>  BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=stm32mp15xx-dhcor-avenger96"
>  BR2_PACKAGE_HOST_GENIMAGE=y
> diff --git a/configs/olimex_stmp157_olinuxino_lime_defconfig b/configs/olimex_stmp157_olinuxino_lime_defconfig
> index 3b56fefeca1c..44ff706fb2c5 100644
> --- a/configs/olimex_stmp157_olinuxino_lime_defconfig
> +++ b/configs/olimex_stmp157_olinuxino_lime_defconfig
> @@ -41,6 +41,7 @@ BR2_TARGET_UBOOT_BOARD_DEFCONFIG="STM32-OLinuXino-LIME"
>  # BR2_TARGET_UBOOT_FORMAT_BIN is not set
>  BR2_TARGET_UBOOT_FORMAT_IMG=y
>  BR2_TARGET_UBOOT_FORMAT_STM32=y
> +BR2_TARGET_UBOOT_BUILD_FORMAT_STM32_LEGACY=y
>  BR2_TARGET_UBOOT_SPL=y
>  BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl.stm32"
>
> diff --git a/configs/stm32mp157a_dk1_defconfig b/configs/stm32mp157a_dk1_defconfig
> index a487ce989148..3b8fdea993ac 100644
> --- a/configs/stm32mp157a_dk1_defconfig
> +++ b/configs/stm32mp157a_dk1_defconfig
> @@ -40,6 +40,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
>  BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
>  # BR2_TARGET_UBOOT_FORMAT_BIN is not set
>  BR2_TARGET_UBOOT_FORMAT_STM32=y
> +BR2_TARGET_UBOOT_BUILD_FORMAT_STM32_LEGACY=y
>  BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
>  BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=stm32mp157a-dk1"
>
> diff --git a/configs/stm32mp157c_dk2_defconfig b/configs/stm32mp157c_dk2_defconfig
> index f1f7baaa0806..8b83bfe44353 100644
> --- a/configs/stm32mp157c_dk2_defconfig
> +++ b/configs/stm32mp157c_dk2_defconfig
> @@ -40,6 +40,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
>  BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
>  # BR2_TARGET_UBOOT_FORMAT_BIN is not set
>  BR2_TARGET_UBOOT_FORMAT_STM32=y
> +BR2_TARGET_UBOOT_BUILD_FORMAT_STM32_LEGACY=y
>  BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
>  BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=stm32mp157c-dk2"
>
> diff --git a/configs/stm32mp157c_odyssey_defconfig b/configs/stm32mp157c_odyssey_defconfig
> index 6b699830b171..15b9a63b3926 100644
> --- a/configs/stm32mp157c_odyssey_defconfig
> +++ b/configs/stm32mp157c_odyssey_defconfig
> @@ -29,6 +29,7 @@ BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
>  BR2_TARGET_UBOOT_NEEDS_DTC=y
>  # BR2_TARGET_UBOOT_FORMAT_BIN is not set
>  BR2_TARGET_UBOOT_FORMAT_STM32=y
> +BR2_TARGET_UBOOT_BUILD_FORMAT_STM32_LEGACY=y
>  BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
>  BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=stm32mp157c-odyssey"
>  BR2_PACKAGE_HOST_GENIMAGE=y

(Sorry for the folks receiving this email multiple times. My mailing
list settings were incorrect and my replies were bouncing.)

Thanks for this! I was messing with a new STM32MP157D over the weekend,
tried using a newer uboot version, and failed because of this exact
issue.

I applied this series, successfully created an SD card image, booted my
board with it, and it worked great. Here is the uboot version and my
board info from uboot's startup:

    U-Boot 2023.04 (Jan 01 1980 - 00:00:00 +0000)

    CPU: STM32MP157DAC Rev.Z
    Model: STMicroelectronics STM32MP157A-DK1 Discovery Board
    Board: stm32mp1 in trusted - stm32image mode (st,stm32mp157a-dk1)
    Board: MB1272 Var3.0 Rev.C-03

Tested-by: David Reaver <me@davidreaver.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
