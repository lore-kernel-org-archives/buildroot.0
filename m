From: Teemu Keskinarkaus <Teemu.Keskinarkaus@cc-systems.com>
Date: Fri, 18 Sep 2009 11:52:41 +0200
Subject: [Buildroot] Buildroot 2009.08 fails to build working rootfs
Message-ID: <330EC2471BF24E48B513AF1A6975EB69B00E3F@MAIL-UA.ccs.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

First of all I'm using AT91-version of the buildroot-2009.08, but I'm
guessing (or more like hoping) that it has nothing to do with the
problem I'm having.

 

I finally got the buildroot build okay with external toolchain.
Toolchain is glibc eabi toolchain (Codesourcery) and kernel (2.6.30.4)
is configured for eabi too. Kernel boots up just fine and get's rootfs
mounted, but then panics because init is not found.

 

VFS: Mounted root (ubifs filesystem) readonly on device 253:1.

Freeing init memory: 100K

Kernel panic - not syncing: No init found.  Try passing init= option to
kernel.

 

I manually compiled busybox and made my own small rootfs. Then with the
same kernel as before, the system booted up nicely. 

 

I tried to be sneaky and replaced the busybox binary that buildroot was
compiled, with the one I had compiled and let buildroot regenerate
rootfs, but that didn't help. I still got the same error.

 

I programmed the rootfs image as a second partition to unit and booted
up with older buildroot and checked what was that new rootfs like and it
seemed to be just fine. I couldn't see anything that was causing the
problem. And the image was working just fine too.

 

Kernel command line on both working and non-working case is the same:

 

Kernel command line: mem=128M console=ttyS0,115200 ubi.mtd=1 ubi.mtd=2
root=ubi0:rootfs ro rootfstype=ubifs ubi.mtd=3

 

I'm guessing this must be some simple thing, but I just can't figure it
out. Has anyone else had similar problems and how did you solve it?

 

Teemu Keskinarkaus

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090918/82b6db5a/attachment-0001.htm>
