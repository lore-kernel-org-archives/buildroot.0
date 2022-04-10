Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C45CC433F5
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 15:08:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C91D40940;
	Sun, 10 Apr 2022 15:08:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tZJmOHikMzTK; Sun, 10 Apr 2022 15:08:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DA24408DF;
	Sun, 10 Apr 2022 15:08:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DA0151BF869
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 15:08:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D66FB4017A
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 15:08:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Keg_VrKZqKSo for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 15:08:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E1E2F40119
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 15:08:21 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id bh17so26097699ejb.8
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 08:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=QGdPCt44niwo/vqkVLAS07adcCdVaLekwxP/KLiD5xs=;
 b=A8Q7ZYSoKkwKmHPXAyYgBKxu9Qorp7C1aIPSxJveZ7L3KAJxxd716GTrRK3N1Vr4vt
 MT6ZtNMjYzdCujdq4eY22Bs0EmGEUDQbiAAz1Po8/pNQL9VG85Xr+4fP4ZvEykK21Wdh
 yQLCRRhfHamJRNlP6qvrCYciNT2jEnUQiWepnAretE+4nNnApzbRCPDaWlGCiRl9JOVQ
 UsT/oyaTtMRh8l8/gJRgjZ458hnBiAO5MqN+aL/CzW5m0N/bUEA5j+3GGWVUkkq05WEO
 rpUJF5E8neGOWM0dG3fJa7oCRMm3jI+WXPJoeysceVOUzZUKdvXi+XyNTOZJYVJCNRvK
 WXIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=QGdPCt44niwo/vqkVLAS07adcCdVaLekwxP/KLiD5xs=;
 b=NEku3BUecM2of8x53k1Ucgk5vDo28dMQ4oHOC0OfKZSu5ZcY9oV8egzHMMEf5+en5u
 UeYb3cEHM4uTh656+ZvKtJicHwDWb3sTml1cSkGVl9E46cdWGlyvKoIea76l/9bHexLj
 XZ9e5F94EPhw3t9S1JaJDYVFW5HZCNI9GQbE4/JUfsVisI6E/jy+RcBZeRX2cXiX6eJC
 wPjUe4sZ/bO4rSt8kERD+fAMvyGOufqTekoWnHNtxGfmf2gv+GAZ+JjsWW0aGy+QTeRx
 rbKI13QuIJiqU3u8HTZ/kWryO/KzvjUS1FmUB/ILboo4ebzLcL2cL0z0B/0mbA9obceP
 O81g==
X-Gm-Message-State: AOAM533Cwz/0U0toFz/qG3gAUh+bVXC8DoLpEzmzE2riizzWupAfCSVQ
 B1OAF/FI9uEi01xwYhhWbM5WiQ==
X-Google-Smtp-Source: ABdhPJynhGbee+FYUcODJ+mj6CGt3w+MkdSVrxMKLE0YE0FydLg91Tx+xZGG4e4AbhiBJZICdDc37Q==
X-Received: by 2002:a17:907:e8a:b0:6e7:f3cb:61eb with SMTP id
 ho10-20020a1709070e8a00b006e7f3cb61ebmr26623796ejc.247.1649603299933; 
 Sun, 10 Apr 2022 08:08:19 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a50daca000000b0041cc361b1c9sm10659583edj.68.2022.04.10.08.08.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Apr 2022 08:08:19 -0700 (PDT)
Message-ID: <63ca4150-fb74-c0c8-32bb-1287e3d4a4f7@mind.be>
Date: Sun, 10 Apr 2022 17:08:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20220405203030.3418304-1-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220405203030.3418304-1-giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH] package/harfbuzz: bump to version 4.2.0
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



On 05/04/2022 22:30, Giulio Benetti wrote:
> Since the major release changed I've built successfully all packages that
> have direct dependency to harfbuzz:
> - efl
> - libass
> - mupdf
> - pango
> - qt5base
> - sdl2_ttf
> - supertuxkart
> - vlc
> - webkitgtk
> - wpewebkit
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/harfbuzz/harfbuzz.hash | 2 +-
>   package/harfbuzz/harfbuzz.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
> index e4674afa87..1576824a5a 100644
> --- a/package/harfbuzz/harfbuzz.hash
> +++ b/package/harfbuzz/harfbuzz.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  7158a87c4db82521fc506711f0c8864115f0292d95f7136c8812c11811cdf952  harfbuzz-3.4.0.tar.xz
> +sha256  f2200f177768bdc21445aa09703326f3bbe8114ac083d081fe1a79d305c7ae73  harfbuzz-4.2.0.tar.xz
>   sha256  4345e1735f8bc6d812fed5180cabb5a5e88a4109d332652f2a45c13cfa5ee692  COPYING
> diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
> index 331b35c530..551277a788 100644
> --- a/package/harfbuzz/harfbuzz.mk
> +++ b/package/harfbuzz/harfbuzz.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -HARFBUZZ_VERSION = 3.4.0
> +HARFBUZZ_VERSION = 4.2.0
>   HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
>   HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
>   HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
