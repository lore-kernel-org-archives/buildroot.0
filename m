Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD759C433EF
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 21:15:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B41760B79;
	Tue, 15 Mar 2022 21:15:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LOHYRKzNlpyZ; Tue, 15 Mar 2022 21:15:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BEB860AFB;
	Tue, 15 Mar 2022 21:15:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B4EAF1BF284
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:15:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A3FBB81462
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:15:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ERKuqOc61kwJ for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 21:15:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B3453813CE
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 21:15:33 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id bi12so308100ejb.3
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 14:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=sS80wJe6WB4ElPZg59D32erj3lP5PRXcT6Dy8hjH/ak=;
 b=Qbx68mcjbQWqsN2BTKn1fGgvVfkVQJeR42vaXXlLX9wG3K9mWg1tW7IOd4PLa4IIRP
 IUc2S+u3DddJH5C6G1aUim6bzgwQuLm64lxlkADQYtajOgEAMiElaWg1HRyj6mTpopVB
 fN1BAN6GPKsY+GgfeITkaaYWhGzaYoHZPO1NM9PdSmWfv//UjMuLQrMglEvLOmCCh9h7
 q9Crv+sBy6jhKP1qYorcFowIt3U1aYeWAZNupemVWeMqiaHXYfbHcfdM5uf4htv+J4Ai
 yTlT06hUqyVksWh/3PyseuAYMOrqu9bM9YORbZagcyY45DNsUkr0gS/a0Y8YiBRHxqDt
 PSHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=sS80wJe6WB4ElPZg59D32erj3lP5PRXcT6Dy8hjH/ak=;
 b=q36W9Fb8m/NUtRdY/lLG32wkPLlXQYF42v1jif8B2dF39yBdHgamkJk0UwTntK9tuf
 L5HaFCfn8O0VQMxmCNoikR+2ih9aTyaggDGv5wXGMIh3YMzVEN9LmysRC12OEJQSP2kR
 bwxFHqdeIVI02/JbklX0sDY/lwFzcZoPHiBU/0c0CICJZLeTZFmf4IKmfb6RexDC332L
 PmlmNcYZPAHXeUgLu4TIdt1I3OktO4lIo7MC8Qi6RqmWOWGYdbCWW09tGZ3gPoizE2Zh
 psJzIgFCjIBesHzwBB0sGSD7d9MtDLv7h0mPYAQ4VER2ZRRhQZqDIoG/rAm5AwFKEhMx
 6sMg==
X-Gm-Message-State: AOAM531wwgWaE1WWRC2Kr4/y/hIWj/z1YLFAp7KTHbWtndi07ecXo1pJ
 MgU0k/4yztBD9cfCH5zZiEHWsQ==
X-Google-Smtp-Source: ABdhPJywfnEl4Xlp/bH1G02A+Au9WE4BLfj+nCKaTbS0FdxEPh2P1rj0ehnKpkrT7O0AxI9jDhKeWQ==
X-Received: by 2002:a17:907:608b:b0:6da:8fa8:27e8 with SMTP id
 ht11-20020a170907608b00b006da8fa827e8mr24548233ejc.168.1647378931938; 
 Tue, 15 Mar 2022 14:15:31 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 ne42-20020a1709077baa00b006d76251f4e7sm60926ejc.109.2022.03.15.14.15.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 14:15:31 -0700 (PDT)
Message-ID: <79c9a68c-4b86-3201-8efb-a6e3eae29bf9@mind.be>
Date: Tue, 15 Mar 2022 22:15:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20220302173433.28939-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220302173433.28939-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH/next 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 21.3.7
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
Cc: Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/03/2022 18:34, Bernd Kuhls wrote:
> Release notes:
> https://lists.freedesktop.org/archives/mesa-announce/2022-February/000664.html
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/mesa3d-headers/mesa3d-headers.mk | 2 +-
>   package/mesa3d/mesa3d.hash               | 6 +++---
>   package/mesa3d/mesa3d.mk                 | 2 +-
>   3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
> index c8573fafad..736dedc25e 100644
> --- a/package/mesa3d-headers/mesa3d-headers.mk
> +++ b/package/mesa3d-headers/mesa3d-headers.mk
> @@ -12,7 +12,7 @@ endif
>   
>   # Not possible to directly refer to mesa3d variables, because of
>   # first/second expansion trickery...
> -MESA3D_HEADERS_VERSION = 21.3.6
> +MESA3D_HEADERS_VERSION = 21.3.7
>   MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
>   MESA3D_HEADERS_SITE = https://archive.mesa3d.org
>   MESA3D_HEADERS_DL_SUBDIR = mesa3d
> diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
> index d64b833100..b680411051 100644
> --- a/package/mesa3d/mesa3d.hash
> +++ b/package/mesa3d/mesa3d.hash
> @@ -1,6 +1,6 @@
> -# From https://lists.freedesktop.org/archives/mesa-announce/2022-February/000663.html
> -sha256  96bb761fd546e9aa41d025fcc025225c5668443839dae21e3731959beb096736  mesa-21.3.6.tar.xz
> -sha512  8c930e04eade29f689384ee7d6e2f178acbbf30fa6c9fdf132281279658c3c221ec7f9b1318e3c0a654c6136f925a5c0a35eaf849b65db7674641127c71e8a4f  mesa-21.3.6.tar.xz
> +# From https://lists.freedesktop.org/archives/mesa-announce/2022-February/000664.html
> +sha256  b4fa9db7aa61bf209ef0b40bef83080999d86ad98df8b8b4fada7c128a1efc3d  mesa-21.3.7.tar.xz
> +sha512  0991543e9435457fa4d077517408b3f197be32ed61a6c7ca34ddb3906eed208791f1a57227f74115f99df18e612efab1d2c6809b7cf426d273633b53d4aefc88  mesa-21.3.7.tar.xz
>   
>   # License
>   sha256  998437f3f75f0c542046f83c1cb349408122268168fb13eb4ae6967aa18b7d98  docs/license.rst
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index 95618b2072..d0b12932c4 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   # When updating the version, please also update mesa3d-headers
> -MESA3D_VERSION = 21.3.6
> +MESA3D_VERSION = 21.3.7
>   MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
>   MESA3D_SITE = https://archive.mesa3d.org
>   MESA3D_LICENSE = MIT, SGI, Khronos
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
