Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F124C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 16:41:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D9F2610FC
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 16:41:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0D9F2610FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBFFE60A3A;
	Thu,  5 Aug 2021 16:41:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hzhFaXH_JdZX; Thu,  5 Aug 2021 16:41:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AA5260871;
	Thu,  5 Aug 2021 16:41:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A1DD61BF574
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 16:41:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 907C960871
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 16:41:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6w7zDOUru6G6 for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 16:41:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9CE5260616
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 16:41:50 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id o5so10639532ejy.2
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 09:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:from:to:cc:references:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=V2HzwZFFXs2tVeGtuHMHp8L3z49LmmerobGG+R/SqV4=;
 b=LsOaYfoVXMk9HD/C7H1+6Y1bcu0659P6qjav1AIx2XPO42C8q6P8/51/R9xy7J6U49
 KE53aiARhuDoF24txy9UL3y9Mbfo5lcprQG28y2m4chnCbGsatFrOAY8uaBDjpERYXF0
 kS6za3ndqZTd9OCe/fqDwNhaphCbUxAvsR+D6JDV3nRAOe/kTjf/Um8ClGCz8gr2JZJC
 0/XcymwPwwQd4cRtxHyZDDUOWvdL0vC72Kp2hviJPWxhscUVMWtT4jbMG1iydCj/8NCY
 0/qsQuyB1IqHy7njSlJoF8JMDOM5J7nKJL018oN6ErEg3YY3uUOvjDNEw36Icrx/GWu+
 VFaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=V2HzwZFFXs2tVeGtuHMHp8L3z49LmmerobGG+R/SqV4=;
 b=qcFeUcGdlh7Da3c48GyWEA6kMCiQrKaaSczmitpZAP+wWxs1o6w8CePN+j0hn89UwH
 6hgu4LtUFHhH070jle1jBsxeKqqPJueJVLxtEm//49qJ+EjGjLD7UtXtQ18lI8SgU4i1
 A9sXWSYYuESCZlegHfqCO/HCtBHpRPHrp4XXJ8Qt3DCIuOHpKqMZXd4GV4FGtrgRYXjA
 Iok6P/ZYPRcmqkFYTIlLdF9DOwinPbaSgAfuhUnZYLC8ChSjBHZfvIGaO/wgt/5BpFaQ
 MrtIPLjvGUrR0RM4VcemVF2kdHAhG6BH9RMpF5BFstfRRAI1MLq4G7bPaYtijhWzNnhj
 gTzA==
X-Gm-Message-State: AOAM53134eV7UwJzfin7ZDxFOkk8Ap5dmndezqdz03SjIKNi1XAp/O+I
 yPkeu8mgzJVnNs47mmnr3hE7A7vCm5ic+CinPZ8=
X-Google-Smtp-Source: ABdhPJwPjpuQXXxA8agPLDSPAbpU+1O9lhJcuM+CnEd6n4zPayPycinV0jXMNjkD7AzY4xyJJm4+iw==
X-Received: by 2002:a17:906:b0c8:: with SMTP id
 bk8mr5778747ejb.412.1628181708846; 
 Thu, 05 Aug 2021 09:41:48 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id w6sm2507633edd.22.2021.08.05.09.41.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 09:41:48 -0700 (PDT)
From: Arnout Vandecappelle <arnout@mind.be>
To: Pascal de Bruijn <p.debruijn@unilogic.nl>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20210805085353.3457-1-p.debruijn@unilogic.nl>
 <20210805085353.3457-3-p.debruijn@unilogic.nl>
 <20210805153149.3b72eb3f@windsurf>
 <AM0PR07MB39874E7C25C042D0F51C8BC09DF29@AM0PR07MB3987.eurprd07.prod.outlook.com>
 <20210805160140.4fcc15ce@windsurf>
 <AM0PR07MB39876E0E73FD0E7059D1D5CB9DF29@AM0PR07MB3987.eurprd07.prod.outlook.com>
 <20210805161020.5fde871c@windsurf>
 <AM0PR07MB39879D2B6747974F28FAA7579DF29@AM0PR07MB3987.eurprd07.prod.outlook.com>
 <1dab04a3-644c-d583-049d-2a1a3f3f8f6f@mind.be>
Organization: Essensium/Mind
Message-ID: <55d97e13-1e0f-7877-17da-c8507bdc7161@mind.be>
Date: Thu, 5 Aug 2021 18:41:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1dab04a3-644c-d583-049d-2a1a3f3f8f6f@mind.be>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 3/3] package/php: enable opcache jit
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
Cc: "aduskett@gmail.com" <aduskett@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 05/08/2021 18:27, Arnout Vandecappelle wrote:
> 
> 
> On 05/08/2021 16:47, Pascal de Bruijn wrote:
>> Hey,
>>
>>>     > In ed355dec (PATCH 2/3) the following line is what makes opcache actually
>>>     work:
>>>
>>>     What is ed355dec ? I don't have any commit with that reference in
>>>     Buildroot. If it's the reference of the commit of PATCH 2/3 in your
>>>     Buildroot Git repository, then it doesn't make sense to reference it,
>>>     as this commit won't have the same hash when we'll apply your patch,
>>>     i.e ed355dec means nothing expect just to you locally.
>>
>> I know, which is why I referenced both. So I'm referencing the second of three
>> patches in my recently submitted series regarding package/php.
>>
>>>     > PHP_CHECK_LIBRARY(rt, shm_unlink,
>>>     [PHP_ADD_LIBRARY(rt,1,OPCACHE_SHARED_LIBADD)])
>>>
>>>     And what is this doing ? Again shm_unlink() is no longer in librt, it's
>>>     in libc since glibc 2.17 (if I remember correctly).
>>
>> PHP_CHECK_LIBRARY(rt, shm_unlink, [PHP_ADD_LIBRARY(rt,1,OPCACHE_SHARED_LIBADD)])
>> is executed for non-cross-compiles, and with my patch also executes for
>> cross-compiles.
>>
>> Though I haven't looked deeply into the PHP specific autotools macros...
>> https://github.com/php/php-src/blob/PHP-8.0.9/build/php.m4#L1507
> 
>  This bit is indeed useless with modern glibc, but all libc still install an
> (empty?) librt for backward compatibility, so it doesn't hurt either.

 But now I think more about it: how does this patch make it succeed at runtime?
Unless you are indeed using an ancient glibc, it should do exactly nothing. Or
is it the define of HAVE_SHM_MMAP_POSIX (also added by patch 2/3) that makes the
difference?

 Regards,
 Arnout

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
