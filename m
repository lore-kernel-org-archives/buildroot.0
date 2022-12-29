Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47029C4332F
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 18:36:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CDDCD400DD;
	Thu, 29 Dec 2022 18:35:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDDCD400DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oW9FFUMXp8Q3; Thu, 29 Dec 2022 18:35:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C32B840143;
	Thu, 29 Dec 2022 18:35:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C32B840143
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E50481BF390
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 18:35:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C09FD60655
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 18:35:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C09FD60655
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hh-fhjxPEAUi for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 18:35:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4542560640
Received: from mx1.sonologic.net (mx1.sonologic.nl
 [IPv6:2a01:4f8:121:43cd::1:9])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4542560640
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 18:35:53 +0000 (UTC)
Received-SPF: pass (mx1.sonologic.net: authenticated connection)
 receiver=mx1.sonologic.net; client-ip=178.63.120.221; helo=[10.1.3.45];
 envelope-from=gmc@sonologic.nl;
 x-software=spfmilter 2.001 http://www.acme.com/software/spfmilter/ with
 libspf2-1.2.10; 
Received: from [10.1.3.45] (portal.sonologic.net [178.63.120.221])
 (authenticated bits=0)
 by mx1.sonologic.net (8.17.1/8.16.1) with ESMTPSA id 2BTIZnmV002324
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Thu, 29 Dec 2022 18:35:51 GMT (envelope-from gmc@sonologic.nl)
X-Authentication-Warning: mx1.sonologic.net: Host portal.sonologic.net
 [178.63.120.221] claimed to be [10.1.3.45]
Message-ID: <98395477-5b91-fdcc-e0b9-39bd66b46c08@sonologic.nl>
Date: Thu, 29 Dec 2022 19:35:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-GB
To: Joel Carlson <JoelsonCarl@gmail.com>
References: <20221228230326.3799157-1-JoelsonCarl@gmail.com>
 <189a295b-c984-9580-ced2-b8c0b34d3210@sonologic.nl>
 <CA+1k=2bP59qt6dVnqhu1NCsakdHcTJ6mdU82swM76N_ifO=tnA@mail.gmail.com>
From: Koen Martens <gmc@sonologic.nl>
In-Reply-To: <CA+1k=2bP59qt6dVnqhu1NCsakdHcTJ6mdU82swM76N_ifO=tnA@mail.gmail.com>
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4
 (mx1.sonologic.net [178.63.120.202]); Thu, 29 Dec 2022 18:35:51 +0000 (UTC)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=sonologic.nl; s=dkim; 
 t=1672338951; bh=LLCTKE4aMnbF8Daye1umRNm2At3XRXLYiVDuDDp/1+A=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=BXhfKCEISfYanN8MYDGlMv46GxOu/v5FJv9uqmpnk3wJLtDSphcceOjuZthpCVE3z
 VN9D1+Lc/oy8FSvXxsdBxxjKwWYgFNIy6lhzHJdw8/iZmzu8R8FUB7dWD4Ye628tuR
 ldKvlc5KlQ8Pb/AUxE2o6Lf5kgjw1ntTKd52t3CtQrFfWXfr6KBoxUm2oWx2bEqMs/
 iu1aq3wT1oInKsqmKpdVvb+MTl5AXV53z9x2/BaMZhB+5vD0lfzrbPWOxcVuKJICbI
 SOG51NPp2MNQHHTy8vWrBiV4aP5Xbpb2Np09xiBdfmWX9ItZZGAUJ+vdQNGvUEw1Ia
 zsOitFSmAXKVQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=sonologic.nl header.i=@sonologic.nl
 header.a=rsa-sha256 header.s=dkim header.b=BXhfKCEI
Subject: Re: [Buildroot] [PATCH 1/1] package/capnproto: bump version to
 0.10.3
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


On 29-12-2022 19:19, Joel Carlson wrote:
> On Thu, Dec 29, 2022 at 6:36 AM Koen Martens <gmc@sonologic.nl> wrote:
>> Hey Joel,
>>
>> Cool. Did you manage to get it to compile on all platforms? I tried a
>> while ago to bump the version, but sadly ran into compilation failures
>> on a handful of platforms, which is why I never submitted a patch. I
>> didn't have the time to figure out why it failed, what would be needed
>> to make it pass or how to patch the configuration requirements to not
>> show up on the affected platforms.
> I used "./utils/test-pkg -a" and of the 44 toolchains that it goes
> through, they were all OK or SKIPPED.  I don't test much beyond that.
> If that isn't mostly inclusive of all the variations, then we'll soon
> know through the autobuilder reports.

