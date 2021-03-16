From: Christian Stewart <christian@paral.in>
Date: Mon, 15 Mar 2021 18:45:20 -0700
Subject: [Buildroot] [PATCH v1 1/2] package/batman-adv: fix compile with
 BR2_PACKAGE_BATMAN_ADV_BATMAN_V disabled
In-Reply-To: <20210315225046.522e98f6@gmx.net>
References: <20210314223207.13460-1-ps.report@gmx.net>
 <CA+h8R2qT=su3CO8OCVbQtdpsZezCxsrnq2UtWWNJVp+ZP75r8A@mail.gmail.com>
 <20210315225046.522e98f6@gmx.net>
Message-ID: <CA+h8R2p+uepuOOpG=QbZ+y4bEzQZ4eL6BQU1wScyqXfVXALYZA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Mon, Mar 15, 2021 at 2:50 PM Peter Seiderer <ps.report@gmx.net> wrote:
> On Mon, 15 Mar 2021 14:00:38 -0700, Christian Stewart <christian@paral.in> wrote:
> > On Sun, Mar 14, 2021 at 3:32 PM Peter Seiderer <ps.report@gmx.net> wrote:
> > >
> > > The given 'CONFIG_BATMAN_ADV_BATMAN_V=' is enough to trigger the wrong
> > > code compile path in net/batman-adv/bat_v.h missing the static inline
> > > dummy implementations.
> > >
> > > Fixes:
> >
> > Unfortunately after applying this commit it still breaks.
> >
> > I confirmed that the CONFIG_BATMAN_ADV_BATMAN_V is not being set now.
> >
> >
> > CONFIG_BATMAN_ADV=m
> > CONFIG_BATMAN_ADV_BLA=y
> > CONFIG_BATMAN_ADV_DAT=y
> > CONFIG_BATMAN_ADV_MCAST=y
> > M=build/batman-adv-2021.0/net/batman-adv
> > make modules
> >
> > [snip]
> >
> >   MODPOST /build/batman-adv-2021.0/net/batman-adv/Module.symvers
> > ERROR: modpost: "batadv_v_mesh_free" undefined!
> > ERROR: modpost: "batadv_v_mesh_init" undefined!
> > ERROR: modpost: "batadv_v_hardif_init" undefined!
> > ERROR: modpost: "batadv_v_init" undefined!
>
> Mind to share your defconfig (which cross-compiler)?
>
> Did you do a complete re-build of the batman-adv-2021.0
> package (rm -rf build/batman-adv-2021.0 && make batman-adv)?

Buildroot toolchain,

BR2_x86_64=y
BR2_TOOLCHAIN=y
BR2_TOOLCHAIN_USES_GLIBC=y
BR2_TOOLCHAIN_BUILDROOT=y
BR2_BINUTILS_VERSION_2_35_X=y
BR2_GCC_VERSION_10_X=y
BR2_PACKAGE_BATMAN_ADV=y

Yes, deleted the build/batman-adv* dir and fully re-built, and
confirmed that it was not setting the BATMAN_ADV_V flag anymore.

Thanks,
Christian
