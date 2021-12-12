Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7409C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 14:51:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 791B661CE6;
	Sun, 12 Dec 2021 14:51:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5zwtn-tCdL8d; Sun, 12 Dec 2021 14:51:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C27AA61CD9;
	Sun, 12 Dec 2021 14:51:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 82EFE1BF33B
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:51:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7224661CD9
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:51:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rHl0S0UlQbiz for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 14:51:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8A89560E7E
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 14:51:40 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id x15so45260204edv.1
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 06:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=wQi+K71w3p3/2HtTbxljs0FeaR9ktpGpuX5YQf7+wgs=;
 b=LN118VUmGNzUqI2u+cp6xdlA3FQmlF43jombAj9PGuXDfTLr3kSEPfxbKCTOt3LY6i
 IF5sT+RnH84ER2bZG7wxcBMGQ1NSbviblAW4H+XVfPum9OCmoOU2ZAp7IxM/zJBIhw4z
 pkyFMKStqfH04DM7dQg4S2YuVPPHPbJCNMH2Pt9+v+BCFMm+M1VndK9ZwTU3OYbycHP8
 63foTprryiOoaTYT6pyxduzg4p0e87fSsw7yKturxdyzxahjmDoYIg/SA2Drd9k/NwAr
 Y3/R8642oW/krcI6cjBL4DtS22McYqZ4t9Sx38oYyTW6HYmaw4oABGAKPVFZ70zWqXtq
 opLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=wQi+K71w3p3/2HtTbxljs0FeaR9ktpGpuX5YQf7+wgs=;
 b=YrLy/I6P0zJu2FfnmVwXDUxWdnNZAANO2P4LI/6Eiv2KA96rtuPeCj1/BPpEY9ty/J
 w1yiy0HrmOaQmWgN3Jma1uWBoPVix6HNFA3KInKxhhKEFVL/66Iq0mX+d5cE+qcsEkq5
 G1sHezXzgYVns2cbWZSvt3Od2U0iWhqr6W2nml9b/dzOU4fJA4OTrN++2h16rarBsNk9
 mW3cCHTen3R+Ts8N48OwMAqqvz9oiCYwh2VoMO6NSZ6Zfrt6JsDh/L1ef7BQUGFCr7vw
 hJ3E4yHQ9VHzTrKGnhOW7TIadOPzAyu2PBB/aoXBm9JPReQhrPwX6ZdXEY+UeWCSdyOM
 N0sg==
X-Gm-Message-State: AOAM533cicp6dQe2P4N9cELJq8etkz0c7oz8m2FzV4fRqlg7hF+yCg46
 n2vUKYeJfFjxQihGAPC60WBsTMkwU2ZY1A==
X-Google-Smtp-Source: ABdhPJzNXDd42fgfcL5yeGoHmDFAj0OQpWmLTbOVIeKQPrE41fTEtQdbUrxJGpZfXhRfdRnDzDKBRg==
X-Received: by 2002:a17:906:4789:: with SMTP id
 cw9mr37492002ejc.518.1639320698799; 
 Sun, 12 Dec 2021 06:51:38 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id d3sm4737357edx.79.2021.12.12.06.51.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 06:51:38 -0800 (PST)
Message-ID: <1d0fac6d-d13f-0602-45cb-c89c3764a873@mind.be>
Date: Sun, 12 Dec 2021 15:51:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211211181323.51024-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211211181323.51024-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libtasn1: bump to version 4.18.0
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



On 11/12/2021 19:13, Fabrice Fontaine wrote:
> https://lists.gnu.org/archive/html/info-gnu/2021-11/msg00002.html
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libtasn1/libtasn1.hash | 4 ++--
>   package/libtasn1/libtasn1.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libtasn1/libtasn1.hash b/package/libtasn1/libtasn1.hash
> index fc3610b965..fa39dd2c73 100644
> --- a/package/libtasn1/libtasn1.hash
> +++ b/package/libtasn1/libtasn1.hash
> @@ -1,6 +1,6 @@
>   # Locally calculated after checking pgp signature
> -# https://ftp.gnu.org/gnu/libtasn1/libtasn1-4.17.0.tar.gz.sig
> -sha256  ece7551cea7922b8e10d7ebc70bc2248d1fdd73351646a2d6a8d68a9421c45a5  libtasn1-4.17.0.tar.gz
> +# https://ftp.gnu.org/gnu/libtasn1/libtasn1-4.18.0.tar.gz.sig
> +sha256  4365c154953563d64c67a024b607d1ee75c6db76e0d0f65709ea80a334cd1898  libtasn1-4.18.0.tar.gz
>   # Locally calculated
>   sha256  7446831f659f7ebfd8d497acc7f05dfa8e31c6cb6ba1b45df33d4895ab80f5a6  COPYING
>   sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  doc/COPYING
> diff --git a/package/libtasn1/libtasn1.mk b/package/libtasn1/libtasn1.mk
> index d9d14fde83..5cc33d505e 100644
> --- a/package/libtasn1/libtasn1.mk
> +++ b/package/libtasn1/libtasn1.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBTASN1_VERSION = 4.17.0
> +LIBTASN1_VERSION = 4.18.0
>   LIBTASN1_SITE = $(BR2_GNU_MIRROR)/libtasn1
>   LIBTASN1_DEPENDENCIES = host-bison host-pkgconf
>   LIBTASN1_LICENSE = GPL-3.0+ (tests, tools), LGPL-2.1+ (library)
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
