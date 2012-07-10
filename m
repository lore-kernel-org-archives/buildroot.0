From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 11 Jul 2012 00:30:19 +0200
Subject: [Buildroot] Unable to boot via initrd
In-Reply-To: <07221C471CA1C044B6D10EC0D483C95708D30B6D@hercules.clumpton.homeip.net>
References: <07221C471CA1C044B6D10EC0D483C95708D30B6D@hercules.clumpton.homeip.net>
Message-ID: <4FFCACFB.4030601@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/10/12 23:24, Bart J. Smit wrote:
> Another buildroot newbie looking at this. I'm looking to create a PXE boot for generic x86.
>
> I've created the initial ramdisk with:
>   mount -o loop rootfs.ext2 ../initrd
>   cd ../initrd
>   find . | cpio -o -H newc | gzip>  ../initrd.img

  An easier way to create the initrd is to choose the CPIO image from the
buildroot menuconfig.

> When I PXE boot the client, it gets to:
>    VFS Cannot open root device, please append a correct root= boot option; here are the available partitions
>    Kernel panic - not syncing: VFS; Unable to mount root fs on unknown-block(2,0)

  Does the kernel have support for gzipped initramfs?  Do you give a root= option
on the kernel command line?  (Shouldn't be necessary, since your initramfs is the
final root filesystem.)


  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
