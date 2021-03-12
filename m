From: Christian Stewart <christian@paral.in>
Date: Fri, 12 Mar 2021 15:51:05 -0800
Subject: [Buildroot] [PATCH v1 2/2] package/batman-adv: bump version to
 2021.0
In-Reply-To: <20210312230903.18bf4a0a@gmx.net>
References: <20210311210804.9616-1-ps.report@gmx.net>
 <20210311210804.9616-2-ps.report@gmx.net>
 <CA+h8R2ps1MF-NiZKYWceSTruHLXMpzLPORhzORetVKuF1PWDdA@mail.gmail.com>
 <20210312230903.18bf4a0a@gmx.net>
Message-ID: <CA+h8R2r7oBE1h7FSQC+CR=q2Vr-K5bS-qkwVFO-+GT24Qb6Raw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Fri, Mar 12, 2021 at 2:09 PM Peter Seiderer <ps.report@gmx.net> wrote:
> > On Thu, Mar 11, 2021 at 1:08 PM Peter Seiderer <ps.report@gmx.net> wrote:
> > > -BATMAN_ADV_VERSION = 2019.3
> > > +BATMAN_ADV_VERSION = 2021.0
> >
> > I get build errors against 2 different device kernels (x86_64 and pi4):
> >
> > LD [M]  /build/batman-adv-2021.0/net/batman-adv/batman-adv.o
> > MODPOST /build/batman-adv-2021.0/net/batman-adv/Module.symvers
> > ERROR: modpost: "batadv_v_mesh_free"
> > [/build/batman-adv-2021.0/net/batman-adv/batman-adv.ko] undefined!
> > ERROR: modpost: "batadv_v_mesh_init"
> > [/build/batman-adv-2021.0/net/batman-adv/batman-adv.ko] undefined!
> > ERROR: modpost: "batadv_v_hardif_init"
> > [/build/batman-adv-2021.0/net/batman-adv/batman-adv.ko] undefined!
> > ERROR: modpost: "batadv_v_init"
> > [/build/batman-adv-2021.0/net/batman-adv/batman-adv.ko] undefined!
> >
> > Possibly the package makefile needs to be updated?
>
> For me the update fixed the compile for RPi4_64 ;-), can you share your
> defconfig(s)?

OK, I see what happened here. I just ran "make batman-adv" in an
existing tree without enabling the Kconfig options.

The problem is when batman adv protocol version 5 is not enabled:

BR2_PACKAGE_BATMAN_ADV=y
# BR2_PACKAGE_BATMAN_ADV_DEBUG is not set
# BR2_PACKAGE_BATMAN_ADV_NC is not set
# BR2_PACKAGE_BATMAN_ADV_BATMAN_V is not set

That's causing the "batadv_v_init" undefined errors.

Best regards,
Christian Stewart

>
> Regards,
> Peter
>
> >
> > thanks,
> > Christian
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
