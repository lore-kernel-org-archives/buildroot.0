From: Mohamed HAMZAOUI <requinham@gmail.com>
Date: Sat, 25 Feb 2012 01:01:14 +0100
Subject: [Buildroot] [U-Boot] Craneboard with Uboot and xloader
In-Reply-To: <CA+M6bXk7yKi8VFQRbYT-SQZMwM9eneBzjx2NB9KpHeicxkDb9Q@mail.gmail.com>
References: <CABMxt4ic6cZ_xfrtkouKkw2OWSbOiL95tXrz9XgKyqUAd4U-6A@mail.gmail.com>
 <20120224150232.GA2346@bill-the-cat>
 <CABMxt4hMc3CjnjFEQNTjzsfxyXgBoyO8uMg1xsmaTeZ2pWXRRQ@mail.gmail.com>
 <CA+M6bXk7yKi8VFQRbYT-SQZMwM9eneBzjx2NB9KpHeicxkDb9Q@mail.gmail.com>
Message-ID: <CABMxt4ja3EmjER5ywn5R+OLxkXy-Ho-cZ89LLuML4qX50ews=w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I tried following your instruction and i have been found the file MLO and
u-boot.img in the build/uboot directory but when i use them with the
generated rootfs th craneboard boot from the nand and not from my SD
although it's configured to booting from SD card and i tested it whith a
openembedded distribution.
the first log for starting is :
U-Boot SPL 2011.12 (Feb 25 2012 - 00:01:51)
Texas Instruments Revision detection unimplemented
OMAP SD/MMC: 0
reading u-boot.img
reading u-boot.img


U-Boot 2011.12 (Feb 25 2012 - 00:01:51)

AM35XX-GP ES2.0, CPU-OPP2, L3-165MHz, Max CPU Clock 600 Mhz
CraneBoard + LPDDR/NAND
I2C:   ready
DRAM:  256 MiB
NAND:  256 MiB
MMC:   OMAP SD/MMC: 0
In:    serial
Out:   serial
Err:   serial
Die ID #0dc0000100000000015da39614006015
Hit any key to stop autoboot:  3  2  1  0
mmc - MMC sub system

Usage:
mmc read addr blk# cnt
mmc write addr blk# cnt
mmc erase blk# cnt
mmc rescan
mmc part - lists available partition on current mmc device
mmc dev [dev] [part] - show or set current mmc device [partition]
mmc list - lists available devices
Booting from nand ...

NAND read: device 0 offset 0x480000, size 0x500000
 5242880 bytes read: OK
## Booting kernel from Legacy Image at 82000000 ...
   Image Name:   Linux-2.6.32
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    2103408 Bytes = 2 MiB
   Load Address: 80008000
   Entry Point:  80008000
   Verifying Checksum ... OK
   Loading Kernel Image ... OK
OK

Starting kernel ...

Uncompressing
Linux....................................................................................................................................
done, booting the kernel.
Linux version 2.6.32 (sriharsha at localhost.localdomain) (gcc version 4.3.3
(Sourcery G++ Lite 2009q1-203) ) #1 Mon Nov 29 23:22:22 IST 2010
CPU: ARMv7 Processor [411fc087] revision 7 (ARMv7), cr=10c53c7f
....
...


On Fri, Feb 24, 2012 at 9:20 PM, Tom Rini <trini@ti.com> wrote:

> On Fri, Feb 24, 2012 at 1:08 PM, Mohamed HAMZAOUI <requinham@gmail.com>
> wrote:
> > Thank you for your help, but i use the 2012.12RC version and in the
> > bootloader menu i select the u-boot version 2011.12 and in the uboot
> binary
> > format i only have u-boot.bin, u-boot-nand.bin, u-boot.kwb !
> > How to build u-boot.img ?
> > when i used a u-boot.bin for my Craneboard i can't boot because it need a
> > MLO (xloader) for booting.
>
> That's a buildroot problem.  'make am3517_crane ; make', or however
> buildroot builds today is producing u-boot.img and MLO, it's just not
> copying them out to where you're looking for them.
>
> >
> > thx
> >
> > On Fri, Feb 24, 2012 at 4:02 PM, Tom Rini <trini@ti.com> wrote:
> >
> >> On Fri, Feb 24, 2012 at 10:25:21AM +0100, Mohamed HAMZAOUI wrote:
> >> > Hi,
> >> >
> >> > I want to use Buildroot for CraneBoard...
> >> >
> >> > My problem is with configuration files : MLO, u-boot.bin and uImage.
> >> > I installed the last RC buildroot and after I started to configure the
> >> build
> >> >  by selecting the desired setting because i dont found a defconfig
> file
> >> for
> >> > Kernel with buildroot ...
> >>
> >> Starting with v2011.12 you do not need x-loader and you want the MLO and
> >> u-boot.img (NOT u-boot.bin) files created by U-Boot.
> >>
> >> --
> >> Tom
> >>
> >
> > _______________________________________________
> > U-Boot mailing list
> > U-Boot at lists.denx.de
> > http://lists.denx.de/mailman/listinfo/u-boot
> >
>
>
>
> --
> Tom
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120225/b69673ed/attachment-0001.html>
