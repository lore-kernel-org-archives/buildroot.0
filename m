From: Michael S. Zick <minimod@morethan.org>
Date: Tue, 6 Dec 2011 09:56:05 -0600
Subject: [Buildroot] buildroot with SquashFS root file system
In-Reply-To: <4EDE32C3.7020400@neotion.com>
References: <4EDE32C3.7020400@neotion.com>
Message-ID: <201112060956.07523.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue December 6 2011, Emmanuel BOUAZIZ wrote:
> 
> Hi,
> 
> I'm trying to run buildroot 2011.11 on an atom based board, booting via PXE.
> 
> I've selected the SquashFS 4.x root filesystem (xz compressed), bzImage as the Kernel binary format, and
> syslinux/pxelinux as the  bootloader.
> In the system configuration, I checked "remount root filesystem read-write during boot"
> 
> In the kernel configuration, I checked Initial RAM filesystem and RAM disk support+XZ, and SquashFS/XZ filesystem support.
> 
> On the PXE server, I put these kernel parameters: append vga=0x305 fbcon=scrollback:4096k initrd=rootfs.squashfs
> 
> Here is what I get during the boot sequence:
> 
> (...)
> RAMDISK: squashfs filesystem found at block 0
> RAMDISK: Loading 14133KiB [1 disk] into ram disk.../
> usb 1-7: new high speed USB device number 3 using ehci_hcd
> VFS: Mounted root (squashfs filesystem) readonly on device 1:0
> usb 2-2: new full speed USB device number 2 using uhci_hcd
> can't open /dev/null: No such file or directory
> can't open /dev/null: No such file or directory
> can't open /dev/null: No such file or directory
> can't open /dev/null: No such file or directory
> can't open /dev/null: No such file or directory
> can't open /dev/null: No such file or directory
> Starting logging: OK
> Starting mdev...
> mdev: /sys/class: No such file or directory
> Starting network...
> hub 2-2:1.0: USB found
> hub 2-2:1.0: 3 ports detected
> ifup: can't open '/var/run/ifstate': Read-only file system
> (...)
> 
> I get the exact same result if I try to use a cramfs instead of a SquashFS.
> 
> Oddly enough, it works perfectly with a cpio root filesystem, or when I integrate the root filesystem as an initramfs in
> the kernel image.
> 
> I probably missed an important item, but can't figure which. 
> Any help appreciated. 
> 

SquashFS is a read-only file system.

So which of the "device support" options did you choose?
You'll need one that puts devices in something writable, like tmpfs.

Mike
> Thanks,
> 
