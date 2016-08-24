From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 24 Aug 2016 03:01:00 +0200
Subject: [Buildroot] BuildRoot cannot build powerpc64
In-Reply-To: <20160818231850.4072ddf2@free-electrons.com>
References: <F9C551623D2CBB4C9488801D14F864C6EE8B1000@ex-mb1.corp.adtran.com>
 <57b3aeb6944cf_7ec33f915a8b1b9c298e6@ultri3.mail>
 <F9C551623D2CBB4C9488801D14F864C6EE8B17ED@ex-mb1.corp.adtran.com>
 <20160817193721.0cc1466d@free-electrons.com>
 <532ce6e0-de27-9a2a-f062-179a4fa3248e@mind.be>
 <20160818231850.4072ddf2@free-electrons.com>
Message-ID: <1b65f937-d2ee-312c-964d-e6b9da957463@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18-08-16 23:18, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 18 Aug 2016 20:02:31 +0200, Arnout Vandecappelle wrote:
> 
>>> The only C library that supports PowerPC64 today is glibc.
>>>
>>> But glibc does not support static linking.
>>>
>>> Hence there is no solution to do a statically linked rootfs on
>>> PowerPC64 today.  
>>
>>  Perhaps we should remove the static/shared libs options to the toolchain menu,
>> and make them depend on the libc choice rather than the other way round. That
>> way, we're sure that we never run into such impossible situations.
>>
>>  Actually also some other options are more fitting in the toolchain menu IMHO,
>> like debug/optimization options and SSP.
> 
> I personally don't like this, and instead would like to keep separated
> the options that affect the build of all components (SSP or not,
> debug/optimization, shared/static) from the options that configure the
> toolchain itself.

 OK, fair enough.

 Actually, I noticed now that SSP in the build menu already depends on the
toolchain choices. So perhaps we should move the build options below the
toolchain, and make the static/shared libs options depend on the toolchain as well.

 That leaves us just with the awkward headers-same-as-kernel forward dependency.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
