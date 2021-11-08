Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B7E7C433F5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:02:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79B4A61054
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:02:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 79B4A61054
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37EA86085C;
	Mon,  8 Nov 2021 22:02:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q4v-14kfOjqg; Mon,  8 Nov 2021 22:02:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A748060860;
	Mon,  8 Nov 2021 22:02:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E9C221BF2FC
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:02:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D396F80ED0
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:02:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BphVhY1fGyOt for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 22:02:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd13147.aruba.it (smtpcmd13147.aruba.it [62.149.156.147])
 by smtp1.osuosl.org (Postfix) with ESMTP id 83B4180E7B
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 22:02:04 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id kCiImLEQGueW5kCiImNLFA; Mon, 08 Nov 2021 23:02:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636408922; bh=z1BDyXI0olmynenk23vMn0rsYCALYL9xhPSef9cEGt4=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=a20GfTdqleo53mvmj4ExFCoI9kbWfwXc9poQ8IGEQUONDnQ2Wqd1CzWu98N6gDWfG
 Xo8P8Lvp52EA161SehUCGuaUuG1vUyD4RYwRdOx0ewQH313TFuMSSYio1syH34Y/e0
 lb+BtQOPZHLjVs2Qxxhqpz1j/HiBIWCQ49/sD5+nBP26o5/my0vrsFUvD+QlP1jrZq
 JneAmtfj0SPTE6zqI4ypiQWmHFjuKDmBykmIMvhgD9GkU2agCO3Kp7sTXHxwxz+/NH
 2ZPgSOG+SuPKnmmc9zGW47Qd+FJWFdcf03EzxqAoBowQblWXzEgz4GrBcQbeGhFCnx
 p3sAdvVDkUT8g==
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <20211107020519.3057454-1-giulio.benetti@benettiengineering.com>
 <8ffa84de-ed47-3310-d4b2-fb1b22b49738@mind.be>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <79df7e04-9a19-c144-742c-71c00cfd0060@benettiengineering.com>
Date: Mon, 8 Nov 2021 23:02:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <8ffa84de-ed47-3310-d4b2-fb1b22b49738@mind.be>
Content-Language: en-US
X-CMAE-Envelope: MS4wfDumRV+JN3fGm/ijUf+9XQyxl9dtmmJM/WmPSIVZLCa0GReV/CC2OJLDorW2wb0r5GbfQagmYeo8OD3FrvzLnAHdilzikmfa3O1au7Nr/I88OyQYC0I4
 A7O3YxM4p+R0eT5bD5UfjrgS4FI/uicXU7Nsvw2aLV1xIIL0oBuig7VH+KU60QNtvd4FvF4VC1Qo/kM98pINPkj1CnO5wqSabV9CO1t9ldNEEek6VsNWodXa
Subject: Re: [Buildroot] [PATCH 023/102]
 board/cubietech/cubieboard2/genimage.cfg: beautify file
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 11/8/21 11:00 PM, Arnout Vandecappelle wrote:
> 
> 
> On 07/11/2021 03:05, Giulio Benetti wrote:
>> Beatify this genimage .cfg file to have consistency with all genimage .cfg
>> files in Buildroot.
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>>    board/cubietech/cubieboard2/genimage.cfg | 5 +++--
>>    1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/board/cubietech/cubieboard2/genimage.cfg b/board/cubietech/cubieboard2/genimage.cfg
>> index b082ab0da1..5ef10ef135 100644
>> --- a/board/cubietech/cubieboard2/genimage.cfg
>> +++ b/board/cubietech/cubieboard2/genimage.cfg
>> @@ -9,6 +9,7 @@ image boot.vfat {
>>    			"boot.scr"
>>    		}
>>    	}
>> +
>>    	size = 10M
>>    }
>>    
>> @@ -19,8 +20,8 @@ image sdcard.img {
>>    	partition u-boot {
>>    		in-partition-table = "no"
>>    		image = "u-boot-sunxi-with-spl.bin"
>> -		offset = 8192
>> -		size = 1040384 # 1MB - 8192
>> +		offset = 8K
>> +		size = 1016 # 1MB - 8KB
> 
>    1016K, not 1016 bytes...

Thank you Arnout. I check again for the 4th time all files too.

>    Regards,
>    Arnout
> 
>>    	}
>>    
>>    	partition boot {
>>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
> 

-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
