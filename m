Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D7BAC433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 21:50:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38DF341681;
	Thu, 17 Feb 2022 21:50:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F7LEv8i-xAKj; Thu, 17 Feb 2022 21:50:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59D8F41663;
	Thu, 17 Feb 2022 21:50:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3B2D21BF37A
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 21:50:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2895441663
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 21:50:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zLO0t5p6knzf for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 21:50:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14161.aruba.it (smtpcmd14161.aruba.it [62.149.156.161])
 by smtp4.osuosl.org (Postfix) with ESMTP id B5D4541662
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 21:50:34 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.188.82])
 by Aruba Outgoing Smtp  with ESMTPSA
 id KofYn8Q2RNVvLKofZnaMSs; Thu, 17 Feb 2022 22:50:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1645134633; bh=lmk72wDm/e3gQjwnLhaC8En6csrSk4J0O3JOF2rYyxc=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=iA3SsffLAccfyhMsvb9RugmkEOGRvJrTbhLEEoIPC5TxhMSSwm6+uxhFLl8xYFkXp
 5eXIN3n9xaCw/aLXlwM8pcC+RgCYRAfEo1C6XuB9AE4QT134C84Lw/KRD9jD5c9HBc
 7xsmAQjvGK5ekDtDh7XsVX0vI7xyA4IC1TUA3J4rixUWRZsmP2zsHcKjukWU81pyOG
 XHUkbrJeNdVk2z1pYu37TgmRZw5DfjGbRqUYSgf/4TG+QPP5dEt7UkIUtAiCN9WnBU
 6G7Ki///hYCJwvlk5JHBe+RdOZNR2rAeqcoBW5tEMa5tRKDpo2zabRa7/9yH0SlGEm
 e7ITaJRalkx4A==
Message-ID: <d42095bc-b8b2-4910-b25e-c5bf369f8fa5@benettiengineering.com>
Date: Thu, 17 Feb 2022 22:50:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Marcus Hoffmann <marcus.hoffmann@othermo.de>
References: <20220217155549.1084829-1-marcus.hoffmann@othermo.de>
 <20220217155549.1084829-3-marcus.hoffmann@othermo.de>
 <20220217214443.GN522310@scaer>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220217214443.GN522310@scaer>
X-CMAE-Envelope: MS4wfE1JPAcCWtA/jHdiT51TrC7lUmddjq/s2jZowm5g5j/VnofcXrgFjyS4YvOQdv2hO8mukKrMqTYwdQBC6UmgwfzwDsx+cKtPfoGGVlW9G83cKE8+SIJk
 dYC08B5jfnhE2weVhQ9X092vY5TCxZVLeYeaH/RBcVocPFgnHz+QaSbcDLVWC/GF6jDfBTgfnlQWwP29x3dzza6ytYuB+vxPL9vqxTO2y3vf9/e4dxR0A1ej
 XEZziINfhezkwvQKtPKPC8ZiGF/8bZx4Lyo+3txr/6ad0PJOFOBx101+qOD+ccVwMkyH2Mz49tf6YK6S4yC44A==
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
Cc: buildroot@buildroot.org, Suniel Mahesh <sunil@amarulasolutions.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

On 17/02/22 22:44, Yann E. MORIN wrote:
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

I've been asked by Arnout to drop L since it's the default:
https://lists.buildroot.org/pipermail/buildroot/2022-February/636945.html

I see both Thomas and Arnout seem to go for single letters intead of 
extended specific partition-type-uuid. That's why I didn't comment on 
this point that only removes partition-type.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

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
