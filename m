From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 15 Mar 2021 22:50:46 +0100
Subject: [Buildroot] [PATCH v1 1/2] package/batman-adv: fix compile with
 BR2_PACKAGE_BATMAN_ADV_BATMAN_V disabled
In-Reply-To: <CA+h8R2qT=su3CO8OCVbQtdpsZezCxsrnq2UtWWNJVp+ZP75r8A@mail.gmail.com>
References: <20210314223207.13460-1-ps.report@gmx.net>
 <CA+h8R2qT=su3CO8OCVbQtdpsZezCxsrnq2UtWWNJVp+ZP75r8A@mail.gmail.com>
Message-ID: <20210315225046.522e98f6@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Christian,

On Mon, 15 Mar 2021 14:00:38 -0700, Christian Stewart <christian@paral.in> wrote:

> Peter, all,
>
> On Sun, Mar 14, 2021 at 3:32 PM Peter Seiderer <ps.report@gmx.net> wrote:
> >
> > The given 'CONFIG_BATMAN_ADV_BATMAN_V=' is enough to trigger the wrong
> > code compile path in net/batman-adv/bat_v.h missing the static inline
> > dummy implementations.
> >
> > Fixes:
>
> Unfortunately after applying this commit it still breaks.
>
> I confirmed that the CONFIG_BATMAN_ADV_BATMAN_V is not being set now.
>
>
> CONFIG_BATMAN_ADV=m
> CONFIG_BATMAN_ADV_BLA=y
> CONFIG_BATMAN_ADV_DAT=y
> CONFIG_BATMAN_ADV_MCAST=y
> M=build/batman-adv-2021.0/net/batman-adv
> make modules
>
> [snip]
>
>   MODPOST /build/batman-adv-2021.0/net/batman-adv/Module.symvers
> ERROR: modpost: "batadv_v_mesh_free" undefined!
> ERROR: modpost: "batadv_v_mesh_init" undefined!
> ERROR: modpost: "batadv_v_hardif_init" undefined!
> ERROR: modpost: "batadv_v_init" undefined!

Mind to share your defconfig (which cross-compiler)?

Did you do a complete re-build of the batman-adv-2021.0
package (rm -rf build/batman-adv-2021.0 && make batman-adv)?

Regards,
Peter

>
> Thanks,
> Christian Stewart
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
