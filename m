Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A537C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 15:10:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D72CD419A5;
	Sat, 23 Apr 2022 15:10:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9mxP6Ju1nfT6; Sat, 23 Apr 2022 15:10:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93CD5409BE;
	Sat, 23 Apr 2022 15:10:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 60E421BF421
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 15:10:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5DDB2606E7
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 15:10:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OiEwOXXo5YeP for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 15:10:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6FC0F6068A
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 15:10:33 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id a21so1515124edb.1
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 08:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=9KhIZdN4HleBI+jrpUDSt/W6EiyTSTGNXZCKlSn2u30=;
 b=LUf+Gqa0koJ21yMzK+pjABTlwEaobgoraEqd9HL6sALuZ35BR+i7YutfJIrwgTyjvc
 EmpShGrfgezm7c2OI87t7ZXNDCl9J950yRKnsKNmskWfk4NMU1A6pLlUSnkc8pLnQvKL
 RSm4e9dKZnkSAIZfhiSRE30FMIjhH017jtEG/ZmPYQG92nuMAUw7h2pH4M6CBbpDos1m
 eD8B8m98thNBsTI9K+ToFi7CxWz8SYmapbqE407QECLC4tih+DxLS3ZLxYyqYnBmypzC
 ePmIe+647VHM1JeSioISDeR3RsMy+lVKv5P6y1cVTcY8+1GQAyk8O5TppvZLcHRueT8U
 M8Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=9KhIZdN4HleBI+jrpUDSt/W6EiyTSTGNXZCKlSn2u30=;
 b=6BXRXiC/67Q2k7Kdhh+Xy6UzsAHIUTh1Gt+en5yH1jER/5MnqnrJsiEHlh2/of739x
 B75gvhNb2TkwpwhiOxMYemKEDhO02ek4B5DxtYSPK0Wa9O/2v/BMAJ4dt7SaWFT8Divo
 9jkxVeDCiJNHv/Mnxw+ofkTyCJjK2N8CbpFTtfXd1ln3MpeyAVKlTC7cqPSP2yYAjt74
 O8U6TkULGbNdSZS0QYO1PNzYCix4koEy/gYoAY+MyCxZlPluIrEo4f/bXYeQHXZHPsHg
 okWAvpdJLXl87sMRqgFCSqdf/jBaSLWNT5tBajPnjEE5hWQnJC7EXRnSfKPkuPxTWAjh
 mg/g==
X-Gm-Message-State: AOAM533/tq15/IEssLs9K1qFALCSSrcwqxFloZ0ENDmsoZ1IztcGuT1V
 9kUSwFQTh7vU8D1r81Gu7IVPiKP3+AfXvA==
X-Google-Smtp-Source: ABdhPJxx3mGThi7/CDSXYLqX+V1wGNnkIX7H8ZIMJzmZW+5zvU+3tgfRQjQCQ0WNqGL58u2LP4pLAA==
X-Received: by 2002:a05:6402:270b:b0:424:7dd:9d7b with SMTP id
 y11-20020a056402270b00b0042407dd9d7bmr10523292edd.92.1650726631547; 
 Sat, 23 Apr 2022 08:10:31 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 h8-20020a1709066d8800b006e09a49a713sm1745867ejt.159.2022.04.23.08.10.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Apr 2022 08:10:31 -0700 (PDT)
Message-ID: <cfba7e93-1592-4163-9dde-81cfc93494d2@mind.be>
Date: Sat, 23 Apr 2022 17:10:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220419200122.4095481-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220419200122.4095481-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] boot/shim: add
 BR2_PACKAGE_SHIM_ARCH_SUPPORTS
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 19/04/2022 22:01, Fabrice Fontaine wrote:
> Add BR2_PACKAGE_SHIM_ARCH_SUPPORTS as requested by Thomas Petazzoni in
> https://patchwork.ozlabs.org/project/buildroot/patch/20220419121409.2055818-1-fontaine.fabrice@gmail.com
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   boot/shim/Config.in | 13 ++++++++++---
>   1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/boot/shim/Config.in b/boot/shim/Config.in
> index b0e549a51b..a762ad9215 100644
> --- a/boot/shim/Config.in
> +++ b/boot/shim/Config.in
> @@ -1,8 +1,15 @@
> -config BR2_TARGET_SHIM
> -	bool "shim"
> +config BR2_PACKAGE_SHIM_ARCH_SUPPORTS
> +	bool
>   	# it includes gnu-efi
>   	depends on BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS

  depends comes after default (as reported by check-package).

  Applied to master with that fixed, thanks.

  Regards,
  Arnout

> -	depends on !BR2_mips64el
> +	default y if BR2_aarch64 || BR2_aarch64_be
> +	default y if BR2_arm || BR2_armeb
> +	default y if BR2_i386
> +	default y if BR2_x86_64
> +
> +config BR2_TARGET_SHIM
> +	bool "shim"
> +	depends on BR2_PACKAGE_SHIM_ARCH_SUPPORTS
>   	help
>   	  Boot loader to chain-load signed boot loaders under Secure
>   	  Boot.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
