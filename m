From: Paul Cercueil <paul@crapouillou.net>
Date: Sat, 09 Aug 2014 15:38:37 +0200
Subject: [Buildroot] [PATCH] nodejs: Add dependency on zlib
In-Reply-To: <20140806201538.3843a111@free-electrons.com>
References: <1407279442-15084-1-git-send-email-paul@crapouillou.net>
 <20140806201538.3843a111@free-electrons.com>
Message-ID: <53E6245D.5040104@crapouillou.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

Le 06/08/2014 20:15, Thomas Petazzoni a ?crit :
> Dear Paul Cercueil,
>
> On Wed,  6 Aug 2014 00:57:22 +0200, Paul Cercueil wrote:
>
>> index a85384e..ff44e01 100644
>> --- a/package/nodejs/nodejs.mk
>> +++ b/package/nodejs/nodejs.mk
>> @@ -7,9 +7,9 @@
>>   NODEJS_VERSION = 0.10.12
>>   NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.gz
>>   NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
>> -NODEJS_DEPENDENCIES = host-python host-nodejs \
>> +NODEJS_DEPENDENCIES = host-python host-nodejs zlib \
>
> Ok.
>
>>       $(call qstrip,$(BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL_DEPS))
>> -HOST_NODEJS_DEPENDENCIES = host-python
>> +HOST_NODEJS_DEPENDENCIES = host-python host-zlib
>
> So here you're adding host-zlib as a dependency of host-nodejs.
>
>>   NODEJS_LICENSE = MIT (core code); MIT, Apache and BSD family licenses (Bundled components)
>>   NODEJS_LICENSE_FILES = LICENSE
>>
>> @@ -69,6 +69,7 @@ define NODEJS_CONFIGURE_CMDS
>>   		$(HOST_DIR)/usr/bin/python2 ./configure \
>>   		--prefix=/usr \
>>   		--without-snapshot \
>> +		--shared-zlib \
>
> However here you're only adding --shared-zlib to the target nodejs
> configure options. Shouldn't --shared-zlib also be passed in
> HOST_NODEJS_CONFIGURE_CMDS ?

You are correct - I didn't see that one. I will shortly send a V2 patch 
then.

> Thanks!
>
> Thomas
>
