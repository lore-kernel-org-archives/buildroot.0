From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
Date: Thu, 30 Jan 2014 15:07:59 +0100
Subject: [Buildroot] jffs2 errors on ubifs rootfs
In-Reply-To: <CAB+dmji48fxFuUPJrq7EhL4QC+Amw4ZiNRe=oiBArPeCPPw-Ow@mail.gmail.com>
References: <CAB+dmji48fxFuUPJrq7EhL4QC+Amw4ZiNRe=oiBArPeCPPw-Ow@mail.gmail.com>
Message-ID: <20140130150759.138aae27@e6520eb>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Emmanuel,

Le Thu, 30 Jan 2014 10:08:40 +0000,
Kaspar Emanuel <kaspar.emanuel@gmail.com> a ?crit :

> Hey,
> 
> I am trying to boot a Buildroot generated .ubi rootfs on a Karo TX53
> SoM [1]. I am seeing a lot of jffs2 errors even though the rootfs is
> ubifs ubi image. The errors look like this:
> 
> jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at
> 0x00000000: 0x0527 instead
> 
> There are a lot of these. Full log is attached. I can boot Karo's ubi
> rootfs without seeing these errors, using the same kernel and dtb. I
> boot the kernel with these arguments:
> 
> rootfstype=ubifs ubi.mtd=3,512 root=ubi0:rootfs
> 
> I have have made sure the ubifs LEBs, min i/o size and the ubi image
> erase block and sub-page size etc. are all set correcty in Buildroot.
> The rootfs _does_ actually seem to mount correctly and I can login,
> but I just don't get where these jffs2 errors could be coming from.
> 
your rootfs mounts fine (VFS: Mounted root (ubifs filesystem) readonly
on device 0:12.), the jffs2 log comes after : aren't you trying to mount
a jffs2 filesystem in an initscript or in fstab ?

Eric
