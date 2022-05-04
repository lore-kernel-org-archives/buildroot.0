Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F5F5C433F5
	for <buildroot@archiver.kernel.org>; Wed,  4 May 2022 21:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34AC280D8C;
	Wed,  4 May 2022 21:06:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mTq7eDeKh4DE; Wed,  4 May 2022 21:06:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F106E83FA4;
	Wed,  4 May 2022 21:06:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 08DDA1BF8A8
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 21:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EBE7983FA4
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 21:06:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id byRum5w4tjOf for <buildroot@lists.busybox.net>;
 Wed,  4 May 2022 21:06:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4E9F483FA2
 for <buildroot@buildroot.org>; Wed,  4 May 2022 21:06:20 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id n18so2567085plg.5
 for <buildroot@buildroot.org>; Wed, 04 May 2022 14:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3zWmhWDI4Xo6qrbmBrD6zW9KC1zFPEaWFk4ulmUjyzo=;
 b=JTyIeOj07yfCBErO+7qbqutFJKnlA7bM7zSadPjJHFMXaRosOH3FQLDgr1S02xTYPA
 4y4KdYyc7bdJA5boXG2hBZcHzLPgJteR8QY6flTA8NwUJb8V7GrMLIcY00aFDLSsj5pr
 J7tx3+RT4GhWTYAPoGhPMNh3AR2l6nbRMpQUDREn0sHdsQI5EkuaVzqQwrLBcorCytEz
 SPzuLzNK867KBLNy+UyvVbbMCA221r0XpkX004tQseLP8E5Id9tegtxr1F1b3xHuLRGe
 GIIicRdR1mx8Az5pZzBUvetBpdzp6WuOjr1KUqWJSDEamujPMm9LIDP3cVEclYHF3VyX
 v2sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3zWmhWDI4Xo6qrbmBrD6zW9KC1zFPEaWFk4ulmUjyzo=;
 b=CtdZk4LxIlyYEpoAWi6DsOvLiR8D7VLz+wHv554j3ORif3Q4Ejd5zhKsF8Wrplx+Py
 iiiOkyUMDVd+5XFz5JKfF4jKG8erGcZjwpJWnKMKrqo+KLjkJKL3x4BEaAPInlLovGOw
 mY7S4ssXgnXb94mSK6GuFuAO3ZmLF6g48djQahIJiH0r/sL3BQjJZXwO1wjGjXUl09Kx
 deXgtGOuZBVudLxwmvI8aLYHo7G/kekO/znEhkfzUvjDSLhKRVMBGo3BSTpNfjYyZfZj
 lfEZ1v/Ww3kj40JuAYr52msR8UMpqZuKpnIcFqKhQbfdjYiXJpNSYwMl96APkNi4QqzR
 yZZw==
X-Gm-Message-State: AOAM531jxBT+njgqyGGwKn7glVE47RvwQM6bfTK5R5CjwgE+brBPPbfV
 vuGXwQFOJFwpZJzsJKpjBfs=
X-Google-Smtp-Source: ABdhPJyHODtVemTG1dcp0mq27c4kANVXIl0FiPN8JZoXcWysTQ2c2dop6iT0KxzOh/VDjGnJ6Qt4hw==
X-Received: by 2002:a17:90b:1811:b0:1dc:7f26:458a with SMTP id
 lw17-20020a17090b181100b001dc7f26458amr1698618pjb.150.1651698379734; 
 Wed, 04 May 2022 14:06:19 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id
 gz9-20020a17090b0ec900b001cd630f301fsm3711630pjb.36.2022.05.04.14.06.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 14:06:19 -0700 (PDT)
Message-ID: <43e15313-c8b8-f549-089b-eb3cbb5943f4@gmail.com>
Date: Wed, 4 May 2022 14:06:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Peter Korsgaard <peter@korsgaard.com>
References: <20220504182038.1828037-1-f.fainelli@gmail.com>
 <87wnf1106v.fsf@dell.be.48ers.dk>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <87wnf1106v.fsf@dell.be.48ers.dk>
