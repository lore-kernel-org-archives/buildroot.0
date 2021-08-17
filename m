Return-Path: <SRS0=/l1z=NI=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0228AC4338F
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 21:28:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8430C600D4
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 21:27:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8430C600D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 510C780DE8;
	Tue, 17 Aug 2021 21:27:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UIsXQkGXeUVv; Tue, 17 Aug 2021 21:27:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE48780DEE;
	Tue, 17 Aug 2021 21:27:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E67F41BF396
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 21:27:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E0D4440112
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 21:27:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NWfGiCeP9b8T for <buildroot@lists.busybox.net>;
 Tue, 17 Aug 2021 21:27:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0651.aruba.it (smtpcmd0651.aruba.it [62.149.156.51])
 by smtp2.osuosl.org (Postfix) with ESMTP id 644C440019
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 21:27:48 +0000 (UTC)
Received: from [192.168.47.129] ([89.164.10.249])
 by Aruba Outgoing Smtp  with ESMTPSA
 id G6cdm5vJBxC2nG6cdm1I0q; Tue, 17 Aug 2021 23:27:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1629235668; bh=zQSOKshfh6+TDoJncKfnKMfGOMND9iOctfmizbIY+Eo=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=dX7emKte2a5680hBTTMMhlARxl6momS4fb2wq/WV1oe/8F7D3TurohXIHiGByk/Wc
 CXiblqkFa/E4TBvoTOlbXTEtyKeKMptFRIZzSbc7Tzyzz/Yx+ESKYEf7TyikxYQZJt
 Z3qLEgF219Cz7USC7xRYBl+WvX1RD7ENoNPSA0qurj89x3ZVJYLaIwXXSqxJ4bXAxw
 iFXG/FG+gtz8YRHaFsn7IfFGv5DGLw6yTfB3O+spRTgCp2K4gY8n+mqMWdi15P7kZS
 sgkJO/uX41pKb6WwSDip/UmDkiLNdCxJYT73lzyCM5U8OXwDxQB75Q/HU/Dqh4OUTT
 Z4r4qOu5CL+jw==
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <20210726235656.1df4ddeb@windsurf>
 <20210726223435.2906458-1-giulio.benetti@benettiengineering.com>
 <20210726223435.2906458-4-giulio.benetti@benettiengineering.com>
 <105b5335-044a-b800-2451-7c9edf6cf987@mind.be>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <d6448805-9a07-0d5a-c527-60b42944de69@benettiengineering.com>
Date: Tue, 17 Aug 2021 23:27:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <105b5335-044a-b800-2451-7c9edf6cf987@mind.be>
Content-Language: en-US
X-CMAE-Envelope: MS4wfFfbcJg9kXqkmMyiAHeW6GOYr6zihT2+VtpDe9Frm9SHPfUnKAWYERIgfMdE5uJRC7CkhILN+nfjMgzyQIhQnmo+E1sPlWANMv85NWp3rez99sQXQKpy
 nLFrEiPBbb1e9gReQja1JtOr0VtjwvQLE7Kcau3ShJPDQI9ipmpxh9UeCRmDCY9RPCFoqGc5BWc5cj2pXrckZqk4RyJyHypkt42kqmU1HS71xkQOJnHG3Uia
 js8YUe00LgiWXfmt/QjGbSPv3kztj3srSTry+hsS/m2cOPYS2onLrMacyGDL2x3RPbt2WYx1rB4ljp2iqMJV2N7N/aSNW15uMUmWTawFOq9+Eq6Xg0uL/EZR
 rRCk/IT0bFeqj6PnAXtKlvJAl8RoGiGsSRMOqh11JNBS6eDPhg6wG/orsa/9r5rUg17hy7P7agvAaNfWLvuKLUbl//ocLZAaK22JzEaVnEx133MeeRw=
Subject: Re: [Buildroot] [PATCH v2 3/3] toolchain: remove binutils bug 21464
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Michael Nosthoff <buildroot@heine.tech>,
 Maxim Kochetkov <fido_max@inbox.ru>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi Arnout,

On 8/17/21 11:11 PM, Arnout Vandecappelle wrote:
> 
> 
> On 27/07/2021 00:34, Giulio Benetti wrote:
>> This bug has been fixed upstream and backported to buildroot binutils
>> package. So let's remove it from toolchain/Config.in and from packages
>> that are affected by it:
>> - libgeos
>> - postgis
>> - protobuf
> 
>   It's not clear to me if all the external toolchains that we use also have this
> patch already. Basically that boils down to the stable and bleeding edge bootlin
> toolchains.
> 
>   Well, I'm pretty sure they're not yet updated, since they're still  2020.08-1...

