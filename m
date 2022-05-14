Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E22C433F5
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 09:47:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CCA783FAA;
	Sat, 14 May 2022 09:47:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SQIuzEPgN6ON; Sat, 14 May 2022 09:47:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FEFA83FA4;
	Sat, 14 May 2022 09:47:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5BCAF1BF85D
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 09:47:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4AD7560F06
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 09:47:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0ESWrMsTajTr for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 09:47:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3A7AE60B42
 for <buildroot@buildroot.org>; Sat, 14 May 2022 09:47:41 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id p4so12652231edx.0
 for <buildroot@buildroot.org>; Sat, 14 May 2022 02:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=hzHlopclZxUVWCC2bwasMXrQaSR8u6REirX66gBa7hw=;
 b=GRf/5dy3xaXmL2OFz1+3m/bi3AoRKokD6V6pKZ0oW5CTiF6abxApBwolAwq5HUi7LI
 8dtFkrjZZH/fMyhmVKY5sw0Rj9Y/06xaoWSirZ73GLP0KpjaXIBp/lQ2rYIvQnXzmHrn
 dpbLOqces8YHjhlNlzjSG5jiFScjSTr0zlfCcyKvG/bqFg3YJebEVtd4Dixs/39t/DJ4
 hEBbjhDZTqxJT5NMIlrUXc9bK9Oawm+FjHTDvfVbcsR0y+x4eqP3Bk8L+Bg0t39aGYsE
 AEOntBLR8PzFddISnwL+o8aH8JxhinJtqUxTY9ZQMEYoR1ZQXLOe+yUotn9jdtVwVDe2
 1xZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=hzHlopclZxUVWCC2bwasMXrQaSR8u6REirX66gBa7hw=;
 b=AJaGrjSWxIzb521juVybc3v4xv21njrshL4/3iEjZJpymaER/KvSAIfTVQJPkzWM1/
 V9KDiwdx6rBeRXLWCKiYvnn4GFLus80mR4eThaMfjTKRKVLS+WifTUS9e3r0TTI4xMhV
 HdL+Z3YQELkJBBnUY9FeHmAtXKcNFbbAcYx93sqBJwnfIkiy/2cZRg3WebEgYVrv7cky
 JC83YFvepkr8vOo/LRqpNX+UL2WxefvkA5CSa/w8EPlcx1L7udqkPHASfV3tcIw/FKlF
 fA+IjDy3F9x5Lykbp9BAOmDZpoa09Xc0YQNjNB2oieaOTT4woxvYvvWcpKmpowfJcW4v
 8I9g==
X-Gm-Message-State: AOAM5300f7Uvke45IfTMD40MfIWK4uYVzsGQg11wOE6w1dO7WQvRF9WB
 oz+7UvB/mqDGm59B+OzZ6P8ZlzZf+uccDQ==
X-Google-Smtp-Source: ABdhPJwI8BHw2+bmmK9tqWecWnEmuPHGiZqDjKzLB/hQZezMpFCRFhKC/8KyF5MQejL1dBROc7B9dQ==
X-Received: by 2002:aa7:d791:0:b0:42a:62a7:a1bd with SMTP id
 s17-20020aa7d791000000b0042a62a7a1bdmr2748146edq.247.1652521659424; 
 Sat, 14 May 2022 02:47:39 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 gx13-20020a1709068a4d00b006f3ef214db6sm1596392ejc.28.2022.05.14.02.47.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 May 2022 02:47:39 -0700 (PDT)
Message-ID: <ad095ddc-ed6c-5a57-eeda-77863fd44c66@mind.be>
Date: Sat, 14 May 2022 11:47:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
References: <20220511194616.2272499-1-geomatsi@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220511194616.2272499-1-geomatsi@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/wpa_supplicant: wired driver
 needs headers >= 4.6
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
Cc: Matt Weber <matthew.weber@collins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/05/2022 21:46, Sergey Matyukevich wrote:
> Wired driver enables macsec support which depends on if_macsec.h.
> That header has only been exported since kernel v4.6, see commit:
> https://github.com/torvalds/linux/commit/dece8d2b78d19df7fe5e4e965f1f0d1a3e188d1b
> 
> Fixes:
> - http://autobuild.buildroot.net/results/6bb619eb7fdecf7824fcc549c4ccb8e487665d10/
> 
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/wpa_supplicant/Config.in | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
> index 7e2432985c..92953f69f0 100644
> --- a/package/wpa_supplicant/Config.in
> +++ b/package/wpa_supplicant/Config.in
> @@ -42,6 +42,7 @@ config BR2_PACKAGE_WPA_SUPPLICANT_WEXT
>   config BR2_PACKAGE_WPA_SUPPLICANT_WIRED
>   	bool "Enable wired support"
>   	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6
>   	select BR2_PACKAGE_LIBNL
>   	select BR2_PACKAGE_WPA_SUPPLICANT_EAP
>   	help
> @@ -49,6 +50,9 @@ config BR2_PACKAGE_WPA_SUPPLICANT_WIRED
>   	  supplicant can be used with Ethernet.  This also enables
>   	  support for MACSEC.
>   
> +comment "wired macsec support needs a toolchain w/ headers >= 4.6"
> +	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6
> +
>   comment "wired support needs a toolchain w/ threads"
>   	depends on !BR2_TOOLCHAIN_HAS_THREADS
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
