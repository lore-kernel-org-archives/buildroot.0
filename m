From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Jul 2014 22:49:16 +0200
Subject: [Buildroot] [PATCH 00/10] Proposals of deprecation/removal,
 mainly affecting toolchain
In-Reply-To: <53B31C82.6070608@zacarias.com.ar>
References: <1404237789-15563-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <53B3073B.8090005@zacarias.com.ar>
 <20140701221326.3ca5279f@free-electrons.com>
 <53B31C82.6070608@zacarias.com.ar>
Message-ID: <20140701224916.0a11ba13@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 01 Jul 2014 17:39:30 -0300, Gustavo Zacarias wrote:

> > If people insist, I'm OK with keeping a version selection, but I find
> > it pretty useless to have it specifically for Busybox and not for all
> > the other packages that we have. For example, when bumping Qt from
> > 5.3.1 to 5.4.0, should we keep 5.3.1 around because 5.4.0 is not
> > guaranteed to be as stable?
> 
> Buildroot has historically had the busybox version selection maybe
> because of it's origins.

Indeed.

> I agree we should at least ditch the older versions since other than a
> 'stable' and 'experimental' there's no more reason.

Right.

> With that being said now that toolchain components are packages we do
> have multiple versions :) Granted it's something special.

Yes, toolchain components are special.

> > Yes, I know the hole is a bit weird, but 4.3.x and 4.6.x are the only
> > versions that can be easily removed: 4.4.x is still needed for SPARC
> > Leon (hence the mail I've sent to Konrad) and 4.5.x is still the
> > default version for Blackfin (would we be able to bump this? I
> > remember you did the internal toolchain support for Blackfin).
> > Basically, I'd like to get rid of 4.2.x (by removing AVR32), 4.3.x (can
> > be done now), 4.4.x (by updating the Leon support), 4.5.x (by updating
> > the Blackfin support) and 4.6.x (can be done now), and therefore keep
> > only 4.7.x, 4.8.x and 4.9.x.
> 
> We could kill the baseline, say 4.2.x (with avr32) and 4.3.x, and go
> upwards soon.

Well, we can't kill 4.2.x now, we have to wait at least the next cycle
to remove AVR32 (see discussion with Thomas DS). I don't think keeping
4.2.x should prevent us from removing 4.3.x or 4.6.x actually. For
example, in gdb we still have 6.7.1 for AVR32 and then it jumps to 7.4:
we haven't kept all intermediate versions just to have a continuous
range of versions available.

> Which sparks the SPARC question, LEON is supposedly the best and only
> target for any meaningful usage these days, qemu sparcstation is just a
> testing ground for the architecture (doesn't quite work right with the
> latest bits though, networking including loopback is broken, haven't dug
> into what's the exact component causing it, may very well be qemu itself
> doing something bad in the latest versions, it happened before).

There is apparently a LEON3 emulator available at
http://www.gaisler.com/index.php/downloads/simulators?task=view&id=157,
with an Evaluation License available. I haven't tested though.

> Blackfin yeah i did the internal toolchain fixes up to "it builds and
> looks ok" - if that works is a whole different matter, i've got 0
> hardware to test it and 0 feedback, it may mean anything.

I've got some hardware here, so I could do some testing. On the
Blackfin side, I continue to remain highly disappointed by the lack of
help/support from ADI, despite the numerous requests I made to them,
and the fact that they use Buildroot as their official build system.

> For PowerPC there are some issues with gcc 4.9.x, 4.8.x is good so no
> problem there.

Hopefully this is the type of issues that will get resolved with 4.9.1
or 4.9.2.

> Question is, how far are we going to keep architectures 'alive' without
> upstream collaboration?

I don't know. Which architectures are in this situation right now?
AVR32 for sure. Blackfin is also an architecture for which we don't
have a lot of contribution from either ADI or direct Blackfin users.
Any other architecture? We can't expect for all architectures to have
direct upstream collaboration, not all companies necessarily care about
Buildroot.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
