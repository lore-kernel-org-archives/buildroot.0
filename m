Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F116C433EF
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 20:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A86EB40490;
	Fri, 13 May 2022 20:35:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ll2gziPt2SvH; Fri, 13 May 2022 20:35:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BBD2940256;
	Fri, 13 May 2022 20:35:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7DE941BF3CD
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 20:35:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 65F1440256
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 20:35:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fgvotAzFDprn for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 20:35:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2E226400EA
 for <buildroot@buildroot.org>; Fri, 13 May 2022 20:35:07 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id gh6so18438088ejb.0
 for <buildroot@buildroot.org>; Fri, 13 May 2022 13:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=722Uasti9rjOModguJncFeWitPsN/AlSRqf5oMvne2g=;
 b=PpMUJevgGdRNpqVDPjrtNEuj4jSdvjaZIBjtU/Z8/A4Y7Ih27hNZbNGyq9rJlvux/7
 udmpQvLn0SuWLImqJQb7WSoydo4IEgB4rPw809xzhuObii/aIqqrKJrY6VBKWq7zzHZY
 tYMLLFM9+JD/j/JqvDzNk1nTLLxgbquWor5HvYYKJtqomujR26R2fa7wn6CHMW5ycPPi
 XSC8SjjStz0q92Ry3iOuVm4e6Q6DgHvIIy6/XbbXkRNK0fFc/5kWP2wxtBKnCPdyC5it
 LFLY/+ONTOExTY8loq9DgLvLwVedfPcM2HF6dp51lQYE3aHw0vnyb1BeePw/f5EQo2pn
 62lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=722Uasti9rjOModguJncFeWitPsN/AlSRqf5oMvne2g=;
 b=tEZDNVQ3UykIx1qW/xQPT3XD7/fNLsgiNA2AMl5vrL7ntt/2ItvhuQaEIMK5XxfhAd
 stA+GFIoK70vyvvgCjMstb+hv41vzaOjG3bVJXwkkxxmXOjQELvq0Iru2ysglyjubwtt
 BLPfA9YtAdQKkyFBVbadSyoVlP5Ywz2VLUDqHheZT+Ig1UqlQyMlZTXA2zEYc6+D8Wkc
 7IU1V6IZJnNe6T8/s/uGWU/eDkhQWR7Ww+EuhZ+0GBebZdr7lfOFsBlBOqOy5uKHW3Y4
 3gmBC7zXiaRiWap+9pn30oqz1GRDAtPUPNsfuX5TyDam0dviq4oe2VnAi+E//AiEjQc1
 AcQw==
X-Gm-Message-State: AOAM5325+eCN5lLtitI0EjQugij9p46EWXCFJ5BWbNBU6OC91wHIUFGF
 brb1DEuNX/sRAaAgN25B1t8AOEA8HU4nzg==
X-Google-Smtp-Source: ABdhPJzCsTN73WVfZzPLFvBSlgbS42wiG8RRhVtZY1M4PwvfapbiVtd+oZHyB+30KbjTsKl8cRXK8Q==
X-Received: by 2002:a17:907:3f86:b0:6db:b745:f761 with SMTP id
 hr6-20020a1709073f8600b006dbb745f761mr5612297ejc.610.1652474105382; 
 Fri, 13 May 2022 13:35:05 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 m7-20020a17090672c700b006f3ef214e39sm1093969ejl.159.2022.05.13.13.35.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 13:35:04 -0700 (PDT)
Message-ID: <7c474ae0-2a57-0c3f-56e4-9c7017bc84ea@mind.be>
Date: Fri, 13 May 2022 22:35:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Peter Korsgaard <peter@korsgaard.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220513144215.2598981-1-peter@korsgaard.com>
 <20220513144215.2598981-4-peter@korsgaard.com>
 <20220513163446.GQ1597494@scaer> <87lev58j8l.fsf@dell.be.48ers.dk>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <87lev58j8l.fsf@dell.be.48ers.dk>
Subject: Re: [Buildroot] [PATCH 4/4] {linux,
 linux-headers}: default to 5.17.x
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/05/2022 18:55, Peter Korsgaard wrote:
>>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>   > Peter, All,
>   > On 2022-05-13 16:42 +0200, Peter Korsgaard spake thusly:
>   >> 5.15.x is getting quite old, so default to 5.17.x instead.
> 
>   > But 5.15 is a longterm kernel, while 5.17 will probably not be.
> 
> True, but we normally default to the latest kernel, I just kept it for
> 5.15 for the LTS release.

  FWIW, +1 to that philosophy.

  Regards,
  Arnout

> 
>   > Also, see below...
> 
>   >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
>   >> ---
>   > [--SNIP--]
>   >> diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
>   >> index 5ff616fb34..859f772624 100644
>   >> --- a/package/linux-headers/Config.in.host
>   >> +++ b/package/linux-headers/Config.in.host
>   > [--SNIP--]
>   >> @@ -56,10 +56,6 @@ config BR2_KERNEL_HEADERS_5_15
>   >> bool "Linux 5.15.x kernel headers"
>   >> select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
>   >>
>   >> -config BR2_KERNEL_HEADERS_5_16
>   >> -	bool "Linux 5.16.x kernel headers"
>   >> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_16
> 
>   > Did you forget to squash this hunk...
> 
> Ups, indeed. Will fix.
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
