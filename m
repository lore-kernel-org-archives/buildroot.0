Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA93FC433EF
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 21:54:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A08DB83276;
	Thu,  6 Jan 2022 21:54:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vGG-VBO6RLv9; Thu,  6 Jan 2022 21:54:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C37483279;
	Thu,  6 Jan 2022 21:54:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C5BF61BF38A
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 21:54:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B3DFE6FB3A
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 21:54:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DuojIRcDkBqi for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 21:54:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A9D2B60D66
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 21:54:17 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 2-20020a05600c02c200b003470f96e778so1692579wmn.5
 for <buildroot@buildroot.org>; Thu, 06 Jan 2022 13:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+yQThuh88GZ3Vt8wRCYkYNKgUZy0XBKEHfIfCIA0h8o=;
 b=JhPwfbzllK4qy9/fh3n0QFdVbnX2TlJnJHVpKgV3XMAqPu2KlcbgHf6fkExX/WZY6z
 S8eRHhOKm8PixiB08LWjUonMpfhvV62T6iwMwAdGCMXqGbdPnm1GwJJu854AiYPF+EEW
 50Cw/uqLeDT+1b7Z5oSQcyHnhQ/2CqJTtOoudoXpDIWcY84KI3EcD+usnsspyYeNnpNt
 qVpXd28zm/Y0Bpr+dRQGRWQmg1/TLRxSq0L8wXM5VLMbEstZxY2u/L8AtKiR0A7V+IJE
 OzMJjUsrX0UmMlpwPteRVxceaUcYvHflPgd53x5vowGgg8pSBdb+mp4ygdTKvH8iTVQw
 1BKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+yQThuh88GZ3Vt8wRCYkYNKgUZy0XBKEHfIfCIA0h8o=;
 b=LRY+mweNm/R/HtgxXQoGJGPiueB8ld+7irPG8PLxm6Ki8wgOxnVtx2eld4hcixKloz
 AMmChqsVrfBiaP9l0YAPEVxIiHlZfPjfHGfeZJ/9VEmZ8vuPSzwmoAKK3OI/bVIyjT9n
 gpWe9hkQJ6uPEGnW6dMhUtDgl4yavhJ3/pTDzhnDnheDqky+PvB0zCrc4ovZ7nk7L7WC
 /4UYyDsjgutH8EShoEmQWSsfY0D13jnlpAZHXEfSyL8/CoI4BeK0PqdJs3oeOQFfqkiu
 777fmBQvg0dQ+m0urio4jiHCYxlrzNd2odUGThubQRYmQTF8FOfXgB6ZPzqqwd2q6xXQ
 Zx7g==
X-Gm-Message-State: AOAM530uPPc8diEIDWW5rMUWdCeIDMPBDoS9ZvoafBlxuPSmzIocjB5G
 rFBMjdzl3SLW7ulQXdoFtrZEpg==
X-Google-Smtp-Source: ABdhPJw9vROCqQSjQzGFrJEcZCgwra1/4e2tHxFf4Ih6f3pQvcFhuHq+h2/ZxUJS32XmLe0oTmncbA==
X-Received: by 2002:a05:600c:22d2:: with SMTP id
 18mr8392607wmg.158.1641506055954; 
 Thu, 06 Jan 2022 13:54:15 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id g18sm3012160wrv.42.2022.01.06.13.54.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 13:54:15 -0800 (PST)
Message-ID: <ac928fe3-6d66-0cdf-0bbc-8ec164ec5dc1@mind.be>
Date: Thu, 6 Jan 2022 22:54:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Christian Stewart <christian@paral.in>
References: <20211212090107.2975294-1-christian@paral.in>
 <CA+h8R2o_bHkD2g+mJGsxMbNfDSSiOXj3wn_uhC+90xVeT-ceDA@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CA+h8R2o_bHkD2g+mJGsxMbNfDSSiOXj3wn_uhC+90xVeT-ceDA@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/go: security bump to 1.17.5
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/01/2022 22:39, Christian Stewart via buildroot wrote:
> Hi maintainers, all,
> 
> Currently 2021.11.x branch is at version 1.17.3 which is vulnerable to:
> 
>   - CVE-2021-44716
>   - CVE-2021-44717
> 
> Is it currently policy to backport security patches?

  Yes, of course. Peter regularly goes through the master branch and identifies 
commits for backporting. If he misses something, you can definitely ping him on it.

  Due to holidays, the last time he did that was somewhere mid-December, so the 
stable branches are running a bit behind.

> Similarly the 2021.02.x LTS branch is at 1.16.10, when the security
> fixes landed in 1.16.12.
> 
> I've just submitted 1.17.6 to the list and will submit 1.16.12 for
> 2021.02.x as well.

  A 1.1.6.12 bump for the 2021.02.x branch will definitely be welcome.

  Regards,
  Arnout

> 
> On Sun, Dec 12, 2021 at 1:01 AM Christian Stewart <christian@paral.in> wrote:
>> --- a/package/go/go.hash
>> +++ b/package/go/go.hash
>> @@ -1,3 +1,3 @@
>>   # From https://golang.org/dl/
>> -sha256  705c64251e5b25d5d55ede1039c6aa22bea40a7a931d14c370339853643c3df0  go1.17.3.src.tar.gz
>> +sha256  3defb9a09bed042403195e872dcbc8c6fae1485963332279668ec52e80a95a2d  go1.17.5.src.tar.gz
>>   sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
>> diff --git a/package/go/go.mk b/package/go/go.mk
>> index 59177e54db..0d9ceab2bb 100644
>> --- a/package/go/go.mk
>> +++ b/package/go/go.mk
>> @@ -4,7 +4,7 @@
>>   #
>>   ################################################################################
>>
>> -GO_VERSION = 1.17.3
>> +GO_VERSION = 1.17.5
>>   GO_SITE = https://storage.googleapis.com/golang
>>   GO_SOURCE = go$(GO_VERSION).src.tar.gz
> 
> Thanks & best regards,
> Christian Stewart
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
