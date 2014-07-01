From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 01 Jul 2014 17:39:30 -0300
Subject: [Buildroot] [PATCH 00/10] Proposals of deprecation/removal,
 mainly affecting toolchain
In-Reply-To: <20140701221326.3ca5279f@free-electrons.com>
References: <1404237789-15563-1-git-send-email-thomas.petazzoni@free-electrons.com>	<53B3073B.8090005@zacarias.com.ar>
 <20140701221326.3ca5279f@free-electrons.com>
Message-ID: <53B31C82.6070608@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/01/2014 05:13 PM, Thomas Petazzoni wrote:

> We don't keep two versions of any other package, why would we do it for
> Busybox that is widely tested, and therefore most likely issues are
> going to be found before we do a Buildroot release?
> 
> If people insist, I'm OK with keeping a version selection, but I find
> it pretty useless to have it specifically for Busybox and not for all
> the other packages that we have. For example, when bumping Qt from
> 5.3.1 to 5.4.0, should we keep 5.3.1 around because 5.4.0 is not
> guaranteed to be as stable?

Buildroot has historically had the busybox version selection maybe
because of it's origins.
I agree we should at least ditch the older versions since other than a
'stable' and 'experimental' there's no more reason.
With that being said now that toolchain components are packages we do
have multiple versions :) Granted it's something special.

>> Also punching a hole in gcc version continuity even though logical
>> sounds dirty (and really they aren't stopping any features other than
>> missing atomics in old versions).
> 
> Yes, I know the hole is a bit weird, but 4.3.x and 4.6.x are the only
> versions that can be easily removed: 4.4.x is still needed for SPARC
> Leon (hence the mail I've sent to Konrad) and 4.5.x is still the
> default version for Blackfin (would we be able to bump this? I
> remember you did the internal toolchain support for Blackfin).
> Basically, I'd like to get rid of 4.2.x (by removing AVR32), 4.3.x (can
> be done now), 4.4.x (by updating the Leon support), 4.5.x (by updating
> the Blackfin support) and 4.6.x (can be done now), and therefore keep
> only 4.7.x, 4.8.x and 4.9.x.

We could kill the baseline, say 4.2.x (with avr32) and 4.3.x, and go
upwards soon.
Which sparks the SPARC question, LEON is supposedly the best and only
target for any meaningful usage these days, qemu sparcstation is just a
testing ground for the architecture (doesn't quite work right with the
latest bits though, networking including loopback is broken, haven't dug
into what's the exact component causing it, may very well be qemu itself
doing something bad in the latest versions, it happened before).
Blackfin yeah i did the internal toolchain fixes up to "it builds and
looks ok" - if that works is a whole different matter, i've got 0
hardware to test it and 0 feedback, it may mean anything.
For PowerPC there are some issues with gcc 4.9.x, 4.8.x is good so no
problem there.
Question is, how far are we going to keep architectures 'alive' without
upstream collaboration?
Regards.
