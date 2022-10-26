Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31EA5C38A2D
	for <buildroot@archiver.kernel.org>; Wed, 26 Oct 2022 18:11:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7E4B408C1;
	Wed, 26 Oct 2022 18:11:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7E4B408C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lH6M4i10pKDA; Wed, 26 Oct 2022 18:11:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A59A6408B6;
	Wed, 26 Oct 2022 18:11:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A59A6408B6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2BC1A1BF580
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 18:11:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14A2460D78
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 18:11:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14A2460D78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NZGEIapW8JrI for <buildroot@lists.busybox.net>;
 Wed, 26 Oct 2022 18:11:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 980CA60D77
Received: from smtpcmd0756.aruba.it (smtpcmd0756.aruba.it [62.149.156.56])
 by smtp3.osuosl.org (Postfix) with ESMTP id 980CA60D77
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 18:11:29 +0000 (UTC)
Received: from [192.168.50.173] ([146.241.83.94])
 by Aruba Outgoing Smtp  with ESMTPSA
 id nksBoodbLuz2mnksBouLpH; Wed, 26 Oct 2022 20:11:28 +0200
Message-ID: <15ee7ca2-eb3b-3a5a-549a-de372f7c9810@benettiengineering.com>
Date: Wed, 26 Oct 2022 20:11:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
To: kris@embeddedTS.com, buildroot@buildroot.org
References: <20221026132634.999254-1-giulio.benetti@benettiengineering.com>
 <20221026132634.999254-8-giulio.benetti@benettiengineering.com>
 <1666805548.3174.1.camel@embeddedTS.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <1666805548.3174.1.camel@embeddedTS.com>
X-CMAE-Envelope: MS4xfDAdsmBJPPmE2UjrcTkX1hWSqhD0goEmQW/NUU8l2fIvu3wQYoLVg6rayhh+LCW1uK9404CahLebpP1anoVZ4R4ri4be3elMza3P68HhSVCW/5YxtUwf
 zbPT6l/I5RxcGnMHHQhO3GWkrtv65iqYHc0I6FH5o8ZacIVv/qGSbe8NrzaRvhKSgL67ZfUePZ2+si4WEZO8nQ5ESizfI97GO+I8heerJLwIgw4glc7CPGTN
 ae5nsWtYv2oTrBCfxuKON5boQSjrgHN+6Mbt2UItgi7PElEWVIEMLv/XLVYrhGDdHQ0b2YHPrFlGnJLbRSzlZtX7mnhkp0oGtD9aJaq//L8lSGCJUxlPn+jW
 Uqnos5ut
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1666807888; bh=hPD3inRhpK9hAZsXV2axDK0+v0BviO6McgqCmItE1G4=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=Nk2GWwM4s2zD5fBqEfIg/krA7yslJiADNgjToo9iPSSVJT782HXkEqoPLYQ4aupC5
 7E3mbllDVnBiZFZmdMGuhzEtwqz80vIQ5qP6Qsg1aGr0bVY287u9v7iHa3052yHkiH
 INpyH6AC/eC99sGxHATcWMGHY7CKCjJyibR8CXyYxv/yW7SXmCfLHU8OA11wsZ9VCF
 QFT8jROchl098HUeHPTkrXSlD6bDdTfOth0CTNDIm4Ih7vsWP+zcPUf8NzWr4LAflc
 WvqM6A71kb5itbktu1Pe/Av6TNvNiBbZhh2t55UEL0bMseMFvFXHn3SuVNMBDSdGhB
 JvZSSNNiZUdKw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=Nk2GWwM4
Subject: Re: [Buildroot] [PATCH 7/7] package/wilc-driver: disable package
 for s390x architecture
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Kris, All,

sorry for my previous HTML e-mail,

On 26/10/22 19:32, Kris Bahnsen via buildroot wrote:
> On Wed, 2022-10-26 at 15:26 +0200, Giulio Benetti wrote:
>> s390x doesn't support CONFIG_WIRELESS in Linux so let's disable this
>> package for this architecture.
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>>   package/wilc-driver/Config.in | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/package/wilc-driver/Config.in b/package/wilc-driver/Config.in
>> index 7ed062bb66..7f970bd38b 100644
>> --- a/package/wilc-driver/Config.in
>> +++ b/package/wilc-driver/Config.in
>> @@ -1,5 +1,6 @@
>>   config BR2_PACKAGE_WILC_DRIVER
>>   	bool "wilc kernel module"
>> +	depends on !BR2_s390x
>>   	depends on BR2_LINUX_KERNEL
>>   	help
>>   	  External kernel module for WILC1000/3000 devices.
>> @@ -59,4 +60,5 @@ endif
>>   endif
>>   
>>   comment "wilc kernel module needs a Linux kernel to be built"
>> +	depends on !BR2_s390x
>>   	depends on !BR2_LINUX_KERNEL
> 
> I don't know much on the s390x arch, nor Buildroot paradigms for disabling packages
> per-architecture, however the change itself looks good to me.

If you check here:
https://elixir.bootlin.com/linux/latest/source/net/Kconfig#L371

You will see that Linux Wireless subsystem is activated only when s390x 
is not enabled.

This also created a build failure with another rtlxxxx driver due to that:
http://autobuild.buildroot.net/results/693053491ba61edcff0f75a4f30c13958e7e12ce/

This is why I came in with this patchset that prevents that kind of 
build failure.

> Reviewed-by: Kris Bahnsen <kris@embeddedTS.com>

Thank you
Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
