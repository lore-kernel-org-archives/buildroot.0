From: Ivan Sergeev <vsergeev@gmail.com>
Date: Sun, 18 Aug 2013 10:48:38 -0700
Subject: [Buildroot] BeagleBone defconfig broken?
In-Reply-To: <520DE175.1050103@relinux.de>
References: <520DE175.1050103@relinux.de>
Message-ID: <CAAMhL_RF-0KNoCpRfAK1foEcfbJRCz2y5nF3d2UF=1kBD1N-vw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Stephan,

Does u-boot report that the device tree is loaded into memory just before
booting? It should be named /boot/am335x-bone.dtb or
/boot/am335x-boneblack.dtb on your rootfs partition, depending on if your
BeagleBone hardware platform is White or Black, for u-boot to autoload it
without further assistance in a uEnv.txt... The defaults are
in buildroot/output/build/uboot-2013.04/include/configs/am335x_evm.h.

Thanks,
~vsergeev
Ivan Sergeev


On Fri, Aug 16, 2013 at 1:23 AM, Stephan Hoffmann <sho@relinux.de> wrote:

> Hello all,
>
> I am currently trying to get the latest buildroot to run on my
> beaglebone with little success. The last version that seem to run out of
> the box is 2012.08, where I can simply copy MLO, u-boot.img and uImage
> to the boot partition, dd rootfs.ext2 to the second partition and the
> system works.
>
> The current build fails to boot, because u-boot expects the image and
> dts in /boot within the root filesystem. After putting them there with a
> post build script, u-boot starts the kernel, but the kernel fails to
> mount root:
> > [    1.509962] Waiting for root device /dev/mmcblk0p2...
> The SD partitions seem o.k.:
> > Disk /dev/sdi: 3965 MB, 3965190144 bytes
> > 255 heads, 63 sectors/track, 482 cylinders
> > Units = cylinders of 16065 * 512 = 8225280 bytes
> > Sector size (logical/physical): 512 bytes / 512 bytes
> > I/O size (minimum/optimal): 512 bytes / 512 bytes
> > Disk identifier: 0x00000000
> >
> >    Device Boot      Start         End      Blocks   Id  System
> > /dev/sdi1   *           1           9       72292    c  W95 FAT32 (LBA)
> > /dev/sdi2              10         133      996030   83  Linux
> and /dev/mmcblk0p2 sounds like the right partition.
>
> Can anybody give a hint where to look further?
>
> Kind regards
>
> Stephan
>
> --
> reLinux     -    Stephan Hoffmann
> Am Schmidtgrund 124    50765 K?ln
> Tel. +49.221.95595-19    Fax: -64
> www.reLinux.de     sho at reLinux.de
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130818/5f39c32b/attachment.html>
