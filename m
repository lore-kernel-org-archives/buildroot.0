From: Ciro Santilli <ciro.santilli@gmail.com>
Date: Wed, 3 Aug 2016 08:52:48 +0100
Subject: [Buildroot] How to login automatically without typing root in
 buildroot x86 64 QEMU?
In-Reply-To: <20160802094112.072e3382@free-electrons.com>
References: <CAFXrp_e2sDqZGZKM_B2rgBuh_1oXWhJgW6wgMzfBWsGQ_hnV7g@mail.gmail.com>
 <20160802094112.072e3382@free-electrons.com>
Message-ID: <CAFXrp_cSim7KTWQNGPgOLtaym1REtQfpR4THLrX8hMmZwQ-wpA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks!

Is editing `package/busybox/inittab` the best way to do it?

Or is there a more specific `.config` option? I know about
BR2_ROOTFS_OVERLAY.

On Tue, Aug 2, 2016 at 8:41 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello,
>
> On Tue, 2 Aug 2016 07:24:24 +0100, Ciro Santilli wrote:
>
> > How to configure buildroot to skip that and login directly?
>
> Override the default /etc/inittab, and start a shell process directly
> rather than a getty process. I.e, replace:
>
> console::respawn:/sbin/getty -n -L  console 0 vt100 # GENERIC_SERIAL
>
> by:
>
> console::respawn:/bin/sh
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160803/194586e4/attachment.html>
