Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD6B3C61DA4
	for <buildroot@archiver.kernel.org>; Tue, 14 Feb 2023 12:16:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E7A7408E8;
	Tue, 14 Feb 2023 12:16:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E7A7408E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Funt38hffOI; Tue, 14 Feb 2023 12:16:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40F4C408AD;
	Tue, 14 Feb 2023 12:16:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40F4C408AD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BB6DC1BF424
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 12:16:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A2414408AD
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 12:16:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2414408AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9YMpfnvVLbfY for <buildroot@lists.busybox.net>;
 Tue, 14 Feb 2023 12:16:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBE7340888
Received: from smtpcmd13146.aruba.it (smtpcmd13146.aruba.it [62.149.156.146])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EBE7340888
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 12:16:43 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.66.151])
 by Aruba Outgoing Smtp  with ESMTPSA
 id RuEipAUdsZOVXRuEjpYHv6; Tue, 14 Feb 2023 13:16:41 +0100
Message-ID: <636d30cd-bb2d-ec64-1b4f-9a1d2c98f2b7@benettiengineering.com>
Date: Tue, 14 Feb 2023 13:16:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
To: yann.morin@orange.com
References: <20230214105033.1042139-1-giulio.benetti@benettiengineering.com>
 <16600_1676373529_63EB6E19_16600_354_5_20230214111846.GB3487@tl-lnx-nyma7486>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <16600_1676373529_63EB6E19_16600_354_5_20230214111846.GB3487@tl-lnx-nyma7486>
X-CMAE-Envelope: MS4xfLnhHhuNACKo1kljF7jXAZ2Mv7q8cLhz0VpvwN/pNRcQEwOTyqiai4ADGpkiO40hxCFcUWZ0Y0ERKF2PP1lsQ6Ebcb5t9FWLPittuzfHiXG8ppa0r7ed
 C6NC1ofeRYDHkwoE5cNmz2W/emcSk3TSk6nWfUfOu5CBAYAE07iKBRME5x8y8jrgntSyo9sReJsQNiKirdOjXmYNsZ5Jm3C3DT9BVCDFy4P74+O8iEcW6Bg7
 vSWqEttxJ24jFWe+NiNyyw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1676377001; bh=kNfkDlmFeM+E3rzOPGOv0EE91y4vCL7wsLUj4MVB2xU=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=c0I57/dHj0yQc2GrhgOau8Nh/k43tXBbaV9e76cXwF2YFQ4+A2iACgTvI91lOK/LG
 NXhrpJP8lzYmVKD4uqq5k3qq+6BTTvhyd7We0nqymyaLLbJvPsOCo6ZkGI4OmB9m0O
 K8QlDXkQo5cp6ftrT75aOhpvzooxIZR8BUzUW2Y0sVS+AqlIOIMIgJh0kAOofG77tJ
 8TX8jJixDsxUzNIFURfHk66MBo16TwL67qr8rdHc/istBBfO12dpQfqKKYg6bD1MCq
 9jk9Tfof7XNTjNAdghbpjmIR5KXV5UVCVtvv+PcRximQYP4w7VAM0aszGeDwpFdjNY
 DJGq2JepZRqzQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=c0I57/dH
Subject: Re: [Buildroot] [PATCH] package/rtl8821cu: disable package for
 s390x architecture
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

Hi Yann,

On 14/02/23 12:18, yann.morin@orange.com wrote:
> Giulio, All,
> 
> On 2023-02-14 11:50 +0100, Giulio Benetti spake thusly:
>> s390x doesn't support CONFIG_WIRELESS in Linux so let's disable this
>> package for this architecture.
> 
> Instead of fixing each and every rtlXXXX packages one by one when there
> is an autobuild failure, can we just exclude them in bulk, since they
> are all wireless drivers, and thus will never be available for s390x?

something like this[0] seems to work, what about it?

Of course I need to clean up all the packages that depends on !BR2_s390x
but the idea works for me, at least I've tested on my side and it does.

If you say it's ok I clean up, check better for other Wireless Drivers,
create a good patch and send it while rejecting this one.

[0]: 
https://patchwork.ozlabs.org/project/buildroot/patch/20230214120808.1282621-1-giulio.benetti@benettiengineering.com/

-- 
Giulio Benetti
CEO/CTO@Benetti Engineering sas

> Regards,
> Yann E. MORIN.
> 
>> Fixes:
>> http://autobuild.buildroot.net/results/3a74d393cdbc308eab9ec3f0f9e420947669a0ea/
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>>   package/rtl8821cu/Config.in | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/package/rtl8821cu/Config.in b/package/rtl8821cu/Config.in
>> index a5a7b9d255..00a41b5196 100644
>> --- a/package/rtl8821cu/Config.in
>> +++ b/package/rtl8821cu/Config.in
>> @@ -1,8 +1,10 @@
>>   comment "rtl8821cu needs a Linux kernel to be built"
>> +	depends on !BR2_s390x
>>   	depends on !BR2_LINUX_KERNEL
>>   
>>   config BR2_PACKAGE_RTL8821CU
>>   	bool "rtl8821cu"
>> +	depends on !BR2_s390x
>>   	depends on BR2_LINUX_KERNEL
>>   	help
>>   	  rtl8821cu wifi driver
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
