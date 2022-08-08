Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB97FC00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 23:42:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5089960AE2;
	Mon,  8 Aug 2022 23:42:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5089960AE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1HZnLeuznJJH; Mon,  8 Aug 2022 23:42:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6982760A68;
	Mon,  8 Aug 2022 23:42:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6982760A68
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3766A1BF330
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 23:41:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10B8C408FD
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 23:41:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10B8C408FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FVK83p8aevDZ for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 23:41:56 +0000 (UTC)
X-Greylist: delayed 00:07:03 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDADC4097F
Received: from smtpdh17-su.aruba.it (smtpdh17-su.aruba.it [62.149.155.128])
 by smtp4.osuosl.org (Postfix) with ESMTP id BDADC4097F
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 23:41:55 +0000 (UTC)
Received: from [192.168.8.155] ([86.32.63.136])
 by Aruba Outgoing Smtp  with ESMTPSA
 id LCGnoxjV5ZPAlLCGoocK62; Tue, 09 Aug 2022 01:34:50 +0200
Message-ID: <6b65aab2-a77e-15f4-fcbc-6134bd09a226@benettiengineering.com>
Date: Tue, 9 Aug 2022 01:34:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220806153651.4013424-1-giulio.benetti@benettiengineering.com>
 <20220807002123.6ad5ef3b@windsurf>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220807002123.6ad5ef3b@windsurf>
X-CMAE-Envelope: MS4xfOjK+wzFviaM96FWf6nSteLotkVNoAkGkqzwERpkrNKO7pM/LUrwA0R1/BPjRfZa+Q1ZK2rMdm1nJd+he0cayvInU2nrYxUap29rx4Olw+g9gwNUB4ej
 3WWDUIkdEuzDyP7VOiQawG9BUlkA9c2rBY351ftDUEIb6C1dzyUAmETKXBfxL8tqplYxHjF72mr8uWSxPcrC1WwraU+JMrP01ZQKZbSkKrcmoDAOybyuujEi
 De3bjIWQB3F/cV8nWO3+/PSnMf4ZMtUqOBvlYlpCWrwgz4L0kqn7q4FziG1Yjvv3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1660001690; bh=EFSI0JJFaFYYo8j/O0/bx86IEZZk42qrA/+zyYJzWlg=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=O20RE3H7Qfii+hhXRLuYjJHWDDNu4pK2xViCf2alTW9Pdi4Lk8xWo9ob9I1wCav8q
 QwqoDmj+MxjVliM8IasbKqA1tNSEx4ccFsTYJURp8tIUZ0uAZ6C2YiEDQNVgcJ5UIK
 UcgwKYteZXOp23BUJQg2T9E7LJzecWgJ2dnCdoaD2KEwB5CxMjAOtzcHWC1gDH0U06
 GdXuClpcmfZ+LHdvdmpkpq6SKOLikP7OYdF+v/Ap+hEqc1jlIiMx1wrrfdNK+KXGZt
 m/gX5iAGxQPjvkvm9V0eoWZzEOowjLuiag0wHrMvAZTvp3OLbkXYVxVfNWSd+7i0SD
 9FaRaArd+Yhsw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=O20RE3H7
Subject: Re: [Buildroot] [PATCH] package/libnss: fix build failure due to
 missing missing libnspr in link list
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On 07/08/22 00:21, Thomas Petazzoni via buildroot wrote:
> Subject:
> Re: [Buildroot] [PATCH] package/libnss: fix build failure due to missing 
> missing libnspr in link list
> From:
> Thomas Petazzoni via buildroot <buildroot@buildroot.org>
> Date:
> 07/08/22, 00:21
> 
> To:
> Giulio Benetti <giulio.benetti@benettiengineering.com>
> CC:
> Joseph Kogut <joseph.kogut@gmail.com>, buildroot@buildroot.org
> 
> 
> On Sat,  6 Aug 2022 17:36:51 +0200
> Giulio Benetti<giulio.benetti@benettiengineering.com>  wrote:
> 
>> FREEBL_NO_DEPEND is usually set to 1 and this means that:
>> ```
>> build libfreebl3.so with no NSPR and libnssutil3.so dependencies by
>> default
>> ```
>> But PR_SetError() and other PR_*() APIs are contained right in
>> NSPR(libnspr) that we already build and it's a libnss dependency, so let's
>> make libnss to link with libnspr by default by setting FREEBL_NO_DEPEND to
>> 0.
>>
>> Fixes:
>> http://autobuild.buildroot.net/results/c5b440bae5cd6dc6d5f1a632a6b5950b32d13f66/
>>
>> Signed-off-by: Giulio Benetti<giulio.benetti@benettiengineering.com>
> Thanks for the debugging, but I have to say I am not convinced by the
> explanation. Why is FREEBL_NO_DEPEND=1 the default if it doesn't work?
> Why was it working before, and what broke it?

Yes, you're right. I'm going back to previous versions and I've found
this bug affects back to libnss 3.72 and still have to try older ones.
This is to find if it is something libnss related or something else in
the environemnt.

This bug didn't show up always with every version bump.

> Setting or not setting FREEBL_NO_DEPEND has impact in a lot of parts of
> the libnss code, I don't think we should do this lightly.

Yes, totally. I've realized only now that every call to PR_*() and
PORT_*() API would end up to abort(). So I've misinterpreted the meaning
of FREEBL_NO_DEPEND. It seemed like it implemented part of libnspr
locally but that's not true at all.

> Could you research more when this broke (i.e which version bump in
> Buildroot), and then which commit in NSS causes this breakage? 

I'm doing like that and I'm back to 3.72, I'll keep rolling back.
Since Autobuilders didn't show up the problem before 3.77 I suspect
that the cause can be not due to libnss itself, but external, or more
likely libnss doesn't handle something external that is "too new".
So I keep on digging. It's a pity they have chosen to go for gyp
instead of other build system, this complicates things a lot since
actual Makefile is not linear at all. Anyway I don't see alternatives.

> I don't
> want to blindly set this obscure variable.

Yes

> Has this issue been reported upstream?

Still not. But usually I fix the problem and only later I report the
issue(Bug - xxxxx) with the patch fixing it.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
