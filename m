Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10B58C433F5
	for <buildroot@archiver.kernel.org>; Mon, 28 Mar 2022 19:55:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94CA0410B9;
	Mon, 28 Mar 2022 19:55:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tla_YZVXAcXH; Mon, 28 Mar 2022 19:55:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A23C04017F;
	Mon, 28 Mar 2022 19:55:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AD5121BF2BA
 for <buildroot@lists.busybox.net>; Mon, 28 Mar 2022 19:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9BB8760C02
 for <buildroot@lists.busybox.net>; Mon, 28 Mar 2022 19:55:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C5Iy795CKjK1 for <buildroot@lists.busybox.net>;
 Mon, 28 Mar 2022 19:55:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A4A7760899
 for <buildroot@buildroot.org>; Mon, 28 Mar 2022 19:55:26 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id g20so18205376edw.6
 for <buildroot@buildroot.org>; Mon, 28 Mar 2022 12:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=F63mtg+1DiNef8bRpUy+FeUZBf4N6Rb3nk4GdP5+GEY=;
 b=NSAbdJV+PPB6BTuPPL87+G1wxCyi/4CzmBSkKRddPcy4JPTzpTwISOS6GwXv/JCRX6
 IJuwF1qaiPYnT1b4aWhZHnVHLt1/4uivWPRGPzPC1Oy3TblCvXdoY12W1fXKZY6V8hhT
 Vr0lgwnIx5lUFLwdTm+GZx7oxND23JhRQO/G18HB5/Ck4IAOt+7q1mP7ZQUrN/iKKkwW
 zOqRfTLH2XtwAJP1qnEzSvu1hJnK88AD2YOR96QFkbCqFe+xi6i35TFElmQqId3Qvr4Y
 L7rKI6bzcnZv9M74yfUTHIBCRd6k3/MZLMYADcsMvBCSJ9QdMMI7iCw7VZIipHFUoT8v
 OHjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=F63mtg+1DiNef8bRpUy+FeUZBf4N6Rb3nk4GdP5+GEY=;
 b=IG1Pzf+LM+XZY6G7RbbGiWwh+6Uj2eDKTXcFyyDmyUNEQ3a+CkwmFWBK69TxGmrxRh
 bkMTlAsrihPYS7gttt3RMbQ42WR/0m89PboSPb829cGRJTCWXCPIqNaAEcZdq7XygG/y
 4g68LNkSSQk9Z8L8kNgaveyH7gcXr5V4x98qXfcPpeguqdVNJ5eR5WlY0fHBmeasUEWB
 dIcvbFFdRo7l2Z1MHto9ZkvKUYkGpXol/PkrAJlhuU3Hiwdi9fZMmENICKEQjfARKN0Y
 Z8tOilgFxD7jNxO+pffNtf1ZuXACEic0zcbIG6PJ7ZoLY7FZI6nSHEUqWIMW5erSj1bD
 D4Ng==
X-Gm-Message-State: AOAM5325CZyOCqmbfr/jPmQ7w/hI2fT4jxVZdYkiIGN2qxuV5sfWesVY
 79abgGP7CAUJnuHgjAJ3Chsw4w==
X-Google-Smtp-Source: ABdhPJw5RgqlhFU4rVwj1jD+wgA4F/kCNcDKrvhGbY3PEGqDQNOkIX4RLjCFnzNMQMpGtZet0s3xVg==
X-Received: by 2002:aa7:cdc4:0:b0:419:d0d:fa07 with SMTP id
 h4-20020aa7cdc4000000b004190d0dfa07mr18242368edw.208.1648497324862; 
 Mon, 28 Mar 2022 12:55:24 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 do8-20020a170906c10800b006dfe4d1edc6sm6295252ejc.61.2022.03.28.12.55.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 12:55:24 -0700 (PDT)
Message-ID: <eccd121a-9993-9e8c-d89c-5b8575a2041a@mind.be>
Date: Mon, 28 Mar 2022 21:55:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220327205750.1448336-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220327205750.1448336-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/unclutter-xfixes: bump to
 version 1.6
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 27/03/2022 22:57, Fabrice Fontaine wrote:
> Update indentation in hash file (two spaces)
> 
> https://github.com/Airblader/unclutter-xfixes/releases/tag/v1.6
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/unclutter-xfixes/unclutter-xfixes.hash | 4 ++--
>   package/unclutter-xfixes/unclutter-xfixes.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/unclutter-xfixes/unclutter-xfixes.hash b/package/unclutter-xfixes/unclutter-xfixes.hash
> index 785825da7a..b0bd5532ef 100644
> --- a/package/unclutter-xfixes/unclutter-xfixes.hash
> +++ b/package/unclutter-xfixes/unclutter-xfixes.hash
> @@ -1,3 +1,3 @@
>   # locally calculated
> -sha256 35c75ad24be989dd6708db1d9ce9b2a2f814b80638c0633cdb075c6df090ed11  unclutter-xfixes-1.5.tar.gz
> -sha256 33e94693849b57fdb34987c95fd0076b4aa4b70fcd9a3152313d00b86a3f7bf7  LICENSE
> +sha256  6f7f248f16b7d4ec7cb144b6bc5a66bd49078130513a184f4dc16c498d457db9  unclutter-xfixes-1.6.tar.gz
> +sha256  33e94693849b57fdb34987c95fd0076b4aa4b70fcd9a3152313d00b86a3f7bf7  LICENSE
> diff --git a/package/unclutter-xfixes/unclutter-xfixes.mk b/package/unclutter-xfixes/unclutter-xfixes.mk
> index 713a84bca6..6da607b660 100644
> --- a/package/unclutter-xfixes/unclutter-xfixes.mk
> +++ b/package/unclutter-xfixes/unclutter-xfixes.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -UNCLUTTER_XFIXES_VERSION = 1.5
> +UNCLUTTER_XFIXES_VERSION = 1.6
>   UNCLUTTER_XFIXES_SITE = $(call github,Airblader,unclutter-xfixes,v$(UNCLUTTER_XFIXES_VERSION))
>   UNCLUTTER_XFIXES_LICENSE = MIT
>   UNCLUTTER_XFIXES_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
