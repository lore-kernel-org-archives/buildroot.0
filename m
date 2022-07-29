Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A8B6C00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 20:23:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E27268475F;
	Fri, 29 Jul 2022 20:23:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E27268475F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HjBkZVkQrpu6; Fri, 29 Jul 2022 20:23:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13F7C84754;
	Fri, 29 Jul 2022 20:23:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13F7C84754
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3C83C1BF35D
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 20:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 17E2984754
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 20:23:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17E2984754
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zp3eVip6LYj4 for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 20:22:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7BAA84742
Received: from smtpweb147.aruba.it (smtpweb147.aruba.it [62.149.158.147])
 by smtp1.osuosl.org (Postfix) with ESMTP id D7BAA84742
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 20:22:58 +0000 (UTC)
Received: from [192.168.50.173] ([146.241.73.23])
 by Aruba Outgoing Smtp  with ESMTPSA
 id HWVcoC00FbMeiHWVcoSNOj; Fri, 29 Jul 2022 22:22:56 +0200
Message-ID: <4e591fc1-3820-3e6a-1edf-c815336f8976@benettiengineering.com>
Date: Fri, 29 Jul 2022 22:22:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220729162430.1028453-1-giulio.benetti@benettiengineering.com>
 <20220729162430.1028453-2-giulio.benetti@benettiengineering.com>
 <20220729215552.325fbe22@windsurf>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220729215552.325fbe22@windsurf>
X-CMAE-Envelope: MS4xfKhU4lty1be+FTdX+vjgnhycNw/cV5FssjixDukydFxFE/g3SQjTtgVWcTtKm2d3m6OZTNpwKETHW3m6G2Iijwa/1jWpo6Wf64OroYAvEFYVihJW9rYa
 x/rTu1L3FZlxetV05sGMFCkXTg0nA2KXSfrSgCXZ4236lauFZg6wKA7ZTp/YQw01zChyWvxUaBEtfPlxVoMPaFwHgFk6OBJ17SJ3nCU5bSGpIjlK3dReol4Z
 1s0sJTAJtmeugZF42x4JokJbf4c0rMWzuNhRpnkmg3r5Gna2EAe1Nn0P47Z79YJ8Qyy6c5ASQDOR7crkZ0c/Q3mG/NaXszSb0bUKxmYaeVAfUL35HgM+msHk
 hZBwlkcW7SpIgBiN0G+qrEd2l6CjyyB9PVS/ZNZt1GI4QOcriplDdH+4hXtd56v1K45CEmtP
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1659126176; bh=M2LgG8sLVioxQ90/qge9sPShdoCvg9agIc9dPxKj/bQ=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=Rsc5JKOd/eWDsWdYBV7M6aPEYaGhg+iNKMv53Mmv3COi0thtA3kZ2cLnDG2lTgASD
 yQgfNXi0VGHZZIJRwowANqMhRibOCRoKLUzGK8QxG3HTc+oAfzfMyrJYkhu+SE16rG
 5M3XUl4abH79PR/bMk4YCXyLVR1QI5CMDrcp0+aTS3kAtxWZn9TZOAlYRKT9zSIdgR
 X7gr4iiiuaymdWdmfkxH7wPPinvV0fkHJjBi9WfthOmkh9pnQ6ZBCR40ayIfRjy7un
 de4k7ARtxxvBTm5t9e4TLacYft+2xBessQjrBddvKiJRYrQEv8tgW4U5W+SQd6pc/h
 8rZ96sUrSm1nw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=Rsc5JKOd
Subject: Re: [Buildroot] [PATCH 2/2] toolchain/Config.in: update gcc bug
 99410
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 29/07/22 21:55, Thomas Petazzoni via buildroot wrote:
> On Fri, 29 Jul 2022 18:24:30 +0200
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>>   config BR2_TOOLCHAIN_HAS_GCC_BUG_99410
>>   	bool
>> -	default y if !BR2_TOOLCHAIN_GCC_AT_LEAST_8
>> -	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_9 && !BR2_TOOLCHAIN_GCC_AT_LEAST_11
>> +	default y if !BR2_TOOLCHAIN_GCC_AT_LEAST_8 || BR2_TOOLCHAIN_GCC_AT_LEAST_9 || \
>> +		     BR2_TOOLCHAIN_GCC_AT_LEAST_10 || BR2_TOOLCHAIN_GCC_AT_LEAST_11 || \
>> +		     BR2_TOOLCHAIN_GCC_AT_LEAST_12
> 
> This looks like a very convoluted way, that can be replaced with:
> 
> config BR2_TOOLCHAIN_HAS_GCC_BUG_99410
> 	bool
> 	default y if !BR2_TOOLCHAIN_GCC_AT_LEAST_8
> 	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_9
> 
> This says:
> 
>   - The bug is present if you don't have at least gcc 8.x (so versions
>     older than gcc 8.x are affected)
> 
>   - The bug is present if you have at least gcc 9.x (so all versions
>     more recent than 9.x included are affected)
> 
> So I replaced it with that. Let me know if you see a problem with this
> change.

That's true, thank you.

So I can improve also bugs:
BR2_TOOLCHAIN_HAS_GCC_BUG_43744
BR2_TOOLCHAIN_HAS_GCC_BUG_83143

This way we're also sure we always deal with latest gcc version.
What about it?

-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
