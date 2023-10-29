Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF42EC4332F
	for <buildroot@archiver.kernel.org>; Sun, 29 Oct 2023 12:28:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 759FF7059D;
	Sun, 29 Oct 2023 12:28:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 759FF7059D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I7GR9trJ4yRC; Sun, 29 Oct 2023 12:28:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B36BC704EC;
	Sun, 29 Oct 2023 12:28:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B36BC704EC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 34AFA1BF3A7
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 12:28:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0DDBE4EE82
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 12:28:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DDBE4EE82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bkNBzaQQRJqd for <buildroot@lists.busybox.net>;
 Sun, 29 Oct 2023 12:28:47 +0000 (UTC)
X-Greylist: delayed 590 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 29 Oct 2023 12:28:46 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D870F4EE81
Received: from mx1.sberdevices.ru (mx1.sberdevices.ru [37.18.73.165])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D870F4EE81
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 12:28:46 +0000 (UTC)
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
 by mx1.sberdevices.ru (Postfix) with ESMTP id C2B8C100003;
 Sun, 29 Oct 2023 15:18:51 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru C2B8C100003
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru
 [172.16.192.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx1.sberdevices.ru (Postfix) with ESMTPS;
 Sun, 29 Oct 2023 15:18:50 +0300 (MSK)
Received: from [192.168.1.13] (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.37; Sun, 29 Oct 2023 15:18:50 +0300
Message-ID: <cf7ceaeb-c76a-4be2-8160-4bc5bdd19a3f@salutedevices.com>
Date: Sun, 29 Oct 2023 15:18:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20231027155221.977752-1-ovlevin@salutedevices.com>
 <20231028223503.GF687180@scaer>
In-Reply-To: <20231028223503.GF687180@scaer>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 180965 [Oct 29 2023]
X-KSMG-AntiSpam-Version: 6.0.0.2
X-KSMG-AntiSpam-Envelope-From: ovlevin@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 543 543
 1e3516af5cdd92079dfeb0e292c8747a62cb1ee4, {Tracking_uf_ne_domains},
 {Tracking_from_domain_doesnt_match_to}, lists.buildroot.org:7.1.1;
 127.0.0.199:7.1.2; d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;
 salutedevices.com:7.1.1; p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1;
 100.64.160.123:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2023/10/29 11:52:00
X-KSMG-LinksScanning: Clean, bases: 2023/10/29 11:52:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960,
 bases: 2023/10/29 10:40:00 #22344003
X-KSMG-AntiVirus-Status: Clean, skipped
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=salutedevices.com; s=mail; t=1698581931;
 bh=a7GKoFjsuygxrSJtsV8mWHDS3jNVXKvERhLw1+vdStI=;
 h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
 b=FcZXNW137SiOTQi5+2UbDvrsiNU7UYUbqMkX0VZASdOfkO9pG11tDSsvRpHqCOdy1
 N6iDndXbM2Hfx6D0/TNUvhnnq2jso7QX08/Lznz0VFKPCnrqQYGN3VzLau1y0MZULs
 oQ6ja7uTd5HCrGlOSR5PWm6flb0EI2cYU+xo0RJ/uCSTdSfiWOs+/Fk/reHa88iDa0
 KM0ucLA8+7YAOoTnK3kOx6qcbnEzakMvo87gnOd96Mff34gaGzu2qAqv2rARSJxkkM
 dv/R2wEBrKlxeWO9rlyUf0gaMbdxqB8uWzYs24TaUzh6uOAHDlivj2GcKWPfWYnAYW
 2CEm5lixL5ouQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=salutedevices.com
 header.i=@salutedevices.com header.a=rsa-sha256 header.s=mail
 header.b=FcZXNW13
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pycryptodomex: fix
 package build with gcc 4.8
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
From: Oleg Lyovin via buildroot <buildroot@buildroot.org>
Reply-To: Oleg Lyovin <ovlevin@salutedevices.com>
Cc: olegartys@gmail.com, James Hilliard <james.hilliard1@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Yann,

On 29.10.2023 01:35, Yann E. MORIN wrote:
> Oleg, All,
> 
> On 2023-10-27 18:52 +0300, Oleg Lyovin via buildroot spake thusly:
>> python-pycryptodomex uses C99 features like variable
>> declaration in for-loop statement, while old compilers
>> assumes C89 by default.
>>
>> This patch explicitly specifies C99 standard.
>>
>> Change-Id: I934211714307cea43541167fbc72ff30fb66ad5f
>> Signed-off-by: Oleg Lyovin <ovlevin@salutedevices.com>
>> ---
>>  package/python-pycryptodomex/python-pycryptodomex.mk | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/package/python-pycryptodomex/python-pycryptodomex.mk b/package/python-pycryptodomex/python-pycryptodomex.mk
>> index 3790aa4787..ee8ce6e069 100644
>> --- a/package/python-pycryptodomex/python-pycryptodomex.mk
>> +++ b/package/python-pycryptodomex/python-pycryptodomex.mk
>> @@ -13,5 +13,11 @@ PYTHON_PYCRYPTODOMEX_LICENSE = \
>>  	Public Domain (pycrypto original code)
>>  PYTHON_PYCRYPTODOMEX_LICENSE_FILES = LICENSE.rst Doc/LEGAL/COPYRIGHT.pycrypto
>>  
>> +PYTHON_PYCRYPTODOMEX_CFLAGS = -std=c99
>> +
>> +PYTHON_PYCRYPTODOMEX_ENV = \
>> +	CFLAGS="$(PYTHON_PYCRYPTODOMEX_CFLAGS)"
>> +HOST_PYTHON_PYCRYPTODOMEX_ENV = $(PYTHON_PYCRYPTODOMEX_ENV)
> 
> It is weird to use the target settings for the host settings, even if
> they appear to be identical. Instead, we prefer duplicating the
> assignment; indeed if the target variable gains target-related settings
> in the future, they would inadvertently leak into the host variant.
> 
> The second issue is that (AFAIU) passing CFLAGS in the environment will
> override the other CFLAGS we set in our infrastructure, and we instead
> must complement them, see for example how it's done in python-brotli.
> 
> So, I've done that, and... the target settings leaked into the host
> variable...
> 
> So, I've fixed that so that the host and target variant are based of the
> TARGET/HOST_CFLAGS, plus -std=c99
> 
> Applied to master with the above fix, thanks.
> 
> Regards,
> Yann E. MORIN.
> 
>>  $(eval $(python-package))
>>  $(eval $(host-python-package))
>> -- 
>> 2.42.0.270.gbcb6cae296
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
> 

Much appreciate for the great explanation and patch fix!

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
