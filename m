From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 20 Nov 2013 08:54:30 +0100
Subject: [Buildroot] Makeinfo
In-Reply-To: <528B9B14.3080708@mind.be>
References: <CAAXf6LWWWG4DABPQzNezk+Tnr1tbDx9mc6+zXZ457vskm1VFBA@mail.gmail.com>
 <528B9B14.3080708@mind.be>
Message-ID: <528C6AB6.1080609@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/11/13 18:08, Arnout Vandecappelle wrote:
> On 19/11/13 11:45, Thomas De Schampheleire wrote:
[snip]
>> +#
>> +# Also, disable documentation by undefining makeinfo
>>   STRESS_CONF_OPT = \
>> -       $(if $(BR2_PREFER_STATIC_LIB),,--disable-static)
>> +       $(if $(BR2_PREFER_STATIC_LIB),,--disable-static) \
>> +       MAKEINFO=:
>>
>>   $(eval $(autotools-package))
>> -------------
>>
>> I'm now wondering if this is an approach we could add globally: set
>> MAKEINFO to : to effectively disable the generation of
>> documentation...
>
>   I still have the feeling it is a bit of a hack. But it's true, it could
> be part of DISABLE_DOCUMENTATION.

  I found in gcc.mk how to make it less than a hack:
$(2)_CONF_OPT += MAKEINFO=missing

  That should work for all real autotools environments, and is the way 
that autoconf handles missing makeinfo to start with.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
