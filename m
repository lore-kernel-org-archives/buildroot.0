From: Carlos Santos <unixmania@gmail.com>
Date: Mon, 12 Aug 2019 20:47:06 -0300
Subject: [Buildroot] [PATCH] package/nfs-utils: enable IPv6 if libtirpc
 is selected
In-Reply-To: <20190812230639.4a7811d9@windsurf.home>
References: <20190812030954.4880-1-unixmania@gmail.com>
 <20190812181450.70b8c901@gmx.net>
 <20190812230639.4a7811d9@windsurf.home>
Message-ID: <CAJ4jsafKz3Hrex0RwiBmZcULyumTHX4hpAS0Tfb442TNdg4NAQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Aug 12, 2019 at 6:06 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Mon, 12 Aug 2019 18:14:50 +0200
> Peter Seiderer <ps.report@gmx.net> wrote:
>
> > On Mon, 12 Aug 2019 00:09:54 -0300, unixmania at gmail.com wrote:
> >
> > > From: Carlos Santos <unixmania@gmail.com>
> > >
> > > IPv6 support depends on libtirpc, so no not disable it if libtirpc is
> >
> > s/no not/do not/
> >
> > > selected. In practice this always enables IPv6, since nfs-utils needs
> > > rpcbind, which in its turn always selects libtirpc.
> >
> > Why not simple select it directly?
>
> Because it is an optional dependency and as such is not strictly
> required, so we don't typically force such optional dependencies in
> Buildroot.
> I found the v1 from Carlos to be more appropriate than his v2. If you
> want RPC/IPv6 support, then you must enable libtirpc, and nfs-utils.mk
> properly uses libtirpc if available.
>
> Arnout, what do you think ?

It's an optional dependency only if we decide to make ipv6 optional,
which goes against the decision taken years go, according to Arnout's
comment[1]: "We decided a few years ago to no longer make ipv6 support
in packages optional, i.e. always assume it is there." That's why by
default autotools packages are configured with --enable-ipv6 (see
package/pkg-autotools.mk).

1. https://bugs.busybox.net/show_bug.cgi?id=10806#c1

-- 
Carlos Santos <unixmania@gmail.com>
