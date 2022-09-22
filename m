Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59474C6FA8B
	for <buildroot@archiver.kernel.org>; Thu, 22 Sep 2022 06:54:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4A49832BF;
	Thu, 22 Sep 2022 06:54:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4A49832BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iOLo8J4__nb4; Thu, 22 Sep 2022 06:54:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D810B832A9;
	Thu, 22 Sep 2022 06:54:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D810B832A9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 171B51BF957
 for <buildroot@lists.busybox.net>; Thu, 22 Sep 2022 06:54:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F4099610AC
 for <buildroot@lists.busybox.net>; Thu, 22 Sep 2022 06:54:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F4099610AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5Wvtj3kWnnDu for <buildroot@lists.busybox.net>;
 Thu, 22 Sep 2022 06:54:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C76ED60D4B
Received: from smtpng3.i.mail.ru (smtpng3.i.mail.ru [94.100.177.149])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C76ED60D4B
 for <buildroot@buildroot.org>; Thu, 22 Sep 2022 06:54:46 +0000 (UTC)
Received: by smtpng3.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1obG6d-0000xA-Mm; Thu, 22 Sep 2022 09:54:44 +0300
Message-ID: <8f9dee46-4ca5-e5c2-e651-8ccd8ba05bde@inbox.ru>
Date: Thu, 22 Sep 2022 09:54:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220919062023.1091771-1-fido_max@inbox.ru>
 <20220921221523.21e6656d@windsurf>
In-Reply-To: <20220921221523.21e6656d@windsurf>
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD9EBD81B01C038F8F3CE59F3A543F714FF9E29FD4C2AF5F232182A05F53808504018ED5919E6AE8D11FE71145C48EEB60CB346759C15A3D65D73A53D71D0A27D99
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7BCC85671EC7A750CEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637DA5CEC9EE7F170198638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8E457458014C863533D51AAABC88D40E16F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE767883B903EA3BAEA9FA2833FD35BB23D9E625A9149C048EE26055571C92BF10FF04B652EEC242312D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BE2CCD8F0CAA010FB389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7CA35FE21102777C0943847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: 9604B64F49C60606AD91A466A1DEF99B296C473AB1E142185AC9E3593CE4B31AB1881A6453793CE9274300E5CE05BD4401A9E91200F654B0CEC15DA3DDAC97275036A336AC3467B491D6ACAD302B196C2B1F75FCCDAF83119C2B6934AE262D3EE7EAB7254005DCED8DA55E71E02F9FC08E8E86DC7131B365E7726E8460B7C23C
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D3472E5ECC12A9739C17A59EC00521E575898BE4CC328B0865BB6774C12F04C8039E7599243E4B78E731D7E09C32AA3244C63E0F911B60298E311B5AFFD64CDF1DD3E8609A02908F271729B2BEF169E0186
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojS8Mlo6Y3xQl+qUHaneeaDw==
X-Mailru-Sender: 689FA8AB762F7393CC2E0F076E87284EE85B9FCD2C38ADAA594D1C922A304C8898CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=0ZIqppu/qG6a+v1R8OGl0pfNPQ0LFzQJ74W6eztpx9I=; 
 t=1663829686;x=1663919686; 
 b=TH83JDVc7Cr1wBRA/Xo232Zdu7x4JoYuRyMmhazxmM8j9Y39g5U0rbZ2BvLmiuc2cpbev0qQ/e6f3zpNEH7AqI8Xe7FWDDfgQIO6bJqmXKtYU37TXsudcid84rUiP6QgndwxCgb2lZYrotO/hb5r6FvoDPyR8u3DSrXYtGYgPx1zoTjdb/FyzlJuIkD+5z42M9yVnLTj7f1uKjyyOfJtndOgJ2c2zU8KiaTlgogzpei9cqHd58OTNMR98d8eFiBoObr875cL2giWlIpV8/4DKTdCPbO9cGHyBsT5pcdH0A1b5lbaG4n2YPh6SZxV/NvvoVjidyZYgu0CEnQRdnfUAw==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=TH83JDVc
X-Mailman-Original-Authentication-Results: smtpng3.m.smailru.net; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: Re: [Buildroot] [PATCH 1/1] package/postgis: bump version to 3.3.1
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
From: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 21.09.2022 23:15, Thomas Petazzoni wrote:
> On Mon, 19 Sep 2022 09:20:23 +0300
> Maxim Kochetkov <fido_max@inbox.ru> wrote:
> 
>> Release-notes: https://git.osgeo.org/gitea/postgis/postgis/src/tag/3.3.1/NEWS
>>
>> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
>> ---
>>   ...kefile.in-do-not-force-static-linkin.patch | 23 ++++++++++---------
>>   package/postgis/postgis.hash                  |  2 +-
>>   package/postgis/postgis.mk                    |  2 +-
>>   3 files changed, 14 insertions(+), 13 deletions(-)
>>
>> diff --git a/package/postgis/0002-raster-loader-Makefile.in-do-not-force-static-linkin.patch b/package/postgis/0002-raster-loader-Makefile.in-do-not-force-static-linkin.patch
>> index 756a7c10dd..20a359fadd 100644
>> --- a/package/postgis/0002-raster-loader-Makefile.in-do-not-force-static-linkin.patch
>> +++ b/package/postgis/0002-raster-loader-Makefile.in-do-not-force-static-linkin.patch
>> @@ -1,6 +1,6 @@
>> -From 29c33c483e22a4445d870739187d128df0f11f60 Mon Sep 17 00:00:00 2001
>> -From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>> -Date: Wed, 27 Jul 2022 15:12:40 +0200
>> +From 50af3f4fc2353ba35fd054060e27e034d29b1c78 Mon Sep 17 00:00:00 2001
>> +From: Maxim Kochetkov <mkochetkov@airspan.com>
>> +Date: Mon, 19 Sep 2022 09:09:44 +0300
> 
> Since you are not doing substantial changes on this patch, it would be
> nicer to preserve the authorship as it is.

Let's wait for the response from upstream.

> 
>>   Subject: [PATCH] raster/loader/Makefile.in: do not force static linking
>>   
>>   This is similar to commit
>> @@ -13,23 +13,24 @@ object XYZ".
>>   
>>   Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>>   Upstream: https://github.com/postgis/postgis/pull/702
> 
> Do you think you could follow-up with upstream on this? I did an
> initial fix, but that wasn't accepted as-is. However, my interest in
> postgis is limited, so I don't think I will have the chance to look
> into this in the near future.
Sure. I've just posted some comments on
https://github.com/postgis/postgis/pull/702
https://github.com/postgis/postgis/pull/598

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
