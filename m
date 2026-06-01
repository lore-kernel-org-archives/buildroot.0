Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B1AFCD6E56
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 00:25:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A138160F9A;
	Mon,  1 Jun 2026 00:25:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CnXTVnKAAPsQ; Mon,  1 Jun 2026 00:25:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6E8460F39
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780273511;
	bh=cOn5CE/iCGt+ilmLKAEyVQTCcCEEPlpTI3e6q8ANdaM=;
	h=Date:To:Cc:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SsCgAFHmzNpo80TLDm0ZZF/cgC+FvAPtFSgp3QmYkLn+iNXSndKfQhENAWpWeNkN9
	 kn6jqZGGhiF25zj90Y1lpGP63SuY5mwh62AVHgeoOtsNxSm+pNS4IP3K36UU4PlO76
	 tZEIQ+HVR4jZTvu80zX3vNQGYM7yYBrD8pQrUKfaO9h4Z3HH7ToyKoakT3bXXhrlGr
	 2oXXuBBMHdSn1+WtZ4KB8wyIuoSzM+FS2iJ+SRnIBfT1uCLL1hiLNbxfOfOYL83te2
	 Zx67gc4E7DkOTToWFaUQIwOFnLWObjpHfatP3MwIZ3e/+21xMqJl6ssMouj4DLS8IK
	 5ApL+dvmrTmxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6E8460F39;
	Mon,  1 Jun 2026 00:25:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with UTF8SMTP id BC1A7257
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 00:25:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with UTF8SMTP id ACFAE405E7
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 00:25:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id gLHqwjp992DY for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 00:25:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=143.55.232.47;
 helo=v547.v5f06b487.use4.send.mailgun.net;
 envelope-from=bounce+4afdde.7f991a-buildroot=buildroot.org@drhouck.me;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 99F36405DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99F36405DF
Received: from v547.v5f06b487.use4.send.mailgun.net
 (v547.v5f06b487.use4.send.mailgun.net [143.55.232.47])
 by smtp2.osuosl.org (Postfix) with UTF8SMTPS id 99F36405DF
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 00:25:09 +0000 (UTC)
X-Mailgun-Sid: WyI3M2VlNiIsImJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnIiwiN2Y5OTFhIl0=
Received: from [192.168.50.187] (unknown [73.82.189.57]) by
 3f7243d0bfbcd98f02696643d8c5423531532bb20f02c58bc5f8e5a8e48d286f with SMTP id
 6a1cd1647dcf252c920e2577; Mon, 01 Jun 2026 00:25:08 GMT
X-Mailgun-Sending-Ip: 143.55.232.47
Message-ID: <d0db0464-cb86-4cc8-8a79-6076524c7610@DRHouck.me>
Date: Sun, 31 May 2026 20:25:07 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Chris Packham <judge.packham@gmail.com>
References: <20260508235516.3028284-1-Software@DRHouck.me>
 <ahtVrc-CD9fLtDgO@windsurf>
Content-Language: en-US
From: Daniel Houck <Software@DRHouck.me>
In-Reply-To: <ahtVrc-CD9fLtDgO@windsurf>
X-Mailman-Original-DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed;
 d=drhouck.me; q=dns/txt; s=krs; t=1780273508; x=1780280708; 
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: From:
 References: Cc: To: To: Subject: Subject: MIME-Version: Date: Message-ID:
 Sender: Sender; 
 bh=xEthOa/HZrhMTv/ijH5dI4UCohPdN5cYH8Ux/tXCcXE=;
 b=X4niQQDwRlOz7bdvMENxkQydvfXLAaYB9SHBZI5gKZzMSGEt9skGwHaa212k71ccSQoThUfmsYxXA09V2dXiXvalScYzT9qGUMLfLIsBUdw65U3Qh8kuRs6ecZD1LhyRBQSyq7BJ8sjdgdlOVLtKGKsFs3FUXJVZe1sNaI1MK3w=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=DRHouck.me
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=drhouck.me header.i=@drhouck.me header.a=rsa-sha256
 header.s=krs header.b=X4niQQDw
