From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Jun 2016 09:14:42 +0200
Subject: [Buildroot] [arc-buildroot] [autobuild.buildroot.net] arc build
 results for 2016-06-19
In-Reply-To: <1466742836.3244.20.camel@synopsys.com>
References: <20160620063029.16331102969@stock.ovh.net>
 <1466742836.3244.20.camel@synopsys.com>
Message-ID: <20160624091442.6a4f342f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 24 Jun 2016 04:34:55 +0000, Alexey Brodkin wrote:

> With arc-2016.03 toolchain we're seeing quite a lot of failures here and there.
> That's sort of expected because we switched to binutils rewritten from scratch.
> So we're still ramping up with these new binutils. What is also important these
> new rewritten binutils are in upstream already. I.e. upcoming binutils 2.27 will
> have everything ARC-specific from arc-2016.03 plus some more fixes and
> enhancements that we made since March.

OK, thanks for explaining the situation.

> And what we may do in Buildroot we may either wait for 2.27 binutils to be released
> and then apply [backported from mainline master] patches on top of it to fix still
> existing issues or alternatively we may start using so-called "engineering builds"
> of binutils for ARC.
> 
> These "engineering builds" are basically snapshots [that pass internal review and
> testing] made from our dev branch (arc-2016.09) on GitHub like the most recent
> "arc-2016.09-eng004":?https://github.com/foss-for-synopsys-dwc-arc-processors/binutils-gdb/releases/tag/arc-2016.09-eng0
> 04
> 
> We'd prefer to go with "engineering builds" simply because we foresee still a lot
> of changes in ARC port of binutils (remember our port is in its childhood currently)
> while upstream binutils see release about once a year. Which means adding fixes and
> enhancements on top of 2.27 release at some point will become a support nightmare.
> 
> What do you guys think about all that?

I think at some point we will want to use the upstream version of
binutils if there is ARC support upstream. However, I definitely
understand that the upstream support may not be fully ready overnight,
so I'm fine with using those engineering builds for now, and then move
to using the upstream binutils version for binutils 2.28 for example
(or 2.29 if 2.28 is still not good enough).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
