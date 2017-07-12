From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 12 Jul 2017 18:56:32 +0200
Subject: [Buildroot] [PATCH v2 08/13] package/minetest: enable sound
 support
In-Reply-To: <20170624172156.36a1820f@windsurf.home>
References: <20170612205410.20230-1-romain.naour@gmail.com>
 <20170612205410.20230-8-romain.naour@gmail.com>
 <20170624172156.36a1820f@windsurf.home>
Message-ID: <573b5724-335b-ab41-266e-321d653b8f0c@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 24/06/2017 ? 17:21, Thomas Petazzoni a ?crit :
> Hello,
> 
> On Mon, 12 Jun 2017 22:54:05 +0200, Romain Naour wrote:
> 
>> diff --git a/package/minetest/Config.in b/package/minetest/Config.in
>> index d0613a2..a15a8f7 100644
>> --- a/package/minetest/Config.in
>> +++ b/package/minetest/Config.in
>> @@ -55,6 +55,14 @@ config BR2_PACKAGE_MINETEST_CLIENT_SERVER
>>  
>>  endchoice
>>  
>> +config BR2_PACKAGE_MINETEST_SOUND
>> +	bool "enable sound"
>> +	depends on BR2_PACKAGE_MINETEST_CLIENT
>> +	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
>> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # openal
> 
>  -> Config.in comment for this dependency?

Done.

Best regards,
Romain

> 
>> +	select BR2_PACKAGE_LIBVORBIS
>> +	select BR2_PACKAGE_OPENAL
>> +
>>  endif
> 
> Thanks,
> 
> Thomas
> 
