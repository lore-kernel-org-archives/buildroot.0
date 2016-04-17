From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 17 Apr 2016 17:10:47 +0200
Subject: [Buildroot] [PATCH v14 01/27] package/freeswitch: new package
In-Reply-To: <5713A5DB.2040309@mind.be>
References: <1460804118-4900-1-git-send-email-bernd.kuhls@t-online.de>
 <1460804118-4900-2-git-send-email-bernd.kuhls@t-online.de>
 <5713A5DB.2040309@mind.be>
Message-ID: <5713A777.2010503@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/17/16 17:03, Arnout Vandecappelle wrote:
> On 04/16/16 12:54, Bernd Kuhls wrote:
>> This commit adds freeswitch without any configured modules and with a
>> minimal set of non-optional dependencies. All other dependencies and
>> modules will be added by further patches in this series.
[snip]
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  Oops, no...

[snip]

>> +# zrtp supports a limited set of archs, sparc support is also broken due
>> +# to a broken ld call by gcc, see libs/libzrtp/include/zrtp_config.h
>> +ifeq
>> ($(BR2_i386)$(BR2_arm)$(BR2_armeb)$(BR2_aarch64)$(BR2_aarch64_be)$(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el)$(BR2_powerpc)$(BR2_powerpc64)$(BR2_powerpcle)$(BR2_x86_64),y)
>>
>> +FREESWITCH_CONF_OPTS += --enable-zrtp
>> +else
>> +FREESWITCH_LICENSE += AGPLv3 (libzrtp)
>> +FREESWITCH_LICENSE_FILES += libs/libzrtp/src/zrtp_legal.c

  This doesn't sound right, I guess that that bit should have gone to the other 
side of the condition?

  So this makes the whole AGPLv3 for most architectures... I guess that anyone 
who has a problem with that can just edit the .mk file to remove zrtp support.

  Regards,
  Arnout

>> +FREESWITCH_CONF_OPTS += --disable-zrtp
>> +endif
>> +
>> +$(eval $(autotools-package))
>>
>
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
