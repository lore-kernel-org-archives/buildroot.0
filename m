Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4288C433EF
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 21:47:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CE4B41754;
	Thu, 17 Feb 2022 21:47:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LyN1D5Y5CgwM; Thu, 17 Feb 2022 21:47:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C85784163E;
	Thu, 17 Feb 2022 21:47:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3C94B1BF37A
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 21:47:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2AB2383FFB
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 21:47:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=othermo.de
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JnYCjZKmOSme for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 21:47:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mout-b-206.mailbox.org (mout-b-206.mailbox.org [195.10.208.51])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3193F83FFA
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 21:47:38 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [80.241.60.233])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-b-206.mailbox.org (Postfix) with ESMTPS id 4K07j33qyvz9skD;
 Thu, 17 Feb 2022 22:47:35 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=othermo.de; s=MBO0001; 
 t=1645134453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vWKY1vTYEW8qEonF19QjKTxEzSeBEl3u2HsndTepjzM=;
 b=EbxC4g8mlSd5iQiV/SQbaQ3IcnlvlhlIOG4JEzKgC1FNf0VMaxu79p+efoQIOCXhF7M/e8
 DoeboFd76073qJQ6Ewo5L/9E8qV8RUObLTky0nA1GQ5IGdQQkTfb0QgmFi3OJLtV3ErsEw
 fwEXjnGRImYWGJ6YElI5x1dlqHGpttM09rwGCf3sPEILTlA2oHyVhsE7CTj69Uy4nMiGc/
 wtrNlk8f0nd9AMyVGpq7k8jpBp3gFt+/RbGU9btsw0WoNAfZVDGvDiBRiUE5Eu28Gay67l
 OW0EhjPqNDaJKNnhoYVg8kuvv62qyfcokfbjiPLAT84k0x/8w6SZmyMWBDyQmw==
Message-ID: <f31c8fe1-3977-9e1a-97b1-830ed0db9f8b@othermo.de>
Date: Thu, 17 Feb 2022 22:47:27 +0100
MIME-Version: 1.0
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220217155549.1084829-1-marcus.hoffmann@othermo.de>
 <20220217155549.1084829-3-marcus.hoffmann@othermo.de>
 <20220217214443.GN522310@scaer>
From: Marcus Hoffmann <marcus.hoffmann@othermo.de>
In-Reply-To: <20220217214443.GN522310@scaer>
Subject: Re: [Buildroot] [PATCH v2 2/2]
 board/orangepi/orangepi-rk3399/genimage: fix partition types for gpt
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
Cc: Suniel Mahesh <sunil@amarulasolutions.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

On 17.02.22 22:44, Yann E. MORIN wrote:
> Marcus, All,
> 
> On 2022-02-17 16:55 +0100, Marcus Hoffmann spake thusly:
>> Fixes the following error during image generation:
>>    ERROR: hdimage(sdcard.img): part boot: 'partition-type' is only valid
>>    for mbr and hybrid partition-table-type
>>
>> Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/2103784375
>>
>> Signed-off-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
>> ---
>>   board/orangepi/orangepi-rk3399/genimage.cfg | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/board/orangepi/orangepi-rk3399/genimage.cfg b/board/orangepi/orangepi-rk3399/genimage.cfg
>> index c94e0bc7cc..a02166172f 100644
>> --- a/board/orangepi/orangepi-rk3399/genimage.cfg
>> +++ b/board/orangepi/orangepi-rk3399/genimage.cfg
>> @@ -26,14 +26,13 @@ image sdcard.img {
>>   	}
>>   
>>   	partition boot {
>> -		partition-type = 0xC
>> +		partition-type-uuid = F
>>   		bootable = "true"
>>   		image = "boot.vfat"
>>   		offset = 16M
>>   	}
>>   
>>   	partition rootfs {
>> -		partition-type = 0x83
> 
> Why don't you also switch this one to partition-type-uuid?

The replacement for this would be "partition-type-uuid = L", which is 
the default. I believe I saw a patch recently that removed those default 
entries, which is why I didn't include it.

Best,
Marcus

> 
> Regards,
> Yann E. MORIN.
> 
>>   		image = "rootfs.ext4"
>>   	}
>>   }
>> -- 
>> 2.25.1
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
