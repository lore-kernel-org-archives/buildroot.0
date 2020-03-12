From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Mar 2020 14:22:24 +0100
Subject: [Buildroot] [PATCH v6 18/28] package/cmake: Fix for using -O in
 top-level make
In-Reply-To: <33267645-fd49-cb20-bb8f-f6a1edd57a15@mind.be>
References: <20200217212350.29750-1-anaumann@ultratronik.de>
 <20200217212350.29750-19-anaumann@ultratronik.de>
 <20200311232503.0bafe189@windsurf>
 <33267645-fd49-cb20-bb8f-f6a1edd57a15@mind.be>
Message-ID: <20200312142224.0a52d7b7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 12 Mar 2020 14:00:24 +0100
Arnout Vandecappelle <arnout@mind.be> wrote:

> > Reading
> > https://www.gnu.org/software/make/manual/html_node/Parallel-Output.html,
> > it seems like it is expected for -Otarget to behave like this.  
> 
> Indeed, looks exactly like expected.
> 
> > However,
> > if you use -Orecurse, it works as expected: the entire output of the
> > sub-make is buffered, and output in one-go when the make target at the
> > Buildroot level completes.
> > 
> > So I'm not sure we want to prevent -Otarget from doing what it does: we
> > should probably instead use -Orecurse.  
> 
> 
>  Where do we pass -Otarget to begin with?

We don't. But I guess Andreas is using "make -Otarget" as it is
using/testing top-level parallel build and it doesn't want messed up
build log.

>  There could be something to be set for globall resetting MAKEFLAGS and taking
> control over the make flags entirely from Buildroot infra when calling into
> package build systems. However, this is a bit complicated in make, and I'm not
> entirely convinced we really want that...

And I assume we wouldn't want to solve on that on a per-package basis,
but rather more globally for all packages.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
