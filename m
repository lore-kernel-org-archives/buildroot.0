From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 14 Jun 2020 23:48:27 +0200
Subject: [Buildroot] [PATCH v1 2/3] package/iwd: add basic configuration
 file
In-Reply-To: <20200614213610.GQ2346@scaer>
References: <20200612232433.18442-1-ps.report@gmx.net>
 <20200612232433.18442-2-ps.report@gmx.net>
 <20200614095628.GJ2346@scaer> <20200614210740.0d39d95d@gmx.net>
 <20200614205715.GN2346@scaer> <20200614232826.146a5b79@gmx.net>
 <20200614213610.GQ2346@scaer>
Message-ID: <20200614234827.2208bc3a@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On Sun, 14 Jun 2020 23:36:10 +0200, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Peter, All,
>
> On 2020-06-14 23:28 +0200, Peter Seiderer spake thusly:
> > On Sun, 14 Jun 2020 22:57:15 +0200, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > > On 2020-06-14 21:07 +0200, Peter Seiderer spake thusly:
> > > > On Sun, 14 Jun 2020 11:56:29 +0200, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > > > > > +	select BR2_PACKAGE_OPENRESOLV if !BR2_INIT_SYSTEMD
> [--SNIP--]
> > > I'm still not convinced...
> > > What if one has:
> > >     BR2_INIT_SYSTEMD=y
> > >     # BR2_PACKAGE_SYSTEMD_RESOLVED is not set
> > > Does systemd still provides resolv.conf?
> > > I guess not. So in fact the dependency is really not about the init
> > > system. but about a package that provides resolv.conf. In which case it
> > > should be changed to:
> > >     select BR2_PACKAGE_OPENRESOLV if !BR2_PACKAGE_SYSTEMD_RESOLVED
> > Or:

> > 	select BR2_PACKAGE_OPENRESOLV if !BR2_INIT_SYSTEMD

This one fixes it for all non-systemd init systems...

> > 	select BR2_PACKAGE_SYSTEMD_RESOLVED if BR2_PACKAGE_SYSTEMD

This one fixes it for systemd-init-system implemented with BR2_PACKAGE_SYSTEMD...

>
> No sorry, that still does not make sense to me... :-(
>
>
> For one, the conditions are not homogeneous: in one case you test
> against the init system, in the other you test against the package.
>
> [--SNIP--]
> > And what is about the LIBFOO_INSTALL_INIT_OPENRC mentioned in [1]?
>
> Aha! If not specified, it defaults to using the sysv hook, quoting:
>
>     The only exception is when openrc is chosen as init system and
>     LIBFOO_INSTALL_INIT_OPENRC has not been set, in such situation
>     LIBFOO_INSTALL_INIT_SYSV will be called, since openrc supports
>     sysv init scripts.

So, what do with the openrc-init case (for the config file)?

Regards,
Peter

>
> Regards,
> Yann E. MORIN.
>
