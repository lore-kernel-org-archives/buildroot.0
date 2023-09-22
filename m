Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF5DCE7A86
	for <buildroot@archiver.kernel.org>; Fri, 22 Sep 2023 21:07:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9DE8C405D9;
	Fri, 22 Sep 2023 21:07:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9DE8C405D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SJWW17zLuhad; Fri, 22 Sep 2023 21:07:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D22B140547;
	Fri, 22 Sep 2023 21:07:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D22B140547
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 180D01BF476
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 21:07:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E556781E71
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 21:07:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E556781E71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gfb096LmrPi5 for <buildroot@lists.busybox.net>;
 Fri, 22 Sep 2023 21:07:41 +0000 (UTC)
Received: from smtpdh19-2.aruba.it (smtpdh19-2.aruba.it [62.149.155.149])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 03AAA81E3C
 for <buildroot@buildroot.org>; Fri, 22 Sep 2023 21:07:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03AAA81E3C
Received: from [192.168.50.162] ([84.33.144.138])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jnNBq1oQtLVMJjnNCqePs0; Fri, 22 Sep 2023 23:07:38 +0200
Message-ID: <e504da69-70ac-4e37-89f0-1cd3e8e9f234@benettiengineering.com>
Date: Fri, 22 Sep 2023 23:07:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20230921193111.1136943-1-giulio.benetti@benettiengineering.com>
 <20230921204503.GM512384@scaer>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20230921204503.GM512384@scaer>
X-CMAE-Envelope: MS4xfN4MgAc5WlohQB6ew/F6woNU0XTUu/XcrZHrRg4u0GszKu0ZYtiVgVCEQ0m4gOXrudgmkm4xyc0DdrW/BGoxHoNGMXo/WA9FlXpxIsZ7QAKxzDFXZaQA
 u6/bFqAm1iytCsRJVCwbcIpCdaNhFbtERRWxuV2DgxD540FPhEOkSWDcin1nIMBhJWVWbwGzEyOO0GD0AVMeByB86ERsTkdxN8Hntyj+KvYTKfmQpjedOAqJ
 FHg4/qQNioZ0yD3hpL2Knpfcqjm8SYasHyaAIbUc80RDuQnxgLF00z77lqGINclaOIPxoMH44YwNAxDaovgeERH/rByJwpa2x6Scve4PCt4axR8t2yHhg8/L
 4/WILpxB9e2E75ghp4gWTJH8I/+UrfZS3HT5MrxSGKt2u+mqdU/EpC8D73FROWbZOeygryu9jiq9uA/HfS40P+gyCsB6Rg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1695416858; bh=lSTJcx/GvYIa8ho3dKBOSypcrIM9gt6Z4X/O2cs1NJc=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=H6YTK5VILPxJ7QxhBztKtApXQ53cemBwzq2x7Y7LGeAGWMhq7OJHEdYznSA1jASPY
 B2QEXUJHWaPNq4ywMBI97LqdRBGihQiSz7SBZxnN31HHQnQKZAonEdGBRHavTR2RDY
 eWM8kpgXIcop1RH68ZzeCWaCRQRR88LotTCKPdnt9vy0zsdYq+XYClfX0oqn6n1+ds
 lgovSqKoj97JDqLV1WI9KAKvon3y3pU9oJUvt3nrZgPCykeXsF6qC6BHy5dqT8kwjK
 6O2JHjZsu3UsZP+kj1zaKNH6QkA8RQHP+WxqsZbVQp457uwGotaQ6YCD8WsFxwqVyg
 EGWfcIvTYTzhA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=H6YTK5VI
Subject: Re: [Buildroot] [PATCH v3] package/apache: add option
 BR2_PACKAGE_APACHE_DAEMON
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>,
 James Autry <jautry@tekvox.com>, Matthew Maron <matthewm@tekvox.com>,
 buildroot@buildroot.org, Jim Reinhart <jimr@tekvox.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann, All,

