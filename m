Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD9CECE7A86
	for <buildroot@archiver.kernel.org>; Fri, 22 Sep 2023 21:09:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9081240547;
	Fri, 22 Sep 2023 21:09:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9081240547
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tur-ACDWl6Sn; Fri, 22 Sep 2023 21:09:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 926FC405A9;
	Fri, 22 Sep 2023 21:09:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 926FC405A9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DD4AB1BF476
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 21:09:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3C91819D2
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 21:09:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3C91819D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MqCWuuHBKSjl for <buildroot@lists.busybox.net>;
 Fri, 22 Sep 2023 21:09:53 +0000 (UTC)
Received: from smtpdh19-2.aruba.it (smtpdh19-2.aruba.it [62.149.155.149])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 447428183D
 for <buildroot@buildroot.org>; Fri, 22 Sep 2023 21:09:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 447428183D
Received: from [192.168.50.162] ([84.33.144.138])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jnPKq1pO6LVMJjnPKqeQZl; Fri, 22 Sep 2023 23:09:50 +0200
Message-ID: <88324aaa-6893-41fc-968a-d762097cd8a3@benettiengineering.com>
Date: Fri, 22 Sep 2023 23:09:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20230921203237.1249291-1-giulio.benetti@benettiengineering.com>
 <20230921205637.GN512384@scaer>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20230921205637.GN512384@scaer>
X-CMAE-Envelope: MS4xfI9QhzkNQKhwGdqw5NuHP6E7O5LKpRCdHyjGdd8a6qpWhfpjPOLYwsI5moEqbwHrPVTWDjjSbfBn174ZiWHp8reUYVoKR5mKfEVufeg0OCNqJCzdsmfM
 VU5vq2YdFkZ8582YXi0s4eePVduHWu3C5gfTCAk6vr2vaeJiiblMLZY7D8aeAf6luWKt44WzpcoU/EpuUJVUq71DB/clmPachV4KhdEJZ3xaBU8zcTXLvA2C
 HjOQcmYonKR9d5ewC+dumZWhbEYly4iUsnF5lqjN+5M0JOOQldEsb6drzoMLwyIYaAbLeAZqtUlZvNEWLYFxupmt2embeqAAprzStqgr6Eg2RZsMMNrg/bcy
 wivXBGfBixnCgLyAacDB6w28gA9HdpjR1al2HBLBoaL1StzdnsuqmaiRGFya3zA5+EpboXaFMAebzOpQNjj6Wr+lVJCczw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1695416990; bh=jM8IzKkiThB8STer6+HjkbN0jYsHUPjqokfk/XiRgrg=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=iRcal2RlLEusR3SlfbpXgMnxEgFRsdV88pIHbxxBqtkssUOvN3Rsk8Evvhl0mmURs
 f6clJWBsW3FR1qYS8+dbpPNGtmqVeMuAExlrGeUOGtqLFOrR6FYpLElwIdc9cpPIVS
 m0MDcs9JJ/L3AnSKOYytqj4ADWFyOfhunLynj6a2NORcwlfIR4qg1NKg4LvciIUxwO
 EJibT3jS/pq2RFGAJI2SaTXCwnuABzvdFu+qoMFCOzNdmwickRodObYhxau4qMuAtB
 WbT0+zMZxGgeZWwYHNlQLYpwFl66H0O2ANnIswnxW+SxLVWmcOOsqnD48oDWVl81ss
 q4xZL1vJLo2yQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=iRcal2Rl
Subject: Re: [Buildroot] [PATCH v4] package/apache: add option
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

On 21/09/23 22:56, Yann E. MORIN wrote:
> Giulio, All,
> 
> You sent your v4 while I was writing my review of v3, so you could not
> have adressed my comments. Concurrency in computers is really hard, but
> is even harder with humans! ;-)
> 
> This is however a good opportunity to add what I forgot...
> 
> On 2023-09-21 22:32 +0200, Giulio Benetti spake thusly:
>> From: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
>>
>> With option BR2_PACKAGE_APACHE_DAEMON disabled only htdigest and htpasswd
>> are built and installed. By default BR2_PACKAGE_APACHE_DAEMON is enabled
>> and entire apache daemon is built. This is useful for Mongoose credentials
>> handling.
> 
> Your commit log must not describe the commit; it must explain it. Start
> with the problem you have, and then explain how you fixed it. E.g.:
> 
>      package/apache: add option to disable server
> 
>      Other packages (e.g. mongoose) can use htdigest and htpasswd, but
>      those are only available with apache.
> 
>      We don't want to build the whole apache server just for those tools,
>      so we add an option to disable the server; it is enabled by default
>      for legacy purposes (so that existing (def)configs still work).
> 
> (adapt the following:)
> 
>      However, there is not way to tell the apache buildsystem to only
>      build those two tools, so we have to provide custom build and
>      install commands; they are statically linked against the apache
>      internal helper libs, so we have nothing to install besides those
>      two executables.
> 
> About that last part: if --disable-http et al. really do the job, then
> it is moot, of course: adapt it appropriately.

