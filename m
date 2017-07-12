From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 12 Jul 2017 18:46:43 +0200
Subject: [Buildroot] [PATCH v2 07/13] package/minetest: add gles
 optional dependency
In-Reply-To: <20170624172116.35677c25@windsurf.home>
References: <20170612205410.20230-1-romain.naour@gmail.com>
 <20170612205410.20230-7-romain.naour@gmail.com>
 <20170624172116.35677c25@windsurf.home>
Message-ID: <8cab150b-ac70-997a-683b-818816e53628@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 24/06/2017 ? 17:21, Thomas Petazzoni a ?crit :
> Hello,
> 
> On Mon, 12 Jun 2017 22:54:04 +0200, Romain Naour wrote:
>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
>> ---
>>  package/minetest/minetest.mk | 8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/package/minetest/minetest.mk b/package/minetest/minetest.mk
>> index 5075fc0..0302bd3 100644
>> --- a/package/minetest/minetest.mk
>> +++ b/package/minetest/minetest.mk
>> @@ -14,7 +14,6 @@ MINETEST_DEPENDENCIES = irrlicht gmp jpeg jsoncpp luajit sqlite zlib
>>  MINETEST_CONF_OPTS = \
>>  	-DDEFAULT_RUN_IN_PLACE=OFF \
>>  	-DENABLE_SOUND=OFF \
>> -	-DENABLE_GLES=OFF \
>>  	-DENABLE_LUAJIT=ON \
>>  	-DENABLE_CURSES=OFF \
>>  	-DENABLE_POSTGRESQL=OFF \
>> @@ -52,6 +51,13 @@ else
>>  MINETEST_CONF_OPTS += -DENABLE_GETTEXT=OFF
>>  endif
>>  
>> +ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
>> +MINETEST_DEPENDENCIES += libgles
>> +MINETEST_CONF_OPTS += -DENABLE_GLES=ON
>> +else
>> +MINETEST_CONF_OPTS += -DENABLE_GLES=OFF
>> +endif
> 
> The overall minetest package already depends on libGL support,
> inherited from irrlicht. Do we have useful situations where GLES
> support can be leveraged, since anyway you require libGL+X11 ?

I looked in the code and it seems that GLES is used only for Android build.

https://github.com/minetest/minetest/blob/master/src/client/tile.cpp#L43

I'll remove this patch the v3.

Best regards,
Romain

> 
> Best regards,
> 
> Thomas
> 
