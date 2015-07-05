From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Jul 2015 15:30:34 +0200
Subject: [Buildroot] [PATCH] pkg-kconfig: .config target needs to take
 into account package dependencies
In-Reply-To: <20150703220237.GI3652@free.fr>
References: <1435956134-9543-1-git-send-email-arnout@mind.be>
 <20150703220237.GI3652@free.fr>
Message-ID: <20150705153034.74fd2b66@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 4 Jul 2015 00:02:37 +0200, Yann E. MORIN wrote:

> > +# Generating the .config file is part of the configure step of the package
> > +# infrastructure, so it should be ordered like it. IOW, it should take over
> > +# its dependencies.
> > +$$($(2)_DIR)/.config: | $$($(2)_FINAL_DEPENDENCIES)
> 
> OK, I see the point.
> 
> However, when Thomas DS. and I did the infra, we explicitly avoided this
> dependency, for a simple reason: we did not want to have to build the
> dependencies of a package just to 'menuconfig' it, like so:
> 
>     make menuconfig   <- enable kernel
>     make linux-menuconfig
> 
> Currently, all we need at that moment is that linux be downloaded,
> extracted and patched, then we can show the menuconfig.
> 
> With your proposed patch, it means all the Linux dependencies
> (host-kmod, lzop...) will have to be built before we can show the
> menuconfig. This was the situation we were in before we had the
> kconfig-package infra, and it is *very* frustrating... :-(

I agree that having to build all dependencies of linux just to run
"make linux-menuconfig" is a bit annoying. So finding a solution to
keep this behavior would be nice.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
