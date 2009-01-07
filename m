From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Wed, 7 Jan 2009 04:09:41 +0100
Subject: [Buildroot] Buildroot maintainer and stable releases
In-Reply-To: <87vdsssiwo.fsf@macbook.be.48ers.dk>
References: <87prj1v4dy.fsf@macbook.be.48ers.dk>
	<1231243376.32308.52.camel@elrond.atmel.com>
	<87vdsssiwo.fsf@macbook.be.48ers.dk>
Message-ID: <200901070409.42558.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CC-ing Hans-Christian Egtvedt

Peter Korsgaard, 06.01.2009:
> >>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
>  Ulf> I can see that this would affect the AVR32 where
>  Ulf> the patches are still to be introduced into gcc and binutils.
>  Ulf> (They are there in uClibc right now).
> 
> Sorry, I don't know anything about avr32. It's my opinion that we have
> too much special case handling for avr32/at91 in buildroot, and that
> it's causing problems for the users + friction between developers
> (E.G. see the recent openssl breakage)
> 
> But ok, that's the situation as it is today. My understanding is that
> most of those patches are (slowly) progressing upstream.
> 
> Are you saying that the default config for avr32 doesn't build?
> 
> >>From talking with HcE on IRC, it seems like the Atmel fork of
> buildroot is the recommended solution for avr32 users anyway.

I wonder, why many of the patches are also included in uClibc's
Buildroot then. Don't the avr32 users use Atmel's Buildroot? I'm an
avr32 user myself and only use Atmel's Buildroot for development. One
drawback is that I'm not up-to-date with uClibc, because these changes
are only seldom merged into the Atmel branches, only short before their
release candidates. So I end up working on another file base, which
doesn't ease integration of changes into uClibc's Buildroot. I could
merge myself, a branch "upstream" is available and is updated often, but
that doesn't make sense somehow. I haven't yet tried it, so I don't know
whether it will cause some hassle or not.

I haven't yet asked why this merge happens so rarely. Maybe lack of
time? OK, I'm already getting avr32-buildroot specific, but I think
updating the "devel" branch would be nice, even without testing
anything.  Currently the three branches "devel", "master" and
"atmel-2.3" are the same, pointing to the latest release.

>  Ulf> You have complained about size of patches, and 
>  Ulf> that is why there is a prepatched toolchain for AVR32.
>  Ulf> If that is not considered to be OK, then the several
>  Ulf> MBytes of patches has to be introduced into the trunk.
> 
> It's not the size in bytes as such, it's the special casing and
> (effectively) black box patches. Even when you test your changes on
> multiple archs there's a fairly big change that you break stuff for
> avr32/at91, or that you guys break it for the other archs. The same
> with moving packages to new versions or removing old versions, you
> cannot expect other people to forward port those arch specific
> patches.

Yes, mplayer for example is more than 2 years old and includes a huge
avr32 patch.

Markus
