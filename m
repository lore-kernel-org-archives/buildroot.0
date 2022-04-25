Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 679A9C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 19:03:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00FA94167C;
	Mon, 25 Apr 2022 19:03:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JlRYV_TQXKaV; Mon, 25 Apr 2022 19:03:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB098415A1;
	Mon, 25 Apr 2022 19:03:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3AD121BF312
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 19:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26D5960D95
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 19:03:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JP01dcafeLqu for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 19:03:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0681D60D61
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 19:03:01 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id bv19so31472315ejb.6
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 12:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=++z5AJBWfhI5BWx7CDkwsHDi4uWXS6VkU+jrJCgpL6M=;
 b=cNW/FYYWNX6vyuLxV9UHCnyOXoIbzvANTwzRZf6/X+gZmgSC6oUA4yXmfUGPPbm/bV
 rV8XNMoSaHn37sEDfgyhJOaRSqsE15BGzbt8jQFfi3YJeAV8OcLtrMbK6wbohtwceJIv
 QkAG3pew5bnvOPSgLE5jDGnI0iVQ6KCW9K8C5xHce8ZuPULZkUtOUPyhfF0RV7ljDdwl
 KGoVmx/PyhHmYz9hQiysPxAU3XD7J/cAi7sH91wRRaw1t0Yq0TafsDolN3TlBRtf4d9S
 pd3cNyibfiLyhrim36Sv48gF1zNXs0HRkxRHsRAvvtz/3wS6bzCZw+ADaAwN9fIyyhcR
 UgwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=++z5AJBWfhI5BWx7CDkwsHDi4uWXS6VkU+jrJCgpL6M=;
 b=tCSKwFuq3cIi7v299yrNKBIQQ9khdy4FHy7DmiAFyKXS0tqfANepwvz4OzU+clK1ov
 JhlXKRlTz7S3VHaJhEkEUVh8SVQ71tTNPkpIl+N69y7tThgEJxhIDzQkjUB24NK0xVf6
 BgrM39AwJyayt+h9eS2u781DVfU9mU+5agPwe/hG3mnujyMi2cfE4duWOA7qA0LJKRv/
 2onXSx2bJuiW0wq2STOJWaNaoBACE4EWk9WuEW3aCoyjA2gqOcoCpHE2gCxhVZ21roRv
 B9ae0Cbk6Ig/dtf9Cc5Wu6El+SnW3Da7zZasJaVpW5ZmFW3FZw9ixbAj0FPSQxuSbWvg
 cm/Q==
X-Gm-Message-State: AOAM531Zj0DQ6ij5CVpyrJslTHbArZa6P6avEPU3sil21jOWFV6R2KdD
 fPbhUCQGV2lPds4c7WS5sdCTQQ==
X-Google-Smtp-Source: ABdhPJyVP4Mqx9KfOEWScW3dfE/kxYZ6ohGETrvmCLWGd5oZxPKFDNH4i3icGITNWc0ieX62aalqmg==
X-Received: by 2002:a17:907:161f:b0:6f0:653:d95e with SMTP id
 hb31-20020a170907161f00b006f00653d95emr18139022ejc.237.1650913380205; 
 Mon, 25 Apr 2022 12:03:00 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 a1-20020a1709063e8100b006ce06ed8aa7sm3935386ejj.142.2022.04.25.12.02.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 12:02:59 -0700 (PDT)
Message-ID: <6d0814d7-69a9-e16a-8087-faa0d85b6a51@mind.be>
Date: Mon, 25 Apr 2022 21:02:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Lang Daniel <d.lang@abatec.at>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <VI1P190MB049366A16260EA4FCC31A8859FF79@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <VI1P190MB049366A16260EA4FCC31A8859FF79@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Subject: Re: [Buildroot] [PATCH 1/1] package/sam-ba: update link
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/04/2022 09:06, Lang Daniel via buildroot wrote:
> The link to at91.com is outdated and redirects to linux4sam.org
> 
> Signed-off-by: Daniel Lang <d.lang@abatec.at>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/sam-ba/Config.in.host | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/sam-ba/Config.in.host b/package/sam-ba/Config.in.host
> index b96e377e79..1967f33ab3 100644
> --- a/package/sam-ba/Config.in.host
> +++ b/package/sam-ba/Config.in.host
> @@ -7,5 +7,5 @@ config BR2_PACKAGE_HOST_SAM_BA
>   	  programming the Atmel SAM3, SAM7 and SAM9 ARM-based
>   	  microcontrollers.
>   
> -	  http://www.at91.com/linux4sam/bin/view/Linux4SAM/SoftwareTools
> +	  https://www.linux4sam.org/bin/view/Linux4SAM/SoftwareTools
>   	  https://www.microchip.com/en-us/development-tool/SAM-BA-IN-SYSTEM-PROGRAMMER
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
