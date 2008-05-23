From: Arun Reddy <reddyac@gmail.com>
Date: Fri, 23 May 2008 12:05:05 -0700
Subject: [Buildroot] Anyone try simulating their Buildroot-created
	filesystem image in QEMU?
Message-ID: <326f33790805231205j302081b1oec193841dac80e0c@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While this might fall more under a QEMU related problem, I thought it might
be helpful to ask it here since other Buildroot members may have encountered
the same problem I'm having.

I have successfully built my filesystem image for a versatile (pb)
baseboard. I have included all the appropriate hardware and drivers for this
board in my kernel configuration as listed here:

http://fabrice.bellard.free.fr/qemu/qemu-doc.html#SEC63

I am trying to now boot it in QEMU, and used the following syntax:

qemu-system-arm -M versatilepb -m 128 -kernel arm-linux-2.6.24.4-20080523.gz
-hda rootfs.arm.ext2 -nographic -append "root=/dev/hda1 console=ttyAMA0"

The kernel image uncompresses fine, but I am getting a kernel panic saying
that it is unable to mount the root fs on unknown block. I was wondering if
the problem is coming from the fact that rootfs.arm.ext2 is not a harddisk
image, and cannot be used with the -hda option? Or does it have to do with
the device I passed into root=? I know for certain that hda1 is what I wish
to use so the kernel will know what to use as the root filesystem... in this
case the local harddisk.

Has anyone here had trouble getting their kernel to boot in qemu after
finishing their buildroot build process? Should I build my kernel for
another board supported by QEMU and try again? Thanks for any help you can
offer!
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080523/a0e9587c/attachment.htm 
