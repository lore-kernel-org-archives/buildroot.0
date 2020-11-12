From: Petr Vorel <petr.vorel@gmail.com>
Date: Thu, 12 Nov 2020 22:24:27 +0100
Subject: [Buildroot] [PATCH v2 2/2] package/linux-backports: bump
 version to 5.8
In-Reply-To: <20201112211713.GD771438@scaer>
References: <20201111162208.362275-1-ju.o@free.fr>
 <20201112120155.333290-1-ju.o@free.fr>
 <20201112120155.333290-2-ju.o@free.fr>
 <20201112210103.GB60815@pevik> <20201112211713.GD771438@scaer>
Message-ID: <20201112212427.GA68372@pevik>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Johannes,

Unless using mac80211, which require v3.10 current backports still support
kernel v3.0 right?

Thanks for info.

Kind regards,
Petr

> Julien, Petr, All,

> On 2020-11-12 22:01 +0100, Petr Vorel spake thusly:
> > > Attempting to compile this package with newer Kernel version (e.g. v5.4)
> > > fails with message:

> > >    Generating local configuration database from kernel ...Kernel version parse failed!

> > > Upgrading the package to 5.8 fixes this issue. Anyways, v4.4 is now
> > > rather old and beat the very purpose of having newer drivers in older
> > > kernels.

> > > Note that since backports tag v4.14-rc4-1, the requirement on minimal
> > > kernel version changed from 3.0 to 3.10. See commit [1].
> > Good catch!

> Is this a mandatory dependency for *all* drivers, or only for the WiFi
> ones?

> > > [1] https://git.kernel.org/pub/scm/linux/kernel/git/backports/backports.git/commit/?id=a0d05f9f9ca50ea8b1d60726fac6b54167257e76

> It looks like it is just about the crypto stuff needed for mac80211...

> Thoughts?

> Regards,
> Yann E. MORIN.

> > Update also package/linux-backports/Config.in:

> > diff --git package/linux-backports/Config.in package/linux-backports/Config.in
> > index 362e6e4bc7..251d202fd2 100644
> > --- package/linux-backports/Config.in
> > +++ package/linux-backports/Config.in
> > @@ -9,7 +9,7 @@ config BR2_PACKAGE_LINUX_BACKPORTS
> >  	  recent kernels, backported to older ones.

> >  	  This version of linux-backports supports kernels starting
> > -	  from 3.0.
> > +	  from 3.10.

> >  	  https://backports.wiki.kernel.org