Oh, great. That's what I did too, but with an older version (10.2 
perhaps, or maybe 10.1). I guess whatever was broken got fixed in 10.3 
then!

>> I guess we'll find out soon enough, when I start getting mails from the
>> automated build system that it's failing (or not). Just in case, I
>> currently and in the near future do not have the time to diagnose any
>> failures that might result from bumping the version. Hope that if they
>> do fail, you can have a look.
>>
>> It's probably best if I remove myself as a maintainer for this package,
>> perhaps you'd like to take over?
> I am actually already in DEVELOPERS for capnproto, as I revived and
> pushed through your original patch to add it that had stalled at the
> time.
>
> So I'll still remain on DEVELOPERS for capnproto if you remove
> yourself. Though I'll admit, my responsiveness to the packages I'm
> listed for is fairly slow (cmocka has had a build error on one
> toolchain for I don't know how long now...). And I honestly haven't
> used capnproto since adding it. We thought we were gonna use it on our
> system back when I added the package to buildroot, but then ended up
> using a different library.
>
> So yeah... that doesn't answer the question super well, but if you
> drop yourself, there will still be at least me (very slowly)
> eventually responding to issues for capnproto. =)

Well, let's keep things as they are then, since it seems we're both in 
the same position :) I'm not actually using buildroot for anything at 
all at the moment, but I do love the project, so I'll continue to do my 
part whenever possible to keep the two packages I'm maintaining somewhat 
up to date :) Between you and me, we should be able to keep capnproto going.

Cheers,

Koen

>
> -Joel
>
>> Apologies,
>>
>> Koen
>>
>> On 29-12-2022 00:03, Joel Carlson wrote:
>>> The 0.10 line offers minor improvements and bug fixes.
>>>
>>> The previous security bump from 0.9.1 to 0.9.2 fixed CVE-2022-46149,
>>> which was also present in 0.10.2, but is fixed within 0.10.3.
>>>
>>> Signed-off-by: Joel Carlson <JoelsonCarl@gmail.com>
>>> ---
>>>    package/capnproto/capnproto.hash | 2 +-
>>>    package/capnproto/capnproto.mk   | 2 +-
>>>    2 files changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/package/capnproto/capnproto.hash b/package/capnproto/capnproto.hash
>>> index c3233e7c8b..0faf69d069 100644
>>> --- a/package/capnproto/capnproto.hash
>>> +++ b/package/capnproto/capnproto.hash
>>> @@ -1,3 +1,3 @@
>>>    # Locally calculated
>>> -sha256  4fe1ca8ab90859f33f08d2c4fcd7099e2983b0b946beecebd2fe051e3a64c67e  capnproto-0.9.2.tar.gz
>>> +sha256  e07446f56043c983e009038e69d18ff86a2924909f0b518ccf47eccf5ac03919  capnproto-0.10.3.tar.gz
>>>    sha256  9564998c8d7f270a61a8b89869a8d17a9d5e3783b64027788b5e339ec8479e10  LICENSE
>>> diff --git a/package/capnproto/capnproto.mk b/package/capnproto/capnproto.mk
>>> index 23f128455a..84acf5fc65 100644
>>> --- a/package/capnproto/capnproto.mk
>>> +++ b/package/capnproto/capnproto.mk
>>> @@ -4,7 +4,7 @@
>>>    #
>>>    ################################################################################
>>>
>>> -CAPNPROTO_VERSION = 0.9.2
>>> +CAPNPROTO_VERSION = 0.10.3
>>>    CAPNPROTO_SITE = $(call github,capnproto,capnproto,v$(CAPNPROTO_VERSION))
>>>    CAPNPROTO_LICENSE = MIT
>>>    CAPNPROTO_LICENSE_FILES = LICENSE
>> --
>> Software architecture & engineering: https://www.sonologic.se/
>> Sci-fi: https://www.koenmartens.nl/
>>
-- 
Software architecture & engineering: https://www.sonologic.se/
Sci-fi: https://www.koenmartens.nl/

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
