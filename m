Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31246C433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 14:25:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E82D360B89;
	Sun,  6 Feb 2022 14:25:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nozzhx6ZDy7T; Sun,  6 Feb 2022 14:25:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D92560B12;
	Sun,  6 Feb 2022 14:25:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9AB051BF5AA
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 14:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9626F813B1
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 14:25:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bVzYITODyoUE for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 14:25:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpweb147.aruba.it (smtpweb147.aruba.it [62.149.158.147])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61850813A5
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 14:25:52 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id GiU9ntTflXmFAGiUAnVvTr; Sun, 06 Feb 2022 15:25:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644157551; bh=8TQ43fNZm3BkjckEQwGwBNa+TsqJYBSHQXnCGwW+jYo=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=FOXr9kto2MV9JE5TSgdgVsdDofdz47HXVx1e8CDf2m0aKP4C4jqBn2P/zbDWoPaua
 CyJ+SSQs0ak5OPzJw9ivafqlZ7GPMzoDb13GX5ExxQL5flR3BDecmOxf5wCP4+3I2U
 qE+K1wcVjR6MIGlz9K6HYuOw8hZ+KBFDbUo2iJ57Amq+PO8bonHfuhyvCr34pduRkf
 tlR1ce9V62Ol7uiTTK/44PFis7O80mvusM4rDm8QD7ox8vA9cDJi/70cse0w3apJpY
 tDw6hFCLRQncGmRRWu3OYqVWHwFZacf4AivXnoKwolx+dMGOEm2grE6+ezZV3OHV5u
 uiDqAzogWvPuQ==
Message-ID: <febd6a86-7b73-7263-ce66-2056fa102342@benettiengineering.com>
Date: Sun, 6 Feb 2022 15:25:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220206115156.6042cc1b@windsurf>
 <20220206112620.1637342-1-giulio.benetti@benettiengineering.com>
 <20220206112620.1637342-2-giulio.benetti@benettiengineering.com>
 <20220206131656.16e2c8a6@windsurf>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220206131656.16e2c8a6@windsurf>
X-CMAE-Envelope: MS4wfN0jhJKaehOF3vxo/WuQSCcRod14HsNBMQ+qiqDhfo3mWh1Sk4nK5D+GzpkO0ju4zM+fmqR+daj811H6QOsgNcE9gYfDDfvk6GheRedHrlrzi1z56mjN
 TtClq4Mkpxza0EMBvTVnRil7SwTxsVwMLiVktzyCQsnNQvVDF8b9XXZXoQxd+UC9n7+RM1xIORIuinG+OFNtAUWiZ7A50BtT1fYs5j9qt8kaKMuijLGcOaNT
 PpfIAtCftEdrRfJMjP7eMAoRH2Exi7lzW50Ei1TofEMnAPi9MAvrtZbueij0rO0XCKgEZIbHj2PpqBO9mmlt92S2bMABbZ2BeZcR0DBJCq4=
Subject: Re: [Buildroot] [PATCH v3 1/2]
 configs/microchip_sama7g5ek_mmc_defconfig: set custom linux version to
 5.15.21 and add host openssl for linux
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
Cc: Eugen Hristev <eugen.hristev@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On 06/02/22 13:16, Thomas Petazzoni wrote:
> On Sun,  6 Feb 2022 12:26:19 +0100
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> Fixes:
>> https://gitlab.com/ymorin/buildroot/-/jobs/2035821098
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> 
> Did you actually test on HW that 5.15.21 was working? 

Unfortunately I don't have board, so no.

> Shouldn't this be
> done by the original submitter of the defconfig.
> 
> Eugen, Ludovic?

It would be great to have it tested. Both, this and the 
microchip_sama7g5ek_mmc_dev_defconfig too.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