On 21/09/23 22:45, Yann E. MORIN wrote:
> Giulio, All,
> 
> TBH, I am not too fond of this two-in-one package... :-(
> However, it is not that ugly, so let's give it a look. See below...
> 
> On 2023-09-21 21:31 +0200, Giulio Benetti spake thusly:
>> From: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
>> With option BR2_PACKAGE_APACHE_DAEMON disabled only htdigest and htpasswd
>> are built and installed. By default BR2_PACKAGE_APACHE_DAEMON is enabled
>> and entire apache daemon is built. This is useful for Mongoose credentials
>> handling.
>>
>> Cc: Jim Reinhart <jimr@tekvox.com>
>> Cc: James Autry <jautry@tekvox.com>
>> Cc: Matthew Maron <matthewm@tekvox.com>
>> Signed-off-by: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
>> ---
>> V1->V2:
>> * Hide "External Apache modules" if BR2_PACKAGE_APACHE_UTILS_ONLY is enabled
>> V2->V3:
>> as suggested by Arnout:
>> * change negative option BR2_PACKAGE_APACHE_UTILS_ONLY to BR2_PACKAGE_APACHE_DAEMON
>> * set a common APACHE_CONF_OPTS and only add specific options for
>>    BR2_PACKAGE_APACHE_DAEMON enabled or not
>> diff --git a/package/Config.in b/package/Config.in
>> index e8dbadadf3..aa5e9b5a98 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -2278,7 +2278,7 @@  menu "Networking applications"
>>   	source "package/alfred/Config.in"
>>   	source "package/aoetools/Config.in"
>>   	source "package/apache/Config.in"
>> -if BR2_PACKAGE_APACHE
>> +if BR2_PACKAGE_APACHE_DAEMON
>>   menu "External Apache modules"
>>   	source "package/modsecurity2/Config.in"
> 
> package/modsecurity2/Config.in also has a redundant dependency on
> BR2_PACKAGE_APACHE, which is now even less relevant.

you're right, so I remove it,

>>   endmenu
>   
>> diff --git a/package/apache/Config.in b/package/apache/Config.in
>> index 270296bce4..5e9e4c5f9d 100644
>> --- a/package/apache/Config.in
>> +++ b/package/apache/Config.in
>> @@ -17,6 +17,14 @@ config BR2_PACKAGE_APACHE
>>   
>>   if BR2_PACKAGE_APACHE
>>   
>> +config BR2_PACKAGE_APACHE_DAEMON
> 
> This new config... [0]
> 
> [--SNIP--]
>> diff --git a/package/apache/apache.mk b/package/apache/apache.mk
>> index 320a6ad20e..83df3854a3 100644
>> --- a/package/apache/apache.mk
>> +++ b/package/apache/apache.mk
> [--SNIP--]
>> @@ -32,10 +30,16 @@ APACHE_MPM = worker
>>   endif
>>   
>>   APACHE_CONF_OPTS = \
>> -	--sysconfdir=/etc/apache2 \
>>   	--with-apr=$(STAGING_DIR)/usr \
>>   	--with-apr-util=$(STAGING_DIR)/usr \
>>   	--with-pcre=$(STAGING_DIR)/usr/bin/pcre2-config \
>> +
>> +ifeq ($(BR2_PACKAGE_APACHE_DAEMON),y)
>> +# Needed for mod_php
>> +APACHE_INSTALL_STAGING = YES
> 
> [0] ... means that BR2_PACKAGE_PHP_SAPI_APACHE will have to be made
> dependent on it rather than on plain BR2_PACKAGE_APACHE.

going to change it,

> Beside modsecurity2 and php, there are no other package that refer to
> apache;
> 
>      $ git grep -E '(select|depends on) BR2_PACKAGE_APACHE'
>      package/modsecurity2/Config.in: depends on BR2_PACKAGE_APACHE
>      package/php/Config.in:  depends on BR2_PACKAGE_APACHE
> 
>> +APACHE_CONF_OPTS += \
>> +	--sysconfdir=/etc/apache2 \
>>   	--enable-http \
>>   	--enable-dbd \
>>   	--enable-proxy \
>> @@ -121,5 +125,19 @@ define APACHE_INSTALL_INIT_SYSTEMD
>>   	$(INSTALL) -D -m 644 package/apache/apache.service \
>>   		$(TARGET_DIR)/usr/lib/systemd/system/apache.service
>>   endef
>> +else
>> +APACHE_CONF_OPTS += \
>> +	--with-static-htdigest \
>> +	--with-static-htpasswd
> 
> Why don't you --disable-http --disable-dbd and so on?
> 
>> +define APACHE_BUILD_CMDS
>> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/support htdigest htpasswd
> 
> If it is possible to properly disable everything else, then we would
> not need custom commands, neither for build...
> 
>> +endef
>> +
>> +define APACHE_INSTALL_TARGET_CMDS
>> +	$(INSTALL) -m 0755 -D $(@D)/support/htdigest $(TARGET_DIR)/usr/bin/htdigest
>> +	$(INSTALL) -m 0755 -D $(@D)/support/htpasswd $(TARGET_DIR)/usr/bin/htpasswd
>> +endef
> 
> ... nor for install.

Unfortunately after many tries I've seen that httpd is always built
using autotools, that's why I've end up using a custom build

Thank you for the review and
Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
