Return-Path: <SRS0=/RLo=NT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB634C432BE
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 10:40:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BC3460E73
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 10:40:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5BC3460E73
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21275605AE;
	Sat, 28 Aug 2021 10:40:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qbqHPTXcv6-L; Sat, 28 Aug 2021 10:40:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8800F606D3;
	Sat, 28 Aug 2021 10:40:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B890F1BF4E7
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 10:40:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A8D4382D12
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 10:40:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=heine.tech
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Db6-nsD_263o for <buildroot@lists.busybox.net>;
 Sat, 28 Aug 2021 10:40:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4EB8982F8B
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 10:40:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 37A881814BD; Sat, 28 Aug 2021 12:40:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heine.tech; s=dkim;
 t=1630147207; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=Oyaqk55xuWP9AO/f4XUXoeuVbgiGr+81pcsDVHg4cS4=;
 b=dmu2sphaL9mEMfm8bE9hrvNMxqUUQmUHA/CYNMNYPmke+7BNzykJj5l7dgQxy19EOf2oBT
 mWJdP1swmPOwpgkU5+Ayo3XUKBADBen5cABMw96bbS6OTybxdg3MmaSi0WhFc/N0S1j71a
 IsEV8XWT+oOqdl/6HL2dJIepkJVUBf4=
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <20210819131246.38791-1-buildroot@heine.tech>
 <4a826a55-5c43-23e4-9f5c-5851bee80f21@mind.be>
Message-ID: <a3d324da-95e4-bad3-d125-9ce7818bdc2e@heine.tech>
Date: Sat, 28 Aug 2021 12:40:02 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <4a826a55-5c43-23e4-9f5c-5851bee80f21@mind.be>
Content-Language: en-US
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2] package/boost: bump version to 1.77.0
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
From: Michael Nosthoff via buildroot <buildroot@busybox.net>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, Marcin Bis <marcin@bis.org.pl>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Maxim Kochetkov <fido_max@inbox.ru>,
 Fabio Urquiza <fabiorush@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi,

On 26.08.21 23:36, Arnout Vandecappelle wrote:
>   Applied to master, thanks. With a few more changes though:
>
>      [Arnout: improve propagation of reverse dependencies:
>       - also update comment of cc-tool;
>       - add boost-filesystem to reason of gnuradio, libcpprestsdk, uhd;
>       - move dependency to arch-deps of mongodb]
>
> [snip]
Thanks!
>> diff --git a/package/botan/Config.in b/package/botan/Config.in
>> index 341fa7c622..635fe1836d 100644
>> --- a/package/botan/Config.in
>> +++ b/package/botan/Config.in
>> @@ -18,8 +18,8 @@ config BR2_PACKAGE_BOTAN
>>   	depends on BR2_TOOLCHAIN_HAS_THREADS
>>   	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
>>   	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::future
>> -	select BR2_PACKAGE_BOOST_FILESYSTEM if BR2_PACKAGE_BOOST
>> -	select BR2_PACKAGE_BOOST_SYSTEM if BR2_PACKAGE_BOOST
>> +	select BR2_PACKAGE_BOOST_FILESYSTEM if BR2_PACKAGE_BOOST && BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
>> +	select BR2_PACKAGE_BOOST_SYSTEM if BR2_PACKAGE_BOOST && BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
>   I suspect there might be a problem here. botan will build with boost as soon as
> boost is enabled, even if lockfree atomic ints are not supported. So it's very
> well possible that the build will fail on an architecture without them if you
> select botan and boost (and not filesystem).
>
>   It may be sufficient to add BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
> to the condition in botan.mk - but perhaps botan will automatically enable boost
> if it is detected (even if no --with-boost is given). If so, the configure
> script will have to be patched to add a --without-boost option so we can disable it.
>
>   Can you take a look? Or you could wait for autobuild failures for botan, but
> since you're not a developer for botan you won't get mails for it.
>
>   I've applied without attempting a fix, but I'm pretty sure something will have
> to be done.

I'll keep an eye on the autobuilder results and/or check the botan 
package in more detail when I find the time.

Regards,
Michael


_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
