From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 1 May 2016 12:20:58 +0200
Subject: [Buildroot] [PATCH] toolchain-external: remove sourcery powerpc
 toolchains
In-Reply-To: <dc8e2f3c-5c65-2d3f-3e9f-4d7fb1625ace@gmail.com>
References: <1461935936-9390-1-git-send-email-gustavo@zacarias.com.ar>
 <dc8e2f3c-5c65-2d3f-3e9f-4d7fb1625ace@gmail.com>
Message-ID: <d8384ec1-051f-d7fe-d7f2-67eb6038ac2d@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

Le 30/04/2016 ? 23:57, Romain Naour a ?crit :
> Hi Gustavo,
> 
> Le 29/04/2016 ? 15:18, Gustavo Zacarias a ?crit :
>> These are running long on the teeth - the bundled (e)glibc versions are
>> very old with several security bugs, they don't work reliably with -Os
>> and have several build failures related to internal compiler errors such
>> as:
>>
>> http://autobuild.buildroot.net/results/fe7/fe7bdba5faf199275aedea2918705b5d19d228bf/
>> http://autobuild.buildroot.net/results/935/935ac42c30ed893939c06c077534f060aed80e9a/
>> http://autobuild.buildroot.net/results/a47/a476af82c8fe4a279117314b278b08af9a08fe54/
>> http://autobuild.buildroot.net/results/cae/cae720b5096be2672b4dc1311ae3fc4ed06a3b53/
>>
>> The situation will not provide, and will in fact get worse with older kernel
>> headers precluding modern package versions and the old gcc version doing as
>> well so remove them.
>>
>> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
>> ---
>>  package/liquid-dsp/Config.in                       |  2 -
>>  package/pixman/pixman.mk                           |  5 --
>>  toolchain/toolchain-external/Config.in             | 54 ----------------------
>>  .../toolchain-external/toolchain-external.hash     |  5 --
>>  toolchain/toolchain-external/toolchain-external.mk |  6 ---
>>  5 files changed, 72 deletions(-)
>>
>> diff --git a/package/liquid-dsp/Config.in b/package/liquid-dsp/Config.in
>> index ad887cb..ebdc46e 100644
>> --- a/package/liquid-dsp/Config.in
>> +++ b/package/liquid-dsp/Config.in
>> @@ -1,5 +1,4 @@
>>  comment "liquid-dsp requires a (e)glibc/musl toolchain w/ dynamic library"
>> -	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC
>>  	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL) || BR2_STATIC_LIBS
>>  
>>  config BR2_PACKAGE_LIQUID_DSP
>> @@ -7,7 +6,6 @@ config BR2_PACKAGE_LIQUID_DSP
>>  	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL
>>  	depends on !BR2_STATIC_LIBS
>>  	# These result in internal compiler error
> 
> This comment should be removed.

Also, add a new entry for BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC and
BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC_E500V2 in Config.in.legacy

Best regards,
Romain

> 
> With that fixed:
> 
> Reviewed-by: Romain Naour <romain.naour@gmail.com>
> 
> Best regards,
> Romain
> 
