Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3398C433F5
	for <buildroot@archiver.kernel.org>; Mon, 21 Mar 2022 21:01:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5360F4167C;
	Mon, 21 Mar 2022 21:01:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1sKf3S-HQNlg; Mon, 21 Mar 2022 21:01:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1FA441673;
	Mon, 21 Mar 2022 21:01:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2B0C71BF373
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 21:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 19E8341673
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 21:01:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JZntdFrkB_CW for <buildroot@lists.busybox.net>;
 Mon, 21 Mar 2022 21:01:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1281D41638
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 21:01:43 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id a17so18357557edm.9
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 14:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=m28MoGFNfjVfktezVNxf+5/0qO89YWNi9zwGDDEsT4A=;
 b=TYzj04mTIQDT+C8IPJTcjnofAAOIpJmB6X/aPd72O9m3zHW7SSor0ZHb52S7KxfZ9L
 6QF8Bnlo3/h9cZh09fUwuwB7ipAQbJMYsor2UnFLPgYcqSro7n+JvTYKnBeo82ssLGQQ
 o1yuWbubqGu6cZz28yHOTORZGZrOkQxOMTF5yxanFreAxP9/Aru5+1GhWJIwm1xBmQts
 2MsEksE2+/nUYctDJvzFNj/VQErAlH/ZBmt92t5rmwN2GAHZBFkqDz4jezw1JhMFp/hE
 BIgY12lbte7xtqK2fKWK2JDM7mArbPyq0VaXclk62ze6DpQyeg7RUg4GlkLNOoYdok1h
 VepA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=m28MoGFNfjVfktezVNxf+5/0qO89YWNi9zwGDDEsT4A=;
 b=XImeV/iVdZ2VYSbZxZASwgjE3t36musrHaMiZ20ui5bfuYofL35ISb1QW+tAKicEW0
 bpi6m7kCJ2SYUq8oPgYPaiMbiQMRVrAIJV/1rFldASxpsYoyejbxJN8wDSyiDoGS7xhH
 PcYq3pUsiXaxSFJt8YCYq3NlRFqOqDXdNxJYuVpJYd9dLuPA2CPxtse8cb7GQymv9qf0
 NfKGXaexNCFkLkIg37erIgyQwelgcf89Ln9Fsf2h9/KqFg9rUvgvqGG/RSwJHyQTAPpV
 3nSmP0C82DY91IUYxUo895rGR371iLXOEb5YVpTGiZX0jzQJ2VX8msaV3hum0wOJJwlB
 3uGQ==
X-Gm-Message-State: AOAM533hQ+YlPE9M2/uEjiVjsaBEWf1ROb+abbaM+otcWlzN7Q0iSXt0
 QTyu6f/MxrpY5Xu1BDxLpND7eA==
X-Google-Smtp-Source: ABdhPJxnqitgS7pNSWbTGyp0ckHGAcXXvc7RUDpKaehSr5fhL0RdZKzBZpAsEJTvLuvuNfLkRF2uKg==
X-Received: by 2002:a05:6402:84b:b0:419:b5:70b2 with SMTP id
 b11-20020a056402084b00b0041900b570b2mr21813036edz.162.1647896502111; 
 Mon, 21 Mar 2022 14:01:42 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 17-20020a170906059100b006cee1bceddasm7334409ejn.130.2022.03.21.14.01.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 14:01:41 -0700 (PDT)
Message-ID: <990140a5-a769-2f7b-5786-c08557db4b6b@mind.be>
Date: Mon, 21 Mar 2022 22:01:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Kamel Bouhara <kamel.bouhara@bootlin.com>, buildroot@buildroot.org
References: <20220310095602.2435745-1-kamel.bouhara@bootlin.com>
 <20220310095602.2435745-4-kamel.bouhara@bootlin.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220310095602.2435745-4-kamel.bouhara@bootlin.com>
Subject: Re: [Buildroot] [PATCH v2 3/4] package/libodb-boost: add host
 variant
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/03/2022 10:56, Kamel Bouhara via buildroot wrote:
> Add host variant of libodb-boost required by the ODB compiler.
> The libodb-boost headers are needed at compile time, and
> therefore installed in $(HOST_DIR).
> 
> Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
> ---
>   package/libodb-boost/libodb-boost.mk | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/package/libodb-boost/libodb-boost.mk b/package/libodb-boost/libodb-boost.mk
> index bac5f1e78f..39c9f91030 100644
> --- a/package/libodb-boost/libodb-boost.mk
> +++ b/package/libodb-boost/libodb-boost.mk
> @@ -12,6 +12,8 @@ LIBODB_BOOST_INSTALL_STAGING = YES
>   LIBODB_BOOST_LICENSE = GPL-2.0
>   LIBODB_BOOST_LICENSE_FILES = LICENSE
>   LIBODB_BOOST_DEPENDENCIES = boost libodb
> +HOST_LIBODB_BOOST_DEPENDENCIES = hoost-boost host-libodb
>   LIBODB_BOOST_CONF_ENV = CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"

  I have not double-checked (since I don't know for which GCC version exactly 
this -std=c++11 is needed), but I expect that if -std=c++11 is needed for target 
build, it's also going to be needed for host build. So I added 
HOST_LIBODB_BOOST_CONF_ENV.


  Series applied to master with that fixed, thanks.

  Regards,
  Arnout


>   
>   $(eval $(autotools-package))
> +$(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
