Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 055E6C433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 07:15:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE1C960EB8;
	Wed, 27 Apr 2022 07:15:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nDBPxNES87lX; Wed, 27 Apr 2022 07:15:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD05F60E0B;
	Wed, 27 Apr 2022 07:15:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6FB551BF48C
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 07:15:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5DB8160E0B
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 07:15:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5NqGLJrM9PCf for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 07:15:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 295E9605AC
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 07:15:43 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id g6so1609248ejw.1
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 00:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=sNLXSVLRHqbhhQQya90vqy5by9HLBTNJ8KPARnIX7QQ=;
 b=IEMydYgUR2HXraq529bydUhroJruKoVe//P/oufYdVC6oRBwDj3dU+qSIRDvn7lFbn
 kxf/i8hl37iAJGLDPtlkk732aVHEFmDQrBelznmQmtoJzJW/Fp7qQpLNJi9+YcrBtKrB
 m9cqJw3dPlOFkB5jHsoI7Tov75K1n6pa+jCi90+SP9Lg88r+G/TrxG6J5fNWInW7QO0m
 AvmBN1pqZYGEYY6GaQqesM2GA58TA3FLhiYnWDaFP5nFF/0/ZW8Wv9UJUpzOTKnFbrjG
 BP9IkqKN/06B5SYtAPjhIDhN24wHgDO+HdAKdg023w6s8wm+Pf9+zvuQoY7dHIPobyI7
 EcSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=sNLXSVLRHqbhhQQya90vqy5by9HLBTNJ8KPARnIX7QQ=;
 b=zr/ZLiAkznFxq8x9T8ffzp+befEMeE4veZJTbxgwLfBs3/cy7GiNtnFKDXdlDieIbj
 fasx1yNBisgvmqmoKyoSyA3hXxEkJj2UJFBYjgPJMwQRvevFMr7nTI46kPJ3O0669DAL
 b67Uusu35u8GJy59puuVaTaCkUc9GRxMRpXrsm5bvbOG9tZVNYFBOkLhzpAwvCdDbdwB
 6AYxvDzd8jTNiUJlxhzudiU6sqbvp84ZjavLEAwLZmXLNZfUPWwfMXzn8+Al9qSHBs1C
 Sm3VZZrXjSV/2nQKrU12B7EPMExyC7Ew+Sm0BsiH4PmeTqIlJY3P7kJRe/NZ+iKHrG6P
 MbKg==
X-Gm-Message-State: AOAM531wos2GecRiJYjZJayR0Mc90iiyk+7XsreQvxX/ysLNnXjFvk8Q
 bF0IYqCmMx+T+x0zlUmNVSONn0zYnca1Ng==
X-Google-Smtp-Source: ABdhPJx0V55U7oi05CruKH6UZwGQi8VFVyJ8S0Z5rAOCSAc8E4sGh7myGnlHxfUnPoreOTBLf1VuMQ==
X-Received: by 2002:a17:907:2bde:b0:6f3:8e91:3a60 with SMTP id
 gv30-20020a1709072bde00b006f38e913a60mr14432152ejc.434.1651043742334; 
 Wed, 27 Apr 2022 00:15:42 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 z19-20020a1709067e5300b006f39880d8e5sm3543299ejr.78.2022.04.27.00.15.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 00:15:41 -0700 (PDT)
Message-ID: <d4340fa0-13b9-9a78-a785-0d257edf1a24@mind.be>
Date: Wed, 27 Apr 2022 09:15:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220426174137.3014322-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220426174137.3014322-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/wilc-driver: add missing
 BR2_LINUX_KERNEL dependency
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
Cc: Kris Bahnsen <kris@embeddedTS.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26/04/2022 19:41, James Hilliard wrote:
> Fixes:
>   - http://autobuild.buildroot.net/results/40b/40b8aa0c19917f64c3f272f5479068e7631ffcc3
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   package/wilc-driver/Config.in | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/wilc-driver/Config.in b/package/wilc-driver/Config.in
> index caf46ae281..6b93a23a47 100644
> --- a/package/wilc-driver/Config.in
> +++ b/package/wilc-driver/Config.in
> @@ -1,5 +1,6 @@
>   config BR2_PACKAGE_WILC_DRIVER
>   	bool "wilc kernel module"
> +	depends on BR2_LINUX_KERNEL
>   	help
>   	  External kernel module for WILC1000/3000 devices.
>   

  You should also add a comment.

  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
