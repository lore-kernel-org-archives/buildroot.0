From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Dec 2013 11:13:36 +0100
Subject: [Buildroot] [PATCH 5/9] linux: enable initrd/initramfs support
 when cpio rootfs is chosen
In-Reply-To: <20131228194924.GJ3373@free.fr>
References: <1388242600-2580-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1388242600-2580-6-git-send-email-thomas.petazzoni@free-electrons.com>
 <20131228194924.GJ3373@free.fr>
Message-ID: <20131229111336.0242c913@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 28 Dec 2013 20:49:24 +0100, Yann E. MORIN wrote:

> Do we even want to expose cpio in the first place?
> 
> The way I see it:
>   - if someone wants an archive, then a tarball is a more common archive
>     type than cpio is, so we need not expose cpio. If the user wants an
>     archive, then he should just use a tarball.
>   - thus, as cpio is just a requirement for initramfs, there is no
>     reason to expose cpio in the menu, and just merge cpio as a internal
>     step of initramfs

I am using the cpio format, exposed by Buildroot, on a daily basis. My
use case is that I do a lot of kernel development. I do use Buildroot
to generate a rootfs.cpio, but I build my kernel separately (because
I'm rebuilding it many 50-100 times a day). And I simply point my
kernel configuration to the Buildroot rootfs.cpio:

~/projets/marvell/mvebu$ grep INITRAMFS_SOURCE .config
CONFIG_INITRAMFS_SOURCE="../rootfs-armv7/images/rootfs.cpio"

So yes, I *really* want to keep the cpio format option :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
