Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A075DC433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 21:26:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4AE088476C;
	Thu, 10 Mar 2022 21:26:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dUDcajtfIPkU; Thu, 10 Mar 2022 21:26:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E84684390;
	Thu, 10 Mar 2022 21:26:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1F0D21C1135
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 21:26:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E0D684390
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 21:26:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WaFwoDO7zs8u for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 21:26:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 620A78436C
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 21:26:33 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id d10so14915307eje.10
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 13:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=KD1F6Dl8/ojKOHcno7RQKiw3bzOi2OZcVaHRIWHAOi0=;
 b=QvLOjgviTYDoidmZpFfFfQsFEMBfY3XWiiZRDaWI67t9fpJrCT/yAbU3AGKsOR4zbq
 wXjPX1NUhRQcSe2je5+hVQAb4uN3Nt5M6rT08iVJqqgymNmUJh8yVgyKboPNKtbid4Lo
 CMONE5vklyJnEvxw7drAi8yo4zkte0LHZMkRV58a/iBolWftFNS8xFyfKNUnws12gBNo
 mZvU1TzXStMzuMwzHHerLNfzQvFQ0/jG9+5MH+4OQznYwwhqKEu/VovUtTXEzy7qfxGQ
 aVAClv+5d7CXVDycu6LSo8AUF2s5iViYiU0QSNuLv475rfioi/EkGF7cZeilAf34zm6y
 3Egg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=KD1F6Dl8/ojKOHcno7RQKiw3bzOi2OZcVaHRIWHAOi0=;
 b=lPQZV9LQ82l08Se4xxIPbfSA4/bpf39eASoCnQ8pbbLfr54c/QsPFUgTJT4Q7Lr4w/
 c4iXcZBtQeTyER/hEldpS1BPTm9g/nX+dmbf/BeGWdUvq4gUW/NdGbEZCwkdG1f9nYGc
 a8XvN58DFFFQD+R6QqCiuEHqErFLwze8CDVVyIDrl5QCw2dc8iolOJTUlSIWwIVjrQUq
 DsQ6txlpRGEQKoPFvbbulOf7M4e25iHc+Faoxi4HW3dQrD8Tyo+KfJ5Nmu/P8UUDRPXc
 f9I347kVvAbeHPJHFjIh9BhgiBwuAfvaQGCARpjAj1Kg29Dps/Ti+QT//WQ3aZpcntct
 VV7w==
X-Gm-Message-State: AOAM532yXcFelcEYEPO6hSS+MeO3CuOCYfP97jIpLK4hX3vt3P17jwyS
 uq790BD3tmosDiqKt5JGtK9uxA==
X-Google-Smtp-Source: ABdhPJxnqbK454pUEd9xY9QF4JOdPydKTR+SHE39AU71Tro8Z8jexPc/mlQmoP+c8UJnRFH0K9Gb2A==
X-Received: by 2002:a17:906:b1d0:b0:6cd:fa02:b427 with SMTP id
 bv16-20020a170906b1d000b006cdfa02b427mr6052472ejb.99.1646947591621; 
 Thu, 10 Mar 2022 13:26:31 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 b24-20020a170906491800b006db31196e2bsm2207650ejq.218.2022.03.10.13.26.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 13:26:31 -0800 (PST)
Message-ID: <4b15d59e-f5e9-f0f0-8047-0d4cbfb6b9c1@mind.be>
Date: Thu, 10 Mar 2022 22:26:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220215222422.1865613-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220215222422.1865613-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libbpf: bump to version 0.7.0
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



On 15/02/2022 23:24, James Hilliard wrote:
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
> index 27e22be9e9..06adc09885 100644
> --- a/package/libbpf/libbpf.hash
> +++ b/package/libbpf/libbpf.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  ce3a8eb32d85ac48490256597736d8b27e0a5e947a0731613b7aba6b4ae43ac0  libbpf-0.6.1.tar.gz
> +sha256  5083588ce5a3a620e395ee1e596af77b4ec5771ffc71cff2af49dfee38c06361  libbpf-0.7.0.tar.gz
>   sha256  847f4addbd56e2d5be20c4ea0845e972672fc07b755fadaae5f7abd35d71e349  LICENSE
>   sha256  6313108c23efffa36948f8b2cff1560a5935373b527b0e1a837cc77e6ed1bacd  LICENSE.BSD-2-Clause
>   sha256  0b9a4febcdee6de55872501d5c1a8f5d8b0d1650cd4d5351995ceb22e889f8ca  LICENSE.LGPL-2.1
> diff --git a/package/libbpf/libbpf.mk b/package/libbpf/libbpf.mk
> index 6750b063c0..ff018f5c24 100644
> --- a/package/libbpf/libbpf.mk
> +++ b/package/libbpf/libbpf.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBBPF_VERSION = 0.6.1
> +LIBBPF_VERSION = 0.7.0
>   LIBBPF_SITE = $(call github,libbpf,libbpf,v$(LIBBPF_VERSION))
>   LIBBPF_LICENSE = GPL-2.0, LGPL-2.1, BSD-2-Clause
>   LIBBPF_LICENSE_FILES = LICENSE LICENSE.BSD-2-Clause LICENSE.LGPL-2.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
