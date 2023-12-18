Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 292D8C35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 22:44:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D7FC416FC;
	Mon, 18 Dec 2023 22:44:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D7FC416FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p2TYBcW9zhO9; Mon, 18 Dec 2023 22:44:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD08441583;
	Mon, 18 Dec 2023 22:44:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD08441583
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A2D731BF2C8
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 22:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7BC1D41583
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 22:44:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BC1D41583
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3lmHR4369h9F for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 22:44:14 +0000 (UTC)
Received: from smtpdh19-2.aruba.it (smtpdh19-2.aruba.it [62.149.155.149])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D5BA9410C6
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 22:44:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5BA9410C6
Received: from [192.168.50.221] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id FMLJrgieVRpzCFMLJrOU3v; Mon, 18 Dec 2023 23:44:09 +0100
Message-ID: <f7442fdd-d3d1-4204-b0ff-65a2d1ca5f82@benettiengineering.com>
Date: Mon, 18 Dec 2023 23:44:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20231218131117.152328-1-giulio.benetti@benettiengineering.com>
 <ZYB6k7q06aHaKSRP@landeda>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <ZYB6k7q06aHaKSRP@landeda>
X-CMAE-Envelope: MS4xfD800d9xU7kXAodYQHRotQECYvupqbsKsVTH/a863p5vAuXZEFvtoOJ9uB8m8S0l7Q+t82PhSmuhQESiAP/yH978yNWjgesVWJ5NixSAtyC4id1ucnF2
 MA6dN/2gk+QlelKmBg4YiKZQhq8e+gkGgHARZ+rcuxsBbh/tReVhIHoFTiuknBAYv5jSGoTqL2jLOkUYZnLs3//AqQ2vs1A75sSe0Lvtw9Xt2/1BdcqpSEEP
 3BTdGXEow2dl0NH0R8s4YA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1702939449; bh=Mk6D+Njq1AvRS3THTNH8UUQuCgz93ZlvgCGy83NdXgU=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=lmLOVWpVpU2LxgeT229Z/E3/2GKkmI2dtNA+jU9lBy8EbdI2sZ60R/VfvupQLe/Zx
 tVzd9sQyILkpFFvs+iGbSk+p3xzc0Nn2wKwn66SaEL5MtM0YvaICv3kOS9FI5h/uko
 yF9ZUIZUPgPO+oJ4vaVn4WI/g+VwzelsjkPzYn+Dz0pDzqDZzkP9Hp8VtERI5mVdXr
 If8S7fUXURdVzl2ZaYMRplQJx53j6TWa6tj1u3Kl/pMeYyDXoovX6KSlQn0KMozgOS
 10XQtw5YNdjF8XXB1t+n/HWD/mxzDImdXyLN9UKuW27uh685Wof2zL0zbwNpGqYg2A
 ARTOJHi4pZzeQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=lmLOVWpV
Subject: Re: [Buildroot] [PATCH] package/swupdate: bump version to 2023.12
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

On 18/12/23 18:00, Yann E. MORIN wrote:
> Giulio, All,
> 
> On 2023-12-18 14:11 +0100, Giulio Benetti spake thusly:
>> * make json-c mandatory according to [0]
>> * make libubootenv mandatory according to [1]
>> * drop local patch that has been upstreamed [2]
>>
>> [0]: https://github.com/sbabic/swupdate/commit/82e75322443e021d119a026a3476c410f4705d67
>> [1]: https://github.com/sbabic/swupdate/commit/75838874e2575f822ed85d89532f47e9adf781b6
>> [2]: https://github.com/sbabic/swupdate/commit/1999685830d6e9b57014666b9e53e46de17a471c
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
> [--SNIP--]
>> diff --git a/package/swupdate/Config.in b/package/swupdate/Config.in
>> index 7d9fc90e10..b5a567fa8f 100644
>> --- a/package/swupdate/Config.in
>> +++ b/package/swupdate/Config.in
>> @@ -3,9 +3,10 @@ config BR2_PACKAGE_SWUPDATE
>>   	depends on !BR2_STATIC_LIBS
>>   	depends on BR2_TOOLCHAIN_HAS_THREADS
>>   	depends on BR2_USE_MMU # fork()
>> +	select BR2_PACKAGE_JSON_C
> 
> Json-C depends on SYNC_4, so you must propagate the depndency.

thank you,

