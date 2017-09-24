From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 24 Sep 2017 15:01:24 +0200
Subject: [Buildroot] [PATCH] package/lmv2: add missing host-pkgconf
 dependency
In-Reply-To: <5428adbe-2619-d942-e239-0597cc4f1a69@mind.be>
References: <20170913201755.9871-1-romain.naour@gmail.com>
 <5428adbe-2619-d942-e239-0597cc4f1a69@mind.be>
Message-ID: <e15c1f03-3cc0-2475-c141-f2361c72cde5@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13-09-17 22:30, Arnout Vandecappelle wrote:
> 
> 
> On 13-09-17 22:17, Romain Naour wrote:
>> configure.ac use PKG_CHECK_MODULES macro to find some libraries dependencies.
>> So add host-pkgconf in LVM2_DEPENDENCIES.
>>
>> Fixes:
>> checking pkg-config is at least version 0.9.0... ./configure: line 9875: [...]/host/bin/pkg-config: No such file or directory
> 
>  Any idea why the autobuilders didn't hit this failure?

 Even though you didn't answer :-) I applied to master after all, since
configure clearly really wants pkg-config. Thanks!

 Regards,
 Arnout

>>
>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
>> ---
>>  package/lvm2/lvm2.mk | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
>> index 63ac109..f7f7069 100644
>> --- a/package/lvm2/lvm2.mk
>> +++ b/package/lvm2/lvm2.mk
>> @@ -21,6 +21,8 @@ LVM2_CONF_OPTS += \
>>  	--enable-dmeventd \
>>  	--disable-nls
>>  
>> +LVM2_DEPENDENCIES += host-pkgconf
>> +
>>  # LVM2 uses autoconf, but not automake, and the build system does not
>>  # take into account the toolchain passed at configure time.
>>  LVM2_MAKE_ENV = $(TARGET_CONFIGURE_OPTS)
>>
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
