Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68FA5ECAAD3
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 19:43:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE581424DD;
	Sun, 11 Sep 2022 19:43:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE581424DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4tNo_s5wXXvh; Sun, 11 Sep 2022 19:43:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BA7141DB9;
	Sun, 11 Sep 2022 19:43:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BA7141DB9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C79E41BF281
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 19:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B0075843C0
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 19:43:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0075843C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DRVUP3ba99tx for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 19:43:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF488843B3
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF488843B3
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 19:43:44 +0000 (UTC)
Received: from [192.168.50.173] ([146.241.22.4])
 by Aruba Outgoing Smtp  with ESMTPSA
 id XSrmoezRWMW5FXSrmoxeYO; Sun, 11 Sep 2022 21:43:43 +0200
Message-ID: <a94b9207-0af3-10c0-dbde-1b7dbd8d8880@benettiengineering.com>
Date: Sun, 11 Sep 2022 21:43:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220910135256.1689860-1-giulio.benetti@benettiengineering.com>
 <20220911193046.GH898622@scaer>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220911193046.GH898622@scaer>
X-CMAE-Envelope: MS4xfDK6hbiYKlrfZAbCO8yaa5Lo8Lcct4/XxgHRuaWWNHKPMTOoy5al0VR//J5Ydbx8F5n/1I0mw+n6JEGBFhlg6TuYoxY+IailaVno+YYeW0Q+KSVcXdVd
 mugO2pi+3x9SVyCkgYhGh3loGoKqRJoQ0I0qXBx9n1ZupW9JV/9t3iW0T8wET1onBdCfbkuv+kwbAtPqagsbGM7sR1OasaESLFd7sHULT82eBdwcceP+9WXp
 zahFVA402RKB3B5NtsJ+EjnRWitqpaT3r6XSqy2l/uT3DsIdNiwaoqbqfRjGVdrbLGI31j7GIB4SqMIVTpK9qyxwHDiSYUsFcergI4orFl8AXh3GJCEh9hYZ
 QOaX8b34H8T1qmF5dOpH1NOCWZNL7IBezvO8k6P++7+QFJZrGbAsMC+D7FI5VliKLHfan9c78smVZQ29QSpT4kUs3ekbCg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1662925423; bh=TMXijp8cmAeyRRYWms5kYDiUfc3Hq1khkUDdUqNz0Js=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=KUaCw3w5tNbDwXuP7LHQ4BuJGv6BCxL/C8vfH4PvZz6pZmALpJFbGsRdzytQDPog7
 GogkFot2rmWjdmmuMmqOTlx0zbPbqdaSgRnjxaHOHDEtWyKdxycJGbt0NDpSXCxaUa
 XWxnqyQeG0BtX2qxVgmwz44/DOHjcOegTevgW3FrmJEin0cruA4FJJm2SLrB3N7isC
 gYUO+Qr6k0zJM3+T3lAd0xmm/No40NpbBgO/JC2eh9+FPQegUajUvN+rlEoU3oqZPD
 URCMEZDKSYy3RxVzhTLVXlym/u45+B0nCpW7PpuMrDee+Wm1ThAARzIrcIg4+exRpI
 e4ydjrPBXeJQQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=KUaCw3w5
Subject: Re: [Buildroot] [PATCH 1/2] toolchain/Config.in: update gcc bug
 90620
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
Cc: Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 11/09/22 21:30, Yann E. MORIN wrote:
> Giulio, All,
> 
> On 2022-09-10 15:52 +0200, Giulio Benetti spake thusly:
>> Gcc bug 90620 reappeared with gcc 11.x so let's update
>> BR2_TOOLCHAIN_HAS_GCC_BUG_90620 conditions.
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>>   toolchain/Config.in | 7 ++++---
>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/toolchain/Config.in b/toolchain/Config.in
>> index fbc2f28553..16e358344d 100644
>> --- a/toolchain/Config.in
>> +++ b/toolchain/Config.in
>> @@ -168,11 +168,12 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_85862
>>   
>>   # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=90620
>>   # ICE: in do_output_reload, at reload1.c:7978 on microblaze.
>> -# This bug no longer exists in gcc 10.x
>> +# This bug no longer exists in gcc 10.x but reappeared in gcc 11.x
>>   config BR2_TOOLCHAIN_HAS_GCC_BUG_90620
>>   	bool
>> -	default y if BR2_microblaze
>> -	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_10
>> +	default y if !BR2_TOOLCHAIN_GCC_AT_LEAST_10
>> +	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_11
>> +	depends on BR2_microblaze
> 
> I am not sure why the switch of default to depends is needed, because the
> same condition can still be written without changing the default:
> 
>      default y if BR2_microblaze
>      depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_10 \
>              || BR2_TOOLCHAIN_GCC_AT_LEAST_11

It was an attempt to propose a standard shape to use here

> Yeah, I see that other symbols that have a dependency on two gcc version
> have the default/depends inverted, but symbols that have a dependency on
> a single gcc version do not, e.g.:
> 
>      config BR2_TOOLCHAIN_HAS_GCC_BUG_85862
>          bool
>          default y if BR2_microblaze
>          depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7
> 
> So, I think it is better to keep the same semantics between the two
> situations.
> 
> So, I fixed that, and applied to master, thanks.

Thank you

> Note, there is also a third way to write it, and obviouslty we are also
> using that:
> 
>      config BR2_TOOLCHAIN_HAS_GCC_BUG_93847
>          bool
>          default y if BR2_nios2 && !BR2_TOOLCHAIN_GCC_AT_LEAST_9
> 
> Meh... :-(

Exactly :-)

> Note: this is *not* a plea for patches to fix that, at all. I just like
> ranting a bit. ;-)

Why don't we choose a standard way instead? This for next patches, or
even to send a patchset to keep consistency between all the bugs, but
I know that it doesn't add anything and can add regressions.

What do you think?

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
