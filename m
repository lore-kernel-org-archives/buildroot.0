From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Sun, 01 Feb 2009 16:36:34 +0100
Subject: [Buildroot] Atmel specific handling in buildroot
In-Reply-To: <874ozei4hg.fsf@macbook.be.48ers.dk>
References: <873af0mvws.fsf@macbook.be.48ers.dk>
	<874ozei4hg.fsf@macbook.be.48ers.dk>
Message-ID: <1233502594.5742.24.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

s?n 2009-02-01 klockan 16:03 +0100 skrev Peter Korsgaard:
> >>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:
> 
>  Peter> Hi,
>  Peter> Why is it again we have special handling of Atmel targets?
> 
> ..
>  Peter> target/linux/Config.in.advanced:        default y if BR2_TARGET_ATMEL
> 
>  Peter> Do we really need that? It would imho be a lot more sensible if BR
>  Peter> behaved the same way for all archs.

There are several things here

1) If there is an architecture patch available for an architecture,
   then it should have default yes.
   I can't think of a situation where you prefer not to apply
   the architecture patch for the AT91 or AVR32.
   The only reason is that you are building a kernel for where
   there is no valid patch.
   If there is no architecture patch, then obviously 
   it should be default no.

2) I think that we should reduce the choice to 
   only have no kernel or the advanced configuration.

3) For copy to, that should be collected to a single copy to

BR
Ulf Samuelsson



> 
> No objections? Good, then I'll remove them.
> 
