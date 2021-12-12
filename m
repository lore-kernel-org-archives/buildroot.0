Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD161C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 12:21:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 932208176C;
	Sun, 12 Dec 2021 12:21:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TlpKm_jEHIEN; Sun, 12 Dec 2021 12:21:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC0B68174C;
	Sun, 12 Dec 2021 12:21:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B0D501BF373
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:21:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ADF5F814B4
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:21:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6hfaEcTiU-t5 for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 12:21:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D543481064
 for <buildroot@busybox.net>; Sun, 12 Dec 2021 12:21:10 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id y12so42935425eda.12
 for <buildroot@busybox.net>; Sun, 12 Dec 2021 04:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=Z9Hc5ziLPWIqJfeYhdPOgEcYVbKscFPE2vztDvSEHAI=;
 b=XcJN9a45MY99ed2qiO0o+Fk5KwCJAfpH+4YgV7HsKWafLawS46RWkl/vmo3V819k2I
 5Cp+4hP8r6TwQzYz5eZxUzqGNF3xQkgDh61/2Q/R+LzixSkgVf8L13NgodwtrXChRKRN
 Q0jqrOCEw8ZfByfUP0HQ1PEPpziH3yq0v1ELajM95OdLuyGdYFs0nZiEk+rHX7INENu9
 B43uLPEH4H5E3gObXSoyxEdE5d/Ohrzo9HzsiHz1eORU9QPajux6ZpN2/mJ1ssH5Dxvz
 HbZrBbIo/4D06tYn8R8AX8NaWQfzwy+UoukOoKsg8qaNKOL2+RAP6G3ra+Pf73Z24iyv
 rysA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Z9Hc5ziLPWIqJfeYhdPOgEcYVbKscFPE2vztDvSEHAI=;
 b=uxwKVljBOQ2ul2rWNul99Ejvl4AqeMGKhONL/iJtxqkTbhwpFwe8wgCAFRelwL9i53
 MxARiyObCH2D9NhHmCz/IZMK/zbg6lJoBWOixbjqu8a8SMkcHfdWHHOHC6do+9bTPqxd
 34JxVtu23N8QWhcjJPZ1RgEipPGDq0IC1jssxMm6+9H/6rDTDVprUcvl5U4NIPB8sbdv
 W8Ef7dHj/po/EVq1y5Z3wrH5GPqRcGShibeOLLh86kPDa+LiU7FkFcYHlgYQyHDRvq89
 37IIaqVnkjvtN7h3ffD88zmrqZflOwlceFnQwlPh3tE9VTd5uy4b3OixX9vF9IZ72mDJ
 LyoA==
X-Gm-Message-State: AOAM530XS5HGtdZPyxPDQrN4g/R44t1mMK+ogndaETbhS685Qcrh1HZT
 GMydAgUnSr2KGBBmpSo8R8p6kg==
X-Google-Smtp-Source: ABdhPJwCUC7d4oa1HyI6TL39usRHSgOz0ly+KcrEWKrm/z8970UNT5TNyM9V/E8OwryYZjtt7xO1Xg==
X-Received: by 2002:a17:907:250f:: with SMTP id
 y15mr36435318ejl.0.1639311669046; 
 Sun, 12 Dec 2021 04:21:09 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id h7sm4967145ede.40.2021.12.12.04.21.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 04:21:08 -0800 (PST)
Message-ID: <0cfdd90c-b399-227d-5d8e-a7e0516611ed@mind.be>
Date: Sun, 12 Dec 2021 13:21:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Michael Fischer <mf@go-sys.de>, buildroot@busybox.net
References: <20211208143426.2995-1-mf@go-sys.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211208143426.2995-1-mf@go-sys.de>
Subject: Re: [Buildroot] [PATCH 1/1] package/sdl2: bump version to 2.0.18
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



On 08/12/2021 15:34, Michael Fischer wrote:
> Signed-off-by: Michael Fischer <mf@go-sys.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/sdl2/sdl2.hash | 4 ++--
>   package/sdl2/sdl2.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/sdl2/sdl2.hash b/package/sdl2/sdl2.hash
> index 6dee461258..9fa95270c3 100644
> --- a/package/sdl2/sdl2.hash
> +++ b/package/sdl2/sdl2.hash
> @@ -1,4 +1,4 @@
> -# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.0.16.tar.gz.sig
> -sha256  65be9ff6004034b5b2ce9927b5a4db1814930f169c4b2dae0a1e4697075f287b  SDL2-2.0.16.tar.gz
> +# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.0.18.tar.gz.sig
> +sha256  94d40cd73dbfa10bb6eadfbc28f355992bb2d6ef6761ad9d4074eff95ee5711c  SDL2-2.0.18.tar.gz
>   # Locally calculated
>   sha256  52d41d0c82507721ca1fd92c20dc2bf9ca531b3a288ef845a8275c550f118804  LICENSE.txt
> diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
> index 1708180626..54eec85f5e 100644
> --- a/package/sdl2/sdl2.mk
> +++ b/package/sdl2/sdl2.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -SDL2_VERSION = 2.0.16
> +SDL2_VERSION = 2.0.18
>   SDL2_SOURCE = SDL2-$(SDL2_VERSION).tar.gz
>   SDL2_SITE = http://www.libsdl.org/release
>   SDL2_LICENSE = Zlib
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
