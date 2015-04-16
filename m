From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 16 Apr 2015 23:31:56 +0200
Subject: [Buildroot] config choices in building for beaglebone black
	(BBB)?
In-Reply-To: <alpine.LFD.2.11.1504160857510.20888@localhost>
References: <alpine.LFD.2.11.1504160857510.20888@localhost>
Message-ID: <55302A4C.5050109@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/04/15 15:03, Robert P. J. Day wrote:
> 
>   anyone who uses buildroot to build for a BBB will probably know the
> answers to this instantly.
> 
>   did a "git clone" of buildroot, and did nothing more than:
> 
>   $ make beaglebone_defconfig
>   $ make
> 
> so, basically, all the defaults, worked fine. so now i'm looking at my
> config options and want to know how far i can push a BBB build to the
> bleeding edge, and about the BBB defaults.
> 
>   first, i notice that the default build for BBB uses uClibc rather
> than glibc, which is easy enough to adjust, but i'm curious as to why
> something like a BBB doesn't have glibc as the default C library to
> use.

 Our defconfigs are always the minimal bootable system, where minimal means as
small as possible. glibc makes it about twice as large, that's why the defconfig
uses uClibc.

> 
>   also, for bleeding edge, can anyone verify whether i'm safe pushing
> the versions of everything right to the latest? you know:
> 
>   * kernel 4.0.x
>   * glibc 2.21
>   * binutils 2.25
>   * gcc 4.9.x

 For binutils and gcc and uClibc we typically stick to the buildroot default
versions (even though we don't actually test all defconfigs when we change the
default version for one of those...).

 For the kernel, it's the latest version that anyone has tested and submitted.

 In case of BBB, I'm not 100% sure if all the graphics stuff from the TI kernel
has been fully upstreamed, so switching to a mainline kernel is not necessarily
acceptable. Even though the buildroot defconfig doesn't include graphics
support, we do want to offer a kernel that supports everything that the board has.

 A colleague of mine (in CC) used mainline 3.19 on BBB without any problem;
however AFAIK he didn't really use graphics with that so YMMV. Vianney, do you
think your config should be OK for upstream buildroot? If yes, send it to me and
I'll submit it.

 Regards,
 Arnout

> 
> and so on, and so on. any other BBB issues anyone wants to warn me
> about before i go charging off in that direction? thanks.
> 
> rday
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
