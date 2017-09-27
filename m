From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 27 Sep 2017 23:14:23 +0200
Subject: [Buildroot] [PATCH v3 4/7] package/gcc: enable float128 on
 powerpc64le with glibc >= 2.26 toolchains
In-Reply-To: <20170927204006.GE2903@scaer>
References: <20170923212414.16744-1-romain.naour@gmail.com>
 <20170923212414.16744-5-romain.naour@gmail.com> <20170927204006.GE2903@scaer>
Message-ID: <28b68e39-9fcb-93c8-340e-0368cd9dd826@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 27-09-17 22:40, Yann E. MORIN wrote:
> Romain, All,
> 
> On 2017-09-23 23:24 +0200, Romain Naour spake thusly:

[snip]
>> @@ -254,6 +254,14 @@ HOST_GCC_COMMON_CONF_OPTS += \
>>  	--without-long-double-128
>>  endif
>>  
>> +# Since glibc >= 2.26, poerpc64le requires double/long double which
>> +# requires at least gcc 6.2.
>> +# See sysdeps/powerpc/powerpc64le/configure.ac
>> +ifeq ($(BR2_TOOLCHAIN_USES_GLIBC)$(BR2_TOOLCHAIN_GCC_AT_LEAST_6)$(BR2_powerpc64le),yyy)
>> +HOST_GCC_COMMON_CONF_OPTS += \
>> +	--with-long-double-128
> 
> Could very well have been on a single line.

 I didn't change this, because the way it is now it's similar to the other 3
instances of --with-long-double-128 which makes it easier to spot the repetition.

 Regards,
 Arnout


[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
