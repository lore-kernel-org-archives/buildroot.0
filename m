Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 452C3C48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 13:37:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6B22610F7;
	Tue,  6 Feb 2024 13:37:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6B22610F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xoiIKtRSZFJM; Tue,  6 Feb 2024 13:37:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 227926104A;
	Tue,  6 Feb 2024 13:37:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 227926104A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5EB641BF5AD
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 13:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4313A40137
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 13:37:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4313A40137
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bQsKhXzF6-UZ for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 13:37:18 +0000 (UTC)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E74524011C
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 13:37:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E74524011C
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40fdc63f4feso16613525e9.3
 for <buildroot@buildroot.org>; Tue, 06 Feb 2024 05:37:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707226636; x=1707831436;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=79yZeo+JJG58p8OaJhBR462QZWnWaaH88yggjl/ouVM=;
 b=rfBFyxhV8ivPmMRYbzvFmpccrWEvWDdzE6zoAW0KkjyHRIJP3gCo8xVncDYTJHmdSL
 L/hF2zcFR3+MXf7yKyvJ11oVOLwZGG0U9+mCliUI5h4kjPSPLL2wHdQg1UA/PbIORm7u
 AWCc7F3FYoChNgq0M9ipZq2RYHhmtPLHzF54inIX/MQIYNk7PRhCaFeAM+uxG56DZODE
 Iulkz+pb3M1Aiji9F9L+li9z+aULBqh02XG3UF7XHp+7uZZsWO50y0IcAjBZ2yH8AKuv
 +Ol/mHe028x9PUiIHXI7Y3cdmCDq0z0RQ1HeNJQz4TR5vVBCVLs94AOWO1rnow8n+5cj
 hwGQ==
X-Gm-Message-State: AOJu0Yy3odPc/H7hXwGim4YFFgPo41hDXnOMstksvOw4GSLVavE3lFmQ
 pk4bsUV1mhBxy7aR80CWLF6PjqnERPTtmnzsqKgN/jeHfdkVoskyfVFhcK8FAJlddVFhia3F3pL
 O
X-Google-Smtp-Source: AGHT+IE7R8Ubc6qtrjn76/9PNJf5QfdFgetEQoKJO3A48BmTw3gEDpJY3mPfVALB2merjdSDJb+8VQ==
X-Received: by 2002:a05:600c:4588:b0:40f:dd19:2abb with SMTP id
 r8-20020a05600c458800b0040fdd192abbmr2232752wmo.5.1707226635991; 
 Tue, 06 Feb 2024 05:37:15 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWkPP7JADadWYXVg62kRmDQ8AvlHjHZNYKTrRwRkFfHgbC0ywW/IaB/dFEUmjUhWG1r7kpr0AkVW2rCh0I4fdXCOyEk1Lmj/2eR+Q==
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 z6-20020a05600c0a0600b0040efc268713sm2064727wmp.26.2024.02.06.05.37.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 05:37:15 -0800 (PST)
Message-ID: <67502ba4-3f73-428e-802e-6ee9cbc1fe6a@mind.be>
Date: Tue, 6 Feb 2024 14:37:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, yegorslists@googlemail.com
References: <20240206132051.2838897-1-yegorslists@googlemail.com>
 <ZcI0bZt04f3jRhPk@landeda>
In-Reply-To: <ZcI0bZt04f3jRhPk@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707226636; x=1707831436; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=79yZeo+JJG58p8OaJhBR462QZWnWaaH88yggjl/ouVM=;
 b=bRa1Wo26BD2DbVcrPf1mAzO6omkGfUHae29Eafptpt/0Xc9IupwlElIuv2SyY/Acq4
 /VTY/jAryXiKJeCSVUCTL59DohwpaLoLGblwg3efXzZeU3+9Ei5iIbz6xfJ7k2KYBps5
 ldF2IqPSI+aP/oWTAE69E75UQ5tA3QXRK/ofznlINCgDsLvwnzx4zfZ9KWCB9tOh6FLC
 8qSMfDxGtTVkqeuQzf6GkltFBluARADH/d/L6gWToDI2khswnPSieDjJCvfxzXFPDJgy
 dOrAsHua2QR6LI/0cOJKvfwtb/FSv0BuxyHjL2o7y7km1AWzdDS08K19B7P/K6y8MVu0
 c7sg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=bRa1Wo26
Subject: Re: [Buildroot] [PATCH] Create a .gitignore file in the CANONICAL_O
 directory
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/02/2024 14:30, Yann E. MORIN wrote:
> Yegor, All,
> 
> On 2024-02-06 14:20 +0100, yegorslists--- via buildroot spake thusly:
>> From: Yegor Yefremov <yegorslists@googlemail.com>
>>
>> This .gitignore file ignores all files in an output directory and
>> hence doesn't change the git status.
>>
>> Remove "/output" entry from the main .gitignore file as it is already
>> handled by this general approach.
> 
> What are you trying to achieve with this that does not work currently?

  I you do `make O=output-test-mypkg` (which I do quite a lot), that output 
directory doesn't get ignored by git. We could ignore output* but maybe you name 
the output directory o-foo or something.

  Putting a .gitignore in a generated directory is a very elegant solution for 
that. It is used by e.g. virtualenv, pytest, and a load of other applications 
that generate output in a directory.

  Since the .gitignore is created in the output directory, it is no longer 
necessary to put output/ in the .gitignore file.


  All of the above could be put in the commit message, of course, but for me 
Yegor's commit message was sufficiently clear :-)

  Regards,
  Arnout


> 
> Regards,
> Yann E. MORIN.
> 
>> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>> ---
>>   .gitignore | 1 -
>>   Makefile   | 3 +++
>>   2 files changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/.gitignore b/.gitignore
>> index bb02d9f572..14b7ca5040 100644
>> --- a/.gitignore
>> +++ b/.gitignore
>> @@ -1,4 +1,3 @@
>> -/output
>>   /dl
>>   /.auto.deps
>>   /.config.cmd
>> diff --git a/Makefile b/Makefile
>> index ac625152c6..86d4444745 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -63,6 +63,9 @@ ifneq ($(findstring @,$(CANONICAL_O)),)
>>   $(error The build directory can not contain a '@')
>>   endif
>>   
>> +# Create a default .gitignore file that ignores everything
>> +$(shell echo "*" > "$(CANONICAL_O)/.gitignore")
>> +
>>   CANONICAL_CURDIR = $(realpath $(CURDIR))
>>   
>>   REQ_UMASK = 0022
>> -- 
>> 2.34.1
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
