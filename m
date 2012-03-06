From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Mar 2012 17:59:40 +0100
Subject: [Buildroot] u-boot .img rootfs
In-Reply-To: <ADE657CA350FB648AAC2C43247A983F001F41FF55761@AUSP01VMBX24.collaborationhost.net>
References: <ADE657CA350FB648AAC2C43247A983F001F41FF555E5@AUSP01VMBX24.collaborationhost.net>
 <20120306114825.353855b8@skate>
 <ADE657CA350FB648AAC2C43247A983F001F41FF55761@AUSP01VMBX24.collaborationhost.net>
Message-ID: <20120306175940.19e6f808@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 6 Mar 2012 10:48:10 -0600,
H Hartley Sweeten <hartleys@visionengravers.com> a ?crit :

> The only things I have found about the U-Boot image file mentions
> using 'mkimage' to create the file using a command like these
> examples:
> 
> mkimage -T ramdisk -C gzip -n 'Test Ramdisk Image' -d ramdisk.img.gz
> uRamdisk mkimage -A sh -O linux -T ramdisk -a 0x8C800000 -n "ST40
> Linux ramdisk" -d initrd.img /export/ramdisk.ub
> 
> My guess the uRamdisk file is the same format as the uImage file used
> for the kernel. But, I'm not sure what the format of the
> ramdisk.img.gz or initrd.img files are.

Yes, you have to pass the ext2.gz file through mkimage before giving it
to U-Boot, in order to generate a ramdisk image that U-Boot can
understand and load into memory.

However, this way of doing ramdisks is more or less deprecated,
initramfs have been the norm since quite some years now.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
