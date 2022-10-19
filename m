Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F6F5C4332F
	for <buildroot@archiver.kernel.org>; Wed, 19 Oct 2022 21:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D748B83E8B;
	Wed, 19 Oct 2022 21:29:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D748B83E8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q03wWOMTAEwy; Wed, 19 Oct 2022 21:29:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CE8683E8D;
	Wed, 19 Oct 2022 21:29:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CE8683E8D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EB94A1BF41B
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 21:29:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D43674013E
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 21:29:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D43674013E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id afJliUbiRiWD for <buildroot@lists.busybox.net>;
 Wed, 19 Oct 2022 21:29:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 887B64016F
Received: from mail.h6t.eu (cloud.h6t.eu [IPv6:2a01:4f8:1c1e:8216::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 887B64016F
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 21:29:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CEF842147B1; Wed, 19 Oct 2022 23:29:52 +0200 (CEST)
Message-ID: <38052548-1bbc-ea4e-de3b-88875218b812@h6t.eu>
Date: Wed, 19 Oct 2022 23:29:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20221019085353.8864-1-moritz@h6t.eu> <20221019210519.GH3666@scaer>
In-Reply-To: <20221019210519.GH3666@scaer>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=h6t.eu; s=dkim; 
 t=1666214993; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=EcK/tZ1Tk2PL1UOInjOyY5Fimg3LOBOhTR6IvA5VMKs=;
 b=XsQVAn8lcKC8+yggO5bsh7NDv/oFjQbKv7qLjkGwDaTOMH4D11dUj5RiBiZFmSgDBEjzx/
 0wvU1cOw2tpQRrsTXjw3ZRIA2L0ISlI+y9xW63xgfORfaPUjBoEqOHPqspFenOILdw2m+W
 +nytKPc7PGww3RDbJCiZSk+dpiKyoxnfmdFL/Wc4u2AAohD2JuVC8xqCT9G9qLiM2OPDpV
 8uWOEyVWuqpYxOzfIu+oMWh5W4dx1t9VUebraHTV4diMf38KV5tVUiMjPL6Pla6WbkX0Z5
 6gpLFlh65PtTzdd7i0GeSIC1E/vc6ZchNe0WGiFrfPnIGGfMP/pB6uneXGo+mA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=h6t.eu header.i=@h6t.eu header.a=rsa-sha256
 header.s=dkim header.b=XsQVAn8l
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-cargo.mk: fix handling of
 debug and runtime debug builds
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

Hi Yann,

Am 19.10.22 um 23:05 schrieb Yann E. MORIN:

> Moritz, All,
>
> On 2022-10-19 10:53 +0200, Moritz Bitsch via buildroot spake thusly:
>> From: Moritz Bitsch <moritz@h6t.eu>
>>
>> * when not supplying --release to cargo various optimizations get disabled,
>>    resulting in slower runtime: use BR2_ENABLE_RUNTIME_DEBUG
>>
>> * Debug symbol generation can be controlled with the RUSTFLAGS variable:
>>    add -g to RUSTFLAGS for debug symbols
> Two changes, two patches, please. Yes, they are very related, but the
> second one is a new feature, so should be a separate patch.

Sure, I'm going to split the commit and re submit the patch. Sorry for 
the noise.

Regards,

Moritz Bitsch

>> Signed-off-by: Moritz Bitsch <moritz@h6t.eu>
>> ---
>>   package/pkg-cargo.mk | 10 ++++++++--
>>   1 file changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
>> index f7e3f39503..7ce7867f67 100644
>> --- a/package/pkg-cargo.mk
>> +++ b/package/pkg-cargo.mk
>> @@ -51,9 +51,15 @@ PKG_CARGO_ENV = \
>>   # and should be removed when fixed upstream
>>   #
>>   ifeq ($(NORMALIZED_ARCH),arm)
>> -	PKG_CARGO_ENV += RUSTFLAGS="-Clink-arg=-Wl,--allow-multiple-definition"
>> +	PKG_CARGO_RUSTFLAGS += -Clink-arg=-Wl,--allow-multiple-definition
>>   endif
>>   
>> +ifeq ($(BR2_ENABLE_DEBUG),y)
>> +	PKG_CARGO_RUSTFLAGS += -g
>> +endif
>> +
>> +PKG_CARGO_ENV += RUSTFLAGS=$(subst $(space),$(comma),$(strip $(PKG_CARGO_RUSTFLAGS)))
> I was about to say that we had the make-comma-list macro for that, and
> that's too bad I badly named it, because it also introduces a space
> after the comma, so it is not fitted here...
>
> We could tweak it not to introduce the space, but it is also used to
> create meson lists, and I'm not sure the space is required there or not.
> If it's not, then we can tweak it (and introduce make-comma-sp-list if
> needed elsewhere).
>
> Meh, forget it...
>
> Regards,
> Yann E. MORIN.
>
>>   HOST_PKG_CARGO_ENV = \
>>   	$(PKG_COMMON_CARGO_ENV)
>>   
>> @@ -119,7 +125,7 @@ define $(2)_BUILD_CMDS
>>   		$$($(2)_CARGO_ENV) \
>>   		cargo build \
>>   			--offline \
>> -			$$(if $$(BR2_ENABLE_DEBUG),,--release) \
>> +			$$(if $$(BR2_ENABLE_RUNTIME_DEBUG),,--release) \
>>   			--manifest-path Cargo.toml \
>>   			--locked \
>>   			$$($(2)_CARGO_BUILD_OPTS)
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
