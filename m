Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA75C3DA7F
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 18:23:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84027407D2;
	Thu, 15 Aug 2024 18:23:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lacktQhJtXfh; Thu, 15 Aug 2024 18:23:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32A38407DD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32A38407DD;
	Thu, 15 Aug 2024 18:23:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D80281BF573
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 18:23:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with UTF8SMTP id C4F0A40243
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 18:23:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id Raha3tZE7LV0 for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 18:23:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=43.163.128.43;
 helo=xmbghk7.mail.qq.com; envelope-from=wangdong115@foxmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C59D0400B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C59D0400B5
Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.43])
 by smtp2.osuosl.org (Postfix) with UTF8SMTPS id C59D0400B5
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 18:23:07 +0000 (UTC)
Received: from [192.168.100.247] ([106.120.7.242])
 by newxmesmtplogicsvrszb9-0.qq.com (NewEsmtp) with SMTP
 id 5BAAE2EF; Fri, 16 Aug 2024 02:22:58 +0800
X-QQ-mid: xmsmtpt1723746178t6kwzps9h
Message-ID: <tencent_1160238A6159954BE84C209C13208760D305@qq.com>
X-QQ-XMAILINFO: MrLS19CxEhdHnoD5j/x9IT/nD6vCBbk67sNxRjychTRLhwx2H+/mhRqY/nZgBZ
 mq+E/IQtAHcYrps2foqZEgDkWBBfwVIPwY0xVka3pe/lTzZc6zjeRpF6a52wgQGbavmftsJRGrLx
 gfUGQQ+Elymt4TF8GiM2udAbN7A7PQKFHwo2R6cdt37+ngw+tVYWIloIfNlRlSbDoND3wG4Ce+io
 2CCxyXei+EVoYxwxLsXlyEPNgA/ysit0OhcNoqtqcgjl0HSTFA9GiYRoOyBP3B8PeLnSDCBYW+gH
 L9jJOLDmdxA/CXjumWxzEBvAXKEu/6TWGevF5EtL4Q7fLtzTEZnea73vzP4Q4XgxuHV2cGKT0Ynv
 W9VK1Uox2HFlaAICXgWQpMC3o/GCpbOYTK5ldR61XOAqlQDiwFrFJeNbLonrhkMZ7Xx+0V3Wg+dk
 GoiEIsw8o8frBTjToOeavvl1MMLGvORfd7Tv8Tcle2Ad2JpMCJlfmQ8uMDmQzSVIFwywzaERJ+HE
 2Bn7J5qKLqK1rmi0t5+7hT0Uew5xIf6zh+J1H4kv+v5scrG/FdVWuK2X5HAMUZYu5Xro82zktRme
 uWtap92OmMqKwxclQeAfKOQ5EWkVIsJBjV/v9cVUeK82qigsXefosN0uTYdAXpiQF5GeiSHcO0MZ
 dv4Z1utNIPJtPQsOitZG/7Idq7wuvaP0xY/vWJFbAsdGJp8l7x8Mze4UlwjojrY8D+PsJHTqRTOq
 fcJGiAQRg5fO2cSkeKSd6vEksnK/Br35vWDqk8/H6YO7nTKRCMmffl5/NVSjLm+di64KmhyE+TkY
 gsfixAU+1VfeDIXcNiF9T5tRADVRBH4z8Z4IvM/BM/9zqL+SgtAYRKbgYFU7Fo6fbmFsp33kMabX
 V/JY4SuRNKZtdTnbk1XjB0eSTqgal7Y4Tli2bbDmeQ5XtQAyuUBP7O2zXHFfrF2SyS2Xth78Z4kZ
 kSCtYdfM5Lx535fzL1XhEUQix8yG+cWqoquiGA7ewTZM52zl9vvuHgShyNuOg03OaON2rBhA+Idp
 KlKi4GVNdkxpDhUv01UTqN1Bfy34QvvH+w4AyDqA==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-OQ-MSGID: <e1395d8c-c8ee-42ec-bd42-c7efd942785e@foxmail.com>
Date: Fri, 16 Aug 2024 02:22:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <tencent_C2D6061483906AA710B3001B277F4EE62606@qq.com>
 <Zr5GroPU1KwertMc@landeda>
Content-Language: en-US
From: Dong Wang <wangdong115@foxmail.com>
In-Reply-To: <Zr5GroPU1KwertMc@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=foxmail.com; s=s201512; t=1723746180;
 bh=VQeK/u+4XUI5kYMClbWY5mXfpP3W4Hp5TgE+yrWlOHY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=Qx3ML2HcNaD4l2avQg8EgCwXIUvMdndjwNniH/aXYeveMZT9MRkkEFBC6/M2MNKzD
 uN3rs5L5zFX/vsaiBZeyQ/osQ2cANcqoJq07F5wnlgXQhXK/gBbVO8MQuY1LKnCjP1
 1tycdjqIcIFvZnCSdzB7UZM3zFECZ6Unjp7FFrJ0=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=foxmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256
 header.s=s201512 header.b=Qx3ML2Hc
Subject: Re: [Buildroot] [PATCH next] board/friendlyarm/nanopi-neo: fix
 uboot partition size
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Yann,


On 2024/8/16 02:19, Yann E. MORIN wrote:
> Dong Wang, All,
> 
> On 2024-08-16 01:28 +0800, Dong Wang spake thusly:
>> This patch fixes the wrongly calculated uboot partition size in
>> genimage.cfg. The size should be 1016K, which is
>> 1MB (typical partition start) - 8K(offset dictated by the bootrom).
>>
>> Signed-off-by: Dong Wang <wangdong115@foxmail.com>
> 
> Applied to next, thanks!

Thanks a lot!

> 
> Again, sorry for the confusion.

My bad! I should have let you know in the first patch!

> 
> Regards,
> Yann E. MORIN.
> 
>> ---
>>   board/friendlyarm/nanopi-neo/genimage.cfg | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/board/friendlyarm/nanopi-neo/genimage.cfg b/board/friendlyarm/nanopi-neo/genimage.cfg
>> index ec78fd0e56..8d6bdd3295 100644
>> --- a/board/friendlyarm/nanopi-neo/genimage.cfg
>> +++ b/board/friendlyarm/nanopi-neo/genimage.cfg
>> @@ -7,7 +7,7 @@ image sdcard.img {
>>   		in-partition-table = false
>>   		image = "u-boot-sunxi-with-spl.bin"
>>   		offset = 8K
>> -		size = 1000K # 1MB - 8KB(offset) - 16KB(GPT)
>> +		size = 1016K # 1MB - 8KB(offset)
>>   	}
>>   
>>   	partition rootfs {
>> -- 
>> 2.25.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
> 

Best,
Dong Wang

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
