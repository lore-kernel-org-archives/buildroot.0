Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 688F3C433EF
	for <buildroot@archiver.kernel.org>; Tue,  3 May 2022 20:11:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3399D812D8;
	Tue,  3 May 2022 20:11:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JsP7bKn5eOoF; Tue,  3 May 2022 20:11:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CCE98126A;
	Tue,  3 May 2022 20:11:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3F5CA1BF2C1
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 20:11:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2EB898125B
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 20:11:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tvA6cM_7D9Si for <buildroot@lists.busybox.net>;
 Tue,  3 May 2022 20:11:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2055F80BD3
 for <buildroot@buildroot.org>; Tue,  3 May 2022 20:11:24 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id l7so35532628ejn.2
 for <buildroot@buildroot.org>; Tue, 03 May 2022 13:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=x4EwBXP8eZAQ/8Ig3yYVK+wC6QcYTs1Z/C9eNnLNyIs=;
 b=AGh8dRVWZaFxe72QYUUFJi09WaJUTbqhuubyUwVehIxfD+YtqnuftzQgcAOImIBhkK
 wQ62sdweBY99bTqb3ZarFthvdKHLtzdyHwsmrFJdW8C1lisSFdeNEdn//k4rPGrCfXSq
 /ou4m5n7uLiX0aG3CAwmQ1SlgiOtleVMNOnQ77ZkaBs/7VeEeTOOx+Y+ZAxOoKEsGLpN
 mS8qgvTF5tiMj5IkwlLMEKKbUNLTYYrbC3CO0IF4daYmO2t+HAT0d2X0z7mbpYvWGsZi
 Hx09CeVblJPnUwEbsX8TRW3ty8XWJpoiy8QvQOdEGdc+m1vLpdD0brlSHeY4mbD7LSUU
 B6nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=x4EwBXP8eZAQ/8Ig3yYVK+wC6QcYTs1Z/C9eNnLNyIs=;
 b=vDV35LqPBZBjzXJtuWoDV7mVskvajg+fRBPzvIjCaH2udnVVWmgfOi9XXqJhwmI7oQ
 3O1jBifppucIgwNUT+yOg6D+ExadZocmoYWzzrHtI4cbVLCVP0D7YTGGhBr+pdNmFnjS
 WdZU1m0vDCAafRWjBnPr61qgc6ux90iD3gWa+25NNJO8qkv01eQBevGniTNq11n7y7/O
 nXaOLiwUU/vbFLO1VnezMBLUCh3ejQlRWgDW23JBOaKND99WPml2eXBw1gvAH4X+tgPF
 etic7ueWlrZ/2CpHgQ5zGM3Ff1lTcoC8vtLMenxAzCpK3Owq9FpQY4odsTEuWPLjR3w6
 4A/g==
X-Gm-Message-State: AOAM531vR6G5+hKlda1k6nJ4x6r4oxjaBg81QnbnepPl+51leWLhwY33
 XoLoRRLeHzQMGIQfyKyRan8Em08lZARn2g==
X-Google-Smtp-Source: ABdhPJybZ+vUbPKGa3+CmsfMeTHMsUcTWHxKQfl1AuQE4gsBrA36XmTY81ePA/Hd/eolbw5f3zRbZA==
X-Received: by 2002:a17:906:2646:b0:6d5:d889:c92b with SMTP id
 i6-20020a170906264600b006d5d889c92bmr17824234ejc.696.1651608682161; 
 Tue, 03 May 2022 13:11:22 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 ze16-20020a170906ef9000b006f3ef214e37sm4912893ejb.157.2022.05.03.13.11.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 13:11:21 -0700 (PDT)
Message-ID: <5e4ab39f-3e69-cc0e-557c-2154e690932f@mind.be>
Date: Tue, 3 May 2022 22:11:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220502215342.3485999-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220502215342.3485999-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH v2 1/1] package/linux-headers: prevent
 invalid custom headers selection
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



On 02/05/2022 23:53, James Hilliard wrote:
> If BR2_KERNEL_HEADERS_AS_KERNEL is selected and the kernel version
> is known we should not allow potentially incompatible custom headers
> to be selected.
> 
> For BR2_LINUX_KERNEL_LATEST_CIP_VERSION and
> BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION this means we should select
> BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 and for
> BR2_LINUX_KERNEL_LATEST_VERSION this means we should select
> BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15.
> 
> Fixes:
>   - http://autobuild.buildroot.net/results/816/816d7a3ad77ba051fff7fba7f2a38fc31549c360
>   - http://autobuild.buildroot.net/results/3c3/3c3a9fc1a1e0002ae8169fd47b3003ebb86935f6
>   - http://autobuild.buildroot.net/results/188/18883459577dc0fdc01149110ffb81bf1a28c94a
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> Changes v1 -> v2:
>    - entirely disable Custom kernel headers series when kernel version is known
> ---
>   linux/Config.in                      | 3 +++
>   package/linux-headers/Config.in.host | 5 +++--
>   2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/linux/Config.in b/linux/Config.in
> index 4b4ea8d92b..82f5675f6c 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -29,9 +29,11 @@ choice
>   
>   config BR2_LINUX_KERNEL_LATEST_VERSION
>   	bool "Latest version (5.15)"
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15 if BR2_KERNEL_HEADERS_AS_KERNEL
>   
>   config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
>   	bool "Latest CIP SLTS version (5.10.104-cip3)"
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 if BR2_KERNEL_HEADERS_AS_KERNEL
>   	help
>   	  CIP launched in the spring of 2016 to address the needs of
>   	  organizations in industries such as power generation and
> @@ -51,6 +53,7 @@ config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
>   
>   config BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
>   	bool "Latest CIP RT SLTS version (5.10.104-cip3-rt3)"
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 if BR2_KERNEL_HEADERS_AS_KERNEL
>   	help
>   	  Same as the CIP version, but this is the PREEMPT_RT realtime
>   	  variant.
> diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
> index decf02d175..43a116974b 100644
> --- a/package/linux-headers/Config.in.host
> +++ b/package/linux-headers/Config.in.host
> @@ -127,8 +127,9 @@ endif
>   
>   choice
>   	bool "Custom kernel headers series"
> -	default BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15 if \
> -		(BR2_KERNEL_HEADERS_AS_KERNEL && BR2_LINUX_KERNEL_LATEST_VERSION)
> +	depends on !BR2_LINUX_KERNEL_LATEST_VERSION || !BR2_KERNEL_HEADERS_AS_KERNEL
> +	depends on !BR2_LINUX_KERNEL_LATEST_CIP_VERSION || !BR2_KERNEL_HEADERS_AS_KERNEL
> +	depends on !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION || !BR2_KERNEL_HEADERS_AS_KERNEL
>   	depends on BR2_KERNEL_HEADERS_VERSION || BR2_KERNEL_HEADERS_AS_KERNEL || \
>   		   BR2_KERNEL_HEADERS_CUSTOM_TARBALL || BR2_KERNEL_HEADERS_CUSTOM_GIT
>   	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
