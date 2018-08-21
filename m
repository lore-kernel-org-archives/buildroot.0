From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 21 Aug 2018 22:01:03 +0200
Subject: [Buildroot] [PATCH 1/1] Add support for building toolchains
 against custom kernel headers.
In-Reply-To: <20180821131105.GM15347@scaer>
References: <20180821110646.5671-1-mark.corbin@embecosm.com>
 <20180821140509.162e6c49@windsurf>
 <4f183641-61e2-37bb-d3af-3dfd002efbe9@embecosm.com>
 <20180821131105.GM15347@scaer>
Message-ID: <b9918318-ad23-fc20-7035-2784e698ecb4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21/08/2018 15:11, Yann E. MORIN wrote:
> Mark, Thomas, All,
> 
> On 2018-08-21 13:51 +0100, Mark Corbin spake thusly:
>> On 21/08/18 13:05, Thomas Petazzoni wrote:
[snip]
>>> First, I'm not sure why we bother updating the BR_NO_CHECK_HASH_FOR
>>> variable. I know we already do it, but linux-headers doesn't have
>>> a .hash file, so I don't see the point in doing this. Arnout, you
>>> reworked this in commit 24f650aed2d9d92d8cabf0cb160fcf7964f9811e, why
>>> didn't you just remove the BR_NO_CHECK_HASH_FOR ?
>> I did wonder about this - I'll plan to remove it unless anybody objects.
> 
> No, I'd prefer if we were to actualyl add a .hash file for linux-headers
> and for linux as well, btw, with the former being a symlink to the
> latter.

 I think that was actually the reason that I didn't remove it: the idea was to
add a hash file for linux-headers.

 Regards,
 Arnout

> So, when you respin, prepare a series that:
> 
>  1. adds the help text alone,
>  2. adds a .hash for linux and a symlink to it from linux-headers
>  3. refactors of the variables
>  4. adds the custom locations
> 
> thanks! :-)
> 
> Regards,
> Yann E. MORIN.
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
