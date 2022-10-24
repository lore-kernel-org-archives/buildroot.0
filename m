Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 948DBC38A2D
	for <buildroot@archiver.kernel.org>; Mon, 24 Oct 2022 09:15:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1878940869;
	Mon, 24 Oct 2022 09:15:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1878940869
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mHHBir-YAgcj; Mon, 24 Oct 2022 09:15:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DD55404AA;
	Mon, 24 Oct 2022 09:15:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DD55404AA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 322631BF2B8
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 09:15:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1AA0260B0E
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 09:15:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1AA0260B0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fPBxyWOGy5Pb for <buildroot@lists.busybox.net>;
 Mon, 24 Oct 2022 09:15:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60BCF60AE8
Received: from mail.h6t.eu (cloud.h6t.eu [IPv6:2a01:4f8:1c1e:8216::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 60BCF60AE8
 for <buildroot@buildroot.org>; Mon, 24 Oct 2022 09:15:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 80BAF214733; Mon, 24 Oct 2022 11:15:14 +0200 (CEST)
Message-ID: <b4f788bd-faa8-7643-6bd7-c0d269c7beb1@h6t.eu>
Date: Mon, 24 Oct 2022 11:15:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
To: James Hilliard <james.hilliard1@gmail.com>
References: <20221019220019.8418-1-moritz@h6t.eu>
 <20221019220019.8418-2-moritz@h6t.eu>
 <CADvTj4rBgVG3FYMeT1DO_83w5JCJm8hAVZBKf6gq93SzEwpPdg@mail.gmail.com>
 <1c451d96-4f2a-ed48-c7a0-ab83cb935361@h6t.eu>
 <CADvTj4p7RzkEx4NPvPde1FpSWRvRXy+Z_7nK7RceFQfX1zachA@mail.gmail.com>
 <8fee3b0b-e481-455b-5674-b152965b2525@h6t.eu>
 <CADvTj4qKt8kzhqiZDUEH9gaSZoS0cGi8bN2FYxU7hnN_iB9Lrw@mail.gmail.com>
In-Reply-To: <CADvTj4qKt8kzhqiZDUEH9gaSZoS0cGi8bN2FYxU7hnN_iB9Lrw@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=h6t.eu; s=dkim; 
 t=1666602916; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=paMkjl//GrAqH/t3QCfpqd5imVrthztJinjrCDJTPvo=;
 b=VWS+VeIlM9Niv984pCXWjgh1+AxEnLZZSmLbPa3wOjI+0JhqkZXiG1/efymGRJFVGieuul
 JqaPnLBLHGV7m31uW/TuqxUNnppnLd2oGJshNd3PwlDy0mVuFertO30nRmnEcQmyO5Ds+m
 +XVoYSBq6HgV8qCX3RVb2foU15QwyOTHiwdGlLlqmPUAvRb31S4Icl89K7UIXYuaU6NOQA
 KylTZZakztklaAakeeMMeIXql1vl/jus17mvbITbirIO7fyLzDssYgxF/FFcB337rzMSFK
 9aD5nlTwwofwVrTFlbifLU/KLKUBG5WbUP9fqHOUGomp7VGYdcw5Y5DvBVR7Vg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=h6t.eu header.i=@h6t.eu header.a=rsa-sha256
 header.s=dkim header.b=VWS+VeIl
Subject: Re: [Buildroot] [PATCH 1/2] package/pkg-cargo.mk: fix handling of
 runtime debug builds
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
From: Moritz Bitsch via buildroot <buildroot@buildroot.org>
Reply-To: Moritz Bitsch <moritz@h6t.eu>
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 22.10.22 um 00:57 schrieb James Hilliard:
> On Fri, Oct 21, 2022 at 5:04 PM Moritz Bitsch <moritz@h6t.eu> wrote:
>>
>> Am 21.10.22 um 18:41 schrieb James Hilliard:
>>> On Fri, Oct 21, 2022 at 2:48 AM Moritz Bitsch <moritz@h6t.eu> wrote:
>>>>
>>>> Am 20.10.22 um 00:12 schrieb James Hilliard:
>>>>
>>>>> On Wed, Oct 19, 2022 at 6:02 PM Moritz Bitsch via buildroot
>>>>> <buildroot@buildroot.org> wrote:
>>>>>> From: Moritz Bitsch <moritz@h6t.eu>
>>>>>>
>>>>>> The cargo --release flag is used to create optimized builds, not supplying
>>>>>> --release has major performance implications.
> 
> Looking at this further the cargo --release flag merely tells cargo to use the
> release profile rather than the dev profile, however the issue of optimizations
> being enabled or not is really a matter of what the profile configuration is,
> right now we are effectively choosing between the default release or default
> dev profile configuration which does not properly match the build settings.
> 
> Instead what we really want to do is configure all cargo profiles based on the
> selected buildroot build settings.
> 
> Unfortunately cargo doesn't have any env variable that selects a profile, but
> we can sidestep this simply by configuring both root profiles(which other
> profiles inherit from).
> 
> I think the existing cargo build flags are fine, I sent a patch which should fix
> the profile configurations so that they match the buildroot build settings, let
> me know if this fixes the optimization issue for you:
> https://lore.kernel.org/buildroot/20221021224448.3502942-1-james.hilliard1@gmail.com/

Thanks, for the detailed response. The mentioned patch works fine for my 
use case. I can reproduce the performance issue/improvement when 
switching between different optimization levels.

>>>>> Is there an env variable we can use to set this instead?
>>>>>
>>>>> Some packages use cargo without the cargo infrastructure, for example
>>>>> we have a number of pyo3(https://pyo3.rs/) based packages that use the
>>>>> cargo env but not the cargo build commands from here.
>>>> I could not find any env variable for switching profiles.
>>>>
>>>> I had a look at python-rtoml, and the used setuptools-rust: supplying
>>>> --debug to
>>>> the "setup.py build" removes the --release flag from the cargo invocation.
>>>
>>> Hmm, there are two pyo3 build backends, only setuptools-rust uses setup.py,
>>> we also have maturin which is pep517 based.
>>
>> I'm in no way a a python expert, so take my words with a grain of salt.
>>
>> I could not find a way to specify what build profile is used by maturin
>> when in a pep517 build. Even if maturin supports the -r flag for release
>> builds when called directly.
> 
> I think the real issue is actually not that the wrong build profile is
> being used
> so much as the build profile configuration itself is wrong.

After looking into some crates with different behavior when built in 
debug or release mode (for example rust-embed) I think that most of them 
check for enabled debug_assertions, which you handle in your patch.

I think the conditional --release switch should be removed. Your patch 
is by far the more precise solution.

>>
>>>
>>>>>> Signed-off-by: Moritz Bitsch <moritz@h6t.eu>
>>>>>> ---
>>>>>>     package/pkg-cargo.mk | 2 +-
>>>>>>     1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
>>>>>> index f7e3f39503..e0556252fa 100644
>>>>>> --- a/package/pkg-cargo.mk
>>>>>> +++ b/package/pkg-cargo.mk
>>>>>> @@ -119,7 +119,7 @@ define $(2)_BUILD_CMDS
>>>>>>                    $$($(2)_CARGO_ENV) \
>>>>>>                    cargo build \
>>>>>>                            --offline \
>>>>>> -                       $$(if $$(BR2_ENABLE_DEBUG),,--release) \
>>>>>> +                       $$(if $$(BR2_ENABLE_RUNTIME_DEBUG),,--release) \
>>>>>>                            --manifest-path Cargo.toml \
>>>>>>                            --locked \
>>>>>>                            $$($(2)_CARGO_BUILD_OPTS)
>>>>>> --
>>>>>> 2.37.3
>>>>>>
>>>>>> _______________________________________________
>>>>>> buildroot mailing list
>>>>>> buildroot@buildroot.org
>>>>>> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
