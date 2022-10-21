Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B43C433FE
	for <buildroot@archiver.kernel.org>; Fri, 21 Oct 2022 21:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4060E4156D;
	Fri, 21 Oct 2022 21:04:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4060E4156D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 69rXFejTOovR; Fri, 21 Oct 2022 21:04:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4061F409C8;
	Fri, 21 Oct 2022 21:04:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4061F409C8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 192C91BF846
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 21:04:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 01048409C8
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 21:04:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01048409C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sJrRDDV5nGt1 for <buildroot@lists.busybox.net>;
 Fri, 21 Oct 2022 21:04:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7CFA1409B5
Received: from mail.h6t.eu (cloud.h6t.eu [167.235.55.38])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7CFA1409B5
 for <buildroot@buildroot.org>; Fri, 21 Oct 2022 21:04:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 382D621472A; Fri, 21 Oct 2022 23:04:07 +0200 (CEST)
Message-ID: <8fee3b0b-e481-455b-5674-b152965b2525@h6t.eu>
Date: Fri, 21 Oct 2022 23:04:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
To: James Hilliard <james.hilliard1@gmail.com>
References: <20221019220019.8418-1-moritz@h6t.eu>
 <20221019220019.8418-2-moritz@h6t.eu>
 <CADvTj4rBgVG3FYMeT1DO_83w5JCJm8hAVZBKf6gq93SzEwpPdg@mail.gmail.com>
 <1c451d96-4f2a-ed48-c7a0-ab83cb935361@h6t.eu>
 <CADvTj4p7RzkEx4NPvPde1FpSWRvRXy+Z_7nK7RceFQfX1zachA@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CADvTj4p7RzkEx4NPvPde1FpSWRvRXy+Z_7nK7RceFQfX1zachA@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=h6t.eu; s=dkim; 
 t=1666386249; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=vnISHd0m+Pa8rho5iAFgYSYQl3pnKkzmcE7ctUTN0Z4=;
 b=T9WIlnyr8n/UzPEInwmN1NoAXnC+KdJPgQ0kQjhfxmx82j8OHlHQ97z6m4A4TO+MpGTabo
 yfPJN4ZZRoqWKDuGgQaF13e2kxlPg5sjeblAqBFMNqXDwK0wwGJ/p6g9S+xe8GYY6ffMqo
 jM//uIygcJFIrEv9AduYnnkHp/jit1nFToGpUAOIEgvyabce5HVMoOvocQJaKWVuy8verT
 5qtYXJgoAfw9GdYYy2AAK4lDIN2GPE7yBhBWXuB/1OYomSBVqbKCqm7cL8eyZ/KR95DJ/P
 PdqSOuL12QtkNvOReVvELVjSq1TiIAHkNH9ACp4V+MVysEuvmG3A2cp1lq8jsw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=h6t.eu header.i=@h6t.eu header.a=rsa-sha256
 header.s=dkim header.b=T9WIlnyr
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

Am 21.10.22 um 18:41 schrieb James Hilliard:
> On Fri, Oct 21, 2022 at 2:48 AM Moritz Bitsch <moritz@h6t.eu> wrote:
>>
>> Am 20.10.22 um 00:12 schrieb James Hilliard:
>>
>>> On Wed, Oct 19, 2022 at 6:02 PM Moritz Bitsch via buildroot
>>> <buildroot@buildroot.org> wrote:
>>>> From: Moritz Bitsch <moritz@h6t.eu>
>>>>
>>>> The cargo --release flag is used to create optimized builds, not supplying
>>>> --release has major performance implications.
>>> Is there an env variable we can use to set this instead?
>>>
>>> Some packages use cargo without the cargo infrastructure, for example
>>> we have a number of pyo3(https://pyo3.rs/) based packages that use the
>>> cargo env but not the cargo build commands from here.
>> I could not find any env variable for switching profiles.
>>
>> I had a look at python-rtoml, and the used setuptools-rust: supplying
>> --debug to
>> the "setup.py build" removes the --release flag from the cargo invocation.
> 
> Hmm, there are two pyo3 build backends, only setuptools-rust uses setup.py,
> we also have maturin which is pep517 based.

I'm in no way a a python expert, so take my words with a grain of salt.

I could not find a way to specify what build profile is used by maturin 
when in a pep517 build. Even if maturin supports the -r flag for release 
builds when called directly.

> 
>>>> Signed-off-by: Moritz Bitsch <moritz@h6t.eu>
>>>> ---
>>>>    package/pkg-cargo.mk | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
>>>> index f7e3f39503..e0556252fa 100644
>>>> --- a/package/pkg-cargo.mk
>>>> +++ b/package/pkg-cargo.mk
>>>> @@ -119,7 +119,7 @@ define $(2)_BUILD_CMDS
>>>>                   $$($(2)_CARGO_ENV) \
>>>>                   cargo build \
>>>>                           --offline \
>>>> -                       $$(if $$(BR2_ENABLE_DEBUG),,--release) \
>>>> +                       $$(if $$(BR2_ENABLE_RUNTIME_DEBUG),,--release) \
>>>>                           --manifest-path Cargo.toml \
>>>>                           --locked \
>>>>                           $$($(2)_CARGO_BUILD_OPTS)
>>>> --
>>>> 2.37.3
>>>>
>>>> _______________________________________________
>>>> buildroot mailing list
>>>> buildroot@buildroot.org
>>>> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
