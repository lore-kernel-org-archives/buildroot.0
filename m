From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Mon, 23 Apr 2012 16:24:20 +0000 (UTC)
Subject: [Buildroot] [OT] How to get rootfs.cpio combined with a kernel?
Message-ID: <jn3vnk$go5$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've been trying to figure out how to combined the rootfs.cpio created
by Buildroot with an externally built kernel, and I'm a little
stumped.  The "standard" way to do it is to set
CONFIG_INITRAMFS_SOURCE to point to the cpio archive and have the
kernel build pull in the rootfs cpio archive when the kernel is built.

That works, but not a very good solution when it comes to
configuration management for a shipping project.  I need to be able to
build and manage/version the kernel and rootfs as separate objects --
then combine the kernel and rootfs together into a single uImage file.

IOW, I'd like to do two _separate_ builds:

 1) Build rootfs.cpio (using Buildroot).

 2) Build vmlinux.o (not sure if that's the right file).

Those would both be controlled and versioned as separate objects.

Then I'd like to link those two files together and create a uImage
file from them.

I've been browsing around Linux kernel Makefiles and docs, trying to
figure out what the "pre-rootfs" file is and how to combine it with
the rootfs to produce the uImage file.  There's plenty of info about
how to specify or create an initramfs and the actual kernel startup
works, but all I can find about how to actually link the kernel and
initramfs together is "set CONFIG_INITRAMFS_SOURCE and do a kernel
build".

Having to re-compile the kernel when nothing in the kernel or it's
configuration has changed (only the rootfs changed) just doesn't feel
like an acceptable engineering practice.

Any pointers to documentation on how one might combine a kernel object
and a rootfs cpio image to get a uImage file?

-- 
Grant Edwards               grant.b.edwards        Yow! ANN JILLIAN'S HAIR
                                  at               makes LONI ANDERSON'S
                              gmail.com            HAIR look like RICARDO
                                                   MONTALBAN'S HAIR!
