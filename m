Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB9E7C77B61
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 20:04:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 429D5409AB;
	Mon, 10 Apr 2023 20:04:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 429D5409AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YyWpE_APE-Mh; Mon, 10 Apr 2023 20:04:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C86A409B3;
	Mon, 10 Apr 2023 20:04:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C86A409B3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 76FB21BF345
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 20:04:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5BBAB81B70
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 20:04:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BBAB81B70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ovAKC9O1QxnA for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 20:04:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 033C981B0A
Received: from smtpdh16-2.aruba.it (smtpdh16-2.aruba.it [62.149.155.101])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 033C981B0A
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 20:04:17 +0000 (UTC)
Received: from [192.168.50.162] ([146.241.106.178])
 by Aruba Outgoing Smtp  with ESMTPSA
 id lxkNpFoC60mc7lxkNpQv14; Mon, 10 Apr 2023 22:04:15 +0200
Message-ID: <6241830b-f2db-fd9e-182f-2592cac7ad13@benettiengineering.com>
Date: Mon, 10 Apr 2023 22:04:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20230410194955.104709-1-giulio.benetti@benettiengineering.com>
 <20230410195626.GN2819@scaer>
Content-Language: en-US, it
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20230410195626.GN2819@scaer>
X-CMAE-Envelope: MS4xfIQkfXj4vyCbxoEBhjnQfUp3odRc+iOKuEj/pwsuU82PkRfwCOSR3hE5QaDjsIlF57oWwjNuuJc9ivO7BtesDOLuh39JzJZ0rjJtrN0QjkIynk0KeF9P
 d9Uk3AUooH4wwkNup8FN8OI9t4Ly5tWbGvdOc23u0b12Hjjiskxe/+VvpTyYki0xojf1yZQBH8hVZ48qnMZfrp5+qCrOKr1gEXwID9kcnhccHxXwxYgdNd4k
 2DkWz4k0PVAQ76nuNEVeNuSUyuw33wRChFcUOLJ9QLKHLJJTLCxLpioTmPornUe/
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1681157055; bh=Uv/upDaCgcGXYSzPu0Gz7En1zjJlvHEVTlO5CGvT844=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=Lt+jL/eleN3pkYpzdGLzBEtHKyi4tpPEk0HChFIQJC/MFc3Bxf00GCLn2Iwwmjb7b
 qc2meFzYB7qY81vpY0IBZ3Df/5KX9py3shaOU/4jxrXICB/uyJCpFQkbvxcVDeWxuq
 WgrmzkWp9S7g62VaTAuuNtA/YNPIUoyVfU9zeXWczVpU6Ao7NYPLDLkoRt5FSeNr58
 qG4Bymp67yoSm7iwnF4se2BxzPZRCEJVupOnG2SHP/zQxvUZJiGxkdifUsrQxEoEFu
 KdTFLlmENEFIORh7omHBrx9Q42G7gZcPk0Pxygn18ZRDB5W9uQ0ePJVaQ9NbYwoyb4
 x3Lept9hyv/rg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=Lt+jL/el
Subject: Re: [Buildroot] [PATCH] package/xr819-xradio: bump to version
 2023-04-10
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 10/04/23 21:56, Yann E. MORIN wrote:
> Giulio, All,
> 
> On 2023-04-10 21:49 +0200, Giulio Benetti spake thusly:
>> This version fixes stack parameters issues:
>> https://github.com/fifteenhex/xradio/commit/a835c4747be088978a055b9645e3c523d0c54fe1
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> 
> This bump is already part of:
>      https://patchwork.ozlabs.org/project/buildroot/list/?series=350228
> 
> so I marked your patch as not-applicable. Thanks!

Oops, right. Thank you!

Regards
-- 
Giulio Benetti
Benetti Engineering sas

> Regards,
> Yann E. MORIN.
> 
>> ---
>>   package/xr819-xradio/xr819-xradio.hash | 2 +-
>>   package/xr819-xradio/xr819-xradio.mk   | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/package/xr819-xradio/xr819-xradio.hash b/package/xr819-xradio/xr819-xradio.hash
>> index 60185db736..8676f065f8 100644
>> --- a/package/xr819-xradio/xr819-xradio.hash
>> +++ b/package/xr819-xradio/xr819-xradio.hash
>> @@ -1,4 +1,4 @@
>>   # Locally computed
>> -sha256  2b297fbcc9b5ed190bcfff9f6f808c170632ac3d69dbd92156a7f4f57142dec9  xr819-xradio-005f28cfe9e20b7f2dfd9d32d38ee97060dc707f.tar.gz
>> +sha256  93388424f1f136db541ce056be017f2f0f6688278ac15a88bef34da8f12ffea6  xr819-xradio-119cad7d07aef6973dd44e4dae74d4c9defd06a2.tar.gz
>>   # Locally computed
>>   sha256  db296f2f7f35bca3a174efb0eb392b3b17bd94b341851429a3dff411b1c2fc73  LICENSE
>> diff --git a/package/xr819-xradio/xr819-xradio.mk b/package/xr819-xradio/xr819-xradio.mk
>> index e5daaa6051..66c08e7921 100644
>> --- a/package/xr819-xradio/xr819-xradio.mk
>> +++ b/package/xr819-xradio/xr819-xradio.mk
>> @@ -4,7 +4,7 @@
>>   #
>>   ################################################################################
>>   
>> -XR819_XRADIO_VERSION = 005f28cfe9e20b7f2dfd9d32d38ee97060dc707f
>> +XR819_XRADIO_VERSION = 119cad7d07aef6973dd44e4dae74d4c9defd06a2
>>   XR819_XRADIO_SITE = $(call github,fifteenhex,xradio,$(XR819_XRADIO_VERSION))
>>   XR819_XRADIO_LICENSE = GPL-2.0
>>   XR819_XRADIO_LICENSE_FILES = LICENSE
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
