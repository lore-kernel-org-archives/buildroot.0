Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEDFDC432BE
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 15:50:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DBEA60F9C
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 15:50:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9DBEA60F9C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DBF3600B9;
	Tue,  3 Aug 2021 15:50:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BSJ0tSi7gKRU; Tue,  3 Aug 2021 15:50:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE17160658;
	Tue,  3 Aug 2021 15:50:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2B5BB1BF304
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 15:50:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A27140190
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 15:50:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j_aJuLfM2ifO for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 15:50:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D8C9F40186
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 15:50:35 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id nd39so37087355ejc.5
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 08:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4TuWx2IP962zLAjwaosSviZsuXzBUlExouPLMrd9m1g=;
 b=iGJ2cqxVRMG60Kx6RQ4hZbU00mhAhkwPqJG2+14lF5iootC53PzicBjZjKoicsC9gY
 S/RH2NcowUy/+MhgUqllgS20iXR+lNiimCXadH2f18lZ4l4lCQBmsmFwIE3rTmZTb5yV
 98zDnTBYMX7la3x5yEshBukrHyVl1nruJicJRU8GqUukQe6Lby/hf9/SIEU3Mp94S6V1
 FOLGzkkVfdYh9O73bpHBmbLnsYG/JOOaKVkmMS0W0iXCDQb03mLZJVP/Lt3qHFv+CSNT
 BjUEgRHqpHGEFNP50XmpoUJpTRmztm2FnoH0w/GkV/jSsPUEFdt9n1LXlMmB2igLx8/7
 YgcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=4TuWx2IP962zLAjwaosSviZsuXzBUlExouPLMrd9m1g=;
 b=HP8qc0b4qJAoYBifEG+7RGDxNPTswzJlMqMegFWwfcnVmJw99hXIL5GHNI87lSb5Iq
 0LjCwEiYXhvBVmTGppRa0xYeB7BXTNRrE4OhilJnaT6wr4UWlFvesLaqZdLt5oONXw3/
 uZz0MKJfZ62batcU5uqP24sJX32hBvq7D7Jr4glDrqZupcYKy6wjmnuizX+pJSXUe5R9
 5Ld8UttnafEe9+10cw7PkpeCq4i+vGBnzSbQ0+DQvSzGvZg8DtmJWNDEJxa2lte8S41V
 pCcp4czid3DVUG7IhBCfakVV6EvL5wHD/2n9RV3wB6jqosdk/vWwQuHZP8acaY4gHp35
 1xxw==
X-Gm-Message-State: AOAM530I3xQwLvaBT2n7KKcuXvO7JwRt7TQ3c4l5BcAW2Z9dvJiI2HMA
 /A0nuLdZKqlTMUv0GFd2EWus2A==
X-Google-Smtp-Source: ABdhPJyZQRglSfTqSYf0j6xq3WTCERiLHYv1oBEcomq8icZgUjHjKRR/9REHgHvMdI5KUyOFJ7pNNQ==
X-Received: by 2002:a17:906:1901:: with SMTP id
 a1mr21163613eje.129.1628005833764; 
 Tue, 03 Aug 2021 08:50:33 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id p2sm8551405edx.81.2021.08.03.08.50.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Aug 2021 08:50:33 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210801221118.1010991-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <b5be2a98-b794-8253-b6e4-4ea3ddcf056b@mind.be>
Date: Tue, 3 Aug 2021 17:50:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210801221118.1010991-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/msgpack: bump to version 3.3.0
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Simon Dawson <spdawson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 02/08/2021 00:11, Fabrice Fontaine wrote:
> https://github.com/msgpack/msgpack-c/releases/tag/cpp-3.3.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/msgpack/msgpack.hash | 2 +-
>  package/msgpack/msgpack.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/msgpack/msgpack.hash b/package/msgpack/msgpack.hash
> index 3829a70222..5d432ba0ec 100644
> --- a/package/msgpack/msgpack.hash
> +++ b/package/msgpack/msgpack.hash
> @@ -1,4 +1,4 @@
>  # Locally computed:
> -sha256  464f46744a6be778626d11452c4db3c2d09461080c6db42e358e21af19d542f6  msgpack-3.2.1.tar.gz
> +sha256  6e114d12a5ddb8cb11f669f83f32246e484a8addd0ce93f274996f1941c1f07b  msgpack-3.3.0.tar.gz
>  sha256  664550b43996452a5a2c7471bb0ff77185a58c69ccafa60f983dc4c162e1ee22  COPYING
>  sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE_1_0.txt
> diff --git a/package/msgpack/msgpack.mk b/package/msgpack/msgpack.mk
> index 81670deddc..996b5a2f7c 100644
> --- a/package/msgpack/msgpack.mk
> +++ b/package/msgpack/msgpack.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -MSGPACK_VERSION = 3.2.1
> -MSGPACK_SITE = $(call github,msgpack,msgpack-c,cpp-$(MSGPACK_VERSION))
> +MSGPACK_VERSION = 3.3.0
> +MSGPACK_SITE = https://github.com/msgpack/msgpack-c/releases/download/cpp-$(MSGPACK_VERSION)
>  MSGPACK_LICENSE = BSL-1.0
>  MSGPACK_LICENSE_FILES = COPYING LICENSE_1_0.txt
>  MSGPACK_INSTALL_STAGING = YES
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
