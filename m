From: =?UTF-8?Q?Beno=c3=aet_Mauduit?= <bmauduit@beneth.fr>
Date: Thu, 12 May 2016 15:06:02 +0200
Subject: [Buildroot] [PATCH 1/1] kodi: Enable raspberry-pi2 build support
In-Reply-To: <20160507225043.56bdc54f@free-electrons.com>
References: <1461702074-14376-1-git-send-email-bmauduit@beneth.fr>
 <20160507225043.56bdc54f@free-electrons.com>
Message-ID: <57347FBA.7070605@beneth.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,


On 05/07/2016 10:50 PM, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 26 Apr 2016 22:21:14 +0200, Beno?t Mauduit wrote:
> 
>> +Original commit from "popcornmix" [0], and fixed by "wsnipex" [1] on Kodi branch master.
>> +Commit-id in xbmc/kodi upstream git :
>> +[0] Commit-id : 253ec417519afe9415612add80ff5a1753208b75
>> +[1] Commit-id : 1da2f07be715865bf7cf9731d7147dc4f43459be
> 
> In these are two patches upstream, then it should be two patches in
> Buildroot as well.
> 

Ok. I hesitate to do that. Because the second patch revert and improve
some change done by the first, I thought it was easier to understand
from Buildroot to integrate only one patch. (Following the philosophy,
one commit, one feature).

>> +
>> +Addition to original patches :
>> + * Add optimization flag for rpi2 in main xbmc build
>> + * Add -mtune & -mvectorize-with-neon-quad flag in "tools/depends" build
> 
> Why are you doing those additional changes compared to upstream?

I tried different optimization flags before coming to theses. It is
inspired by what Archlinux are doing for their kodi-rbp package. [1]

> 
> Like Yann said, we prefer to not backport too much stuff, except when
> it's actually fixing a problem (which is not the case here).

I see things a little differently when we talk about fixing/improving
build system and not adding a Kodi feature.

> 
> Yann, will you send a patch that reverts your commit adding explicit RPi
> 2 support in the Kodi package ? This way we can have this for 2016.05,
> and when a new Kodi release is done with built-in support for RPi2, we
> can revisit this.
> 
> Thomas
> 

Anyway, I had some strange behavior with this optimizations. When
compiling in -Os I have no issue, and kodi run very fine (RPI2 & RPI3).
But trying in -O3 result in various segfault. (I do not dig further
about this, and don't know if this is related to this change...)

I think it is better to wait for the next kodi version.

Thanks for the feedbacks !

Ps: I just see that archlinux is providing a patch[2] for building kodi
with gcc 6. Are we interested ? or are we waiting the next kodi ?

[1] : https://archlinuxarm.org/packages/armv6h/kodi-rbp/files/PKGBUILD
[2] : https://archlinuxarm.org/packages/armv6h/kodi-rbp/files/gcc6_fix.patch

-- 
Beno?t Mauduit
Mail : <bmauduit@beneth.fr>
XMPP : <bmauduit@im.beneth.fr>
