Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A4CC433EF
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 21:52:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A200606DC;
	Mon,  2 May 2022 21:52:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s5p6zin7TpXp; Mon,  2 May 2022 21:51:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58119600C5;
	Mon,  2 May 2022 21:51:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EE0041BF2BC
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EAAC340351
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:51:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gHja2Wr-cIiA for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 21:51:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C220040290
 for <buildroot@buildroot.org>; Mon,  2 May 2022 21:51:55 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id bv19so30150304ejb.6
 for <buildroot@buildroot.org>; Mon, 02 May 2022 14:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=sAqQXRM1Cc9yRg+6cTAFrf8iWJ6m0SvlWcDAXpU9HfU=;
 b=UCawv8uqekaAD4o1xkajA2JIPOGrRNnyOVIN9jgwiSDep324wvi9V5QhfBR7r9hN60
 IgPAAToWrUfsEphV6DqTaSfVYLRJA/uQryYpoXUNd9HWfevLDi3ZnOH4kdyNUep3JB62
 knHD+IetiXZDQ2xyMnwDiukMZUBYMDC1AjckAMKHBICrTIT9zOsIA3lLBFZ5GJyHKNK6
 SrC7vglNL46KYgD5/dvoT3NS0ji7tjy7UvDhfsL0Khj5vCioXtV/3PI3BXDFeQ3i2g1t
 cW1Xpn0n2mzD4o6M3WED2Njw7xTWz2XpKlqAxxFkegksHnLTVnS7piBfOdYqnsBeFu1i
 1pIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=sAqQXRM1Cc9yRg+6cTAFrf8iWJ6m0SvlWcDAXpU9HfU=;
 b=HfsoQNIriHOFY2dD6Nu8hxeV2foAxnHk/P3MDkYWZLTFzEJgKjcLXbTKpvyNwp1H2f
 7avIbOg2ISg+MTNzBhXducbaMl/R+2aEELIqwxYAGhx27qiot5WVl59N/tmUR7dqqSA/
 8SNaLqM5BQo5l3yzkWrLkc1hViS2dlatQ7BeeKTcPt9giwolCqQ3/Qj9Zz6avehWd0Vw
 i/dFQMsrclV/Asfj/0Iv0d/xb0PV9rpH0jZxU0wwkvnq2lfa8Jq14WnXlmSKfRXF+iFu
 +oQzGLXckfrhrr3kC/lHbi75P/WBISqUpB1eFTBGxsl88Q/7GPLafJBzhLN5bAYG82Pl
 GJqA==
X-Gm-Message-State: AOAM532HkwCd5uMHdTWtzVTLu3/qSqnqd01Ep85420G0w/rp19ce2Zah
 SQP8W2HVuatwPte5MKKwIYAQ3g==
X-Google-Smtp-Source: ABdhPJxXERB7J23Z0kB2qI0+W5kuk00SXCydMExCY88FufvB2u/445uiZSBgvLEEvSYFqy8BzJAb5A==
X-Received: by 2002:a17:907:8a21:b0:6f3:d0f0:b56b with SMTP id
 sc33-20020a1709078a2100b006f3d0f0b56bmr12802425ejc.305.1651528313960; 
 Mon, 02 May 2022 14:51:53 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 hz7-20020a1709072ce700b006f3ef214dc9sm4006835ejc.47.2022.05.02.14.51.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 14:51:53 -0700 (PDT)
Message-ID: <b1980a5e-ec18-3d83-b6bb-58f46f83917a@mind.be>
Date: Mon, 2 May 2022 23:51:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Thomas Perrot <thomas.perrot@bootlin.com>, buildroot@buildroot.org
References: <20220430080821.3524816-1-thomas.perrot@bootlin.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220430080821.3524816-1-thomas.perrot@bootlin.com>
Subject: Re: [Buildroot] [PATCH] board/freescale/common/imx: add TEE support
 in imx8-bootloader-prepare
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
Cc: thomas.petazzoni@bootlin.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 30/04/2022 10:08, Thomas Perrot via buildroot wrote:
> When BR2_TARGET_OPTEE_OS=y, mkimage_fit_atf.sh is executed with two additional
> variables so that the ITS file contains an additional node for the TEE binary.
> 
> Then the TEE binary will be packaged into the ITB in addition to TF-A and
> U-Boot.
> 
> Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>

  Applied to master, thanks.

