Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC9FBC433EF
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 15:10:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62BDA813EA;
	Sat,  1 Jan 2022 15:10:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Ta21Mb_6Ns4; Sat,  1 Jan 2022 15:10:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4CC1813C4;
	Sat,  1 Jan 2022 15:10:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 560401BF59B
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 15:10:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4297140181
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 15:10:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PxkN3zzhjU7a for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 15:10:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0641.aruba.it (smtpcmd0641.aruba.it [62.149.156.41])
 by smtp2.osuosl.org (Postfix) with ESMTP id 65F3B400D9
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 15:10:12 +0000 (UTC)
Received: from [192.168.50.18] ([146.241.138.59])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 3g1JnSPJpVJjR3g1Jnlcfh; Sat, 01 Jan 2022 16:10:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1641049810; bh=mie5gcvV0PjsNzcLPLUGITvqKwivADlsWGkgQGpqLcQ=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=F7TXZE4YOawqE6t/i6IwoORcMl77rYh66rT1OJdq11hmRotkt+EGxUfQ40J+CC1rg
 85CvM4igcjUfDvMvF2LcWP4HJ0dRyzvI5PTRPSwuLNKv72zx+gvn1NUYyciniXCu2r
 P+1Fj0zeNCFWii86ugEB791KhUObhW9+NE5xJh9mgYelY9tlFc2/RvfOh0UNfkRJrs
 q5yd4WFO95IyOaKMt8jgx4Q5C5SkerMkkYRWSOsOUvYQkGhBh5MsGe3wTqikHcKq/6
 UqEfZVst6rm+rpIUJ0pSutiObLFgI7p+xS7BYY0Bg9NPfIjlnTggBTya0AAb0n5cC0
 UHdI3/r0NkTTA==
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20210930231424.249681-1-giulio.benetti@benettiengineering.com>
 <20220101115058.0515c8d9@windsurf>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <9c4d8993-46b2-8f1a-6aa3-bdd9957b783c@benettiengineering.com>
Date: Sat, 1 Jan 2022 16:10:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220101115058.0515c8d9@windsurf>
Content-Language: en-US
X-CMAE-Envelope: MS4wfE8QBVuFEEC4U5QkzQBal/ySbmO0RrVHXby+HmKMGSgsj1QXUS0w9B2+JygcBlMx6OgY33GERPQao1TnF0O7I9wrIwvP5IJ1HJbKUc8KXXe8kKrvOtnX
 WPX7Yj28MDoflwmyHxuwz1Xu8WewUZYAsL4XIi5/Z0r5FucaA4Vm/jzqkHu/gYAEhI80t29D/90QYlpxX2iw1BDsnhv7SE7S9I61M83gEKkaeblPasDrVCKD
 xOF+DtilTt6mzYdz2Ah/aA==
Subject: Re: [Buildroot] [buildroot-test] scripts/autobuild-run: extend
 timeout from 120 to 180 minutes
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

Hi Thomas,

On 01/01/22 11:50, Thomas Petazzoni wrote:
> Hello Giulio,
> 
> On Fri,  1 Oct 2021 01:14:24 +0200
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> During the last months some package started to timeout, but this is not due
>> to toolchain infinite loop. I think it's due to the increase of the source
>> code files' length and to complexity of toolchains or even slow compiling
>> time. For example python-uvloop and python-lxml only take long time to
>> build with -Os optimization and this makes it seem a TIMEOUT but it's not.
>> So let's extend timeout setting from 120 to 180 minutes to avoid false
>> TIMEOUTs.
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> 
> Do you have a specific example where you have seen a failure?

Not anymore, it's been only in September. 2 days ago I was right 
thinking about dropping this patch when checking patchwork.

> Please
> note that this HUNG_BUILD_TIMEOUT value is the per-step timeout: it
> verifies that one step of one particular package doesn't take more than
> 120 minutes.

Ah, I thought the entire build, but that makes no sense since some build 
can take way more than 2 hours.

> Unless you have a specific example where you have seen this timeout
> causing false positives, I'm not really keen on applying such a patch
> as it would cause situations where the build is really stuck to be
> stuck for 3 hours instead of 2.

Yes, I see you've already marked it as rejected.

> Did you identify that the python-uvloop and python-lxml packages really
> took more than 2 hours to build? I did see at
> http://autobuild.buildroot.net/?status=TIMEOUT those timeouts dating
> back from ~November. Did you reproduce the issue, and verified that the
> build indeed completes at some point? In general, if a simple package
> such as python-uvloop or python-lxml takes more than 2 hours to build,
> it means that the compiler (or linker) has gone crazy in an infinite
> loop, and the build will in fact never finish.

It was only my suspicious as specified in commit log. I couldn't 
reproduce it and I thought it was due to the autobuilder's host.

And yes, now that I know it's a per-step timeout it doesn't make sense 
at all for such little packages.

Thank you
Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
