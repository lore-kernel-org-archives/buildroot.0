Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C8B5C001B3
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 20:39:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 444CF60D9D;
	Mon,  3 Jul 2023 20:39:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 444CF60D9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fRuLlWfK7Ep6; Mon,  3 Jul 2023 20:39:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 749296068F;
	Mon,  3 Jul 2023 20:39:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 749296068F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 06A591BF357
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 20:39:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A74D7812EB
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 20:39:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A74D7812EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sqNH1ONlbwXx for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 20:39:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC16C812E4
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EC16C812E4
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 20:39:06 +0000 (UTC)
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4BA2EFF804;
 Mon,  3 Jul 2023 20:37:58 +0000 (UTC)
Message-ID: <34f2156d-2f2e-c77f-b002-ec0c01bbc6ae@yoseli.org>
Date: Mon, 3 Jul 2023 22:37:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US, fr
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20230629053130.3976-1-jeanmichel.hautbois@yoseli.org>
 <20230629053130.3976-2-jeanmichel.hautbois@yoseli.org>
 <20230703185532.GC2510@scaer>
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
In-Reply-To: <20230703185532.GC2510@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yoseli.org; s=gm1; t=1688416741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YFPNu+yUQp4OTgGuu4QPrc0YhA0J2CJYSOvaJJ95KpY=;
 b=FEemIXWonKcaBhe0g/xFUi3dQ0mEKrnPXAaFxRxKQZA8nYqavr0E/PS5GKoo6/ynEVyRV3
 KVZhd00RiFWBc5VkDbiy4dLUuqGkqjyhUd5pjGWsZBCBoiCIchGRD6K+jYEUl3G0zUO8BB
 EUcxUlnt3tYIt+SRTXI0MesgHL6BevAsDBhjq07ckf/XdRq2B0G5OlznVXfKxKWavPtpPY
 WdZybPHaShDQYupH0iQ1yMMOrj7HtM+9BzHPllrkl6VUBXmPF4YX6WCiKt9OaCUN9pLD4b
 5YyV64U2M/lz+XWz4au/hIF2fVazQBx9zWbZnHYre+kx6g1u5lPo/3/vhmSROg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=yoseli.org header.i=@yoseli.org header.a=rsa-sha256
 header.s=gm1 header.b=FEemIXWo
Subject: Re: [Buildroot] [PATCH 1/3] arch: add support for mcf54418 Colfdire
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

On 03/07/2023 20:55, Yann E. MORIN wrote:
> Jean-Michel, All,
> 
> On 2023-06-29 07:31 +0200, Jean-Michel Hautbois spake thusly:
>> The m68k family ony has one Coldfire variant, namely the 5208. Add the
>> support for the MCF54418 CPU in the configuration file.
> 
> As your cover-letter said, eda11417beaf (m68k: remove
> BR2_GCC_TARGET_ARCH), setting it breaks use of external toolchains.
> 
> Granted, the commit log was not very expansive in why it did break them
> which required dropping setting m68k/cf.

Indeed. Well, I did not found the root cause, but I can say for sure 
that the USE_MMU configuration makes it impossible to build the 
buildroot toolchain.

> However, it did state that the m68k/cf defconfigs where working
> perfectly well without it.
> 
> So, your commit log should explain how/why it is safe to re-introduce
> BR2_GCC_TARGET_ARCH. I see you only set ig for this new CPU variant, so
> maybe that's enough of a reason.
> 
> Still, it'd be nice to have it explained in plain letters.

OK, so get the content from the plain letter and have it in this commit 
message too ;-).

> Also, it'd be nice if you could try with an external toolchain, and
> explain that in the commit log. If you do not have an external toolchain
> available, you can generate one with Buildroot, and re-use it as an
> external toolchain.

Sadly, the only external toolchain I tried is the one from bootlin, and 
it is not compatible with a CPU which has a MMU. Considering I might 
miss some things !

JM
> 
> Regards,
> Yann E. MORIN.
> 
>> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
>> ---
>>   arch/Config.in.m68k | 9 +++++++++
>>   toolchain/Config.in | 1 +
>>   2 files changed, 10 insertions(+)
>>
>> diff --git a/arch/Config.in.m68k b/arch/Config.in.m68k
>> index 9fd22aaf1e..6aa409b272 100644
>> --- a/arch/Config.in.m68k
>> +++ b/arch/Config.in.m68k
>> @@ -33,11 +33,20 @@ config BR2_m68k_cf5208
>>   	select BR2_m68k_cf
>>   	select BR2_SOFT_FLOAT
>>   
>> +config BR2_m68k_cf54418
>> +	bool "54418"
>> +	select BR2_m68k_cf
>> +	select BR2_USE_MMU
>> +	select BR2_SOFT_FLOAT
>>   endchoice
>>   
>>   config BR2_GCC_TARGET_CPU
>>   	default "68040"		if BR2_m68k_68040
>>   	default "5208"		if BR2_m68k_cf5208
>> +	default "54455"		if BR2_m68k_cf54418
>> +
>> +config BR2_GCC_TARGET_ARCH
>> +	default "cf"            if BR2_m68k_cf54418
>>   
>>   config BR2_READELF_ARCH_NAME
>>   	default "MC68000"
>> diff --git a/toolchain/Config.in b/toolchain/Config.in
>> index ff0eb93017..ec2185cb39 100644
>> --- a/toolchain/Config.in
>> +++ b/toolchain/Config.in
>> @@ -95,6 +95,7 @@ config BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
>>   	depends on !BR2_ARM_CPU_ARMV5
>>   	depends on !BR2_sparc_v8
>>   	depends on !BR2_m68k_cf5208
>> +	depends on !BR2_m68k_cf54418
>>   
>>   # GCC uses thunk functions to adjust the 'this' pointer when calling
>>   # C++ member functions in classes derived with multiple inheritance.
>> -- 
>> 2.39.2
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