Subject: Re: [Buildroot] [PATCH v2] package: Add cpulimit
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
Cc: yann.morin.1998@free.fr, thomas.petazzoni@bootlin.com, mmayer@broadcom.com,
 buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 5/4/22 14:02, Peter Korsgaard wrote:
>>>>>> "Florian" == Florian Fainelli <f.fainelli@gmail.com> writes:
> 
>   > Cpulimit is a tool which limits the CPU usage of a process (expressed in
>   > percentage, not in CPU time). It is useful to control batch jobs, when
>   > you don't want them to eat too many CPU cycles.
> 
>   > Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>   > ---
>   > Changes in v2:
> 
>   > - added DEVELOPERS entry
>   > - back ported 2 patches from upstream project pull requests to address
>   >   build warnings
>   > - added _GNU_SOURCE to the CFLAGS
>   > - added hash file
>   > - corrected check-package warnings
> 
>   > +++ b/package/cpulimit/0001-Fix-crash-and-compiler-warnings.patch
>   > @@ -0,0 +1,56 @@
>   > +From d1f42082590bed42cbf6ef1bf37e936df1afbf6b Mon Sep 17 00:00:00 2001
>   > +From: Tobias Tangemann <tobias@tangemann.org>
>   > +Date: Thu, 9 Jul 2015 23:51:07 +0200
>   > +Subject: [PATCH] Fix crash (and compiler warnings)
>   > +
>   > +Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>   > +---
>   > + src/cpulimit.c                | 2 +-
>   > + src/process_group.c           | 4 ++++
>   > + tests/process_iterator_test.c | 2 +-
>   > + 3 files changed, 6 insertions(+), 2 deletions(-)
>   > +
>   > +diff --git a/src/cpulimit.c b/src/cpulimit.c
>   > +index 50eabeacf214..42d7ca280738 100644
>   > +--- a/src/cpulimit.c
>   > ++++ b/src/cpulimit.c
>   > +@@ -43,7 +43,7 @@
>   > + #include <sys/types.h>
>   > + #include <sys/wait.h>
>   > +
>   > +-#ifdef __APPLE__ || __FREEBSD__
>   > ++#if defined(__APPLE__) || defined(__FREEBSD__)
>   > + #include <libgen.h>
>   > + #endif
> 
> Why is this patch interesting in the context of Buildroot? Presumably
> neither __APPLE__ or __FREEBSD__ will be defined?

Right, neither would be defined and therefore we would get the following 
build warning:

/usr/include/x86_64-linux-gnu/sys/sysctl.h:21:2: warning: #warning "The 
<sys/sysctl.h> header is deprecated and will be removed." [-Wcpp]
    21 | #warning "The <sys/sysctl.h> header is deprecated and will be 
removed."
       |  ^~~~~~~
cpulimit.c:46:18: warning: extra tokens at end of #ifdef directive
    46 | #ifdef __APPLE__ || __FREEBSD__
       |                  ^~


> 
> 
>   > +################################################################################
>   > +#
>   > +# cpulimit
>   > +#
>   > +################################################################################
>   > +
>   > +CPULIMIT_VERSION = v0.2
>   > +CPULIMIT_SOURCE = $(CPULIMIT_VERSION).tar.gz
> 
> You can drop CPULIMIT_SOURCE (which will make Buildroot use
> cpulimit-$(CPULIMIT_VERSION).tar.gz). Don't forget to update the .hash
> file as well?

OK

> 
>> +CPULIMIT_SITE = $(call github,opsengine,cpulimit,v$(CPULIMIT_VERSION))
> 
> You have a 'v' here AND in CPULIMIT_VERSION, please drop it from
> CPULIMIT_VERSION.

Will do, thanks Peter.
-- 
Florian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
