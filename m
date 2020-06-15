From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 15 Jun 2020 20:41:54 +0200
Subject: [Buildroot] [PATCH v1 2/3] package/iwd: add basic configuration
 file
In-Reply-To: <20200614205715.GN2346@scaer>
References: <20200612232433.18442-1-ps.report@gmx.net>
 <20200612232433.18442-2-ps.report@gmx.net>
 <20200614095628.GJ2346@scaer> <20200614210740.0d39d95d@gmx.net>
 <20200614205715.GN2346@scaer>
Message-ID: <20200615204154.5ec709b9@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On Sun, 14 Jun 2020 22:57:15 +0200, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

[...]

> > > Also, the condiotion on BR2_INIT_SYSTEMD is already handled by the
> > > infra, by using the appropriate INIT_INSTALL hooks:
> > >
> > >     define IWD_INSTALL_INIT_SYSV
> > >         sed -r -e '$s/$/\n[Network]\nNameResolvingService=resolvconf/' \
> > >             $(IWD_PKGDIR)main.conf \
> > >             >$(TARGET_DIR)/etc/iwd/main.conf
> > >     endef
> >
> > Does not work, gives:
> >
> > 	sed: -e expression #1, char 46: missing command
>
> This is Makefile, I forgot to duplicate the $ signs when copy-pasting
> from my shell experiment...
>

O.k. thanks for explanation, the following works as expected:

        sed -r -e '$$s/$$/\n[Network]\nNameResolvingService=systemd/' \
                $(IWD_PKGDIR)main.conf > $(TARGET_DIR)/etc/iwd/main.conf


But nevertheless I would like to keep the split into copy of plain file and
append of extra options (in case more options with different dependencies
follow)...

Regards,
Peter
