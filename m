Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD0CEC433F5
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 21:58:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E0EA41609;
	Mon,  2 May 2022 21:58:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jMjHVKyhGPMH; Mon,  2 May 2022 21:58:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44193415ED;
	Mon,  2 May 2022 21:58:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 34ACF1BF2BC
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:58:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9047281398
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:58:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e4UjmxS7W0af for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 21:58:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5108681B14
 for <buildroot@busybox.net>; Mon,  2 May 2022 21:58:09 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id i27so30156719ejd.9
 for <buildroot@busybox.net>; Mon, 02 May 2022 14:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=57O0bVvI7pCTyU0RnVV3+X2tEjBvu1Th9AcXYh+GitE=;
 b=Pngb34sZkHrTZAIj/lJmDaWNPKokV5I9JWVHMstiD92SpAvJ1KDmUtCMyWRPwADcv7
 Jac6MVYwBB2VVD+prnz5M7aPwg64kyr+qinW+yMaMuElpjeRkDHwSFMr2b61RTn+lJJW
 ZnwFd2XhqoC9tVYcmgRxitG9JYya0Z/iZdDmlgp+hLsjMMQosN2Zlyjxr90JPt2q4G1r
 TYAuSXvO+bsi6SXYYyOpgRhv0I8yFxma164Z7cvKdt6xBdlcqMJZNirlb603NeATJIaa
 SriYa7LGdf1OVQq/zyv4ifNn9hkWAXAyAhx/UJI/Bs5t6a4o/s6WoEbqKtJMZ/Covv48
 mb7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=57O0bVvI7pCTyU0RnVV3+X2tEjBvu1Th9AcXYh+GitE=;
 b=58RjnEuBJC6VQLr08A6HRmua00IFAILJU2po4AeXPaRt4pUkzyofi9k5Q1EG07g4Zk
 TuGyHvaHBIlHqZpIDdUU2enjJ7X3c43ghoDSFhdELDbZMNVrjxyU0VHp1aK7MWfZBvsE
 DzmhSOhTzGZ9sz2tA/NlKECsa/BcmrMee4S7p1gsIcbN1pvq7KDzIeAS+rHGCtqqYwcU
 eNBZKL4kXkU7U3qR9p6g5A5oBZueIe6DLv7Oc6PXQ7hSiv7C5UyjqC12ohEmdZcfdXWV
 dW7QnFCysRVFCKqGjqKqMIoyrf+lRBcYmjqghTMQRu/kbLy0RQDQUah2DZPmOId7yjvD
 7BTw==
X-Gm-Message-State: AOAM531hmHspv4tGG9+Xmu+KpoOD3ezIGnWZCm2+IcgUSD+58CrCrcRJ
 XjFPM4FksNyEvYYbbyGHrpbqbwohqYCC0g==
X-Google-Smtp-Source: ABdhPJyFy1ZSviCAXPNMSGOHEPaHQplu5rMEfKOcTve0JcR6YtWsfK3mZCAdREPU8PUsEdpK+kBf9Q==
X-Received: by 2002:a17:907:3d89:b0:6f4:7e66:b500 with SMTP id
 he9-20020a1709073d8900b006f47e66b500mr1520701ejc.134.1651528687569; 
 Mon, 02 May 2022 14:58:07 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 hy11-20020a1709068a6b00b006f3ef214db0sm3956700ejc.22.2022.05.02.14.58.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 14:58:06 -0700 (PDT)
Message-ID: <662ab74d-f751-69ad-3257-dbee32dca01d@mind.be>
Date: Mon, 2 May 2022 23:58:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20220502201148.92261-1-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220502201148.92261-1-francois.perrad@gadz.org>
Subject: Re: [Buildroot] [PATCH] package/nano: bump to version 6.3
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



On 02/05/2022 22:11, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/nano/nano.hash | 4 ++--
>   package/nano/nano.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/nano/nano.hash b/package/nano/nano.hash
> index 69ebc27b7..8308005bb 100644
> --- a/package/nano/nano.hash
> +++ b/package/nano/nano.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated after checking pgp signature
> -# https://www.nano-editor.org/dist/v6/nano-6.2.tar.xz.asc
> +# https://www.nano-editor.org/dist/v6/nano-6.3.tar.xz.asc
>   # using key BFD009061E535052AD0DF2150D28D4D2A0ACE884
> -sha256  2bca1804bead6aaf4ad791f756e4749bb55ed860eec105a97fba864bc6a77cb3  nano-6.2.tar.xz
> +sha256  eb532da4985672730b500f685dbaab885a466d08fbbf7415832b95805e6f8687  nano-6.3.tar.xz
>   sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
> diff --git a/package/nano/nano.mk b/package/nano/nano.mk
> index e3ecbab56..cad215bed 100644
> --- a/package/nano/nano.mk
> +++ b/package/nano/nano.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   NANO_VERSION_MAJOR = 6
> -NANO_VERSION = $(NANO_VERSION_MAJOR).2
> +NANO_VERSION = $(NANO_VERSION_MAJOR).3
>   NANO_SITE = https://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
>   NANO_SOURCE = nano-$(NANO_VERSION).tar.xz
>   NANO_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
