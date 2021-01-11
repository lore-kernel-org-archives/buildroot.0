From: =?UTF-8?Q?Geoffrey_Le_Gourri=C3=A9rec?= <geoffrey.legourrierec@gmail.com>
Date: Mon, 11 Jan 2021 16:06:02 +0100
Subject: [Buildroot] [PATCH 1/1] configs/qemu_*: bump kernel version to
 5.4.88
In-Reply-To: <f70462ad-0ad3-1dbb-6acd-882ec36d51dc@smile.fr>
References: <20210110203910.24698-1-geoffrey.legourrierec@gmail.com>
 <CACPK8Xe5gCZpxEs0VROgax9KV19s42JWo5mR_ShTJGjUheCdng@mail.gmail.com>
 <f70462ad-0ad3-1dbb-6acd-882ec36d51dc@smile.fr>
Message-ID: <CADFgU5Ac-m9TyCs6-f3yw_cMJBZvQRQRvTUpLZWyNeVYjmChug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> Le 11/01/2021 ? 02:09, Joel Stanley a ?crit :
> > On Sun, 10 Jan 2021 at 20:39, Geoffrey Le Gourri?rec
> > <geoffrey.legourrierec@gmail.com> wrote:
> >>
> >> Bump QEMU defconfigs to latest longterm kernel 5.4.88.
> >>
> >> Please note that QEMU boards not based on 5.4.y were ignored:
> >> - qemu_csky810_virt_defconfig
> >> - qemu_csky807_virt_defconfig
> >> - qemu_csky610_virt_defconfig
> >> - qemu_csky860_virt_defconfig
> >>
> >> Tests were carried out on all QEMU boards using Gitlab [1] (commit
> >> message was slightly different, but the patch is identical)
> >>
> >> Additional actions needed were:
> >> - board/qemu/sh4-r2d: Remove one of the two kernel patches [2] provided
> >>   by Alan Modra fixing rodata alignment, carried here by Romain Naour [3]
> >>   to fix an issue preventing kernel from booting with binutils 2.23.
> >>   Patch is present in upstream Linux now.
> >>
> >> [1] https://gitlab.com/clumsyape/buildroot/-/pipelines/239483891
> >> [2] https://www.sourceware.org/ml/binutils/2019-12/msg00112.html
> >> [3] https://git.busybox.net/buildroot/commit/?id=a2331c8a61bdd71c47492efc818fb0458a349219
> >>
> >> Signed-off-by: Geoffrey Le Gourri?rec <geoffrey.legourrierec@gmail.com>
> >
> > Thanks for doing this. For the powerpc boards in particular:
> >
> > Reviewed-by: Joel Stanley <joel@jms.id.au>

You're welcome.

> > Is there a plan to move boards up to v5.10 now that is the latest LTS?
>
> Yes, that's something we can do for 2021.02.
>
> @Geoffrey, if you're interested to do this change, feel free to do it :)

Sure, looks like a nice occasion to contribute again. :)

> Best regards,
> Romain
>
> >
> > Cheers,
> >
> > Joel

Cheers,
Geoffrey

Le lun. 11 janv. 2021 ? 10:07, Romain Naour <romain.naour@smile.fr> a ?crit :
>
> Hello,
>
> Le 11/01/2021 ? 02:09, Joel Stanley a ?crit :
> > On Sun, 10 Jan 2021 at 20:39, Geoffrey Le Gourri?rec
> > <geoffrey.legourrierec@gmail.com> wrote:
> >>
> >> Bump QEMU defconfigs to latest longterm kernel 5.4.88.
> >>
> >> Please note that QEMU boards not based on 5.4.y were ignored:
> >> - qemu_csky810_virt_defconfig
> >> - qemu_csky807_virt_defconfig
> >> - qemu_csky610_virt_defconfig
> >> - qemu_csky860_virt_defconfig
> >>
> >> Tests were carried out on all QEMU boards using Gitlab [1] (commit
> >> message was slightly different, but the patch is identical)
> >>
> >> Additional actions needed were:
> >> - board/qemu/sh4-r2d: Remove one of the two kernel patches [2] provided
> >>   by Alan Modra fixing rodata alignment, carried here by Romain Naour [3]
> >>   to fix an issue preventing kernel from booting with binutils 2.23.
> >>   Patch is present in upstream Linux now.
> >>
> >> [1] https://gitlab.com/clumsyape/buildroot/-/pipelines/239483891
> >> [2] https://www.sourceware.org/ml/binutils/2019-12/msg00112.html
> >> [3] https://git.busybox.net/buildroot/commit/?id=a2331c8a61bdd71c47492efc818fb0458a349219
> >>
> >> Signed-off-by: Geoffrey Le Gourri?rec <geoffrey.legourrierec@gmail.com>
> >
> > Thanks for doing this. For the powerpc boards in particular:
> >
> > Reviewed-by: Joel Stanley <joel@jms.id.au>
> >
> > Is there a plan to move boards up to v5.10 now that is the latest LTS?
>
> Yes, that's something we can do for 2021.02.
>
> @Geoffrey, if you're interested to do this change, feel free to do it :)
>
> Best regards,
> Romain
>
> >
> > Cheers,
> >
> > Joel
> >
> [...]
