From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 18 Aug 2016 20:02:31 +0200
Subject: [Buildroot] BuildRoot cannot build powerpc64
In-Reply-To: <20160817193721.0cc1466d@free-electrons.com>
References: <F9C551623D2CBB4C9488801D14F864C6EE8B1000@ex-mb1.corp.adtran.com>
 <57b3aeb6944cf_7ec33f915a8b1b9c298e6@ultri3.mail>
 <F9C551623D2CBB4C9488801D14F864C6EE8B17ED@ex-mb1.corp.adtran.com>
 <20160817193721.0cc1466d@free-electrons.com>
Message-ID: <532ce6e0-de27-9a2a-f062-179a4fa3248e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17-08-16 19:37, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 17 Aug 2016 15:33:30 +0000, ANDY KENNEDY wrote:
> 
>> Our RFS we like to have static, so that we can throw libs into
>> the system @ runtime without breaking our stable RFS.
>>
>> Based upon your e-mail, I dropped into the uclibc dependencies
>> || BR2_powerpc64, which made it selectable.  Problem is that
>> it wouldn?t build.  My guess is that the T-series parts haven't
>> been added to uClibC-ng yet, which is why it isn't selectable.
>>
>> Thus, the answer to my question is "it is by design".
> 
> The only C library that supports PowerPC64 today is glibc.
> 
> But glibc does not support static linking.
> 
> Hence there is no solution to do a statically linked rootfs on
> PowerPC64 today.

 Perhaps we should remove the static/shared libs options to the toolchain menu,
and make them depend on the libc choice rather than the other way round. That
way, we're sure that we never run into such impossible situations.

 Actually also some other options are more fitting in the toolchain menu IMHO,
like debug/optimization options and SSP.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
