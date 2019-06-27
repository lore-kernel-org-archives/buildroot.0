From: Benjamin Marty <benjamin.marty@gmail.com>
Date: Fri, 28 Jun 2019 01:20:23 +0200
Subject: [Buildroot] Build Orange Pi One doesn't boot
In-Reply-To: <861affdc-cb20-aa89-8260-b0e57467a816@mind.be>
References: <CABSdY3+3CUSJrFjpK9GcrLtN48Rn2QgJa1aYp99OUJT+U2CA1g@mail.gmail.com>
 <861affdc-cb20-aa89-8260-b0e57467a816@mind.be>
Message-ID: <CABSdY3+ZJ_xapDGd86p+GFgWY7uJTOfusChVOp6iowjjoDvd7A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout

Yes, that was the issue. I have now changed it to external ARM toolchain
and it's booting perfectly. Thanks!

Benjamin

Am Fr., 28. Juni 2019 um 00:29 Uhr schrieb Arnout Vandecappelle <
arnout@mind.be>:

>
>
> On 27/06/2019 21:04, Benjamin Marty wrote:
> > Hello,
> >
> > I tried to build with the Version 2019.05 from the Website and also with
> > master from Github. It builds fine but doesn't boot on the target device.
> > It looks like the kernel somehow crashes during booting. I'm not sure if
> I
> > did something wrong.
> >
> > Benjamin
> >
> > # make orangepi_one_defconfig
> > # make -j9
> > sudo dd if=output/images/sdcard.img of=/dev/mmcblk0 bs=4M
> >
> >
> > Hit any key to stop autoboot:  0
> > switch to partitions #0, OK
> > mmc0 is current device
> > Scanning mmc 0:1...
> > Found U-Boot script /boot.scr
> > reading /boot.scr
> > 301 bytes read in 15 ms (19.5 KiB/s)
> > ## Executing script at 43100000
> > reading zImage
> > 3803896 bytes read in 192 ms (18.9 MiB/s)
> > reading sun8i-h3-orangepi-one.dtb
> > 15153 bytes read in 26 ms (568.4 KiB/s)
> > ## Flattened Device Tree blob at 43000000
> >    Booting using the fdt blob at 0x43000000
> >    Using Device Tree in place at 43000000, end 43006b30
> >
> > Starting kernel ...
> >
> > data abort
>
>  That might be a compiler issue... Could you try to change the toolchain
> to an
> external toolchain (ARM 2019.03), do 'make clean; make' and see if that
> improves
> things?
>
>  Regards,
>  Arnout
>
> > pc : [<5dfacea8>]   lr : [<5df7eef3>]
> > reloc pc : [<4a02eea8>]   lr : [<4a000ef3>]
> > sp : 59f59020  ip : 59f5e8fa fp : 00000004
> > r10: 59f93a1c  r9 : 59f5dee0 r8 : 00000400
> > r7 : 00000000  r6 : 42000000 r5 : 43000000  r4 : 00000000
> > r3 : 43000000  r2 : 43000000 r1 : 00000000  r0 : 00000000
> > Flags: nZCv  IRQs off  FIQs off  Mode UK6_32
> > Resetting CPU ...
> >
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> >
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190628/44c2dde8/attachment.html>
