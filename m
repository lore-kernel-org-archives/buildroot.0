Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA221C4332F
	for <buildroot@archiver.kernel.org>; Sun, 29 Oct 2023 20:43:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42FB270940;
	Sun, 29 Oct 2023 20:43:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42FB270940
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FdfJpe4EZnjx; Sun, 29 Oct 2023 20:43:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9374F7093C;
	Sun, 29 Oct 2023 20:43:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9374F7093C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DCFD31BF308
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 20:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B50F185196
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 20:43:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B50F185196
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gILFf9a7Rwz0 for <buildroot@lists.busybox.net>;
 Sun, 29 Oct 2023 20:43:28 +0000 (UTC)
Received: from smtpcmd0987.aruba.it (smtpcmd0987.aruba.it [62.149.156.87])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 11F9F85192
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 20:43:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11F9F85192
Received: from [192.168.50.162] ([146.241.104.249])
 by Aruba Outgoing Smtp  with ESMTPSA
 id xCd1qyNi1PegxxCd1qsV81; Sun, 29 Oct 2023 21:43:23 +0100
Message-ID: <4b77e07f-b11d-4cba-9c5d-2b98ddb07777@benettiengineering.com>
Date: Sun, 29 Oct 2023 21:43:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20231026155754.1637976-1-giulio.benetti@benettiengineering.com>
 <20231029113325.GX687180@scaer>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20231029113325.GX687180@scaer>
X-CMAE-Envelope: MS4xfD1pQ2Fy9mDj6OyD5KQivaMCDDRZ2oK/Udi2SNdQERU9wNbJWwseCwwp7+2rHo3JBsoZPtfA4cJ185D01H97PUwlzOM3HAhSdBBqfnjimlRtmYLpO5Fo
 bVClYbmetERH2kYoB3kX32PUB6M06Js0lzzSqPV2lYzkyT5N5+jz8airCcFj5PAn/mEIc91UjCl8R9ZD203LKAnNHSHpNGqiTaf/6K7E27g5rA/X0SwqYdgB
 zbYG4QqD1qsKNnXCy9MmYJuPW55EN86wthdkVBA4DkE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1698612203; bh=8+iBJtfTipzLFISmIz6TsJAMW+BDoKuTSphVsBJQzB0=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=UGKazN8yoM4IchOJhjH7Qatob5mis29wrnVijH2avxJH9yW/CWdOhuaGYxo0RORQd
 iole307TCUi4jY9QtrTACN7QW6JyJhNBDkpU2ZVqrRPk/JyCuHd7eIX7ulLbkpc1kd
 VV8N/YTVeOPdch4RGASqAaEri42kt6GNZI43WSo38tlcYv19Ad/n/dEQrFPKT7V+0H
 3+2Bps4cBvtcXNZ365pWPnoKKou9j58jU3VO3wc1D3AAcVc5VE0AlCiMxIxrkQvBt5
 X8I8Qa56nNX5J6MtbqdwCPwO20AowYhqtkAbf5BSCloXCfCtqERrrIaQkBMdIV7gtY
 G+2xGhwobmQgA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=UGKazN8y
Subject: Re: [Buildroot] [PATCH] package/libnvme: needs host-swig
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

On 29/10/23 12:33, Yann E. MORIN wrote:
> Giulio, All,
> 
> On 2023-10-26 17:57 +0200, Giulio Benetti spake thusly:
>> Fixes:
>> http://autobuild.buildroot.net/results/a63d18fd318783d7e3d1cede062c9c7cacb10282/
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>>   package/libnvme/libnvme.mk | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/package/libnvme/libnvme.mk b/package/libnvme/libnvme.mk
>> index 38394b9931..3b622839fa 100644
>> --- a/package/libnvme/libnvme.mk
>> +++ b/package/libnvme/libnvme.mk
>> @@ -10,6 +10,8 @@ LIBNVME_LICENSE = LGPL-2.1
>>   LIBNVME_LICENSE_FILES = COPYING
>>   LIBNVME_INSTALL_STAGING = YES
>>   
>> +LIBNVME_DEPENDENCIES += host-swig
> 
> swig is only needed to build the python bindings, no?
> In which case it should be in the python conditional block, right?

Oh, yes, absolutely.

Thanks for reviewing.

Going to send V2

Kind regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas

> Regards,
> Yann E. MORIN.
> 
>>   LIBNVME_CONF_OPTS += \
>>   	-Dtests=false
>>   
>> -- 
>> 2.34.1
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
