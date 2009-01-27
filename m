From: Hamish Moffatt <hamish@cloud.net.au>
Date: Tue, 27 Jan 2009 23:56:50 +1100
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
In-Reply-To: <1233005720.2298.125.camel@elrond.atmel.com>
References: <20090126201708.B4FD677458@busybox.osuosl.org>
	<871vup6c9o.fsf@macbook.be.48ers.dk>
	<1233005042.2298.111.camel@elrond.atmel.com>
	<8763k14uz6.fsf@macbook.be.48ers.dk>
	<1233005720.2298.125.camel@elrond.atmel.com>
Message-ID: <20090127125650.GA18250@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jan 26, 2009 at 10:35:20PM +0100, Ulf Samuelsson wrote:
> m?n 2009-01-26 klockan 22:29 +0100 skrev Peter Korsgaard:
> > >>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
> > 
> >  ulf> Log:
> > 
> >  ulf> Replace BUILDROOT_KERNEL_CONFIG_METHOD environment variable with
> >  ulf> BUILDROOT_USE_XWINDOWS
> >  >> 
> >  >> Why are you doing this after I explicitly said:
> >  >> 
> >  >> Let's not add any more undocumented command line options for such
> >  >> special cases like this.
> >  >> 
> > 
> >  Ulf> It is documented now!
> > 
> > That doesn't make it any less of a special case.
> 
> You are again, not only trying to establish a default behaviour
> You are trying to FORCE other to accept your preferences.
> 
> I think you are really out of line.
> 
> I do not want to use menuconfig.
> I do not want to update configs manually to get my preferred behaviour.

Why don't you just pass BR2_KERNEL_CONFIG_METHOD in your own environment?
No need for extra variables and all this other stuff.

> I suspect that there are others that feel the same.
> Why can't you accept that!

Sorry Ulf, I don't think you are being reasonable. The default needs to
be the same everywhere - it doesn't make any sense to have a mix of
menuconfig and xconfig interfaces.

The current logic of trying xconfig then menuconfig is very ugly - does
it allow you to abort xconfig without falling back?

I use X and I never use xconfig.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
