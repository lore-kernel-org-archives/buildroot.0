From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 25 Aug 2010 12:24:35 +0300
Subject: [Buildroot] mini 2440 config nfs problems
In-Reply-To: <AANLkTim=ebkMvT=kZTobqF_u6g6faWUCBDGTR4EW4eBn@mail.gmail.com>
References: <AANLkTikb76LCoPYX93MntAG-dKWerjfBACHkQaOQs2wh@mail.gmail.com>
	<20100825090820.GE28629@jasper.tkos.co.il>
	<AANLkTim=ebkMvT=kZTobqF_u6g6faWUCBDGTR4EW4eBn@mail.gmail.com>
Message-ID: <20100825092435.GF28629@jasper.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Belisko,

On Wed, Aug 25, 2010 at 11:16:03AM +0200, Belisko Marek wrote:
> On Wed, Aug 25, 2010 at 11:08 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> > Hi Belisko,
> > On Wed, Aug 25, 2010 at 10:48:09AM +0200, Belisko Marek wrote:
> >> playing with buildroot (2010.08_rc1) to build complete system for my
> >> mini 2440 board.
> >> I was able to build kernel and rootfs correctly but when I try to
> >> mount rootfs over nfs it
> >> always hangs with :
> >>
> >> Freeing init memory: 120K
> >> Kernel panic - not syncing: Attempted to kill init!
> >
> > We need more info:
> >

[snip]

> eth0: link down
> IP-Config: Complete:
>      device=eth0, addr=10.146.1.195, mask=255.255.255.0, gw=255.255.255.255,
>      host=mini2440, domain=, nis-domain=(none),
>      bootserver=10.146.1.21, rootserver=10.146.1.21, rootpath=
> Looking up port of RPC 100003/2 on 10.146.1.21
> eth0: link up, 100Mbps, full-duplex, lpa 0x45E1
> Looking up port of RPC 100005/1 on 10.146.1.21
> VFS: Mounted root (nfs filesystem) on device 0:13.
> Freeing init memory: 120K
> Kernel panic - not syncing: Attempted to kill init!

Try to add user_debug=31 to your kernel command line, and post the kernel 
messages at this point.

baruch

> [<c002b748>] (unwind_backtrace+0x0/0xec) from [<c02ea548>] (panic+0x38/0xcc)
> [<c02ea548>] (panic+0x38/0xcc) from [<c003caa0>] (do_exit+0x60/0x588)
> [<c003caa0>] (do_exit+0x60/0x588) from [<c003d04c>] (do_group_exit+0x84/0xb8)
> [<c003d04c>] (do_group_exit+0x84/0xb8) from [<c004704c>]
> (get_signal_to_deliver+0x2f4/0x330)
> [<c004704c>] (get_signal_to_deliver+0x2f4/0x330) from [<c0029044>]
> (do_notify_resume+0x6c/0x5c4)
> [<c0029044>] (do_notify_resume+0x6c/0x5c4) from [<c0026f2c>]
> (work_pending+0x1c/0x20)

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