> ---
>   .../common/imx/imx8-bootloader-prepare.sh     | 24 +++++++++++++++----
>   1 file changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/board/freescale/common/imx/imx8-bootloader-prepare.sh b/board/freescale/common/imx/imx8-bootloader-prepare.sh
> index 56f65e312628..9025fb132d49 100755
> --- a/board/freescale/common/imx/imx8-bootloader-prepare.sh
> +++ b/board/freescale/common/imx/imx8-bootloader-prepare.sh
> @@ -10,28 +10,44 @@ main ()
>   
>   	if grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M=y$" ${BR2_CONFIG}; then
>   		cat ${BINARIES_DIR}/u-boot-spl.bin ${BINARIES_DIR}/ddr_fw.bin > ${BINARIES_DIR}/u-boot-spl-ddr.bin
> -		BL31=${BINARIES_DIR}/bl31.bin BL33=${BINARIES_DIR}/u-boot-nodtb.bin ATF_LOAD_ADDR=0x00910000 ${HOST_DIR}/bin/mkimage_fit_atf.sh ${UBOOT_DTB} > ${BINARIES_DIR}/u-boot.its
> +		if grep -Eq "^BR2_TARGET_OPTEE_OS=y$" ${BR2_CONFIG}; then
> +			BL31=${BINARIES_DIR}/bl31.bin BL32=${BINARIES_DIR}/tee.bin BL33=${BINARIES_DIR}/u-boot-nodtb.bin TEE_LOAD_ADDR=0xfe000000 ATF_LOAD_ADDR=0x00910000 ${HOST_DIR}/bin/mkimage_fit_atf.sh ${UBOOT_DTB} > ${BINARIES_DIR}/u-boot.its
> +		else
> +			BL31=${BINARIES_DIR}/bl31.bin BL33=${BINARIES_DIR}/u-boot-nodtb.bin ATF_LOAD_ADDR=0x00910000 ${HOST_DIR}/bin/mkimage_fit_atf.sh ${UBOOT_DTB} > ${BINARIES_DIR}/u-boot.its
> +		fi

  It looks like this stuff is almost the same for all the different imx8 
variants, so this smells like an opportunity to refactor it. Not really 
important though.

  Regards,
  Arnout

