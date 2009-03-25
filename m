From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Wed, 25 Mar 2009 19:45:04 -0400
Subject: [Buildroot] External toolchain
In-Reply-To: <20090325233625.GA20034@buzzloop.caiaq.de>
References: <BD79186B4FD85F4B8E60E381CAEE1909014E2516@mi8nycmail19.Mi8.com>
	<20090325233625.GA20034@buzzloop.caiaq.de>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE1909014E2553@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday, March 25, 2009 4:36 PM, Daniel Mack wrote:
> On Wed, Mar 25, 2009 at 06:14:05PM -0400, H Hartley Sweeten wrote:
> > This might not be the correct list to ask this on but I'll try
> > anyway..
> > 
> > I have been using Buildroot with an external toolchain provided
> > by Cirrus Logic for an ARM ep93xx based board. This toolchain has
> > worked fine ever since I started using it.
> 
> Just curious - why don't you let buildroot build the toolchain for
> you?

I tried that once before and just ended up with a big mess.

That's one of the pieces of Buildroot that I really don't get.. :-(

[...]

> > Now I have a problem I can't figure out.
> > 
> > I can get Buildroot to use the Code Sourcery toolchain and it
> > compiles the 2.6.29 kernel fine. But, when I try to boot the
> > kernel it just hangs after the "Uncompressing Linux.... done,
> > booting the kernel." step.
> >  
> > I went back to kernel 2.6.28.8 and tried it with the Code
> > Sourcery toolchain, same results. But, if I switch back to the
> > Cirrus 4.1.1 toolchain the kernel boots fine.
> 
> We had similar problems discussed on that list just recently. Not
> sure whether you're facing exactly the same thing here, but it might
> be a pointer.

I'll look at the thread and see if anything help.

> The problem on other ARM based boards was configurations of gcc
> using cpu-specific extensions by default which makes the kernel
> build system used them to build the kernel - which eventually
> results in unbootable images.

The strange thing is, the Code Sourcery toolchain works fine with the
other ep93xx user. I'm hoping I just have something messed up.

Also, I would assume if the toolchain had some default cpu-specific
extensions then the "Uncompressing Linux... " wouldn't even work.
But, again I don't know...

> See this thread:
> 
>   http://lists.busybox.net/pipermail/buildroot/2009-March/026580.html
> 
> Hope that helps :) And if it does, it might be worth including some
> proven to work configs in the buildroot repository.

I'll look it over. Maybe it will help.

Thanks,
Hartley
