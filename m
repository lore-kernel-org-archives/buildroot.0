From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 11 Nov 2015 15:28:15 +0100
Subject: [Buildroot] [PATCH 1/2] libnet:new package
In-Reply-To: <20151111150528.16ffceac@free-electrons.com>
References: <1447059812-26424-1-git-send-email-joris.lijssens@gmail.com>
 <56427B24.7030602@mind.be> <20151111150528.16ffceac@free-electrons.com>
Message-ID: <5643507F.3050903@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11-11-15 15:05, Thomas Petazzoni wrote:
> Arnout,
> 
> I'm just seeing your review right now. Did you mark the patches as
> Changes Requested? I did not mark them as Accepted as far as I
> remember, even if I applied them.

 Don't you have a hook that does that automatically? Anyway, they currently are
still marked as Changes Requested, so I'll update them to Accepted.

> 
> On Wed, 11 Nov 2015 00:17:56 +0100, Arnout Vandecappelle wrote:
> 
>>  We now require .hash files for github packages as well, since github nowadays
>> provides stable tarballs.
> 
> This package is not fetched from github. But I've added the hash
> nonetheless.

 Oops, I confused the two patches :-)

> 
>>> +LIBNET_VERSION = 1.1.6
>>> +LIBNET_SITE = http://sourceforge.net/projects/libnet-dev/files
>>> +LIBNET_INSTALL_STAGING = YES
>>> +LIBNET_LICENSE = BSD-2c
>>
>>  There are also a few BSD-3c files, so I think this should be BSD-2c, BSD-3c.
> 
> I made a follow-up commit to fix this.
> 
>>  The configure script tries to build and run a program to test for ETH_P_ALL
>> availability in the AC_LIBNET_CHECK_PF_PACKET function. This will obviously fail
>> when cross-compiling, maybe worse when hostarch == targetarch. So I think it's
>> best to explicitly pass libnet_cv_have_packet_socket=yes
> 
> I did a test build here for ARM, and did not encounter any issues.
> Which configuration did you test? Or is it just by inspection of
> configure.ac?

 With "fail" I mean that it will think that PF_PACKET/ETH_P_ALL is not
available, while normally on Linux it is available (at least for root). Maybe
you can configure it out of the kernel, but that would be a very exotic config.

 I noticed it by inspecting configure.ac and tested an armv7 build to confirm.


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
