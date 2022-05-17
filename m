Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0277C433F5
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 03:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31BC283280;
	Tue, 17 May 2022 03:23:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kr728-NkriQd; Tue, 17 May 2022 03:23:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16FDF83498;
	Tue, 17 May 2022 03:23:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BF1041BF322
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 03:23:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B768060F99
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 03:23:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=cosmos-ink.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xklgzjin9mjk for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 03:23:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.cosmos-ink.net (mail.cosmos-ink.net [95.217.104.42])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 64E0460EB2
 for <buildroot@buildroot.org>; Tue, 17 May 2022 03:23:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1D7B31C6667E; Tue, 17 May 2022 05:23:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cosmos-ink.net;
 s=dkim; t=1652757794;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=G4/uxUBgs0HOWW/XsHW4pdYZd1gwSatfnY0wKPcA7eo=;
 b=V0L1bLom43CS+zT0oKTEPEPNbwtOiDjZ9h+OUrSD1+l0i+iMruCKAlk0M45V+5bi2oZwg4
 rYrv8ley+3cUjQ+g9Lyv5Vk+oE4VtoYIn1m3zuo7dRqWKDe1eu9W2h2kmcp7bmZAeVjV8i
 zEem3ExvbCICD1mt19ipt5JmRXmP77lRnrCj3mptZQf5BDNsGg3/i6iMqSpcqvY4i/s9ef
 0usRSlfoDv4lsinF+NoDQ9d7WlwnA+Zmz7B01BwYc5HQ/SFMMCOD0hmsIRUKmxtC2pF/9J
 8z/oXodvdHv2LniUQnjEzLcG/nGngrmZEr9tciWsRIX7BhKo4JVArwI5f44skw==
Message-ID: <58851e39-5c59-0841-b985-808cc0f6901c@cosmos-ink.net>
Date: Tue, 17 May 2022 05:23:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220515145441.3682-1-linus@cosmos-ink.net>
 <20220515205235.GG1597494@scaer>
 <5027e8d8-02e3-b5ed-e1a6-8f9804d68d68@cosmos-ink.net>
 <20220516164713.GI1597494@scaer>
In-Reply-To: <20220516164713.GI1597494@scaer>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] fs/squashfs: add more options to
 customize creation
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
From: Linus via buildroot <buildroot@buildroot.org>
Reply-To: Linus <linus@cosmos-ink.net>
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann, All,

> Yes, 1K and 2K are not suported, but that page is about mksquashfs 3.x,
> which supported from 4K to 128K, but we are now packagng 4.5, which
> supports from 4K to 1M.
Good to know! Didn't know the details on this and just guessed lucky.

> Yes, it should be hidden, i.e. have no prompt, because the actual user
> input is the entry in the choice; [...]

Cool. Wasn't aware of that. Seems the options appear in the .config,
but are not exported to a defconfig.

>> but I've
>> so far never encountered that. I can add this of course if this has
>> some benefit (maybe being able to specify a specific size in raw
>> config values??).
> Nope, the choice is the only way to set it.
Technically, patching the generated .config would be a way As I found
out above. But I agree that it is not changeable if one does everything
correctly.

## Patches

I've done the patches now. I used the "config default" thing for
both options. I was a bit confused about some envs using
SQUASH4 and some only SQUASH. I'm assuming that the "4" is some
baggage and left it out of the patches. Feel free to correct me
if I assume incorrectly here.

Regarding some compression options, seems that `xz --long-help`
explicitly states that big endian is not supported for arm.
While x86 explicitly states 64-bit support I'm not sure whether
arm (and some similar architectures) are supposed to work for
64 bit as well. For now I'm assuming it. Worst case it'll not
do any savings there I guess.

Looking forward for feedback on the new patches,
Linus Kaschulla

Am 16.05.22 um 18:47 schrieb Yann E. MORIN:
> Linus, Al,
>
> On 2022-05-16 01:56 +0200, Linus spake thusly:
>> I have already prepared the patch for blocksize, using choices
>> from 4k, 8k, ..., 512k, 1024k. That one should be pretty straight
>> forward.
>>
>> I also find 1k to be pretty ridiculous. Not even sure if it would
>> work. This size seems to be pretty old and also only start at 4k:
>> https://tldp.org/HOWTO/SquashFS-HOWTO/mksqoverview.html
> Yes, 1K and 2K are not suported, but that page is about mksquashfs 3.x,
> which supported from 4K to 128K, but we are now packagng 4.5, which
> supports from 4K to 1M.
>
>> I've used the same style that was used for specifiying the compression.
>> Not sure whether the later string without a name is hidden,
> Yes, it should be hidden, i.e. have no prompt, because the actual user
> input is the entry in the choice; the hidden string is just a
> translation from a multi-boolean to a the actual size. We have such
> constructs in a few opther places. For example, see the version choice
> for the kernel version;
>
>        129 config BR2_LINUX_KERNEL_VERSION
>        130     string
>        131     default "5.17.7" if BR2_LINUX_KERNEL_LATEST_VERSION
>        132     default "5.10.104-cip3" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
>        133     default "5.10.104-cip3-rt3" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
>        134 ...
>
>> but I've
>> so far never encountered that. I can add this of course if this has
>> some benefit (maybe being able to specify a specific size in raw
>> config values??).
> Nope, the choice is the only way to set it.
>
>> ## Compression
>>
>> For the compression arguments, I'm up to anything here as well.
>> I'm not sure if we should use all extreme options by default
>>
>>> Also note that lz4 already uses -Xhc unconditionally, and commit
>>>      07e37bcc42f notes that an extra option was dropped, so maybe we
>>>      should just unconditionally enable all those options when possible?
>> Seems like a easy way to confuse people or cause errors should
>> a option somehow make problems.
> In that case, people would not enable this option if it is causing issue
> for them.
>
>> Or is it a major problem to break
>> the assumption that only lz4 is already optimized?
> Well, to keep the existing behaviour we could do something like:
>
>      config BR2_TARGET_ROOTFS_EXTREME_COMP
>          bool "extreme compression if possible"
>          default y if BR2_TARGET_ROOTFS_SQUASHFS4_LZH
>
>>>    - for the comnpression options, I think a generic boolean would be
>>>      better:
>> I agree with that. Will try to get this done tomorrow and do a couple
>> of tests to ensure there are no obvious problems.
>>
>> ## In conclusion
>>
>> If that's okay with you I can prepare a patch-set tomorrow and
>> send them in for review (hopefully also tomorrow).
> Yes, no worries, as you can make it. Thanks!
>
> Regards,
> Yann E. MORIN.
>
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
