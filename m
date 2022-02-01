Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5CB5C433F5
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 17:38:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8278082FF9;
	Tue,  1 Feb 2022 17:38:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PL9LWZ3uP1Cp; Tue,  1 Feb 2022 17:38:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D47C582C4D;
	Tue,  1 Feb 2022 17:38:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0D2B41BF396
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 17:38:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F04D660AA3
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 17:38:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e6em1-6wYHBT for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 17:38:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-g.aruba.it (smtpcmd01-g.aruba.it [62.149.158.217])
 by smtp3.osuosl.org (Postfix) with ESMTP id 02DE260EE9
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 17:38:00 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Ex6NnsWwAroAhEx6NnY7Qp; Tue, 01 Feb 2022 18:37:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643737079; bh=TMOxwbBzjDJR0CbfpBodze2L56rmCYjrR0lSSmPTw0w=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=TS6V/E9pDUrWe8Q+pmoo22iC2Xij7ct7TDIBWrKAuIK3FEgH0Za8P9dJ/zidBhoCM
 GcA0oSIMh6qsycA/MsBCJCajoHC+UzmV9cGkTdMZgt/pnSBN2utLpNpzTH+4ckPw5R
 lpv3UNP71du+mAxbvXJbzeR4yKYpvROKLHglUD/zRxMqdKSyYk2BgFZsY5W4UDP+zC
 /RtS635d2cISXlUqdSOYqwOfoDhFt7IfkmJ088qOWE08lPpMrLZLfjh8WlU++MLvqd
 Qo/XaldQUDsdgzYOPgYn8VcWk+tZL02u7lBxK/sc0Jz8RD9K369tCu9bb2l+L4Xdxd
 xiSKLX7WdqJpA==
Message-ID: <9c345e33-0f39-c52b-55e1-46c7cf096e2f@benettiengineering.com>
Date: Tue, 1 Feb 2022 18:37:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Martin Hicks <mort@bork.org>
References: <20220201173352.160244-1-giulio.benetti@benettiengineering.com>
 <20220201173352.160244-2-giulio.benetti@benettiengineering.com>
 <20220201173633.GC21736@darwin.bork.org>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220201173633.GC21736@darwin.bork.org>
X-CMAE-Envelope: MS4wfB5otN68N90NglJ6XUqW5ZtvK5nzFuAbQWYUc1ICNMhMYE2GSDyt0xnk/ewQgsBEGYYR/qFeygR1shs2YaFPX+pP4cDA5nmtZRiLXz+baPBO4WGX22UZ
 0rfRNqPC1yHnvvL/h0bCjUFucObYoWMrmhdcK6pfwBC2Eq+uIXmWsxtL4Zii7DqrQdTNTaSnqzyVmjo3LUHwWgIhXwLk9fx1VRVFbLW2b4LgAaQ9Ihq/iZH6
Subject: Re: [Buildroot] [PATCH 2/2] DEVELOPERS: add Giulio Benetti to
 cryptsetup package
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Martin,

On 01/02/22 18:36, Martin Hicks wrote:
> On Tue, Feb 01, 2022 at 06:33:52PM +0100, Giulio Benetti wrote:
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> 
> Signed-off-by: Martin Hicks <mort@bork.org>
> 
> I could be removed as a Cryptsetup maintainer.  I no longer have a vested interest
> in using cryptsetup in a buildroot firmware.

That's ok, I send a patch for this and I ask you to give a Acked-by:

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> Thanks,
> mh
> 
>> ---
>>   DEVELOPERS | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/DEVELOPERS b/DEVELOPERS
>> index 38724726d4..5255b096b0 100644
>> --- a/DEVELOPERS
>> +++ b/DEVELOPERS
>> @@ -1097,6 +1097,7 @@ F:	configs/asus_tinker_rk3288_defconfig
>>   F:	configs/olimex_a*
>>   F:	package/at/
>>   F:	package/binutils/
>> +F:	package/cryptsetup/
>>   F:	package/erlang-jiffy/
>>   F:	package/gcc/
>>   F:	package/harfbuzz/
>> -- 
>> 2.25.1
>>
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
