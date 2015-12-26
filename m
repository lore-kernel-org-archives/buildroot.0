From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 26 Dec 2015 21:42:55 +0100
Subject: [Buildroot] [PATCH 1/1] [autobuild] configs: update PowerPC
	Kconfig symbols
In-Reply-To: <20151226145204.GA4083@free.fr>
References: <1451132190-10801-1-git-send-email-romain.naour@gmail.com>
 <20151226145204.GA4083@free.fr>
Message-ID: <567EFBCF.8060408@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Le 26/12/2015 15:52, Yann E. MORIN a ?crit :
> Romain, All,
> 
> On 2015-12-26 13:16 +0100, Romain Naour spake thusly:
>> The Kconfig symbole BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103
>> has been renamed to BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC in commit
>> [1].
>>
>> The CS PowerPC 2011.03 toolchain is still used if
>> BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC is selected, except if the
>> selected PPC CPU has SPE support. In this cas the CS PowerPC 2012.03 will
>> be used.
>>
>> [1] https://git.busybox.net/buildroot/commit/?id=fa4214e21b50b791ec365c64897ac2676b45448a
>> [2] http://lists.busybox.net/pipermail/buildroot/2015-December/148311.html
>>
>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
>> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
>> ---
>>  web/toolchains/configs/sourcery-powerpc-e500v2.config | 1 -
>>  web/toolchains/configs/sourcery-powerpc.config        | 2 --
>>  2 files changed, 3 deletions(-)
>>
>> diff --git a/web/toolchains/configs/sourcery-powerpc-e500v2.config b/web/toolchains/configs/sourcery-powerpc-e500v2.config
>> index f4e3b57..95b88a0 100644
>> --- a/web/toolchains/configs/sourcery-powerpc-e500v2.config
>> +++ b/web/toolchains/configs/sourcery-powerpc-e500v2.config
>> @@ -1,4 +1,3 @@
>>  BR2_powerpc=y
>>  BR2_TOOLCHAIN_EXTERNAL=y
>> -BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103=y
>>  BR2_TARGET_OPTIMIZATION="-te500v2"
> 
> Not directly your fault, but this config is still broken: it needs
> BR2_powerpc_8248=y too.

I think with CS PowerPC 2012.03 we can also remove
BR2_TARGET_OPTIMIZATION="-te500v2" since there is only one sysroot.

Thanks for the review.

Best regards,
Romain

> 
> Regards,
> Yann E. MORIN.
> 
>> diff --git a/web/toolchains/configs/sourcery-powerpc.config b/web/toolchains/configs/sourcery-powerpc.config
>> index 532fab5..385ca88 100644
>> --- a/web/toolchains/configs/sourcery-powerpc.config
>> +++ b/web/toolchains/configs/sourcery-powerpc.config
>> @@ -1,4 +1,2 @@
>>  BR2_powerpc=y
>>  BR2_TOOLCHAIN_EXTERNAL=y
>> -BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103=y
>> -
>> -- 
>> 2.4.3
>>
> 
