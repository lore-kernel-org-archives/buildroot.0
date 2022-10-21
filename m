Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3104C433FE
	for <buildroot@archiver.kernel.org>; Fri, 21 Oct 2022 06:48:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAEEA418D9;
	Fri, 21 Oct 2022 06:48:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAEEA418D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S3EkAnU2djre; Fri, 21 Oct 2022 06:48:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8579418D0;
	Fri, 21 Oct 2022 06:48:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8579418D0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 06D481BF954
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 06:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E37D2842D3
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 06:48:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E37D2842D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K5b1-ZRtbPr1 for <buildroot@lists.busybox.net>;
 Fri, 21 Oct 2022 06:48:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5501184260
Received: from mail.h6t.eu (cloud.h6t.eu [IPv6:2a01:4f8:1c1e:8216::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5501184260
 for <buildroot@buildroot.org>; Fri, 21 Oct 2022 06:48:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BEE5521472A; Fri, 21 Oct 2022 08:48:20 +0200 (CEST)
Message-ID: <1c451d96-4f2a-ed48-c7a0-ab83cb935361@h6t.eu>
Date: Fri, 21 Oct 2022 08:48:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
To: James Hilliard <james.hilliard1@gmail.com>
References: <20221019220019.8418-1-moritz@h6t.eu>
 <20221019220019.8418-2-moritz@h6t.eu>
 <CADvTj4rBgVG3FYMeT1DO_83w5JCJm8hAVZBKf6gq93SzEwpPdg@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CADvTj4rBgVG3FYMeT1DO_83w5JCJm8hAVZBKf6gq93SzEwpPdg@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=h6t.eu; s=dkim; 
 t=1666334901; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=7+O9rvRIOXbULimyq78tGT2sv5HyywF7+Bds7gKwwHE=;
 b=RJQnEXW10rcjtMo+qQWG9hbbzAM538Jz0+yBhp3CdOzouhbN7Ko+BqC7NNCWrRFMVGeL9i
 jlXjMZHksny/wB7caQt0TeA6qyqAonDRIXHuUMIayeRKbc+v8L7dOlhavM5F4v5wK1tfHa
 ClPjKq1aLGrrDHrNQbhMSTbC4not72MelhjRAYRwZ1YJcdL6fjr7ifBjdXkTkX8EJohr2F
 Kduqvs8VrfXprfgW+ZZKXp+2KRmpnnTSYq0kI6wrNuOssQCxbsO7x7AYpkvZCT5PuFxZ8X
 FjYLUTUBnT+unpkCEtUmLA+1r60mvk50AXWG6a//sd4SDsvJuam1EbixOOIEmA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=h6t.eu header.i=@h6t.eu header.a=rsa-sha256
 header.s=dkim header.b=RJQnEXW1
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

Am 20.10.22 um 00:12 schrieb James Hilliard:

> On Wed, Oct 19, 2022 at 6:02 PM Moritz Bitsch via buildroot
> <buildroot@buildroot.org> wrote:
>> From: Moritz Bitsch <moritz@h6t.eu>
>>
>> The cargo --release flag is used to create optimized builds, not supplying
>> --release has major performance implications.
> Is there an env variable we can use to set this instead?
>
> Some packages use cargo without the cargo infrastructure, for example
> we have a number of pyo3(https://pyo3.rs/) based packages that use the
> cargo env but not the cargo build commands from here.
I could not find any env variable for switching profiles.

I had a look at python-rtoml, and the used setuptools-rust: supplying 
--debug to
the "setup.py build" removes the --release flag from the cargo invocation.
>> Signed-off-by: Moritz Bitsch <moritz@h6t.eu>
>> ---
>>   package/pkg-cargo.mk | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
>> index f7e3f39503..e0556252fa 100644
>> --- a/package/pkg-cargo.mk
>> +++ b/package/pkg-cargo.mk
>> @@ -119,7 +119,7 @@ define $(2)_BUILD_CMDS
>>                  $$($(2)_CARGO_ENV) \
>>                  cargo build \
>>                          --offline \
>> -                       $$(if $$(BR2_ENABLE_DEBUG),,--release) \
>> +                       $$(if $$(BR2_ENABLE_RUNTIME_DEBUG),,--release) \
>>                          --manifest-path Cargo.toml \
>>                          --locked \
>>                          $$($(2)_CARGO_BUILD_OPTS)
>> --
>> 2.37.3
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
