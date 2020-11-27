From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 27 Nov 2020 23:53:48 +0100
Subject: [Buildroot] Add crontab entries from package
In-Reply-To: <20201127235210.06a62c2a@gmx.net>
References: <92cb0f53-5289-afec-91e7-fc5e93bf29d2@klomp.eu>
 <20201126200537.314f2576@gmx.net>
 <b7ab5353-8504-055c-fcde-b1130dd53c43@klomp.eu>
 <20201127235210.06a62c2a@gmx.net>
Message-ID: <20201127235348.19ec34b1@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And re-add CC: buildroot at buildroot.org,
sorry for missing it...

Regards,
Peter

On Fri, 27 Nov 2020 23:52:10 +0100, Peter Seiderer <ps.report@gmx.net> wrote:

> Hello Sven,
>
> On Fri, 27 Nov 2020 11:40:03 +0100, Sven Klomp <mail@klomp.eu> wrote:
>
> > Hello Peter,
> >
> > On 26.11.20 20:05, Peter Seiderer wrote:
> > >> I want to add entries to /etc/crontabs/root.
> > >> I know I can add abritary scripts to |BR2_ROOTFS_POST_BUILD_SCRIPT| to
> > >> change files. However, as the crontab entry depends on the package, I
> > >> want to change the file from within thepackage and not globally. How is
> > >> this possible?
> > >> The documentation of |BR2_ROOTFS_POST_BUILD_SCRIPT |makes me think there
> > >> must be another solution:
> > >> "You should, however, use this feature with care. Whenever you find that
> > >> a certain package generates wrong or unneeded files, you should fix that
> > >> package rather than work around it with some post-build cleanup scripts."
> > > Maybe use a root filesystem overlay/BR2_ROOTFS_OVERLAY (see [1])...
> > >
> > > Regards,
> > > Peter
> > >
> > > [1] https://buildroot.org/downloads/manual/manual.html#rootfs-custom
> > >
> >
> > Thanks for the hint. If my understanding is correct, this is also a
> > global approach (i.e. if I don't install my package, the crontab gets
> > still changed).
>
> Yes you are right (I did not catch the 'from package' of the subject line)...
>
> > But maybe there is no other solution from within the package.
>
> Do the same as for sysv or systemd init files, provide a custom one from your
> package and install it, see e.g. DHCPCD_INSTALL_INIT_SYSV/DHCPCD_INSTALL_INIT_SYSTEMD
> from dhcpcd ([2])...
>
> Regards,
> Peter
>
> [2] https://git.buildroot.net/buildroot/tree/package/dhcpcd/dhcpcd.mk#n43
>
> >
> > Best regards
> > Sven
>
