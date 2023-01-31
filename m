Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E39DCC38142
	for <buildroot@archiver.kernel.org>; Tue, 31 Jan 2023 16:31:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26062417DE;
	Tue, 31 Jan 2023 16:31:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26062417DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SRzJ--reRa4T; Tue, 31 Jan 2023 16:31:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7C704161F;
	Tue, 31 Jan 2023 16:31:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7C704161F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C277B1BF419
 for <buildroot@lists.busybox.net>; Tue, 31 Jan 2023 16:31:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A943B60BF9
 for <buildroot@lists.busybox.net>; Tue, 31 Jan 2023 16:31:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A943B60BF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WA7Y9aEAq9If for <buildroot@lists.busybox.net>;
 Tue, 31 Jan 2023 16:31:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 118FF60BDE
Received: from smtpdh18-1.aruba.it (smtpdh18-1.aruba.it [62.149.155.132])
 by smtp3.osuosl.org (Postfix) with ESMTP id 118FF60BDE
 for <buildroot@buildroot.org>; Tue, 31 Jan 2023 16:31:26 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.66.151])
 by Aruba Outgoing Smtp  with ESMTPSA
 id MtXZp7Mljq9NKMtXZpxL7g; Tue, 31 Jan 2023 17:31:25 +0100
Message-ID: <95838e6d-1271-b347-61c9-94b5f0cae29f@benettiengineering.com>
Date: Tue, 31 Jan 2023 17:31:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
References: <20230130144655.1193660-1-maxime.chevallier@bootlin.com>
 <20230130144655.1193660-5-maxime.chevallier@bootlin.com>
 <37a680ce-9213-de60-4d6c-306a787d4bad@benettiengineering.com>
 <20230131161558.5982b380@pc-7.home>
 <51634838-32b7-4ae0-0251-2cd4fc2207ae@benettiengineering.com>
 <ea48dd89-b89f-479d-7df7-a739b66f3101@benettiengineering.com>
In-Reply-To: <ea48dd89-b89f-479d-7df7-a739b66f3101@benettiengineering.com>
X-CMAE-Envelope: MS4xfPt/YCW2JLwm9xNPnqIAUKmVx4cjDCaEefgxc7w/bCTXbwiV3HOsE2vC90TLuUqa3Et1xciTaTKFapkP6k6tmUn1CLiyEjIFeiMCQkQ3PjfWCW2CjaNo
 /NyPO6NKPofIrW9TQEeV4WLeojBuLvXGIhxEFho6atfVsvJXNYec7jGEEBLw2NNJh8XJvvrQVhI8QOh2FfU89Guqmjh29qEcFtJzqJ+hLLGJqWgUBldSDjeF
 7Iq3FRT4MaMDOUYx9MLH/MRZ4A+AYdzoEspswjHDgIGMpcYuzdx9n1TbdyuoK1IRUF3eVTUlwuCSBz59J9VoyDgXvGF8C4nqCEzj0ZURHabodbCgutwBl4BP
 glBsqC8L
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1675182685; bh=Z6HA7LuLfyVuxl52qMCEghJtl0XSqLdfGDssmBxSw1U=;
 h=Date:MIME-Version:Subject:From:To:Content-Type;
 b=iW4X4ppIryXkeQq53va+0TQenRJGfm+zvjiYQa94E3gbXF++1b1wCvOow9gCUwJcE
 AhrowBNekBfBNzmUw9sR+3vCP6XRoByNjWxOLwrtfXrqbtrm5pj17EsOicb8hCel7P
 xKojjhHAO6fe0rBfQO4qkneoszDsvOnkcT5V3EVahyA+qwcsfW2+Vwq5UtZJ9HrYVU
 eOS64u/Gi9Y1TCW+kNCu+SU5m/aX/TaWTTJOK4rY91vqYTY3dyh1E/udYEi9EQQ51l
 29W4wKskSMVm3z7UdgUAmpNofT5IQX0Brq+lOLIEgwC5b6O+70eNtYdoMh4Sj87Ho0
 Ui7qnDhJFpNFw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=iW4X4ppI
Subject: Re: [Buildroot] [PATCH 4/4] package/trace-cmd: bump to 3.1.5
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
Cc: Pierre Floury <pierre.floury@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 31/01/23 17:07, Giulio Benetti wrote:
> On 31/01/23 17:05, Giulio Benetti wrote:
>> Hi Maxime,
>>
>> On 31/01/23 16:15, Maxime Chevallier via buildroot wrote:
>>> Hello Giulio,
>>>
>>> On Tue, 31 Jan 2023 00:12:47 +0100
>>> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
>>>
>>>> Hi Maxime,
>>>>
>>>> I was trying to build trace-cmd but it hangs while calling the first
>>>> make on building stage.
>>>
>>> Aw ok, do you have some logs of what happens before it hangs ?
>>
>> Sure:
>> https://pastebin.com/t883KNqZ
>>
>> It hangs there forever :-/
> 
> Ah, I've also given a try with -O0 but the behaviour is the same
> 
>>
>>>> I've tried with both make 4.3 and 4.3.91. Which make version are you
>>>> using?
>>>
>>> I'm using make 4.3 on my side.
>>
>> So we're aligned
>>
>>> Thanks for giving my patches a try :)
>>
>> Thank you instead for providing the bump!
>>
>> Kind regards
> 

This is the log after 20 minutes:
https://pastebin.com/3saYFn1a

very strange. And it still hasn't finished. I let it go and see if it
builds successfully. It sounds like a make problem. All other buildings
I'm doing works correctly. Just to be sure I've also rebooted my PC.

CPU usage on the make command is around 6% only, almost 0% of Ram 
consumption.

-- 
Giulio Benetti
CEO/CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
