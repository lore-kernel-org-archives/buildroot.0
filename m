Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C3AEC433FE
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 19:39:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AEC180C40;
	Wed, 27 Apr 2022 19:39:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VJ1A15wDMVYo; Wed, 27 Apr 2022 19:39:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 402D480C20;
	Wed, 27 Apr 2022 19:39:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B22081BF2EA
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 19:39:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A0D3F80C1E
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 19:39:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TjrikjmsCQXF for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 19:39:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 967A280C18
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 19:39:25 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id r13so5425302ejd.5
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 12:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=b/Nqrd7v4jGPKaXY6n1ez2RgZOeo/aa8WARrKmy8esw=;
 b=dQBUfX3sVuo0wANkN8GZY29UTV6GsVAn0oPhouJFhFnG9gMhFLOhKf/waXQaCYkD4e
 zjigS57XbBmjHTmNapET+Vsj1FuzP1xl+DEUKFJOB8xwkg8VXtFtN0d4Nwle5Gby//WZ
 GVYvoPBcoJGPNL7YSxhz3tt0xSUf8vnb6EBUxoZsdvGmM32bqXt06AQUN9PaHdiaCW+2
 sILCUCJ2N+QObYu25y383aF6ZmU1IPj0QkcDdhebE2KdudDGyK8lMupil4qAIF2Np42a
 JMMepR/is7YHhGpC3eFgcEtSwguNo7KijI0iHLeX3lNjlUIiD9kcbTy0sq9lV5j3yspW
 DuwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=b/Nqrd7v4jGPKaXY6n1ez2RgZOeo/aa8WARrKmy8esw=;
 b=fngtx+Wb+mNIGm2iM5qJKUya3KF5d9WzvQYANuzfn8SQaiZxBn14rCtd3QeXVwMBCH
 SnLezbD3lw5qSTBwCXLNkAzjFhiuFUB9Bdv6dB/+R2StPh6eh/Lke6uMXAOI5cYo+DMK
 ruTbVumOBf72VpCOwJHJOmLAr9Ml2FTkoIhxFLgivwpfSaF5BJJ4hFv2DYQL8wWof3ef
 gP/EjheiO8lLAxcw2FlnDGzKuUccmG4D2ni3wHGHU46ZdCyXQc97L5fXwHz1aTdQjt8z
 0GzPCK46zZsLKlcnDthQQYkhbHM35H12Y8Xd8pYL0qRmoWQ6ut51QQmg0+6udCAdKfZe
 5WGw==
X-Gm-Message-State: AOAM532QIVzI6Un2XhN+YRrhbKvFYSnW+Sh5f5cjI60K+7jfarpi3CTG
 x/gMnXmp+q2hj2ey7zSBBT9tOA==
X-Google-Smtp-Source: ABdhPJxXX1wz97hAt9k89mUWWLKaZm1aY6nleoAdQSp1qHwQzwwpZxwcQDW0WkVGmehhxaPkU/D+SQ==
X-Received: by 2002:a17:907:96a8:b0:6f3:9e66:80c5 with SMTP id
 hd40-20020a17090796a800b006f39e6680c5mr14485789ejc.662.1651088363918; 
 Wed, 27 Apr 2022 12:39:23 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 p25-20020a1709060e9900b006f399528262sm4541084ejf.33.2022.04.27.12.39.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 12:39:23 -0700 (PDT)
Message-ID: <103854fe-1732-4883-5578-2f68c6ffe0b9@mind.be>
Date: Wed, 27 Apr 2022 21:39:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220427074321.37979-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220427074321.37979-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/nodejs: add missing
 host-pkgconf dependency
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
Cc: Daniel Price <daniel.price@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 27/04/2022 09:43, James Hilliard wrote:
> Fixes:
>   - http://autobuild.buildroot.net/results/d1f/d1f49b451b56e3cf6a97d27e8db5b85b0cb58ca9
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/nodejs/nodejs.mk | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
> index 2e41c11dbd..4fe34e0aad 100644
> --- a/package/nodejs/nodejs.mk
> +++ b/package/nodejs/nodejs.mk
> @@ -7,10 +7,11 @@
>   NODEJS_VERSION = 14.18.3
>   NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
>   NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
> -NODEJS_DEPENDENCIES = host-qemu host-python3 host-nodejs c-ares \
> +NODEJS_DEPENDENCIES = host-qemu host-pkgconf host-python3 host-nodejs c-ares \
>   	libuv zlib nghttp2 \
>   	$(call qstrip,$(BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL_DEPS))
> -HOST_NODEJS_DEPENDENCIES = host-icu host-libopenssl host-python3 host-zlib
> +HOST_NODEJS_DEPENDENCIES = host-icu host-libopenssl host-pkgconf host-python3 \
> +	host-zlib
>   NODEJS_INSTALL_STAGING = YES
>   NODEJS_LICENSE = MIT (core code); MIT, Apache and BSD family licenses (Bundled components)
>   NODEJS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
