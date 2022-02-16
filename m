Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB86BC433F5
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 21:47:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F6F440270;
	Wed, 16 Feb 2022 21:47:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bHH55TX3AjEw; Wed, 16 Feb 2022 21:47:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25FAB40164;
	Wed, 16 Feb 2022 21:47:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0CFDE1BF5A9
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 21:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06BA740157
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 21:47:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 52HBRSvozvTC for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 21:47:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9345040164
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 21:47:12 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id f17so6282117edd.2
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 13:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=BiS5i7qj9OHdk4aBqXZmqnFxTS9xGZR9p8+AY5EGrwo=;
 b=Kj4LmvanvKqchNeaYm9i2YXg5xa5hyHMWBBy6vi/OP/wbU35LAnV6+RS15vATJlpNT
 9ldH9q9bDgUdrYV0ZAtd5VUieg5fIXIwg4ei3CZDfFMH53KtnjOb30oLBVfd6bgRB/aG
 aomkPkSu8ku/+Rp+gKMKOQ/RheA17QdvuEiBJJLziNQ6et9qpQYPaijQQ0y4t8lrhXhW
 YAkwvxRew3fexnz6iOElXJ9uVXbOarcDEqep7gHaykXaPAalyM8gLXI3ACfNxF0ERqof
 cwepfORWLok1NmCLfFPiiSOyFUbzx9Tzwwavy+Hs6WrTrQduW3F2mcNq30uv8aAOZRNZ
 ofyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=BiS5i7qj9OHdk4aBqXZmqnFxTS9xGZR9p8+AY5EGrwo=;
 b=Pr9DenSqjDiJtU77a+cBXIfFzqfbkM0k0AB97JwroLj3bsKc8/e68cpQ43CK7MgHyS
 co5y1HzTFucByLIZ8PUig9MnD8Hd/L3BFvJYZZu23Q02wliXYzhc/dRSN4qhHFXovGmz
 q+KkQaCDmVfJNftFk/qAj/s+HTXxFDfVJCSK4gGh2TNIwWUQcjUZ6Me8vpBhWL4iV/PP
 1TM3E7BxDy5+/qIGa6qIdc3+rcZ7sgM/JXmxKu/yME3LI1yvc9FTYVTArx6ypbjkwZMu
 +7/V+cp9DknZN1Bl4vdZP7K12wqTI8GQiberVJowgZNYU6j+lbK5Cg/tJo9kZLYC8VzJ
 /pFg==
X-Gm-Message-State: AOAM533kO4PNngA0VO8mrbzdcTHcxVFiMtu7VCKAbvKZuoDDsLURPDBu
 YGVCOgWsjB/A82ucU3brq2RL3oxkS5fINw==
X-Google-Smtp-Source: ABdhPJxPFKrTbdzD9eYauE4dt679Z1jR+NOTQ39+DDPl8Qp7KMSEKuGDP4IShfXQEC8JKu7vIz86DA==
X-Received: by 2002:a05:6402:1e88:b0:410:ebb4:c329 with SMTP id
 f8-20020a0564021e8800b00410ebb4c329mr5169552edf.300.1645048030686; 
 Wed, 16 Feb 2022 13:47:10 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id f14sm2395171edf.67.2022.02.16.13.47.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 13:47:10 -0800 (PST)
Message-ID: <97333186-45ec-e81f-8562-266da9fe3230@mind.be>
Date: Wed, 16 Feb 2022 22:47:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220213113332.1056370-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220213113332.1056370-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/strongswan: security bump to
 version 5.9.5
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
Cc: =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jezz@sysmic.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/02/2022 12:33, Fabrice Fontaine wrote:
> Fixed a vulnerability in the EAP client implementation that was caused
> by incorrectly handling early EAP-Success messages. It may allow to
> bypass the client and in some scenarios even the server authentication,
> or could lead to a denial-of-service attack. This vulnerability has been
> registered as CVE-2021-45079:
> https://www.strongswan.org/blog/2022/01/24/strongswan-vulnerability-(cve-2021-45079).html
> 
> https://github.com/strongswan/strongswan/releases/tag/5.9.5
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/strongswan/strongswan.hash | 6 +++---
>   package/strongswan/strongswan.mk   | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/strongswan/strongswan.hash b/package/strongswan/strongswan.hash
> index 69b3547f91..aca7ddf5cd 100644
> --- a/package/strongswan/strongswan.hash
> +++ b/package/strongswan/strongswan.hash
> @@ -1,7 +1,7 @@
> -# From http://download.strongswan.org/strongswan-5.9.4.tar.bz2.md5
> -md5  9c387eb77f0159fdefbcf7e81c905c35  strongswan-5.9.4.tar.bz2
> +# From http://download.strongswan.org/strongswan-5.9.5.tar.bz2.md5
> +md5  53005324e3cba8592f1fb958b1c2d0e5  strongswan-5.9.5.tar.bz2
>   # Calculated based on the hash above
> -sha256  45fdf1a4c2af086d8ff5b76fd7b21d3b6f0890f365f83bf4c9a75dda26887518  strongswan-5.9.4.tar.bz2
> +sha256  983e4ef4a4c6c9d69f5fe6707c7fe0b2b9a9291943bbf4e008faab6bf91c0bdd  strongswan-5.9.5.tar.bz2
>   # Locally calculated
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>   sha256  2292e21797754548dccdef9eef6aee7584e552fbd890fa914e1de8d3577d23f0  LICENSE
> diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
> index 2891e5aa5e..95079aceb3 100644
> --- a/package/strongswan/strongswan.mk
> +++ b/package/strongswan/strongswan.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -STRONGSWAN_VERSION = 5.9.4
> +STRONGSWAN_VERSION = 5.9.5
>   STRONGSWAN_SOURCE = strongswan-$(STRONGSWAN_VERSION).tar.bz2
>   STRONGSWAN_SITE = http://download.strongswan.org
>   STRONGSWAN_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
