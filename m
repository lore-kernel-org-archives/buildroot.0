Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C55C38142
	for <buildroot@archiver.kernel.org>; Tue, 31 Jan 2023 16:05:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 968E841798;
	Tue, 31 Jan 2023 16:05:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 968E841798
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QN1SFNFC1J4J; Tue, 31 Jan 2023 16:05:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 985164179B;
	Tue, 31 Jan 2023 16:05:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 985164179B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8E4221BF419
 for <buildroot@lists.busybox.net>; Tue, 31 Jan 2023 16:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 666DD60B92
 for <buildroot@lists.busybox.net>; Tue, 31 Jan 2023 16:05:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 666DD60B92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zIBAVkoiv820 for <buildroot@lists.busybox.net>;
 Tue, 31 Jan 2023 16:05:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5DB260ADD
Received: from smtpdh18-2.aruba.it (smtpdh18-2.aruba.it [62.149.155.133])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5DB260ADD
 for <buildroot@buildroot.org>; Tue, 31 Jan 2023 16:05:37 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.66.151])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Mt8Zp71TDq9NKMt8Zpx48X; Tue, 31 Jan 2023 17:05:36 +0100
Message-ID: <51634838-32b7-4ae0-0251-2cd4fc2207ae@benettiengineering.com>
Date: Tue, 31 Jan 2023 17:05:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
References: <20230130144655.1193660-1-maxime.chevallier@bootlin.com>
 <20230130144655.1193660-5-maxime.chevallier@bootlin.com>
 <37a680ce-9213-de60-4d6c-306a787d4bad@benettiengineering.com>
 <20230131161558.5982b380@pc-7.home>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20230131161558.5982b380@pc-7.home>
X-CMAE-Envelope: MS4xfNdBOb9IUSpnAXy5lo68oiCJe9rXb7D054s06YKzn6n3PVz8tKCM9d3TWXQ0+lCw+Ec2KbiXQAOR5vdWc1DfdNT5dGVAceJfXyuGOzqflkHdMioSJOTv
 ngS0Hp8kVdE07S2MYZ3EtHwAzISTMyeszv1VMFmNEk6dZ3dQDqhYvXDfl6KfBcuZ5udfAkhsZoeBWgOXDQqnNF9JV23iU0Umdr3WXk6Gy/n6KITAJ3iJoTj5
 DR6PLqDc6dGHHT9PTL8NnLYQjWg2LnJm0yxw7XhogRebgnRA1jUSYHnmAEKYDm2Wq4bsv54CL9quxGKgdu1ZP9qKzLupWhWrOTRniGlX1/hp2lIx4s2PkFPX
 L87ZcK+z
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1675181136; bh=XBXAvq2sB0GCJGA2EcEU3EOCppE9z1zdZCpzIpzegtw=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=CMAX1pkK4JzFVvNSt2c4i29vAZVjhBLKvbXQIkVm5MDtoZ621DeUNt6tFJcaiql6w
 R0XyoWUxfX7EoV+zEIdnVTI1rLsalaT33Eh83LqPzpe1m+ghCK4oTcR3W7GbhSqfQf
 wAfQRtU7RqMv9myKwP84Izj9f8/Zou8FRxuy+5SG6bzlAxdJIAvAB6yJZAxAKL9ktn
 NNJ5uZupTIhLwfLzEDbzhpBImY6CFSsGIe+zPNUvBUQhZ1WDY0c3+SEv8GvMFpajm1
 kGROSj6XU4qMLnKI3GYmqGFqQMBHPB90Gsvqkyo/drXFGwEd5oqNFgd+U5Z++QcxCW
 V1xW9ptPMpVOA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=CMAX1pkK
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

Hi Maxime,

On 31/01/23 16:15, Maxime Chevallier via buildroot wrote:
> Hello Giulio,
> 
> On Tue, 31 Jan 2023 00:12:47 +0100
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> Hi Maxime,
>>
>> I was trying to build trace-cmd but it hangs while calling the first
>> make on building stage.
> 
> Aw ok, do you have some logs of what happens before it hangs ?

Sure:
https://pastebin.com/t883KNqZ

It hangs there forever :-/

>> I've tried with both make 4.3 and 4.3.91. Which make version are you
>> using?
> 
> I'm using make 4.3 on my side.

So we're aligned

> Thanks for giving my patches a try :)

Thank you instead for providing the bump!

Kind regards
-- 
Giulio Benetti
CEO/CTO@Benetti Engineering sas

> Maxime
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
