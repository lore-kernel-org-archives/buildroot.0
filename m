From: Rohit Kumar <rohit.kumar@hitechroboticsystemz.com>
Date: Wed, 16 Apr 2014 18:05:12 +0900
Subject: [Buildroot] buildroot file system: Kernel panic
In-Reply-To: <20140416103924.64cdc49f@skate>
References: <CABzetm2iM9vUAQ4GHfiKv_y3HCq_Jek45Pe16MPSZo=CoV+6Cw@mail.gmail.com>
 <20140416091611.03ce43f3@skate>
 <CABzetm3snhCBbvvtZ8Z9btySm0BeRsf2gwG2GxhNn0mXy4d1fA@mail.gmail.com>
 <20140416095711.430764d9@skate>
 <CABzetm2VtaC-B4tv+2N9qpD-1anG7FkcgGnbV+fcimRCnCLzFQ@mail.gmail.com>
 <20140416103924.64cdc49f@skate>
Message-ID: <CABzetm27cTYk_wiu1Skt3dkbvpFioaCQVz+YaE=VWjXKCz4eUw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Apr 16, 2014 at 5:39 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Rohit Kumar,
>
> On Wed, 16 Apr 2014 17:12:01 +0900, Rohit Kumar wrote:
>
> > > > i am using an ARM11 processor form Nexell (NXP2120)
> > > > 32bit Embedded CPU : 700/800Mhz ARM1176 with
> > > > 16KByte I-Cache, 16Kbyte D-cache with VFP(vector floating-point
> > > processor)
> > >
> > > Ok.
> >
> >  it is weird because when i use arm926t from the processor option, file
> > system works.
> > but as i shift to arm1176 it starts giving panic messages.
>
> Ok, that is interesting. Did you compile your kernel with CONFIG_VFP=y ?
>

Kernel has already CONFIG_VFP=y

>
> > > However, the kernel part of the configuration looks weird: it refers to
> > > the kernel configuration file
> > > board/atmel/at91sam9260ek/linux-3.9.config. Are you building a kernel
> > > in Buildroot, but not using it for your platform?
> >
> > i am not using kernel from the buildroot rather compiling the source i
> have
> > with the toolchain generated.
>
> Ok, but Buildroot is still building a kernel for you, so you're
> spending time for nothing :)
>
> you are right..disabled it :)


> > > Also, please enable CONFIG_DEBUG_USER=y in your kernel, and pass
> > > user_debug=31 on your kernel command line. This should give more
> > > details about the userspace crash.
>
> Did you try this?
>

tried as above:
Looking up port of RPC 100003/2 on 192.168.1.35
Looking up port of RPC 100005/1 on 192.168.1.35
VFS: Mounted root (nfs filesystem) on device 0:13.
devtmpfs: mounted
Freeing init memory: 480K
Kernel panic - not syncing: Attempted to kill init!
[<c00865bc>] (unwind_backtrace+0x0/0xcc) from [<c034b18c>]
(panic+0x54/0x11c)
[<c034b18c>] (panic+0x54/0x11c) from [<c00b2678>] (do_exit+0x5c/0x684)
[<c00b2678>] (do_exit+0x5c/0x684) from [<c00b2fb8>]
(do_group_exit+0xac/0xf0)
[<c00b2fb8>] (do_group_exit+0xac/0xf0) from [<c00bc350>]
(get_signal_to_deliver+0x3b8/0x410)
[<c00bc350>] (get_signal_to_deliver+0x3b8/0x410) from [<c0083494>]
(do_signal+0x5c/0x5e0)
[<c0083494>] (do_signal+0x5c/0x5e0) from [<c0083ef8>]
(do_notify_resume+0x18/0x48)
[<c0083ef8>] (do_notify_resume+0x18/0x48) from [<c0080dec>]
(work_pending+0x1c/0x20)

user
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>



-- 

With Regards,

Rohit Kumar
Sr. Research Developer
Hitec Robotic systems Ltd.
+91 9891691967
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140416/ffb886e8/attachment.html>
