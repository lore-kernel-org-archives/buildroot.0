Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99CD6C47077
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 15:26:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B2FF60A84;
	Thu, 11 Jan 2024 15:26:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B2FF60A84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y5j7gw1JHT8g; Thu, 11 Jan 2024 15:26:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 977F060BD7;
	Thu, 11 Jan 2024 15:26:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 977F060BD7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 914EA1BF2A6
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 15:26:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 700EB426CE
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 15:26:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 700EB426CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id whV35vw6JDhH for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 15:26:19 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F337F40191
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 15:26:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F337F40191
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 9FD32B00579;
 Thu, 11 Jan 2024 16:26:08 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 11 Jan 2024 16:26:08 +0100
Date: Thu, 11 Jan 2024 16:26:08 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Laurent Badel <laurentbadel@eaton.com>
Message-ID: <ZaAIkDXOQV9QUazR@landeda>
References: <20240111131932.11760-1-laurentbadel@eaton.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240111131932.11760-1-laurentbadel@eaton.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704986770;
 bh=k6JF/OOe4u81Aw9deQl6EzPwtqNnl1wHeV28FMAipIw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qOyB6JRDeGY/V8T1ZEPkPae3d34pK4ZSaZa2hpPQNlZh5TfrYAljRIkaZuWM8QMuY
 cugW1NTQmG+sLtFXWwTOfSgQoSvaoa6tHS9l/IILzD9l7AS7XifVV31A8f82OyrGT8
 3yFGjWPjl6QHZa8mJNf4Ig6OCb9Nni3jjmJyxxT1vJt07bL+r+d9O3d7bOhiz2s1Qz
 kJx7YsRH9nqu7FWzxRbUPj0GymRMNdlwGpw4HubPOsrRVhnDEhXMpcK88LcRq40TdF
 f48B0zIkntL3fJPEVAkdrjRfV6G1xmV23z2Pu1/P7yevva+X2KzbH6mMm8mZJwf54N
 kzXjQ7Y7OHlQw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qOyB6JRD
Subject: Re: [Buildroot] [PATCH 1/1] boot/mxs-bootlets: add support for
 zImage with appended DTB
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Laurent, All,

On 2024-01-11 13:19 +0000, Laurent Badel via buildroot spake thusly:
> When building a zImage with appended DTB, buildroot creates a copy of
> the zImage named zImage.$(LINUX_DTS_NAME). mxs-bootlets.mk does not
> take this into consideration and instead passes the original zImage
> (without DTB appended) to elftosb to generate the SB file. Thus,
> make sure that the correct zImage is used in this process.
> 
> Note: this patch only supports a single DTS specified in the
> configuration, because there is no obvious use case for multiple DTS's
> with mxs-bootlets. If multiple DTS's are configured, only the first one
> will be used.

That's a bit unfortunate that we have to rely on the ordering.

So, if using two or more DTS in cunjunction with mxs-bootlets does not
make sense, should that be forbidden? I.e. would we need something like
the following (code slightly elided for brevity):

    ifeq ($(BR2_TARGET_MXS_BOOTLETS_LINUX),y)
    ifeq ($(BR2_BOOT_MXS_BOOTLETS),y)
    ifneq ($(words $(LINUX_DTS_NAME)),1)
    $(error More than one DTS specified; mxs-bootlets can only use one)
    endif
    endif
    define MXS_BOOTLETS_BUILD_LINUX_PREP
        ...
    endef
    MXS_BOOTLETS_ZIMAGE_NAME = zImage$(....)
    define MXS_BOOTLETS_SED_LINUX
        ...
    endif
    endif

(See below the name of the variable.)

> Signed-off-by: Laurent Badel <laurentbadel@eaton.com>
> ---
>  boot/mxs-bootlets/mxs-bootlets.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/boot/mxs-bootlets/mxs-bootlets.mk b/boot/mxs-bootlets/mxs-bootlets.mk
> index adc22767..2003b23f 100644
> --- a/boot/mxs-bootlets/mxs-bootlets.mk
> +++ b/boot/mxs-bootlets/mxs-bootlets.mk
> @@ -65,9 +65,10 @@ define MXS_BOOTLETS_BUILD_LINUX_PREP
>  	BOARD=$(MXS_BOOTLETS_BOARD) CROSS_COMPILE="$(TARGET_CROSS)" \
>  		$(MAKE1) -C $(@D) linux_prep
>  endef
> +ZIMAGE_NAME=zImage$(if $(BR2_LINUX_KERNEL_APPENDED_DTB),.$(notdir $(firstword $(LINUX_DTS_NAME))))

The namespace is global, so the variable names have to be manually
scopped with the name of the package they apply to, in this case:

    MXS_BOOTLETS_ZIMAGE_NAME

Regards,
Yann E. MORIN.

>  define MXS_BOOTLETS_SED_LINUX
>  	sed -i 's,[^ *]linux_prep.*;,\tlinux_prep="$(@D)/linux_prep/output-target/linux_prep";,' $(@D)/$(MXS_BOOTLETS_BOOTDESC)
> -	sed -i 's,[^ *]zImage.*;,\tzImage="$(LINUX_DIR)/arch/arm/boot/zImage";,' $(@D)/$(MXS_BOOTLETS_BOOTDESC)
> +	sed -i 's,[^ *]zImage.*;,\tzImage="$(LINUX_DIR)/arch/arm/boot/$(ZIMAGE_NAME)";,' $(@D)/$(MXS_BOOTLETS_BOOTDESC)
>  endef
>  endif
>  
> -- 
> 2.17.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
