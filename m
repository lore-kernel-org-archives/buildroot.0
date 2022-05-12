Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C8AEC433EF
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 22:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3833D60B4F;
	Thu, 12 May 2022 22:34:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id biRo92bBdARW; Thu, 12 May 2022 22:34:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4588B60B6C;
	Thu, 12 May 2022 22:34:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 826651BF31C
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 22:34:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E9A160BB0
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 22:34:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PkxksVUxboLt for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 22:34:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5C6F960B71
 for <buildroot@buildroot.org>; Thu, 12 May 2022 22:34:10 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id ch13so12851428ejb.12
 for <buildroot@buildroot.org>; Thu, 12 May 2022 15:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=bIsoAQkwmqfMxj1gk4ORsC1dZ5luYoJg2Zhv1QS5PuU=;
 b=g4bsu2hgBDypCbYm2QZBP+7ufegRGLeFAROCQXEvQegwu7hBgZYpeNfxtm+ikBJtMn
 7NUXDdrf+ykgsdH3Geee3SaCAj1igOTohQN6ohruoOKtaZibJdNXhoNnH8p77dKKPw3q
 T4BSN8JA0fvfxl2FIVuW9ffrH4Y/Imt6HjUf7uT/Ii0nuUomLyJSAKEQAWC9IkwcP3sl
 UUGoX+7Mdb+CimRY+0jaCfyi2PVlArsjeXnVEqtD8NYegqwnOwV++f4IILUG4vHkcRHO
 GbraI3koHUehcz981zItlVeqY3S4EqfCELfz0b4cURGYMBFsqdi1XFwH3HmUzkGuwBoQ
 sMvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=bIsoAQkwmqfMxj1gk4ORsC1dZ5luYoJg2Zhv1QS5PuU=;
 b=V40uF24VEUeHYa5VqFekaI5+XrS5CgMI/Xde9F2Aw/PWusOd7hRIb4zKJZ+OeT/fCb
 3QJ4Gzf/HihFmfrgb2nG/5Lqzsh5K0QFOGWQ2ozv9x0H4082hAwudingJDK8uNPwetBJ
 rzjMCHITdT3K//UKhSHPhuGjEQKrogkESopSKKiX0B2SXlMi8oz4bESthWzENQiub0P6
 oCqGE73DVD1v3HLMuasxfDrCHbL9l6Pw72f/3cSGwnazpF+msL5zU1zd58SpvWMGVnYJ
 rAIlGqLnfsmog4A5HavCCdCbDUa5zVw5cP2GTwY+ojDLZVeQEmKPhFSvsOzPefVDzSSg
 mtng==
X-Gm-Message-State: AOAM532xa9jWEvzJTq+rFIDv5hrZQwmwHPNJzzL8wZo7o6LXtOuZiRov
 BxwX0f3/PL3e/VF3hrwH/yJKVg==
X-Google-Smtp-Source: ABdhPJwLbtz2LBIGMrNSrYXrvCIiOKSxO3mkAyk9RawnpY3zb9uQTQcJDH5avzePYQFEQzxmHMxKKA==
X-Received: by 2002:a17:906:c149:b0:6f9:2a43:ef37 with SMTP id
 dp9-20020a170906c14900b006f92a43ef37mr1779409ejc.17.1652394848364; 
 Thu, 12 May 2022 15:34:08 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 dq21-20020a170907735500b006f3ef214da3sm189549ejc.9.2022.05.12.15.34.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 May 2022 15:34:08 -0700 (PDT)
Message-ID: <4dcec046-59a7-22e4-0e58-49e24951e7fe@mind.be>
Date: Fri, 13 May 2022 00:34:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220512121217.176652-1-arnout@mind.be>
 <20220512201827.GH1597494@scaer>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220512201827.GH1597494@scaer>
Subject: Re: [Buildroot] [PATCH 1/2] package/nodejs: clean up DEPENDENCIES
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/05/2022 22:18, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2022-05-12 14:12 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
>> One per line, and alphabetical (was already the case for host).
>>
>> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>> ---
>>   package/nodejs/nodejs.mk | 17 ++++++++++++++---
>>   1 file changed, 14 insertions(+), 3 deletions(-)
>>
>> diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
>> index 6dcaf34aa4..909347eb2e 100644
>> --- a/package/nodejs/nodejs.mk
>> +++ b/package/nodejs/nodejs.mk
>> @@ -7,10 +7,21 @@
>>   NODEJS_VERSION = 16.15.0
>>   NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
>>   NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
>> -NODEJS_DEPENDENCIES = host-qemu host-pkgconf host-python3 host-nodejs c-ares \
>> -	libuv zlib nghttp2 \
>> +NODEJS_DEPENDENCIES = \
>> +	c-ares \
>> +	host-nodejs \
>> +	host-pkgconf \
>> +	host-python3 \
>> +	host-qemu \
> 
> I prefer when all host dependencies go first, then all target
> dependencies, so I've also lightly re-oredered.

  I actually prefer that as well. So good call!

  Regards,
  Arnout

> 
> Applied to master, thanks.
> 
> Regards,
> Yann E. MORIN.
> 
>> +	libuv \
>> +	nghttp2 \
>> +	zlib \
>>   	$(call qstrip,$(BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL_DEPS))
>> -HOST_NODEJS_DEPENDENCIES = host-icu host-libopenssl host-pkgconf host-python3 \
>> +HOST_NODEJS_DEPENDENCIES = \
>> +	host-icu \
>> +	host-libopenssl \
>> +	host-pkgconf \
>> +	host-python3 \
>>   	host-zlib
>>   NODEJS_INSTALL_STAGING = YES
>>   NODEJS_LICENSE = MIT (core code); MIT, Apache and BSD family licenses (Bundled components)
>> -- 
>> 2.35.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
