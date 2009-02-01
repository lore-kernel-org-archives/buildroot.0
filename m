From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 01 Feb 2009 19:57:27 +0100
Subject: [Buildroot] Atmel specific handling in buildroot
In-Reply-To: <1233509597.5742.35.camel@elrond.atmel.com> (Ulf Samuelsson's
	message of "Sun\, 01 Feb 2009 18\:33\:17 +0100")
References: <873af0mvws.fsf@macbook.be.48ers.dk>
	<874ozei4hg.fsf@macbook.be.48ers.dk>
	<1233502594.5742.24.camel@elrond.atmel.com>
	<87zlh6gmod.fsf@macbook.be.48ers.dk>
	<1233509597.5742.35.camel@elrond.atmel.com>
Message-ID: <87vdrugf3c.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

Hi,

 Ulf> I dont think you will build correctly unless you use the
 Ulf> advanced kernel setting for the AVR32 and AT91.

Huh, why wouldn't BR2_KERNEL_none work for those targets?

 Ulf> Copying the build configuration to the root file system
 Ulf> is in line with the open source model, since
 Ulf> it helps people to reproduce whatever is on the board
 Ulf> if they buy the product.

Not only that, That info is required by the license.

 Ulf> If you want to debug something, then it is good to
 Ulf> know how it was configured.

 Ulf> If someone calls in with a board without this, then it is
 Ulf> too late to do anything about it.

 Ulf> Obviously, since I put it there, I want to have it ON
 Ulf> for all my customers.

Fine, that's why we have the configuration in the first place I
guess - But the question isn't about what you or your customers want,
it's about what the default should be in BR.

It makes sense to default these to off like for everything else, so
I'll remove the atmel special case.

 Ulf> As for the copyto, this is a convenience, and people
 Ulf> can configure whatever they want.
 Ulf> I find that it saves time to have this on.

Again, feel free to use it, but it shouldn't be default (E.G. it
breaks the build when you don't have a /tftpboot and/or it isn't
writable.

-- 
Bye, Peter Korsgaard
