From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 10 Aug 2016 10:18:14 +0100
Subject: [Buildroot] [PATCH v3] glibc: add version 2.24
In-Reply-To: <20160809193433.GC5779@free.fr>
References: <1470732937-28889-1-git-send-email-Vincent.Riera@imgtec.com>
 <20160809193433.GC5779@free.fr>
Message-ID: <182b94cc-de35-4fc7-897a-09dab5ae52f1@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On 09/08/16 20:34, Yann E. MORIN wrote:
> Vicente, All,
> 
> On 2016-08-09 09:55 +0100, Vicente Olivert Riera spake thusly:
>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>> ---
>> Changes v2 -> v3:
>>  - Add kernel headers >= 3.2 dependency
>> Changes v1 -> v2:
>>  - Fix typo in glibc.hash: 2.23 -> 2.24 (Thanks Khem Raj)
>>
>>  package/glibc/Config.in  | 9 +++++++++
>>  package/glibc/glibc.hash | 1 +
>>  2 files changed, 10 insertions(+)
>>
>> diff --git a/package/glibc/Config.in b/package/glibc/Config.in
>> index f86822d..643ebef 100644
>> --- a/package/glibc/Config.in
>> +++ b/package/glibc/Config.in
>> @@ -22,6 +22,14 @@ config BR2_GLIBC_VERSION_2_23
>>  	# No support for pthread barriers on < v9 ISA
>>  	depends on !BR2_sparc
>>  
>> +config BR2_GLIBC_VERSION_2_24
>> +	bool "2.24"
>> +	# No support for pthread barriers on < v9 ISA
>> +	depends on !BR2_sparc
>> +	# Linux 3.2 or later kernel headers are required on all arches.
>> +	# See: https://sourceware.org/ml/libc-alpha/2016-08/msg00212.html
>> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
> 
> You forgot the comment:
> 
>     comment "glibc-2.24 needs kernel headers >= 3.2"
>         depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2

certainly I'm not in my best days :-(

Thanks for spotting that; I'll cook a v4.

Regards,

Vincent.

> Regards,
> Yann E. MORIN.
> 
>>  endchoice
>>  
>>  endif
>> @@ -30,3 +38,4 @@ config BR2_GLIBC_VERSION_STRING
>>  	string
>>  	default "2.22" if BR2_GLIBC_VERSION_2_22
>>  	default "2.23" if BR2_GLIBC_VERSION_2_23
>> +	default "2.24" if BR2_GLIBC_VERSION_2_24
>> diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
>> index 052f281..befe80c 100644
>> --- a/package/glibc/glibc.hash
>> +++ b/package/glibc/glibc.hash
>> @@ -1,3 +1,4 @@
>>  # Locally calculated after checking pgp signature (glibc)
>>  sha256	eb731406903befef1d8f878a46be75ef862b9056ab0cde1626d08a7a05328948	glibc-2.22.tar.xz
>>  sha256	94efeb00e4603c8546209cefb3e1a50a5315c86fa9b078b6fad758e187ce13e9	glibc-2.23.tar.xz
>> +sha256	99d4a3e8efd144d71488e478f62587578c0f4e1fa0b4eed47ee3d4975ebeb5d3	glibc-2.24.tar.xz
>> -- 
>> 2.7.3
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 