Thanks a lot for commit log suggestion!

Going to send V5(and wait a bit :-))

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas

> Regards,
> Yann E. MORIN.
> 
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
>> V3->V4:
>> * drop --with-static-* options as suggested by Arnout
>> ---
>>   package/Config.in        |  2 +-
>>   package/apache/Config.in |  9 +++++++++
>>   package/apache/apache.mk | 20 +++++++++++++++++---
>>   3 files changed, 27 insertions(+), 4 deletions(-)
>>
>> diff --git a/package/Config.in b/package/Config.in
>> index cc99be39fb..cd7fe056b8 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -2279,7 +2279,7 @@ menu "Networking applications"
>>   	source "package/alfred/Config.in"
>>   	source "package/aoetools/Config.in"
>>   	source "package/apache/Config.in"
>> -if BR2_PACKAGE_APACHE
>> +if BR2_PACKAGE_APACHE_DAEMON
>>   menu "External Apache modules"
>>   	source "package/modsecurity2/Config.in"
>>   endmenu
>> diff --git a/package/apache/Config.in b/package/apache/Config.in
>> index 270296bce4..5e9e4c5f9d 100644
>> --- a/package/apache/Config.in
>> +++ b/package/apache/Config.in
>> @@ -17,6 +17,14 @@ config BR2_PACKAGE_APACHE
>>   
>>   if BR2_PACKAGE_APACHE
>>   
>> +config BR2_PACKAGE_APACHE_DAEMON
>> +	bool "apache-daemon"
>> +	default y
>> +	help
>> +	  Provide entire Apache daemon, otherwise only htdigest and htpasswd
>> +	  will be built and installed.
>> +
>> +if BR2_PACKAGE_APACHE_DAEMON
>>   choice
>>   	prompt "Multi-Processing Module (MPM)"
>>   	default BR2_PACKAGE_APACHE_MPM_WORKER
>> @@ -40,6 +48,7 @@ config BR2_PACKAGE_APACHE_MPM_WORKER
>>   	  Implements a hybrid multi-threaded multi-process web server
>>   
>>   endchoice
>> +endif
>>   
>>   endif
>>   
>> diff --git a/package/apache/apache.mk b/package/apache/apache.mk
>> index 320a6ad20e..994842b455 100644
>> --- a/package/apache/apache.mk
>> +++ b/package/apache/apache.mk
>> @@ -12,8 +12,6 @@ APACHE_LICENSE_FILES = LICENSE
>>   APACHE_CPE_ID_VENDOR = apache
>>   APACHE_CPE_ID_PRODUCT = http_server
>>   APACHE_SELINUX_MODULES = apache
>> -# Needed for mod_php
>> -APACHE_INSTALL_STAGING = YES
>>   # We have a patch touching configure.in and Makefile.in,
>>   # so we need to autoreconf:
>>   APACHE_AUTORECONF = YES
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
>> +
>> +APACHE_CONF_OPTS += \
>> +	--sysconfdir=/etc/apache2 \
>>   	--enable-http \
>>   	--enable-dbd \
>>   	--enable-proxy \
>> @@ -121,5 +125,15 @@ define APACHE_INSTALL_INIT_SYSTEMD
>>   	$(INSTALL) -D -m 644 package/apache/apache.service \
>>   		$(TARGET_DIR)/usr/lib/systemd/system/apache.service
>>   endef
>> +else
>> +define APACHE_BUILD_CMDS
>> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/support htdigest htpasswd
>> +endef
>> +
>> +define APACHE_INSTALL_TARGET_CMDS
>> +	$(INSTALL) -m 0755 -D $(@D)/support/htdigest $(TARGET_DIR)/usr/bin/htdigest
>> +	$(INSTALL) -m 0755 -D $(@D)/support/htpasswd $(TARGET_DIR)/usr/bin/htpasswd
>> +endef
>> +endif
>>   
>>   $(eval $(autotools-package))
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
