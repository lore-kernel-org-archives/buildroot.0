Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E64EC433EF
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 18:31:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7913E80AFA;
	Tue,  4 Jan 2022 18:31:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XqpoGUr3HaxX; Tue,  4 Jan 2022 18:31:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C76D0827C5;
	Tue,  4 Jan 2022 18:31:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3900D1BF5DB
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 18:31:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 282B6827C5
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 18:31:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bJgEuwQO4Dlx for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 18:31:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 51FB38268F
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 18:31:20 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id z9so81962229edm.10
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 10:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=FURbO7xDUBmSp0E2o6HJiSbe7ZtiSckEXZpNZZi5x/g=;
 b=MYcSxzyXmo9RkK8CoLx74+c9nPkbqIACrIEdnGD8wrIsYimRUbgXqvkbXwYzDRTbqP
 BnG+6gbCb5n4Itt5Hpg/4CBI+3QrXiiz2h7tx1/SkCHHgvRvC9oMih9c31hdAvV7S3jX
 uZirv6dHpjvX51JzGcxIkVL9EsUMzNYEb5W9z4HnY0gyb3kViYNTuTUCk8mUI6aGGo2L
 28cXzdivC7XkLDp22Awd4rrMLvW5VbBmbidfE6ype3eMuffDT75uRQS0gMmfoYBCSoj8
 U5z3fl4wjqluW+owvEvjN+xgnQbP7rLihrgun6xnLWBfPgH0bbFGGtNpwKa/xYNQXekL
 CejQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=FURbO7xDUBmSp0E2o6HJiSbe7ZtiSckEXZpNZZi5x/g=;
 b=NQHACKtOWZqZzxBVZ/mnySoFTIadeRrxtNDEZSthKaRx7hvkamJ+lqsdPzA+LVtN2g
 TpJVINzqI11elol3HDacl1fnqdxmWoEDe1dJ8vpbGvRvDDchX0b8PfDJPJv5O4FzzyDl
 XfaRgQU6lpm5Hv0P4g8pDKPe1LktmBMvVxXDgGUdGE8kwGKExNdj2tAOtZhrpes7e/f3
 IwjmWzpoc077lO1rymz/d4gvwvMG7btr6EZ0fE3N+iFflAafcmcVXHhZYK3uOMCYnToX
 19WXvGf1LZL/20I5/S7Wo3wG4Dwnu3URLT3WyH+EHxschjAhnTqRhjXQxuDBq4EdL1lv
 Fw6w==
X-Gm-Message-State: AOAM532T/GQl0WZ8ve4UWqGEd06Aqd3kNVbFj7xQl6fnm9KI56rt7cUC
 wg0MLQ7nidu3oYw/9ZwIbZnDPnu3uH7Yuw==
X-Google-Smtp-Source: ABdhPJxNUstCc/uDr/be/rnQLuuyV7pDxsDV21IYVbPBUi9asuqJb/iOg982bhP/lFP8xrGJxIpE/Q==
X-Received: by 2002:a17:906:5f97:: with SMTP id
 a23mr20450676eju.154.1641321078583; 
 Tue, 04 Jan 2022 10:31:18 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id ne31sm11764080ejc.48.2022.01.04.10.31.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 10:31:18 -0800 (PST)
Message-ID: <b9a4fd91-6a6c-68a5-70fa-ca53e1789e10@mind.be>
Date: Tue, 4 Jan 2022 19:31:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Michael Nosthoff <buildroot@heine.tech>, buildroot@buildroot.org
References: <20220104133416.5185-1-buildroot@heine.tech>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220104133416.5185-1-buildroot@heine.tech>
Subject: Re: [Buildroot] [PATCH] package/json-for-modern-cpp: bump version
 to 3.10.5
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



On 04/01/2022 14:34, Michael Nosthoff via buildroot wrote:
> * Update License hash due to updated year
> 
> Fixes:
>   - Make sure C++17 filesystem conversions are only used if the compiler supports it.
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/json-for-modern-cpp/json-for-modern-cpp.hash | 4 ++--
>   package/json-for-modern-cpp/json-for-modern-cpp.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/json-for-modern-cpp/json-for-modern-cpp.hash b/package/json-for-modern-cpp/json-for-modern-cpp.hash
> index eb14d2fd6d..a193fa6d49 100644
> --- a/package/json-for-modern-cpp/json-for-modern-cpp.hash
> +++ b/package/json-for-modern-cpp/json-for-modern-cpp.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  1155fd1a83049767360e9a120c43c578145db3204d2b309eba49fbbedd0f4ed3  json-3.10.4.tar.gz
> -sha256  c983d69523377819db3c377b390d5644f5ec53bec9b7c4a0f1ed893bb743d045  LICENSE.MIT
> +sha256  5daca6ca216495edf89d167f808d1d03c4a4d929cef7da5e10f135ae1540c7e4  json-3.10.5.tar.gz
> +sha256  86b998c792894ccb911a1cb7994f7a9652894e7a094c0b5e45be2f553f45cf14  LICENSE.MIT
> diff --git a/package/json-for-modern-cpp/json-for-modern-cpp.mk b/package/json-for-modern-cpp/json-for-modern-cpp.mk
> index 428473db5a..fd13ce1fd1 100644
> --- a/package/json-for-modern-cpp/json-for-modern-cpp.mk
> +++ b/package/json-for-modern-cpp/json-for-modern-cpp.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -JSON_FOR_MODERN_CPP_VERSION = 3.10.4
> +JSON_FOR_MODERN_CPP_VERSION = 3.10.5
>   JSON_FOR_MODERN_CPP_SOURCE = json-$(JSON_FOR_MODERN_CPP_VERSION).tar.gz
>   JSON_FOR_MODERN_CPP_SITE = $(call github,nlohmann,json,v$(JSON_FOR_MODERN_CPP_VERSION))
>   JSON_FOR_MODERN_CPP_LICENSE = MIT
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