> 
>> +	select BR2_PACKAGE_LIBUBOOTENV
>>   	# swupdate requires a parser and uses libconfig as default
>> -	select BR2_PACKAGE_LIBCONFIG if !BR2_PACKAGE_JSON_C && \
>> -		!BR2_PACKAGE_HAS_LUAINTERPRETER
>> +	select BR2_PACKAGE_LIBCONFIG if !BR2_PACKAGE_HAS_LUAINTERPRETER
> 
> Previously, when json-C was enabled, libconfig was not necessary. Now,
> json-c is always enabled (it is selected), so is it still needed to
> force libconfig even without a lua-interpreter?

no, you're right, libconfig is not mandatory anymore

Sending V2 soon correcting some Config.in comment too.

Thanks for reviewing!

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas

> Regards,
> Yann E. MORIN.
> 
>>   	help
>>   	  swupdate provides a reliable way to update the software on
>>   	  an embedded system.
>> diff --git a/package/swupdate/swupdate.hash b/package/swupdate/swupdate.hash
>> index 72b71ce12d..c19a82304f 100644
>> --- a/package/swupdate/swupdate.hash
>> +++ b/package/swupdate/swupdate.hash
>> @@ -1,5 +1,5 @@
>>   # Locally calculated
>> -sha256  888df5050035e4fbe14e3a964885646fa3163e727f78c423c3d24c28f7a50b66  swupdate-2023.05.tar.gz
>> +sha256  ce24032300e2b6a6faa3d22e49f981fd90f04ac6f5d7e802166824b0cd5ca669  swupdate-2023.12.tar.gz
>>   sha256  4cf04ed34ff0ebbf5c71345b56e6af5093fc17206364cca0ebbae92ef3940683  LICENSES/BSD-1-Clause.txt
>>   sha256  e27a3e87706b3aa5ff2e50eaafe2e6ed5397fbf2d7679eaf444a6d000518a3a6  LICENSES/BSD-3-Clause.txt
>>   sha256  0558101984550fa84d1d13c2af11d116c20079d2be58711e8d99cadce7009192  LICENSES/CC0-1.0.txt
>> diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
>> index ea4a5a62e5..ca8c140886 100644
>> --- a/package/swupdate/swupdate.mk
>> +++ b/package/swupdate/swupdate.mk
>> @@ -4,7 +4,7 @@
>>   #
>>   ################################################################################
>>   
>> -SWUPDATE_VERSION = 2023.05
>> +SWUPDATE_VERSION = 2023.12
>>   SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
>>   SWUPDATE_LICENSE = GPL-2.0, GPL-2.0+, LGPL-2.1+, MIT, ISC, BSD-1-Clause, BSD-3-Clause, CC0-1.0, CC-BY-SA-4.0, OFL-1.1
>>   SWUPDATE_LICENSE_FILES = LICENSES/BSD-1-Clause.txt \
>> @@ -18,6 +18,7 @@ SWUPDATE_LICENSE_FILES = LICENSES/BSD-1-Clause.txt \
>>   	LICENSES/MIT.txt \
>>   	LICENSES/OFL-1.1.txt
>>   SWUPDATE_INSTALL_STAGING = YES
>> +SWUPDATE_DEPENDENCIES = json-c libubootenv
>>   
>>   # swupdate uses $CROSS-cc instead of $CROSS-gcc, which is not
>>   # available in all external toolchains, and use CC for linking. Ensure
>> @@ -36,13 +37,6 @@ else
>>   SWUPDATE_MAKE_ENV += HAVE_LIBEXT2FS=n
>>   endif
>>   
>> -ifeq ($(BR2_PACKAGE_JSON_C),y)
>> -SWUPDATE_DEPENDENCIES += json-c
>> -SWUPDATE_MAKE_ENV += HAVE_JSON_C=y
>> -else
>> -SWUPDATE_MAKE_ENV += HAVE_JSON_C=n
>> -endif
>> -
>>   ifeq ($(BR2_PACKAGE_LIBARCHIVE),y)
>>   SWUPDATE_DEPENDENCIES += libarchive
>>   SWUPDATE_MAKE_ENV += HAVE_LIBARCHIVE=y
>> @@ -85,13 +79,6 @@ else
>>   SWUPDATE_MAKE_ENV += HAVE_LIBGPIOD=n
>>   endif
>>   
>> -ifeq ($(BR2_PACKAGE_LIBUBOOTENV),y)
>> -SWUPDATE_DEPENDENCIES += libubootenv
>> -SWUPDATE_MAKE_ENV += HAVE_LIBUBOOTENV=y
>> -else
>> -SWUPDATE_MAKE_ENV += HAVE_LIBUBOOTENV=n
>> -endif
>> -
>>   ifeq ($(BR2_PACKAGE_LIBURIPARSER),y)
>>   SWUPDATE_DEPENDENCIES += liburiparser
>>   SWUPDATE_MAKE_ENV += HAVE_URIPARSER=y
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
