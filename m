Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35143C433F5
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 21:52:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8DC060E24;
	Mon,  2 May 2022 21:52:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eHbyFkr3z4aH; Mon,  2 May 2022 21:52:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 047E3600C5;
	Mon,  2 May 2022 21:52:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C0E4B1BF2BC
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:52:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE8E681307
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:52:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X8yO9sEkCCV9 for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 21:52:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C166581270
 for <buildroot@buildroot.org>; Mon,  2 May 2022 21:52:19 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id kq17so30160845ejb.4
 for <buildroot@buildroot.org>; Mon, 02 May 2022 14:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=YqzdaeuO948DpQdGfqlwnBqeDtII9pHZSAKqB3NMHwI=;
 b=bGMGo6U9441VXo+h198lLxCPPTAfS5XAPn9c0doA3/kt190vcIJA5UJ1CkFLwcFDKR
 sgAauxXItEolmeq57vdzXWkvqMABcbbmXxFXWtHL+ipkRXPO60OczzmwolHfZyLTTScx
 UkCh2yKNfNkZvM8xz9zUVe0topMrVf3PH9IUdlmHqjXnnelMRD0y+ZlXV4GqYUX9zUQk
 oQABYVMSrGGKv3MG2fb0kf/ZhkrmbsTqMumcwK8NHcLNdaVf9mt8/qUOS6I2WEhW27NF
 0G5v7FEA7/jdCybThbjJ2GAuZuGACL8MqHEbkD0qGeRIBT/dVLe4Mbinvh2pFVr9owJa
 UnZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=YqzdaeuO948DpQdGfqlwnBqeDtII9pHZSAKqB3NMHwI=;
 b=g+dtq/sWHz1XjQQCARP7EXvE7LN8e+P0NXaHrzMQm6GchNvEEO9JvPGLFIuz4P3Qj1
 ZU4yu/3hOyJBN0n0DsIDNSPzOqZa6yKt6ViaFP0EUg8H1XPmZL7+01tjLsrgUA5UYU1d
 eTtHk4qmCL4d+z13S0vFCsMp/65ORuG0sWcg2KfBtV8nwtT5+66BdMHwFcU8MjeKf1Ub
 t5VEL0yh2mLeiwfIT3rDjWeRJtrchitnFZ7gZNVY6PJF2JViFelWO9US7PRVJbT+M3+k
 7IsfmO2gghUx8a3GpvHkIPDKJdLrHRLxqRKe8uYAuTFP39mFZLlSOWPHMYbumgK1IngQ
 KMeQ==
X-Gm-Message-State: AOAM53202dBjg8SwDKYIhoNBbYM/am15SAuJQ2/i94ZWGeLeoyqq0bsP
 0TOMKO6yzRcue3MeBt+5XCraMg==
X-Google-Smtp-Source: ABdhPJx0L2tFXZb1N8/NqWS8nCdP9sk4/lUbPouDNdcZih9+kzoqM9JD9hh8xurGI7q2lxPzh5jhWA==
X-Received: by 2002:a17:907:2daa:b0:6da:924e:955 with SMTP id
 gt42-20020a1709072daa00b006da924e0955mr12622770ejc.1.1651528337991; 
 Mon, 02 May 2022 14:52:17 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 hz7-20020a1709072ce700b006f3ef214dc9sm4007100ejc.47.2022.05.02.14.52.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 14:52:17 -0700 (PDT)
Message-ID: <1f0f276e-4b48-6670-d5a4-44d1cce7382f@mind.be>
Date: Mon, 2 May 2022 23:52:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220430192920.2367644-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220430192920.2367644-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/oniguruma: bump to version 6.9.8
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



On 30/04/2022 21:29, Fabrice Fontaine wrote:
> https://github.com/kkos/oniguruma/releases/tag/v6.9.8
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/oniguruma/oniguruma.hash | 4 ++--
>   package/oniguruma/oniguruma.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/oniguruma/oniguruma.hash b/package/oniguruma/oniguruma.hash
> index 3a6112e832..89befe7dbf 100644
> --- a/package/oniguruma/oniguruma.hash
> +++ b/package/oniguruma/oniguruma.hash
> @@ -1,4 +1,4 @@
> -# From https://github.com/kkos/oniguruma/releases/download/v6.9.7/onig-6.9.7.1.tar.gz.sha256
> -sha256  6444204b9c34e6eb6c0b23021ce89a0370dad2b2f5c00cd44c342753e0b204d9  onig-6.9.7.1.tar.gz
> +# From https://github.com/kkos/oniguruma/releases/download/v6.9.8/onig-6.9.8.tar.gz.sha256
> +sha256  28cd62c1464623c7910565fb1ccaaa0104b2fe8b12bcd646e81f73b47535213e  onig-6.9.8.tar.gz
>   # Hash for license file
>   sha256  70ba5469ea0bab6e18a32d7009068f996503168d27be57747e08da34337ff26f  COPYING
> diff --git a/package/oniguruma/oniguruma.mk b/package/oniguruma/oniguruma.mk
> index 31c8d8e512..f5ac810c10 100644
> --- a/package/oniguruma/oniguruma.mk
> +++ b/package/oniguruma/oniguruma.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -ONIGURUMA_VERSION = 6.9.7.1
> +ONIGURUMA_VERSION = 6.9.8
>   ONIGURUMA_SITE = \
>   	https://github.com/kkos/oniguruma/releases/download/v$(ONIGURUMA_VERSION)
>   ONIGURUMA_SOURCE = onig-$(ONIGURUMA_VERSION).tar.gz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
