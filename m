Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B13C433F5
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 14:46:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51E998401F;
	Sun, 10 Apr 2022 14:46:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e8gfuqcQKv63; Sun, 10 Apr 2022 14:46:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6231C84006;
	Sun, 10 Apr 2022 14:46:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A9F761BF3B5
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 14:46:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97D6284006
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 14:46:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id khTJeLyiuxxn for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 14:46:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 943A383FF8
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 14:46:22 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id u15so7412982ejf.11
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 07:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=P4efRilFBc8WQ2xLo+7xMXO7lOXHMJ9m8WVNACN62UE=;
 b=UnuFKWGXsmHVXR5X3oPW+NuXbRWXY+UoHt0yDaOmQj34yigWmq6EYcqmT4FUjPEsWb
 ZXDVE5ocxz1o53OJ7E7vZ2cfxmqDCeWqqlBjFasVXAnQjKsVYB5zlzqzIIlfQVh4D1OP
 CTGjjXfoXj+cJrQHUuyJAKDvyNT+XBRzlreBXX9lhgLKDkr9/9PBbf1xAiuH2tFI7nb5
 ZI8Oe8tSc9bZUZbZ1XKYJOudm45SY6nwYkPjRbPesGkRk0SFk5ErDY4Siwl1HjRSp+H3
 XeZA/7CWSPYMUcLTtoJojnyMdEYBcjdBaT3taze8dvdftHY/qj968EtGDuP23wfNq9O6
 NCTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=P4efRilFBc8WQ2xLo+7xMXO7lOXHMJ9m8WVNACN62UE=;
 b=uDY1Y9HsDN1Xruv0MH60BVVY1jykPpzyBPO6BHrKg/UYEw2jv8T7zt3NnB2fvZZLxj
 tPWtsat8w7I4W1QVvWU1ycqenEIuBYHk7Kpg/BxrN6uz2VnrPMISzmScG6J8iZvkFqvA
 FI2zZs+fkDuI0Fb6RxGo9Jw7GMYpNnSDm6EEWMBcMUdVYGKZFl/jMjz5VNX0k74wDdxP
 QvmeTLn19ifgzwCS9Fc7V1UdBZH/EZ+tH3KI5N+pS6SOpGwD7MmyagK0ZuH4kdDL31gy
 3zokJP7/AtRCfg9oG7jYN36YBCiX66inkKF4IWeIbztYLH19BD8OkdheJP8idXU+JBDX
 EY/Q==
X-Gm-Message-State: AOAM5307MyAjDjUXVc8PfD7tc6buFQLnMqiBP1uojG0vGOziELuKnniN
 wilTH4UCB1G1pVEzYkHgLM89bA==
X-Google-Smtp-Source: ABdhPJyXLfuAGtngDgX8LzaOlGj6Fa4gXaQXjGZd6xdzgkkEoXOcRWNyD3IyKAVEdrMcsm+ldyHwug==
X-Received: by 2002:a17:906:69d1:b0:6ce:7201:ec26 with SMTP id
 g17-20020a17090669d100b006ce7201ec26mr26137560ejs.105.1649601980689; 
 Sun, 10 Apr 2022 07:46:20 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 h8-20020a1709066d8800b006e09a49a713sm10993074ejt.159.2022.04.10.07.46.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Apr 2022 07:46:20 -0700 (PDT)
Message-ID: <eef654ad-8843-b6fe-53f5-a040848ba439@mind.be>
Date: Sun, 10 Apr 2022 16:46:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220404203135.340172-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220404203135.340172-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-ujson: needs C++
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
Cc: Mauro Condarelli <mc5686@mclink.it>, Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 04/04/2022 22:31, Fabrice Fontaine wrote:
> python-ujson needs C++ since bump to version 4.1.0 in commit
> a47f332a20bf3f79ef4903c8ddd2b7917217e354 and
> https://github.com/ultrajson/ultrajson/commit/eb7d894f225bb89d269188ba6ec559b914a71b8a:
> 
> powerpc-buildroot-linux-gnu-gcc.br_real: error: ./deps/double-conversion/double-conversion/bignum-dtoa.cc: C++ compiler not installed on this system
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/b11600bdba42be9b211163e92afa3173276c3f8f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-ujson/Config.in | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/package/python-ujson/Config.in b/package/python-ujson/Config.in
> index 81d1bc457c..7af03e6497 100644
> --- a/package/python-ujson/Config.in
> +++ b/package/python-ujson/Config.in
> @@ -1,7 +1,11 @@
>   config BR2_PACKAGE_PYTHON_UJSON
>   	bool "python-ujson"
> +	depends on BR2_INSTALL_LIBSTDCPP
>   	help
>   	  UltraJSON is an ultra fast JSON encoder and decoder written
>   	  in pure C with bindings for Python 3.
>   
>   	  https://pypi.python.org/pypi/ujson
> +
> +comment "python-ujson needs a toolchain w/ C++"
> +	depends on !BR2_INSTALL_LIBSTDCPP
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
