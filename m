From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Jun 2015 21:10:31 +0200
Subject: [Buildroot] Building bootable usb drive for target board with
 ext2
In-Reply-To: <CANKYLME21pAifC-tb+HC=tRhy5k9ka0W-gywZCPrOdpq1aOTMA@mail.gmail.com>
References: <CANKYLME21pAifC-tb+HC=tRhy5k9ka0W-gywZCPrOdpq1aOTMA@mail.gmail.com>
Message-ID: <20150612211031.3a684e7d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Patricia Holden,

On Fri, 12 Jun 2015 14:20:59 -0400, Patricia Holden wrote:

> I'm following examples of how to create a bootable usb for a target board
> i'm doing some work for.  I am stuck at setting up grub for booting.  I
> can't seem to get buildroot to put the bzImage into /boot directory for
> grub to load.  My target ends up hanging.

If all you need is to have bzImage installed in /boot, then make sure
to enable BR2_LINUX_KERNEL_INSTALL_TARGET.

However, you have BR2_TARGET_ROOTFS_INITRAMFS=y, which means your
rootfs is inside your kernel image. So it is not possible for your
kernel image to be inside your rootfs!

So if you want to use a rootfs inside the kernel image (using
initramfs), then all you have to do it to build yourself a small
filesystem with just the necessary Grub bits in /boot and the
bzImage.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