For this patch we have to wait until all or1k patches have been applied 
to Bootlin toolchain and they got rebuilt and bumped.
Then we can apply it since Buildroot will become OpenRisc bug free. But 
this depends on external OpenRisc toolchains that only Bootlin provide

Kind regards
-- 
Giulio Benetti
Benetti Engineering sas

> 
>   Regards,
>   Arnout
> 
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
>> ---
>>   package/libgeos/Config.in  | 4 +---
>>   package/postgis/Config.in  | 4 +---
>>   package/protobuf/Config.in | 1 -
>>   toolchain/Config.in        | 6 ------
>>   4 files changed, 2 insertions(+), 13 deletions(-)
>>
>> diff --git a/package/libgeos/Config.in b/package/libgeos/Config.in
>> index 86a1cddcf3..124e2da661 100644
>> --- a/package/libgeos/Config.in
>> +++ b/package/libgeos/Config.in
>> @@ -2,7 +2,6 @@ config BR2_PACKAGE_LIBGEOS
>>   	bool "libgeos"
>>   	depends on BR2_INSTALL_LIBSTDCPP
>>   	depends on BR2_USE_WCHAR
>> -	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464
>>   	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
>>   	help
>>   	  GEOS (Geometry Engine - Open Source) is a C++ port of the
>> @@ -13,7 +12,6 @@ config BR2_PACKAGE_LIBGEOS
>>   
>>   	  https://trac.osgeo.org/geos
>>   
>> -comment "libgeos needs a toolchain w/ C++, wchar, not binutils bug 21464, 27597"
>> +comment "libgeos needs a toolchain w/ C++, wchar, not binutils bug 27597"
>>   	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
>> -		   BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464 || \
>>   		   BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
>> diff --git a/package/postgis/Config.in b/package/postgis/Config.in
>> index 04705f7e16..78c52ea7b2 100644
>> --- a/package/postgis/Config.in
>> +++ b/package/postgis/Config.in
>> @@ -6,7 +6,6 @@ config BR2_PACKAGE_POSTGIS
>>   	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11, proj
>>   	depends on BR2_TOOLCHAIN_HAS_THREADS # proj
>>   	depends on BR2_USE_WCHAR # libgeos, proj
>> -	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464 # libgeos
>>   	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597 # libgeos
>>   	select BR2_PACKAGE_LIBGEOS
>>   	select BR2_PACKAGE_PROJ
>> @@ -20,9 +19,8 @@ config BR2_PACKAGE_POSTGIS
>>   
>>   	  https://postgis.net/
>>   
>> -comment "postgis needs a toolchain w/ C++, threads, wchar, gcc >= 4.7, not binutils bug 21464, 27597"
>> +comment "postgis needs a toolchain w/ C++, threads, wchar, gcc >= 4.7, not binutils bug 27597"
>>   	depends on !BR2_microblazeel && !BR2_microblazebe # ICE
>>   	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || \
>>   		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
>> -		BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464 || \
>>   		BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
>> diff --git a/package/protobuf/Config.in b/package/protobuf/Config.in
>> index 30050950aa..46c820b9cf 100644
>> --- a/package/protobuf/Config.in
>> +++ b/package/protobuf/Config.in
>> @@ -24,7 +24,6 @@ config BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
>>   	default y if BR2_TOOLCHAIN_HAS_ATOMIC
>>   	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
>>   	depends on BR2_USE_MMU # fork()
>> -	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464
>>   
>>   config BR2_PACKAGE_PROTOBUF
>>   	bool "protobuf"
>> diff --git a/toolchain/Config.in b/toolchain/Config.in
>> index 8603e2aaff..3598307b20 100644
>> --- a/toolchain/Config.in
>> +++ b/toolchain/Config.in
>> @@ -71,12 +71,6 @@ source "package/gdb/Config.in.host"
>>   
>>   comment "Toolchain Generic Options"
>>   
>> -# https://sourceware.org/bugzilla/show_bug.cgi?id=21464
>> -# Affect toolchains built with binutils 2.31.1, still not fixed.
>> -config BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464
>> -	bool
>> -	default y if BR2_or1k
>> -
>>   # https://sourceware.org/bugzilla/show_bug.cgi?id=27597
>>   # Affect toolchains built with binutils 2.36.1, still not fixed.
>>   config BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
>>

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
