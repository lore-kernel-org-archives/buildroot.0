Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2005CD128A
	for <buildroot@archiver.kernel.org>; Tue,  9 Apr 2024 21:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 692AE815E7;
	Tue,  9 Apr 2024 21:59:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JGzwxf3xW1Tf; Tue,  9 Apr 2024 21:59:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7145081751
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7145081751;
	Tue,  9 Apr 2024 21:59:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EBDE11BF97D
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 21:59:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E337040603
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 21:59:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Htq2CHRoeM16 for <buildroot@lists.busybox.net>;
 Tue,  9 Apr 2024 21:59:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.217;
 helo=smtpcmd01-g.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DB01840611
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB01840611
Received: from smtpcmd01-g.aruba.it (smtpcmd01-g.aruba.it [62.149.158.217])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DB01840611
 for <buildroot@buildroot.org>; Tue,  9 Apr 2024 21:59:11 +0000 (UTC)
Received: from [192.168.50.121] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id uJUir5PfqGFWQuJUjrsivL; Tue, 09 Apr 2024 23:59:09 +0200
Message-ID: <6068206a-9a0c-4ef4-a5bb-9e6f35218297@benettiengineering.com>
Date: Tue, 9 Apr 2024 23:59:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Don <dterry_engineer@yahoo.com>, buildroot@buildroot.org
References: <e2634bc6-2e68-4331-8354-49407b40f191.ref@yahoo.com>
 <e2634bc6-2e68-4331-8354-49407b40f191@yahoo.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <e2634bc6-2e68-4331-8354-49407b40f191@yahoo.com>
X-CMAE-Envelope: MS4xfJ7qoXmenq8vlxM5lL8YIoiuVYDksQj3Fg2kRyU5pngx9PLAyqLe62peZKfUZZx2/Zc0yrgfiMdp1eeBnoKX2uE0NCWfY7Dq8bKv1nNt1gA8WA4y3DgT
 PfDvYgxRFnNKUP0dSxrQcetSQckZVmuo6gFJPpTEOm4lB0FhZRYRa9oSUQpup22QchIH0JfZyHXkeBCI6WdXBhAud6SdkfQ+U4ZpAQ9NNk8qwS+X3TUdwu4d
 AkhdJjizN/caL/OHCkHnJQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1712699949; bh=l7YAPjJg1nkYLz0FSimOXGObyum/lfLP/bDscjo5hZ0=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=n70CN1lQmUPt9ggK5vcnsLQJp1c0twIGgi41jyJgzs8DwJ/pVWCxVHvfka4YlPOw2
 p4kdjxwCo6+8WJYVZJM9/JR5h6qMyqdSfTom13txAW2vOcQ0qtgsOfgr6XJmF28tBP
 tREtSfVadMwMgJFufnYumNk90qGkiJlPNqaxsKkUG3kjF98TFhbsAr7g7jjZIGn7GZ
 GWdM1Ru+OPeEOIL9jf9Om44e/i70r3tgcVImPXN7LNFoImOFU4fzXz27m620X+vF0G
 LpK7DT3gqxCZfprBTKqHQSRoJYKitZ99W16rTl6S3ImsaBveaG5cV8vtpfLYDaMeOs
 vkN3c1Va6/kkQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=n70CN1lQ
Subject: Re: [Buildroot] Problem with device tree
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

Hi Don,

On 09/04/24 23:23, Don via buildroot wrote:
> This is my first time using buildroot. Following the instructions of 
> bootlin.com/doc/training/buildroot/buildroot-labs.pdf, building for 
> Beaglebone Black though not the wireless of the training pdf. Under 
> Kernel - selected device tree blob and in-tree device tree name I put 
> am335x-boneblack. However I get
> 
> Device Tree Source (arch/arm/dts/am335x-.dtb) is not correctly specified.
> Please define 'CONFIG_DEFAULT_DEVICE_TREE'
> or build with 'DEVICE_TREE=<device_tree>' argument
> 
> What does it want? Something is missing but I don't know what.

Starting from  Linux version 6.5[0] you have to specify the manufacturer 
folder too compared to previous versions(i.e. 6.4[1]). So if you're 
using a kernel newer than 6.5 you have to specify something like:
arch/arm/dts/ti/omap/am335x-.dtb

Hope this helps.

[0]: https://elixir.bootlin.com/linux/v6.5-rc1/source/arch/arm/boot/dts
[1]: https://elixir.bootlin.com/linux/v6.4.16/source/arch/arm/boot/dts

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering

> Thanks.
> 
> Have a Blessed day!
> 
> Don
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
