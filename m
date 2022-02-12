Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42DC8C433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 13:05:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2ABD81B9D;
	Sat, 12 Feb 2022 13:05:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SmXnb5Tx4qmm; Sat, 12 Feb 2022 13:05:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21009817AF;
	Sat, 12 Feb 2022 13:05:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5B8471BF283
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 13:05:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 45551817AF
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 13:05:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nU6wzG85jnkX for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 13:05:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 47DA581759
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 13:05:16 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id w2so1638333edc.8
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 05:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=VtzXie2iBRQWFvzPAj6LbvNsUtoVYNVVbF3d6gjIB1U=;
 b=HKywMeZWzNpn0gvE/lHOU0+x7Fl5QA9pZZDpTvuaZ0aDvtZjTbZML+Djp2OViJOFiR
 +/EyveiEIbtKoRS9xVeDg71Nilovjrs+HdoP76PrSpb6eqV7AwmC67DT3Pm35QLrbMW6
 +Cx0gKmsHQyp1pK9v50eshosw11JSmP59yLhDyp0CDo8HYnmM6NpW/0cRGixPARLhA7C
 VJ/IngaF6XvFFjEx0/Bc/MYyFf1UllxkrAfmB7+NjwwyPRSt8cnMqR+lKFXCs1ctaz+c
 ZHUb2VDChZ2WUsWShqFtaR6kTU3k6i/Lb2TyLyhouQn7KJHBm51QkqVMFzm1Sgj1+d3/
 kPIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=VtzXie2iBRQWFvzPAj6LbvNsUtoVYNVVbF3d6gjIB1U=;
 b=0Ebjqq+x7u0MbWLMCNacIFOhINvUOk02X1j1xL7+9hRi+Ux9r4HxqbhwgqmNv92IGe
 x0OtwM16Gt3RGJTKxhffQYGrA45nHaNWLECWBxojT3NjGKBSkUBvy0AEQ1sQYQ2EnK+c
 DOj/M/s23F2O8jMXefTSTPY3oKYnDGqEWQj5QL1oelgw/QvWXI1UeFHWWVF0m3rBScDh
 2zq390uRTWkMjkW8xoEaDIRpjeXzp48TTzGGYal5VFEzHNaJEMIYKJ9TVPYl+OLK2+0X
 pg6NTrkAGcDrjhJ4l2DaD5TaZdazQTX0mbUL+Yd0IzOSKS6M2hweaCrxH4qaIwymo+4z
 ZJNw==
X-Gm-Message-State: AOAM5324uaIu/q2bPoTSiQYusGMVGvoN8eHvRiszpzECBaenA6/E0Rg2
 YYAe04sYxI1qsB2zW6Bvuf73Tw==
X-Google-Smtp-Source: ABdhPJxWz5AWvfgtZYim6iNo7PW2edwcmDdwCQtxdpP35RM5Eu+kqitKLu0R3tTdNHkdRtI73nM9EA==
X-Received: by 2002:a05:6402:510b:: with SMTP id
 m11mr6575122edd.290.1644671115317; 
 Sat, 12 Feb 2022 05:05:15 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id d6sm3469355ejo.224.2022.02.12.05.05.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Feb 2022 05:05:14 -0800 (PST)
Message-ID: <6cb7068a-66a0-9d93-2494-5e0d9fb4f364@mind.be>
Date: Sat, 12 Feb 2022 14:05:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220131020258.4114933-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220131020258.4114933-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libbpf: bump to version 0.6.1
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 31/01/2022 03:02, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libbpf/libbpf.hash | 2 +-
>   package/libbpf/libbpf.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libbpf/libbpf.hash b/package/libbpf/libbpf.hash
> index afc7aec1bf..27e22be9e9 100644
> --- a/package/libbpf/libbpf.hash
> +++ b/package/libbpf/libbpf.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  21cbee4df093e7fd29e76ed429650d3f3abe3a893f35e346ab9bc3484f6e68c0  libbpf-0.4.0.tar.gz
> +sha256  ce3a8eb32d85ac48490256597736d8b27e0a5e947a0731613b7aba6b4ae43ac0  libbpf-0.6.1.tar.gz
>   sha256  847f4addbd56e2d5be20c4ea0845e972672fc07b755fadaae5f7abd35d71e349  LICENSE
>   sha256  6313108c23efffa36948f8b2cff1560a5935373b527b0e1a837cc77e6ed1bacd  LICENSE.BSD-2-Clause
>   sha256  0b9a4febcdee6de55872501d5c1a8f5d8b0d1650cd4d5351995ceb22e889f8ca  LICENSE.LGPL-2.1
> diff --git a/package/libbpf/libbpf.mk b/package/libbpf/libbpf.mk
> index 3f09cc38dc..6750b063c0 100644
> --- a/package/libbpf/libbpf.mk
> +++ b/package/libbpf/libbpf.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBBPF_VERSION = 0.4.0
> +LIBBPF_VERSION = 0.6.1
>   LIBBPF_SITE = $(call github,libbpf,libbpf,v$(LIBBPF_VERSION))
>   LIBBPF_LICENSE = GPL-2.0, LGPL-2.1, BSD-2-Clause
>   LIBBPF_LICENSE_FILES = LICENSE LICENSE.BSD-2-Clause LICENSE.LGPL-2.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
