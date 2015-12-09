From: Romain Naour <romain.naour@openwide.fr>
Date: Wed, 9 Dec 2015 23:34:20 +0100
Subject: [Buildroot] [PATCH v7 20/33] package/enlightenment: bump to
 version 0.19.12
In-Reply-To: <20151208110626.GG4188@free.fr>
References: <1449523775-6582-1-git-send-email-romain.naour@openwide.fr>
 <1449523775-6582-21-git-send-email-romain.naour@openwide.fr>
 <20151208110626.GG4188@free.fr>
Message-ID: <5668AC6C.4090802@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Le 08/12/2015 12:06, Yann E. MORIN a ?crit :
> Romain, All,
> 
> On 2015-12-07 22:29 +0100, Romain Naour spake thusly:
>> Use the newly added libefl package wich provide a new version
>> of efl libraries.
>> This new version needs libelementary dependency.
>>
>> Update upstream url, add hash file and use xz archive.
>>
>> Select png and jpeg image loader since enlightenment_start
>> fail at runtime if png and jpeg image loader are not
>> available in elf libraries.
>>
>> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
>> ---
>> v6: disable systemd and linux-pam explicitely since it's auto
>>     detected. (A patch adding their support can be added latter)
> [--SNIP--]
>> diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
>> index ddebe06..f2e0bc3 100644
>> --- a/package/enlightenment/enlightenment.mk
>> +++ b/package/enlightenment/enlightenment.mk
>> @@ -4,30 +4,26 @@
>>  #
>>  ################################################################################
>>  
>> -ENLIGHTENMENT_VERSION = 0.17.6
>> -ENLIGHTENMENT_SITE = http://download.enlightenment.org/releases
>> +ENLIGHTENMENT_VERSION = 0.19.12
>> +ENLIGHTENMENT_SOURCE = enlightenment-$(ENLIGHTENMENT_VERSION).tar.xz
>> +ENLIGHTENMENT_SITE = http://download.enlightenment.org/rel/apps/enlightenment
>>  ENLIGHTENMENT_LICENSE = BSD-2c
>>  ENLIGHTENMENT_LICENSE_FILES = COPYING
>>  
>> -ENLIGHTENMENT_DEPENDENCIES = 	\
>> -	host-pkgconf 		\
>> -	libecore 		\
>> -	libeet 			\
>> -	libeina 		\
>> -	libevas 		\
>> +ENLIGHTENMENT_DEPENDENCIES = \
>> +	host-pkgconf \
>> +	host-libefl \
>> +	libefl \
>> +	libelementary \
>>  	libevas-generic-loaders \
>> -	libedje 		\
>> -	libefreet 		\
>> -	libedbus 		\
>> -	libeio 			\
>> -	host-libedje 		\
>> -	host-libeet		\
>>  	xcb-util-keysyms
>>  
>>  ENLIGHTENMENT_CONF_OPTS = \
>>  	--with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
>>  	--with-eet-eet=$(HOST_DIR)/usr/bin/eet \
>> -	--disable-rpath
>> +	--disable-pam \
>> +	--disable-rpath \
>> +	--disable-systemd
> 
> What if libefl has systemd support but enlightenment hasn't?

You're right, systemd should be enabled in this case...
But I haven't fully tested enlightenment with systemd.
Maybe we can drop the systemd support for libefl for now ?

Best regards,
Romain

> 
> Regards,
> Yann E. MORIN.
> 
