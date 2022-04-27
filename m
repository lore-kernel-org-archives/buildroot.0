Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81522C433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 18:55:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 320D282741;
	Wed, 27 Apr 2022 18:55:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VVkA-GCc30Hd; Wed, 27 Apr 2022 18:55:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8675826EA;
	Wed, 27 Apr 2022 18:55:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 972131BF322
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 18:55:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 94132826C2
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 18:55:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jj2Jk1g8IW76 for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 18:55:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 01957826EA
 for <buildroot@busybox.net>; Wed, 27 Apr 2022 18:54:59 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id i19so5172015eja.11
 for <buildroot@busybox.net>; Wed, 27 Apr 2022 11:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=bBQx14Tp7BshxkSUok39NqaPwGufXc5gcdVAlZUcOio=;
 b=Pagjadc5aVMroMgb8p57IXno0BCfo5SYSCv/WZj/5eLG9sadAiBUSA8YDuWQou7WGJ
 Wz8omiWXVn6ArtNu1/f9Wzg9gYXWFi8argCKtemn2T4xeS4e9c8reTH+68liTQ2PFEID
 dLTTOIW2Ge6Dso6unls19iKl8mzkHOPp7PTN35NThU8lgoViMp1VluRa32d1hO3XMNVu
 LOkxBxg57pikEpkLH6SapT08z4Z1l7Zyy7n4lsp1Ebj4GAxJxswwEmUfvXzqRueaT/wN
 JxBrOz6MrKhcEXxkeNd7FuxIxi0tamAKCihjo4jSxXVRBtc+luXTuj4tjjPwzFLnUttG
 i+8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=bBQx14Tp7BshxkSUok39NqaPwGufXc5gcdVAlZUcOio=;
 b=H5Ase89VEwvuS+j6ICtEzuZWrOHp4FfDT3bVmW5AEHZHqsftN+gjNLyeBaknYBNinH
 1+xu9y7vl0U8UGjqS+Bi3Rqt7iln9DPDD7Oqf4AQvQy29bvbiYJJHnHKDFB7ELuQ7nR3
 +t9A6GzBXx4YF2ou5D4xlcf+vhZ9BoYauAacEamZgFe2eZsZudBLGGtIXnpC9yFIikY4
 ZMnCrJakr5wBD+IcvoIDjuqyfbblUGodHeifouaQaAe55OVCDB7ZXlylM5Gr4hZNqveO
 v5ptQcXbLKRvdv03qXvF65HGKMRZlTwQRgcNfhrDzrLKo17bbFr3QFSZq3xnC9gicLbA
 jTyw==
X-Gm-Message-State: AOAM532PlwfSli1GTZkwo6FluDiegPNXWDvqkNZOYcoAp06FuE4ruEh1
 ethEVMPcnVkojOlTVrqLYZrk5A==
X-Google-Smtp-Source: ABdhPJywlgQdneQD7K+PUl2dYTycRMIuqH44uhP4TZzGPuE2iKrIEGTzj/CqpTqVh+KmzKDIREvqwQ==
X-Received: by 2002:a17:907:97cf:b0:6f3:b1e0:888 with SMTP id
 js15-20020a17090797cf00b006f3b1e00888mr9520269ejc.119.1651085698035; 
 Wed, 27 Apr 2022 11:54:58 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a056402154e00b0042617ba63a8sm25894edx.50.2022.04.27.11.54.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 11:54:57 -0700 (PDT)
Message-ID: <60587a76-4edd-574f-29cc-262b328244d0@mind.be>
Date: Wed, 27 Apr 2022 20:54:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20220426113724.3544523-1-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220426113724.3544523-1-francois.perrad@gadz.org>
Subject: Re: [Buildroot] [PATCH] package/ethtool: bump to version 5.17
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



On 26/04/2022 13:37, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

  Applied to master, thanks, as well as the 7 other version bumps.

  Regards,
  Arnout

> ---
>   package/ethtool/ethtool.hash | 2 +-
>   package/ethtool/ethtool.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/ethtool/ethtool.hash b/package/ethtool/ethtool.hash
> index 59c657e86..f317a1fb1 100644
> --- a/package/ethtool/ethtool.hash
> +++ b/package/ethtool/ethtool.hash
> @@ -1,5 +1,5 @@
>   # From https://www.kernel.org/pub/software/network/ethtool/sha256sums.asc
> -sha256  686fd6110389d49c2a120f00c3cd5dfe43debada8e021e4270d74bbe452a116d  ethtool-5.15.tar.xz
> +sha256  64ab914b9c6b45047245d91f40b8760b2728992a9e5af22717c644238e889133  ethtool-5.17.tar.xz
>   # Locally calculated
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>   sha256  5d632934396f90c82dfebe3c9512648bbb6333b406113d0cd331b0e0aa2d34a1  LICENSE
> diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
> index c4bb9bdd9..10f0c802a 100644
> --- a/package/ethtool/ethtool.mk
> +++ b/package/ethtool/ethtool.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -ETHTOOL_VERSION = 5.15
> +ETHTOOL_VERSION = 5.17
>   ETHTOOL_SOURCE = ethtool-$(ETHTOOL_VERSION).tar.xz
>   ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
>   ETHTOOL_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
