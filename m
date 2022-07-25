Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8482AC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 09:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1979A61148;
	Mon, 25 Jul 2022 09:38:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1979A61148
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sjVzgwvVa-Mz; Mon, 25 Jul 2022 09:38:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0643D610D9;
	Mon, 25 Jul 2022 09:38:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0643D610D9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 80DA01BF9AC
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 09:38:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5AFC740A62
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 09:38:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5AFC740A62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gvTS7J9vbgAR for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 09:38:33 +0000 (UTC)
X-Greylist: delayed 00:10:00 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D285C40597
Received: from mail.h6t.eu (unknown [IPv6:2a01:4f8:1c1e:8216::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D285C40597
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 09:38:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9B329214312; Mon, 25 Jul 2022 11:20:19 +0200 (CEST)
Message-ID: <5d89a113-d2f0-fd06-9f09-2c8ac4eb23bb@h6t.eu>
Date: Mon, 25 Jul 2022 11:20:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220217230638.98748-1-moritz@h6t.eu>
 <20220724160833.GA2641@scaer>
In-Reply-To: <20220724160833.GA2641@scaer>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=h6t.eu; s=dkim; 
 t=1658740819; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=V1Jfm9IAXSA+RsMefX8ibvV8rj2k9aPvXiYiBXlSgMY=;
 b=dVAPA9Y43FTXDO9e81K8aVMuE44IyCWhcYvsrNWNSascYqZt5upg320+gGCmwCEAjfAyB2
 Z2CY2aRmJBcAxhOtmBfHfJtjNsLJ+eUdfKhlkG3pTGP7Msm2ApglRZaTXvhAdWQT0bPXxa
 rCRsaDPvmVKXWfFW39oIEU/kW9Cd80101tPRvTIKvPlHZbOgnKfTGg490QkxLPdUfqhY0V
 1IXv7ZzAv2PpGWFdOwAVVajpnyO3k6k4Jp5VLzsKuOGHVNTjsA4UEGzEowesp1hp/JY0AN
 nGjWmG6mUMCMVNREL7bv/Z4UW4RsWlXwzKCIAj0v0gt7HoenOzc5XnctDC4NCg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=h6t.eu header.i=@h6t.eu header.a=rsa-sha256
 header.s=dkim header.b=dVAPA9Y4
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-cargo.mk: fix building
 cargo packages on 32bit arm
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

Hello Yann, All,


it seems that the original autobuild error still requires the workaround 
with rust 1.62.0. I think we should keep the workaround in place.

If I get some time Ill have a look at what is going on, as the mentioned 
github issues are fixed.


Regards,

Moritz Bitsch

Am 24.07.22 um 18:08 schrieb Yann E. MORIN:
> Moritz, All,
>
> On 2022-02-18 00:06 +0100, Moritz Bitsch via buildroot spake thusly:
>> From: Moritz Bitsch <moritz@h6t.eu>
>>
>> there are duplicated symbols between rustc and gcc. Specifying
>> --allow-multiple-definition to the linker as workaround until
>> rustc is fixed.
>>
>> rust-lang issue: https://github.com/rust-lang/compiler-builtins/issues/420
> This is supposedly fixed upstream:
>      https://github.com/rust-lang/compiler-builtins/issues/420
>
> which leads to:
>      https://github.com/rust-lang/compiler-builtins/issues/412
>
> which leads to:
>      https://github.com/rust-lang/compiler-builtins/pull/452
>
> and:
>      https://github.com/rust-lang/rust/pull/93696
>
> which is now merged.
>
> We recently bumped to using rust 1.62.0.
>
> Do you think that this workaround can now be dropped?
>
> Regards,
> Yann E. MORIN.
>
>> Fixes: http://autobuild.buildroot.net/results/53f/53f5598b8e520caaa135fb4923c09da382dab329
>> Signed-off-by: Moritz Bitsch <moritz@h6t.eu>
>> ---
>>   package/pkg-cargo.mk | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
>> index e74a8358bc..71d695d926 100644
>> --- a/package/pkg-cargo.mk
>> +++ b/package/pkg-cargo.mk
>> @@ -46,6 +46,14 @@ PKG_CARGO_ENV = \
>>   	CARGO_BUILD_TARGET="$(RUSTC_TARGET_NAME)" \
>>   	CARGO_TARGET_$(call UPPERCASE,$(RUSTC_TARGET_NAME))_LINKER=$(notdir $(TARGET_CROSS))gcc
>>   
>> +#
>> +# This is a workaround for https://github.com/rust-lang/compiler-builtins/issues/420
>> +# and should be removed when fixed upstream
>> +#
>> +ifeq ($(NORMALIZED_ARCH),arm)
>> +	PKG_CARGO_ENV += RUSTFLAGS="-Clink-arg=-Wl,--allow-multiple-definition"
>> +endif
>> +
>>   HOST_PKG_CARGO_ENV = \
>>   	$(PKG_COMMON_CARGO_ENV)
>>   
>> -- 
>> 2.35.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
