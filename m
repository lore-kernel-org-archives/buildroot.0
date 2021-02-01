From: manu f <e.fiancette@gmail.com>
Date: Mon, 1 Feb 2021 21:47:40 +0100
Subject: [Buildroot] qt5 "Could not find DRM device"
In-Reply-To: <20210131211621.3ca2c713@gmx.net>
References: <CAGshWo2DDqef=WG6MatpYHTxyNx=p4j+XxR-iEXSiE76anz4pw@mail.gmail.com>
 <CAOMZO5AUFXJhy2Q7mh5OwtVu4PgLfU2KAMDMemDckq4VjDcK2w@mail.gmail.com>
 <20210131211621.3ca2c713@gmx.net>
Message-ID: <CAGshWo2OxJ_BwwdxbOt7G92N-VQq-vC6Viu1q0Xn6+xx3R+osA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

You are right Peter, and now I understand my mistake!
Effectively the kernel is a freescale/nxp Kernel.
So I modify my config, disable mesa3d and use the kernel-module-imx-gpu-viv
and imx gpu viv with framebuffer.
This morning at wake up I just had time to see that the could not find drm
desapear, but i didn't had time to check more.
I put here my new config and will report next any success or not !

;-) thanks

Le dim. 31 janv. 2021 ? 21:16, Peter Seiderer <ps.report@gmx.net> a ?crit :

> Hello Emmanuel,
>
> On Sun, 31 Jan 2021 16:03:57 -0300, Fabio Estevam <festevam@gmail.com>
> wrote:
>
> > Hi Emmanuel,
> >
> > On Sun, Jan 31, 2021 at 3:15 PM manu f <e.fiancette@gmail.com> wrote:
> > >
> > > Hello all,
> > >
> > > I build a kernel for imx6 board. imx6 boot correctly, but  I got this
> error  "Could not find DRM device" when I try to launch a qt web browser (
> this app working on an other context).
> > >
> > > I search google and mailing list. I find something about qt5
> configuration and -device flag..
> > > Could I have some help about ?
> > >
> > > (qt app depend on qt5 webengine, so I set mesa3d and perhaps I made a
> mistake when setting drivers, because I use direct frame buffer.. perhaps I
> forgot something)
> >
> > I suggest you take a look at configs/imx6-sabresd_qt5_defconfig. This
> > target uses the mainline kernel and the Etnaviv stack.
>
> Think this points to your problem, you must decide between mainline/actual
> kernel using
> mesa3d/etnaviv configuration or freescale/nxp kernel using the vivante
> graphics stack...
>
> From your provided config it is hard to judge which way your try...some
> etnaviv
> options enabled some IMX/Vivante ones enabled... but the main point is
> the selected kernel and kernel options, but your config points to private
> repo and
> private config...., but from the selected/used kernel header version (4.9)
> I would
> suspect an freescale/nxp kernel?
>
> Regards,
> Peter
>
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210201/74eaf890/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/octet-stream
Size: 134662 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210201/74eaf890/attachment-0001.obj>
