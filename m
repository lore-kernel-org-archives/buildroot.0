From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 1 Jan 2016 19:17:14 +0100
Subject: [Buildroot] [PATCH] package/dillo: enable jpeg support only
 with libjpeg provider
In-Reply-To: <20160101181326.GA2182@free.fr>
References: <1451671683-10101-1-git-send-email-romain.naour@gmail.com>
 <20160101181326.GA2182@free.fr>
Message-ID: <5686C2AA.90806@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, All,

Le 01/01/2016 19:13, Yann E. MORIN a ?crit :
> Romain, All,
> 
> On 2016-01-01 19:08 +0100, Romain Naour spake thusly:
>> dillo add libjpeg to his dependencies when the virtual package
>> jpeg is selected. This is wrong because jpeg-turbo can be
>> selected instead of libjpeg. So the build of libjpeg can be
>> trigged at Makefile level when jpeg-turbo is selected at
>> Config.in level by the user.
>>
>> Since 28f67899e54f15c6e48484ea2976c3e431756bcb, the build
>> stop if a package build is trigged at Makefile level without
>> being selected at Config.in level.
>>
>> Use a dependency on the jpeg provider intead of the virtual
>> package.
>>
>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
>> ---
>>  package/dillo/dillo.mk | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/package/dillo/dillo.mk b/package/dillo/dillo.mk
>> index 8eb8d88..45fd611 100644
>> --- a/package/dillo/dillo.mk
>> +++ b/package/dillo/dillo.mk
>> @@ -30,7 +30,7 @@ else
>>  DILLO_CONF_OPTS += --disable-png
>>  endif
>>  
>> -ifeq ($(BR2_PACKAGE_JPEG),y)
>> +ifeq ($(BR2_PACKAGE_LIBJPEG),y)
>>  DILLO_CONF_OPTS += --enable-jpeg
>>  DILLO_DEPENDENCIES += libjpeg
> 
> Can dillo be build with jpeg-turbo? If so, it would better to do:

Yes indeed but I don't know much dillo, I'm not sure it can be build or used
with jpeg-turbo. I added a dependency on the jpeg provider because it how it
work right now.

Best regards,
Romain

> 
>     ifeq ($(BR2_PACKAGE_HAS_JPEG),y)
>     DILLO_CONF_OPTS += --enable-jpeg
>     DILLO_DEPENDENCIES += jpeg
>     else
>     DILLO_CONF_OPTS += --disable-jpeg
>     endif
> 
> Regards,
> Yann E. MORIN.
> 
>>  else
>> -- 
>> 2.4.3
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 
