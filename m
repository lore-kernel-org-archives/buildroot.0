From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Sun, 01 Feb 2009 18:33:17 +0100
Subject: [Buildroot] Atmel specific handling in buildroot
In-Reply-To: <87zlh6gmod.fsf@macbook.be.48ers.dk>
References: <873af0mvws.fsf@macbook.be.48ers.dk>
	<874ozei4hg.fsf@macbook.be.48ers.dk>
	<1233502594.5742.24.camel@elrond.atmel.com>
	<87zlh6gmod.fsf@macbook.be.48ers.dk>
Message-ID: <1233509597.5742.35.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

s?n 2009-02-01 klockan 17:13 +0100 skrev Peter Korsgaard:
> >>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
> 
>  Ulf> There are several things here
> 
>  Ulf> 1) If there is an architecture patch available for an architecture,
>  Ulf>    then it should have default yes.
>  Ulf>    I can't think of a situation where you prefer not to apply
>  Ulf>    the architecture patch for the AT91 or AVR32.
>  Ulf>    The only reason is that you are building a kernel for where
>  Ulf>    there is no valid patch.
>  Ulf>    If there is no architecture patch, then obviously 
>  Ulf>    it should be default no.
> 
> Ok, but that's only one of the settings, so you're fine with me fixing
> the COPYTO / kernel type thingies?

I dont think you will build correctly unless you use the advanced kernel
setting for the AVR32 and AT91.

Copying the build configuration to the root file system
is in line with the open source model, since
it helps people to reproduce whatever is on the board
if they buy the product.
If you want to debug something, then it is good to
know how it was configured.

If someone calls in with a board without this, then it is
too late to do anything about it.

Obviously, since I put it there, I want to have it ON
for all my customers.

As for the copyto, this is a convenience, and people
can configure whatever they want.
I find that it saves time to have this on.

BR
Ulf Samuelsson
