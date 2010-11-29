From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Mon, 29 Nov 2010 15:33:47 +0000 (UTC)
Subject: [Buildroot] [OT] Using CONFIG_INITRAMFS_SOURCE _and_ initrd=<path>?
Message-ID: <id0h4r$3v3$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've been experimenting with using both CONFIG_INITRAMFS_SOURCE at
kernel build time, and an initrd loaded by the boot loader.  According
to the mnaual for systemrescuecd:

   With the CONFIG_INITRAMFS_SOURCE option each kernel image contains
   its own kernel modules. And the initram.igz only contains the
   common boot scripts and programs which are used by all these
   kernels. When a kernel boots, both the embedded initramfs and the
   initram.igz are extracted into memory, then the kernel has all it
   needs to boot.

The interesting part is this:

   When a kernel boots,  _both_the_embedded_initramfs_and_the_
   initram.igz_ are extracted into memory

My experimentation seems to show otherwise, when
CONFIG_INITRAMFS_SOURCE is enabled in the kernel, the initrd loaded by
the bootloader into ram and passed to the kernel on the command-line
is ignored.

Can anybody confirm whether or not you're supposed to be able to use
both CONFIG_INITRAMFS_SOURCE _and_ an extra-kernel initrd?
   
-- 
Grant Edwards               grant.b.edwards        Yow! Did you move a lot of
                                  at               KOREAN STEAK KNIVES this
                              gmail.com            trip, Dingy?
