From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 12 Mar 2020 22:26:14 +0100
Subject: [Buildroot] [PATCH 1/1] package/gupnp: disable introspection
In-Reply-To: <CAFSsvmruUz+YB=mef43KTWTP_ffJbP4eXX_iK-jE1QXvbE2AsQ@mail.gmail.com>
References: <20200311193410.69589-1-fontaine.fabrice@gmail.com>
 <CAFSsvmq1PdEHT-zNqMG_nh2VnUJdQEVBYny6H9pR12FTaDU0nw@mail.gmail.com>
 <CAPi7W81w=vJyfh3YJ4BTbe82qt49HTDepWCQdZid5Zbm7_OVOw@mail.gmail.com>
 <CAFSsvmruUz+YB=mef43KTWTP_ffJbP4eXX_iK-jE1QXvbE2AsQ@mail.gmail.com>
Message-ID: <CAPi7W82OUAK68a7=5DJjn0sH_1_KRvzfsL65uDqZRSJyBECD+g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Adam,

Le jeu. 12 mars 2020 ? 21:05, Adam Duskett <aduskett@gmail.com> a ?crit :
>
> Hey Fabrice;
>
> Actually my patch set does indeed fix these issues! GOI has two issues:
>
> 1) host-goi does not build typelib or gir files.
> 2) goi does not work with meson projects.
>
> My patch set fixes both of these issues, and I have tested extensively with
> every package I could find in Buildroot currently.
>
> Some packages I tested GOI with include:
> libsecret
> gssdp
> gtk3
> libsoup
> gstreamer1
>
> All of them work fine with my patch set applied.
OK, then I'll mark my patches as rejected.
>
> Also, I made a new patch set just a few minutes ago along with a bump
> to libglib2 and goi.
> https://patchwork.ozlabs.org/project/buildroot/list/?series=164047
> https://patchwork.ozlabs.org/project/buildroot/list/?series=164050
> https://patchwork.ozlabs.org/project/buildroot/list/?series=164052
>
> Thanks!
>
> Adam
>
> On Thu, Mar 12, 2020 at 11:20 AM Fabrice Fontaine
> <fontaine.fabrice@gmail.com> wrote:
> >
> > Adam, all,
> >
> > Le jeu. 12 mars 2020 ? 18:31, Adam Duskett <aduskett@gmail.com> a ?crit :
> > >
> > > Frabrice, all;
> > >
> > >
> > > I disagree with this patch set.
> > > I have a patch set that has been sitting for a few weeks now that
> > > allows introspection to work with meson packages:
> > > https://patchwork.ozlabs.org/project/buildroot/list/?series=161028
> > gupnp (and libgtk3 as well as gdk-pixbuf) are autotools packages and
> > not meson packages. From my understanding, your patchset does not fix
> > those. Am I right?
> > Concerning gupnp, I tried to switch it to meson in August 2019 but I
> > had to revert this change due to meson's subproject feature for guul
> > being completely broken on static build with meson.
> > It seems that the issue is now fixed thanks to
> > https://github.com/mesonbuild/meson/pull/5936 so I could try, again,
> > to use meson with gupnp.
> > However, we'll still have to convert libgtk3 and gdk-pixbuf to meson.
> > >
> > > If we apply this patchset first, then we should set this package (and
> > > it's dependencies) to check for goi and enable or disable
> > > introspection conditionally.
> > >
> > > On Wed, Mar 11, 2020 at 12:33 PM Fabrice Fontaine
> > > <fontaine.fabrice@gmail.com> wrote:
> > > >
> > > > Build fails if gobject-introspection is built before gupnp:
> > > >
> > > >  GISCAN   GUPnP-1.0.gir
> > > > Couldn't find include 'GSSDP-1.0.gir' (search path: '['/nvmedata/autobuild/instance-0/output-1/host/bin/../nios2-buildroot-linux-gnu/sysroot/usr/bin/../share/gir-1.0', '..', '/nvmedata/autobuild/instance-0/output-1/host/share', 'gir-1.0', '/nvmedata/autobuild/instance-0/output-1/host/share/gir-1.0', '/usr/share/gir-1.0']')
> > > >
> > > > Fixes:
> > > >  - http://autobuild.buildroot.org/results/ea91dab1d9a59c1aefa481c316115558a6f6e8f8
> > > >
> > > > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > > > ---
> > > >  package/gupnp/gupnp.mk | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/package/gupnp/gupnp.mk b/package/gupnp/gupnp.mk
> > > > index 29305f0b4b..27486b09fa 100644
> > > > --- a/package/gupnp/gupnp.mk
> > > > +++ b/package/gupnp/gupnp.mk
> > > > @@ -12,5 +12,6 @@ GUPNP_LICENSE = LGPL-2.0+
> > > >  GUPNP_LICENSE_FILES = COPYING
> > > >  GUPNP_INSTALL_STAGING = YES
> > > >  GUPNP_DEPENDENCIES = host-pkgconf libglib2 libxml2 gssdp util-linux
> > > > +GUPNP_CONF_OPTS = --disable-introspection
> > > >
> > > >  $(eval $(autotools-package))
> > > > --
> > > > 2.25.1
> > > >
> > > > _______________________________________________
> > > > buildroot mailing list
> > > > buildroot at busybox.net
> > > > http://lists.busybox.net/mailman/listinfo/buildroot
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
Best Regards,

Fabrice
