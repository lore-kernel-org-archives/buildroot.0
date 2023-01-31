Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D92CC636D3
	for <buildroot@archiver.kernel.org>; Tue, 31 Jan 2023 16:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A8987403E9;
	Tue, 31 Jan 2023 16:07:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8987403E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GiuBf3oMjHHb; Tue, 31 Jan 2023 16:07:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E3D0540441;
	Tue, 31 Jan 2023 16:07:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3D0540441
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0025E1BF419
 for <buildroot@lists.busybox.net>; Tue, 31 Jan 2023 16:07:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD1EA81BA8
 for <buildroot@lists.busybox.net>; Tue, 31 Jan 2023 16:07:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD1EA81BA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VpQg6QVBj9Tg for <buildroot@lists.busybox.net>;
 Tue, 31 Jan 2023 16:07:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 084F181BCB
Received: from smtpdh18-2.aruba.it (smtpdh18-2.aruba.it [62.149.155.133])
 by smtp1.osuosl.org (Postfix) with ESMTP id 084F181BCB
 for <buildroot@buildroot.org>; Tue, 31 Jan 2023 16:07:05 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.66.151])
 by Aruba Outgoing Smtp  with ESMTPSA
 id MtA0p72Zkq9NKMtA0px4s5; Tue, 31 Jan 2023 17:07:04 +0100
Message-ID: <ea48dd89-b89f-479d-7df7-a739b66f3101@benettiengineering.com>
Date: Tue, 31 Jan 2023 17:07:04 +0100
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
In-Reply-To: <51634838-32b7-4ae0-0251-2cd4fc2207ae@benettiengineering.com>
X-CMAE-Envelope: MS4xfNOSbecZdbiz3rXuvhezimsJz83Yj6M5NY3vSwLujUyNEYmjKo9pt87GWhb63pZqYgCKEKpCy2DmIg26mjO+a4QG4PCyTy4KQNNr9UIRziqkAH4Y6LcX
 20Vs/rxoEwZHwPiAToa3I2ylfulCzgJZ3U+RWN8d28ushdxze73+x4OWr/3fyJS5ss5k9Hcu70VYtONIrbGreX6+5eJyviNoGAPlaqAB6XJYB5nz+5a4NBe/
 dhy8nc+aQ6YeZ5UHPEXNTodXkTqKkjdEjCDDI6vZLgmhkHBGj25b+t3eQAhiGbXoDsYJqOtev+Vbrl9P1BWL58OLJLoaYU3zSuvV/t8mAMwgcS4iwCu1S2SQ
 CAd7eAr6
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1675181224; bh=VgeUNQlTkiXkn6EgoADg51c/z0mdbZ/Za1Wi+3Bu9Fw=;
 h=Date:MIME-Version:Subject:From:To:Content-Type;
 b=b+lwuYB+GkO49bUk4GCYRYgDThJIl7cTBey7Ljnpw2clw3s8bY6TMgmDMcegT6rVY
 zE0r7XdSHdnT0B29a65r9jCY/sy8Tt+bdXiFcFg9B8Xi0L3uOMvkNCTUePqTnicSYg
 xWmS1arOHDSkafe/6M0odQFn3lgFqlTPtXu6rp6JzlkFDjIvz+IVFvuO6ZvcuW39LL
 yDQoZKgTkXfWZ9081UcoKmOnAHxR97DFCkiTNdUJkz13z6Gqp3i5ZBNTAhp8o86bRm
 ISt4k61G0evNnxXPbZxPYOsYfeSNjUBd5eaI3gt5hBWvBp3qEHJmk2sGaOc4zowzsc
 B+i08ueJ6omcA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=b+lwuYB+
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

On 31/01/23 17:05, Giulio Benetti wrote:
> Hi Maxime,
> 
> On 31/01/23 16:15, Maxime Chevallier via buildroot wrote:
>> Hello Giulio,
>>
>> On Tue, 31 Jan 2023 00:12:47 +0100
>> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
>>
>>> Hi Maxime,
>>>
>>> I was trying to build trace-cmd but it hangs while calling the first
>>> make on building stage.
>>
>> Aw ok, do you have some logs of what happens before it hangs ?
> 
> Sure:
> https://pastebin.com/t883KNqZ
> 
> It hangs there forever :-/

Ah, I've also given a try with -O0 but the behaviour is the same

> 
>>> I've tried with both make 4.3 and 4.3.91. Which make version are you
>>> using?
>>
>> I'm using make 4.3 on my side.
> 
> So we're aligned
> 
>> Thanks for giving my patches a try :)
> 
> Thank you instead for providing the bump!
> 
> Kind regards

-- 
Giulio Benetti
CEO/CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
