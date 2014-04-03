From: Paul Cercueil <paul@crapouillou.net>
Date: Thu, 03 Apr 2014 23:50:46 +0200
Subject: [Buildroot] [PATCH 02/11] arch: MIPS: Add config option
	BR2_GCC_TARGET_TUNE
In-Reply-To: <20140403211925.GC17328@free.fr>
References: <1396558881-29631-1-git-send-email-paul@crapouillou.net>
 <1396558881-29631-2-git-send-email-paul@crapouillou.net>
 <20140403211925.GC17328@free.fr>
Message-ID: <533DD7B6.8080009@crapouillou.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

This patch would pass the same value to --with-arch and --with-tune, 
unless you define a different value for BR2_GCC_TARGET_TUNE in your 
defconfig. We use that for the Ingenic jz4740 processor, which is a 
mips32 processor but running better the code tuned for mips32r2.

On 03/04/2014 23:19, Yann E. MORIN wrote:
> Paul, All,
>
> On 2014-04-03 23:01 +0200, Paul Cercueil spake thusly:
>> This option is actually already used in GCC's package.
>>
>> This allows to optimize the toolchain for a specific MIPS processor
>> while supporting more than one family of processors.
> Is that really needed? man gcc says:
>
>      When this option is not used, GCC optimizes for the processor
>      specified by -march.
>
> Since this patch would pass the same value to --with-arch and
> --with-tune, and since this is the default of gcc, is it really
> needed?
>
> Neither ACKing nor NAKing this patch. Can you explain a bit more why we
> would want that, given the above explanations?
>
> Regards,
> Yann E. MORIN.
>
>> Signed-Off-By: Paul Cercueil <paul@crapouillou.net>
>> ---
>>   arch/Config.in.mips | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/arch/Config.in.mips b/arch/Config.in.mips
>> index 20951e0..e4160a2 100644
>> --- a/arch/Config.in.mips
>> +++ b/arch/Config.in.mips
>> @@ -83,6 +83,16 @@ config BR2_GCC_TARGET_ARCH
>>   	default "mips64"	if BR2_mips_64
>>   	default "mips64r2"	if BR2_mips_64r2
>>   
>> +config BR2_GCC_TARGET_TUNE
>> +	default "mips1"		if BR2_mips_1
>> +	default "mips2"		if BR2_mips_2
>> +	default "mips3"		if BR2_mips_3
>> +	default "mips4"		if BR2_mips_4
>> +	default "mips32"	if BR2_mips_32
>> +	default "mips32r2"	if BR2_mips_32r2
>> +	default "mips64"	if BR2_mips_64
>> +	default "mips64r2"	if BR2_mips_64r2
>> +
>>   config BR2_MIPS_OABI32
>>   	bool
>>   	default y		if BR2_mips || BR2_mipsel
>> -- 
>> 1.9.0
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
