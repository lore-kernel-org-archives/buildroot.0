From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Jun 2019 09:17:11 +0200
Subject: [Buildroot] [PATCH 1/2] package/iputils: move binaries to the
 location also used by Busybox
In-Reply-To: <20190618065929.GC8350@x230>
References: <20190616200919.4378-1-thomas.petazzoni@bootlin.com>
 <20190617202402.GA8498@x230> <20190618084657.64bd21e4@windsurf>
 <20190618065929.GC8350@x230>
Message-ID: <20190618091711.3b3ca1b8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 18 Jun 2019 08:59:29 +0200
Petr Vorel <petr.vorel@gmail.com> wrote:

> > Adjusting the Busybox configuration is not the choice we have made to
> > solve this problem. Instead, the way we have chosen to solve the
> > conflict between Busybox applets and the "full-blown" variant of the
> > same tools is by:  
> 
> >  - Making "busybox" depend on all packages that provide the full-blown
> >    variants, so that those full-blown variants are built/installed
> >    before Busybox.  
> 
> >  - Ensure the Busybox installation process does not overwrite the
> >    full-blown variants when they are already installed.  
> 
> > This ensures that at the end of the build, if a full-blown variant is
> > installed, it takes precedence over the Busybox applet.  
> 
> > The drawback is while the Busybox symlink is not installed, the actual
> > code is present in the Busybox binary.  
> 
> Thanks for an explanation. Having a bit bigger binary it's not a big deal.
> If this is a problem for any reason, fortunately user can supply it's own
> busybox config.
> I guess you took this direction because it's much simpler than messing with
> busybox config (the solution I suggested).

Yes, that's exactly the reason. It would require to keep track of which
Busybox options need to be disabled, depending on which other Buildroot
packages/options are enabled.

That being said, the current solution also requires that all packages
install their programs in the same location as the corresponding
Busybox applets, which also requires some maintenance effort.

None of the solutions is perfect, and a trade-off has to be made.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
