Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E6BC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 20:25:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 53B2D404F9;
	Mon, 25 Apr 2022 20:25:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VF_p18HVIYOG; Mon, 25 Apr 2022 20:25:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D4EA404FF;
	Mon, 25 Apr 2022 20:25:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DB2941BF2AB
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 20:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D849C82919
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 20:25:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kgYgWJHRUdmt for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 20:25:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BD82D828F7
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 20:25:26 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id gh6so7818759ejb.0
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 13:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=bVldFOM1u8sw0wdknGWvyhn39oJynlURPcEJU9LbqVk=;
 b=LQl6/nh2QNYNhVzzQs2GBsKtUQ1KQk7HWw8v63dfDfrcshnngdq+NwfKG9tdLTDLbL
 JBbBygZxQ+Sv10hjunA7bqvI5UD9pBhmo8uu1e0cAxWbznIXPVsgtx4mX3bnOAwf2iRx
 n3LO5hG9JYNSnkRPKpTtzy49rVmmPLaknLK14tcU0Smn5M+rjxnTPqk7Q9Dm8LXhYLfW
 gu+GyQGMl2Hc1lo18jpoTNdrXHNA+occYi64bx+FgrZ6ROkf08aub/yAsAtqLXPTRlbq
 X/Nkaug3jQdBJA9Hrw4mZf+/WwsQtD+11SRQhxwi4aGHSlp4EQLYmk9bxol7V5WWxTJ2
 K+9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=bVldFOM1u8sw0wdknGWvyhn39oJynlURPcEJU9LbqVk=;
 b=EhvLziwtfWts6Vjh22aL4vbJNPNIENhjq/TYmZ5CMZJ0cGxS9fGLnrFQnJqFDFt3L5
 ppIPYGpci9lRJqj1xXgYM2LwvluWMHHVExzU9+901JdmBRO9l+ZCEZ9tJ3cJB8FOGwgG
 QRSJZpkHMhU6jst0ivl5pfevTaJhan0asvhpQkPLBNzRY7rAPzfoL97P9LWsOH5FfMA6
 kk2EDMsKvhKPPQ8vjZRjRtwi0bFCFN+BK0fMMXVCs8RTZefg8LOjxVhyeWnj7o3u/3Je
 irPn9zXtXiLKOzTjaexk83vxug7aVGWDSqpHK5ETWbss0TP2nfPTMfGVLnHblfmKDHKT
 ubvA==
X-Gm-Message-State: AOAM531rCfO8RNx+yz3cfbebVvPus15Eu8NIsGoPsiWyOcb985A2OUxS
 FGTHuoCTrweOh6pcOLE0BkEkXA==
X-Google-Smtp-Source: ABdhPJyCcvny5FyzIhYjoe6PlB1Imwdw8B7s0iArBIlwk60jPW6SyctDHbCXNMNbaVHimjEWflgqRg==
X-Received: by 2002:a17:907:6286:b0:6da:6e24:5e43 with SMTP id
 nd6-20020a170907628600b006da6e245e43mr17886728ejc.449.1650918324389; 
 Mon, 25 Apr 2022 13:25:24 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 o3-20020aa7c7c3000000b0042237eda622sm5046619eds.83.2022.04.25.13.25.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 13:25:23 -0700 (PDT)
Message-ID: <b7000ec8-1d47-2a03-c7f4-bbfa59d09219@mind.be>
Date: Mon, 25 Apr 2022 22:25:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220423211141.1704835-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220423211141.1704835-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/aubio: add host-pkgconf
 dependency
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 23/04/2022 23:11, Fabrice Fontaine wrote:
> Add host-pkgconf dependency to fix the following build failure raised
> since the addition of the package in commit
> 280bb6807619e2e858836435f44aad0cccd27a40 and
> https://github.com/aubio/aubio/commit/e57859fd1f2c3c8b18b3f5ede122071c66166a8f:
> 
> Checking for program 'pkg-config'        : not found
> Could not find the program ['pkg-config']
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/e6f0e9b09e4b611daf5bb37091610d8de80f1f4d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/aubio/aubio.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/aubio/aubio.mk b/package/aubio/aubio.mk
> index b79beccd97..b2eb2b5e6d 100644
> --- a/package/aubio/aubio.mk
> +++ b/package/aubio/aubio.mk
> @@ -11,6 +11,7 @@ AUBIO_LICENSE = GPL-3.0+
>   AUBIO_LICENSE_FILES = COPYING
>   AUBIO_INSTALL_STAGING = YES
>   
> +AUBIO_DEPENDENCIES = host-pkgconf
>   AUBIO_CONF_OPTS = \
>   	--disable-docs \
>   	--disable-atlas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
