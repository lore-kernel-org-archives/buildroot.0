From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 9 Dec 2018 14:32:27 +0100
Subject: [Buildroot] [PATCH 1/2] package/gcc: bump to version 7.4.0
In-Reply-To: <20181209095348.GC3383@scaer>
References: <20181208153735.12898-1-romain.naour@gmail.com>
 <20181209095348.GC3383@scaer>
Message-ID: <166d263c-65fe-2285-2217-7d2370db9c1d@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 09/12/2018 ? 10:53, Yann E. MORIN a ?crit?:
> Romain, All,
> 
> On 2018-12-08 16:37 +0100, Romain Naour spake thusly:
> [--SNIP--]
>>  rename package/gcc/{7.3.0 => 7.4.0}/0001-m68k-coldfire-pr68467.patch (97%)
> [--SNIP--]
>> diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
>> index 55a9c8b69f..c2925cc6dc 100644
>> --- a/package/gcc/Config.in.host
>> +++ b/package/gcc/Config.in.host
>> @@ -83,7 +83,7 @@ config BR2_GCC_VERSION
>>  	default "4.9.4"     if BR2_GCC_VERSION_4_9_X
>>  	default "5.5.0"     if BR2_GCC_VERSION_5_X
>>  	default "6.4.0"     if BR2_GCC_VERSION_6_X
>> -	default "7.3.0"     if BR2_GCC_VERSION_7_X
>> +	default "7.4.0"     if BR2_GCC_VERSION_7_X
> 
> It looks like patch 0001 breaks the build on m68k, because upstream
> seems to have introducved a function by the same name:
> 
>     https://gitlab.com/ymorin/buildroot/-/jobs/131924271
>     https://gitlab.com/ymorin/buildroot/-/jobs/131924272
> 
> ../../gcc/config/m68k/m68k.c: In function ?machine_mode m68k_promote_function_mode(const_tree, machine_mode, int*, const_tree, int)?:
> ../../gcc/config/m68k/m68k.c:6603:1: error: redefinition of ?machine_mode m68k_promote_function_mode(const_tree, machine_mode, int*, const_tree, int)?
> 
> Care to have a look, please? ;-)

Well, 0001-m68k-coldfire-pr68467.patch is already upstream [1].

I'll send a patch to remove it.

Best regards,
Romain

[1]
https://github.com/gcc-mirror/gcc/commit/2d1d94491cc66e240f9ca2845ec64e8ffe851c74

> 
> Regards,
> Yann E. MORIN.
> 
