From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 31 Oct 2015 15:19:02 +0100
Subject: [Buildroot] [PATCH v5 25/36] package/expedite: bump to efl-1.15
 branch
In-Reply-To: <20151025163651.GW11692@free.fr>
References: <1445720476-21517-1-git-send-email-romain.naour@openwide.fr>
 <1445720476-21517-26-git-send-email-romain.naour@openwide.fr>
 <20151025163651.GW11692@free.fr>
Message-ID: <5634CDD6.60003@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, All,

Le 25/10/2015 17:36, Yann E. MORIN a ?crit :
> Romain, All,
> 
> On 2015-10-24 23:01 +0200, Romain Naour spake thusly:
>> Since expedite hasn't been released since 1.7.10 release,
>> use efl-1.15 branch in the git tree.
>>
>> Use the newly added libefl package wich provide a new version
>> of efl libraries.
>>
>> Autoreconf the package since there is no configure script
>> in the git tree.
>>
>> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> [--SNIP--]
>> diff --git a/package/expedite/expedite.mk b/package/expedite/expedite.mk
>> index 9b232f8..ae30535 100644
>> --- a/package/expedite/expedite.mk
>> +++ b/package/expedite/expedite.mk
>> @@ -4,14 +4,19 @@
>>  #
>>  ################################################################################
>>  
>> -EXPEDITE_VERSION = 1.7.10
>> -EXPEDITE_SITE = http://download.enlightenment.org/releases
>> +# efl-1.15 branch
>> +EXPEDITE_VERSION = 3ce8b3f1451700f9a2da60c2e717c644220e2449
>> +EXPEDITE_SITE = http://git.enlightenment.org/tools/expedite.git
>> +EXPEDITE_SITE_METHOD = git
>>  EXPEDITE_LICENSE = BSD-2c
>>  EXPEDITE_LICENSE_FILES = COPYING
>>  
>> -EXPEDITE_DEPENDENCIES = libevas libeina libeet
>> +EXPEDITE_DEPENDENCIES = host-libefl libefl
> 
> It also uses PKG_CHECK_MODULES, so you need host-pkgconf.
> 
> BTW, please check the previous patches, I did not systematically checked
> for it. I've seen it on some of the efl packages, but I'm not sure all
> depend on host-pkgconf when needed.

Thanks, I've checked the previous patches and I added host-pkgconf to
libevas-generic-loaders and libemotion-generic-players

Thanks!

Best regards,
Romain

> 
> Regards,
> Yann E. MORIN.
> 
>> -ifeq ($(BR2_PACKAGE_LIBEVAS_X11),y)
>> +# There is no configure script in the git tree.
>> +EXPEDITE_AUTORECONF = YES
>> +
>> +ifeq ($(BR2_PACKAGE_LIBEFL_X),y)
>>  EXPEDITE_CONF_OPTS += --with-x=$(STAGING_DIR) \
>>  	--x-includes=$(STAGING_DIR)/usr/include \
>>  	--x-libraries=$(STAGING_DIR)/usr/lib
>> -- 
>> 2.4.3
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 
