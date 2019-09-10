From: Carlos Santos <unixmania@gmail.com>
Date: Tue, 10 Sep 2019 08:03:03 -0300
Subject: [Buildroot] [PATCH v2] package/nfs-utils: enable IPv6 if
 libtirpc is selected
In-Reply-To: <20190910125548.64acb272@windsurf>
References: <6a13e0d0-9beb-99f0-436d-5a9d6fd7feb5@mind.be>
 <20190909235607.31990-1-unixmania@gmail.com>
 <9c8666a8-6dc4-8747-7580-588eb574f52e@mind.be>
 <CAJ4jsaefMaEjAuJiqjtkNSNtGQJ=g4UP9xVg786+PE93JpHzkw@mail.gmail.com>
 <20190910125548.64acb272@windsurf>
Message-ID: <CAJ4jsae9p-=EF++F8k_SLXN-b8gH_BCzM4Ci5s6gEc6TNeL+QA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Sep 10, 2019 at 7:55 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Tue, 10 Sep 2019 07:29:39 -0300
> Carlos Santos <unixmania@gmail.com> wrote:
>
> > > >  ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
> > > > -NFS_UTILS_CONF_OPTS += --enable-tirpc
> > > > +NFS_UTILS_CONF_OPTS += --enable-tirpc --enable-ipv6
> > > >  NFS_UTILS_DEPENDENCIES += libtirpc
> > > >  else
> > > > -NFS_UTILS_CONF_OPTS += --disable-tirpc
> > > > +NFS_UTILS_CONF_OPTS += --disable-tirpc --disable-ipv6
> > > >  endif
> > > >
> > > >  define NFS_UTILS_INSTALL_FIXUP
> > > >
> >
> > 2019-09-10T07:22:05 configure: error: '--enable-ipv6' requires TIRPC support.
>
> How come this happens ? We only pass --enable-ipv6 when TIRPC is
> available.

I forced it to happen, just to provide the example. :-)

-- 
Carlos Santos <unixmania@gmail.com>
