From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 07 Jan 2009 08:08:46 -0000
Subject: [Buildroot] Buildroot maintainer and stable releases
In-Reply-To: <200901070409.42558.markus.heidelberg@web.de> (Markus
	Heidelberg's message of "Wed\, 7 Jan 2009 04\:09\:41 +0100")
References: <87prj1v4dy.fsf@macbook.be.48ers.dk>
	<1231243376.32308.52.camel@elrond.atmel.com>
	<87vdsssiwo.fsf@macbook.be.48ers.dk>
	<200901070409.42558.markus.heidelberg@web.de>
Message-ID: <87fxjvmtrj.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markus" == Markus Heidelberg <markus.heidelberg@web.de> writes:

Hi,

 >> >>From talking with HcE on IRC, it seems like the Atmel fork of
 >> buildroot is the recommended solution for avr32 users anyway.

 Markus> I wonder, why many of the patches are also included in uClibc's
 Markus> Buildroot then.

Me too.

 Markus> Don't the avr32 users use Atmel's Buildroot? I'm an avr32
 Markus> user myself and only use Atmel's Buildroot for
 Markus> development. One drawback is that I'm not up-to-date with
 Markus> uClibc, because these changes are only seldom merged into the
 Markus> Atmel branches, only short before their release
 Markus> candidates. So I end up working on another file base, which
 Markus> doesn't ease integration of changes into uClibc's
 Markus> Buildroot. I could merge myself, a branch "upstream" is
 Markus> available and is updated often, but that doesn't make sense
 Markus> somehow. I haven't yet tried it, so I don't know whether it
 Markus> will cause some hassle or not.

I don't know anything about this Atmel fork (where is it?), but as
avr32 is maturing, long term I don't see why we cannot support it in
uclibc buildroot.

Right now things are kind of a mess as avr32 is lacking from most
upstream projects, so there's lots of big patches involved. As things
are now, I don't see missing avr32 as a showstopper for a first
release.

 Ulf> You have complained about size of patches, and 
 Ulf> that is why there is a prepatched toolchain for AVR32.
 Ulf> If that is not considered to be OK, then the several
 Ulf> MBytes of patches has to be introduced into the trunk.
 >> 
 >> It's not the size in bytes as such, it's the special casing and
 >> (effectively) black box patches. Even when you test your changes on
 >> multiple archs there's a fairly big change that you break stuff for
 >> avr32/at91, or that you guys break it for the other archs. The same
 >> with moving packages to new versions or removing old versions, you
 >> cannot expect other people to forward port those arch specific
 >> patches.

 Markus> Yes, mplayer for example is more than 2 years old and includes a huge
 Markus> avr32 patch.

Exactly. Who will redo this patch if I bump the mplayer version?

-- 
Bye, Peter Korsgaard