>   		${HOST_DIR}/bin/mkimage -E -p 0x3000 -f ${BINARIES_DIR}/u-boot.its ${BINARIES_DIR}/u-boot.itb
>   		rm -f ${BINARIES_DIR}/u-boot.its
>   
>   		${HOST_DIR}/bin/mkimage_imx8 -fit -signed_hdmi ${BINARIES_DIR}/signed_hdmi_imx8m.bin -loader ${BINARIES_DIR}/u-boot-spl-ddr.bin 0x7E1000 -second_loader ${BINARIES_DIR}/u-boot.itb 0x40200000 0x60000 -out ${BINARIES_DIR}/imx8-boot-sd.bin
>   	elif grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM=y$" ${BR2_CONFIG}; then
>   		cat ${BINARIES_DIR}/u-boot-spl.bin ${BINARIES_DIR}/ddr_fw.bin > ${BINARIES_DIR}/u-boot-spl-ddr.bin
> -		BL31=${BINARIES_DIR}/bl31.bin BL33=${BINARIES_DIR}/u-boot-nodtb.bin ATF_LOAD_ADDR=0x00920000 ${HOST_DIR}/bin/mkimage_fit_atf.sh ${UBOOT_DTB} > ${BINARIES_DIR}/u-boot.its
> +		if grep -Eq "^BR2_TARGET_OPTEE_OS=y$" ${BR2_CONFIG}; then
> +			BL31=${BINARIES_DIR}/bl31.bin BL32=${BINARIES_DIR}/tee.bin BL33=${BINARIES_DIR}/u-boot-nodtb.bin TEE_LOAD_ADDR=0xbe000000 ATF_LOAD_ADDR=0x00920000 ${HOST_DIR}/bin/mkimage_fit_atf.sh ${UBOOT_DTB} > ${BINARIES_DIR}/u-boot.its
> +		else
> +			BL31=${BINARIES_DIR}/bl31.bin BL33=${BINARIES_DIR}/u-boot-nodtb.bin ATF_LOAD_ADDR=0x00920000 ${HOST_DIR}/bin/mkimage_fit_atf.sh ${UBOOT_DTB} > ${BINARIES_DIR}/u-boot.its
> +		fi
>   		${HOST_DIR}/bin/mkimage -E -p 0x3000 -f ${BINARIES_DIR}/u-boot.its ${BINARIES_DIR}/u-boot.itb
>   		rm -f ${BINARIES_DIR}/u-boot.its
>   
>   		${HOST_DIR}/bin/mkimage_imx8 -fit -loader ${BINARIES_DIR}/u-boot-spl-ddr.bin 0x7E1000 -second_loader ${BINARIES_DIR}/u-boot.itb 0x40200000 0x60000 -out ${BINARIES_DIR}/imx8-boot-sd.bin
>   	elif grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN=y$" ${BR2_CONFIG}; then
>   		cat ${BINARIES_DIR}/u-boot-spl.bin ${BINARIES_DIR}/ddr_fw.bin > ${BINARIES_DIR}/u-boot-spl-ddr.bin
> -		BL31=${BINARIES_DIR}/bl31.bin BL33=${BINARIES_DIR}/u-boot-nodtb.bin ATF_LOAD_ADDR=0x00960000 ${HOST_DIR}/bin/mkimage_fit_atf.sh ${UBOOT_DTB} > ${BINARIES_DIR}/u-boot.its
> +		if grep -Eq "^BR2_TARGET_OPTEE_OS=y$" ${BR2_CONFIG}; then
> +			BL31=${BINARIES_DIR}/bl31.bin BL32=${BINARIES_DIR}/tee.bin BL33=${BINARIES_DIR}/u-boot-nodtb.bin TEE_LOAD_ADDR=0x56000000 ATF_LOAD_ADDR=0x00960000 ${HOST_DIR}/bin/mkimage_fit_atf.sh ${UBOOT_DTB} > ${BINARIES_DIR}/u-boot.its
> +		else
> +			BL31=${BINARIES_DIR}/bl31.bin BL33=${BINARIES_DIR}/u-boot-nodtb.bin ATF_LOAD_ADDR=0x00960000 ${HOST_DIR}/bin/mkimage_fit_atf.sh ${UBOOT_DTB} > ${BINARIES_DIR}/u-boot.its
> +		fi
>   		${HOST_DIR}/bin/mkimage -E -p 0x3000 -f ${BINARIES_DIR}/u-boot.its ${BINARIES_DIR}/u-boot.itb
>   		rm -f ${BINARIES_DIR}/u-boot.its
>   
>   		${HOST_DIR}/bin/mkimage_imx8 -v v2 -fit -loader ${BINARIES_DIR}/u-boot-spl-ddr.bin 0x912000 -second_loader ${BINARIES_DIR}/u-boot.itb 0x40200000 0x60000 -out ${BINARIES_DIR}/imx8-boot-sd.bin
>   	elif grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP=y$" ${BR2_CONFIG}; then
>   		cat ${BINARIES_DIR}/u-boot-spl.bin ${BINARIES_DIR}/ddr_fw.bin > ${BINARIES_DIR}/u-boot-spl-ddr.bin
> -		BL31=${BINARIES_DIR}/bl31.bin BL33=${BINARIES_DIR}/u-boot-nodtb.bin ATF_LOAD_ADDR=0x00970000 ${HOST_DIR}/bin/mkimage_fit_atf.sh ${UBOOT_DTB} > ${BINARIES_DIR}/u-boot.its
> +		if grep -Eq "^BR2_TARGET_OPTEE_OS=y$" ${BR2_CONFIG}; then
> +			BL31=${BINARIES_DIR}/bl31.bin BL32=${BINARIES_DIR}/tee.bin BL33=${BINARIES_DIR}/u-boot-nodtb.bin TEE_LOAD_ADDR=0x56000000 ATF_LOAD_ADDR=0x00970000 ${HOST_DIR}/bin/mkimage_fit_atf.sh ${UBOOT_DTB} > ${BINARIES_DIR}/u-boot.its
> +		else
> +			BL31=${BINARIES_DIR}/bl31.bin BL33=${BINARIES_DIR}/u-boot-nodtb.bin ATF_LOAD_ADDR=0x00970000 ${HOST_DIR}/bin/mkimage_fit_atf.sh ${UBOOT_DTB} > ${BINARIES_DIR}/u-boot.its
> +		fi
>   		${HOST_DIR}/bin/mkimage -E -p 0x3000 -f ${BINARIES_DIR}/u-boot.its ${BINARIES_DIR}/u-boot.itb
>   		rm -f ${BINARIES_DIR}/u-boot.its
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
