From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 17 Feb 2014 15:37:45 +0100
Subject: [Buildroot] [PATCH 1/2] udev: update udev to new virtual
 package infra.
In-Reply-To: <20140217143311.GA4920@pc-eric>
References: <1392632536-16714-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1392632536-16714-2-git-send-email-eric.le.bihan.dev@free.fr>
 <20140217114906.5b6aab4a@skate> <20140217143311.GA4920@pc-eric>
Message-ID: <20140217153745.1e5683e9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Le Bihan,

On Mon, 17 Feb 2014 15:33:13 +0100, Eric Le Bihan wrote:

> > Why are we doing this check in UDEV_CONFIGURE_CMDS ? I believe we can
> > simply do:
> >
> > ifeq ($(<foo>_DEPENDENCIES),)
> > $(error No <foo> implementation selected)
> > endif
> I followed the example in package/opengl/libegl/libegl.mk, but I mixed the
> Makefile control function $(error text...) and some Shell script without
> thinking...
> 
> I will revert it to the pure shell version to be coherent.

I guess you mean "to the pure make version", according to what you say
below, right?

> With the <foo>_CONFIGURE_CMDS method, we go through all the dummy steps, and
> this is very verbose:
> 
>   >>> udev undefined Extracting
>   >>> udev undefined Patching
>   >>> udev undefined Configuring
>   echo "No Udev implementation selected. Configuration error."
>   No Udev implementation selected. Configuration error.
>   exit 1
>   make: *** [/home/eric/build/elebihan/demo-systemd/arm/build/udev-undefined/.stamp_configured] Erreur 1
> 
> With the pure Makefile version, the error message is clearer:
> 
>   package/udev/udev.mk:11: *** No Udev implementation selected. Configuration error. Stop.

Yes, I believe this is better. And the message is given at the very
beginning of the build, not when udev starts to be built, which is also
nicer.

> I find it better. If it suits everyone, I can propose a patch to convert all
> the virtual packages to it and re-send my tutorial patch about virtual
> package.

That would be really great!

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