Subject: Re: [Buildroot] [PATCH 1/1] package/micropython: bump to version
 1.28.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

[Accidentally only hit reply; re-sending with reply all]

Thanks for the review.  I always worry I'm too verbose in my commit 
messages; I'm glad you liked it (and wanted even more detail).  I hope 
this answers your questions.

On 5/30/26 17:27, Thomas Petazzoni wrote:
> On Fri, May 08, 2026 at 07:52:36PM -0400, Daniel Houck wrote:
> 
>> +if BR2_PACKAGE_MICROPYTHON_LIB
>> +
>> +config BR2_PACKAGE_MICROPYTHON_LIB_UNIXFFI
>> +	bool "micropython-lib unix-ffi modules"
>> +	default y
>> +	select BR2_PACKAGE_LIBFFI
>> +	select BR2_PACKAGE_PCRE2 # runtime
> 
> So libffi is only needed as a dependency when
> BR2_PACKAGE_MICROPYTHON_LIB_UNIXFFI=y?

Yes, it's only required then, but it still works as an optional 
dependency without the flag, the same way it's an optional dependency 
for Ruby, MoarVM, and p11-kit.

>>   # When building from a tarball we don't have some of the dependencies that are in
>>   # the git repository as submodules
>>   MICROPYTHON_MAKE_OPTS += \
>> @@ -71,7 +64,8 @@ ifeq ($(BR2_PACKAGE_MICROPYTHON_LIB),y)
>>   define MICROPYTHON_COLLECT_LIBS
>>   	$(EXTRA_ENV) PYTHONPATH=$(@D)/tools \
>>   		package/micropython/collect_micropython_lib.py \
>> -		$(@D) $(@D)/.built_pylib
>> +		$(@D) $(@D)/.built_pylib \
>> +		$(if $(BR2_PACKAGE_MICROPYTHON_LIB_UNIXFFI),--ffi,--no-ffi)
> 
> If yes, then this change is not needed. Indeed:
> 
> ifeq ($(BR2_PACKAGE_LIBFFI),y)
> MICROPYTHON_DEPENDENCIES += host-pkgconf libffi
> MICROPYTHON_MAKE_OPTS += MICROPY_PY_FFI=1
> else
> MICROPYTHON_MAKE_OPTS += MICROPY_PY_FFI=0
> endif
> 
> will continue to bring libffi as a dependency if BR2_PACKAGE_LIBFFI is
> enabled.

I should add a comment because I hadn't properly thought about it before 
and I do see that this behavior is confusing, but I do think it's 
correct in both cases; the two sections do different things.  The check 
for BR2_PACKAGE_LIBFFI tells us whether the core MicroPython program 
should have libffi support (like with any optional dependency), and the 
check for BR2_PACKAGE_MICROPYTHON_LIB_UNIXFFI tells us whether to 
include the extra libraries that depend on that feature.  I added the 
second flag because there are reasons to want to avoid the unix-ffi 
libraries even with the rest of micropython-lib and libffi, but I can't 
think of a reason beyond saving 8 KiB to not want to build libffi 
support into MicroPython itself if the library is available.

> 
>> diff --git a/package/micropython/collect_micropython_lib.py b/package/micropython/collect_micropython_lib.py
>> index 8dce78337a..5fb74787a9 100755
>> --- a/package/micropython/collect_micropython_lib.py
>> +++ b/package/micropython/collect_micropython_lib.py
> 
> Could you perhaps improve a tiny bit the commit message to explain the
> changes being brought to this script?

Sure thing.  The short version is that there were two types of changes 
which I couldn't cleanly separate into separate patches.  The first is 
adding the flag for whether to include unix-ffi libraries at all (as 
discussed above), and the second is that upstream changed the 
manifest.require function when including unix-ffi, so we needed to 
change how we call it, according to the new upstream recommendations[1], 
which work better than what we could do before the change.

[1] https://github.com/micropython/micropython-lib/tree/master/unix-ffi

> Thanks a lot!
> 
> Thomas

Thanks for the review!  I'll try to get the updated patch to the list 
tomorrow.

Daniel
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
