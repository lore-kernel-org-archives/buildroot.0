From: Bart J. Smit <bart@smits.co.uk>
Date: Tue, 10 Jul 2012 21:24:39 +0000
Subject: [Buildroot] Unable to boot via initrd
Message-ID: <07221C471CA1C044B6D10EC0D483C95708D30B6D@hercules.clumpton.homeip.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Another buildroot newbie looking at this. I'm looking to create a PXE boot for generic x86.

I've created the initial ramdisk with:
 mount -o loop rootfs.ext2 ../initrd
 cd ../initrd
 find . | cpio -o -H newc | gzip > ../initrd.img

When I PXE boot the client, it gets to:
  VFS Cannot open root device, please append a correct root= boot option; here are the available partitions
  Kernel panic - not syncing: VFS; Unable to mount root fs on unknown-block(2,0)

From what I can google, this seems to be a popular use for small builds such as buildroot. Do any of the gurus on this list have a recipe to achieve a PXE boot image?

Thanks,

Bart...
  
