From: =?UTF-8?Q?Mihajlo_Jovanovi=C4=87?= <jovanovic.mihajlo@gmail.com>
Date: Mon, 9 Jul 2012 10:31:49 +0200
Subject: [Buildroot] /dev/ttyS0 in filesystem created by Buildroot can't be
	opened in Qemu
Message-ID: <CAM1vXnbUXsTaCbtRnS5z8SdqKTTY-EV3=o79vcGbwnSjukYmNw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone,

I am working with QEMU 1.1.0, emulating Versatile Express board with ARM
Cortex-A9. I have managed to launch simple "Hello World" example following
this instructions:

http://balau82.wordpress.com/2012/03/31/compile-linux-kernel-3-2-for-arm-and-emulate-with-qemu/

but now I want to create filesystem by myself.

I decided to use buildroot, version 2012.05. and I've configured it to
create toolchain, kernel and filesystem image for ARM Cortex-A9 target.

Kernel is of version 3.3.7 and for the filesystem I've selected to be cpio,
non-compressed. The initrd argument in call to qemu-system-arm is pointing
to

*/output/images/rootfs.cpio*

When I launch QEMU kernel boots, but then I get this message:

*Initializing random number generator... done.*

*Starting network...*

*can't open /dev/ttyS0: No such device or address*

*can't open /dev/ttyS0: No such device or address*

*can't open /dev/ttyS0: No such device or address*

*...*

All I can do is to terminate QEMU.

I have checked the contents of rootfs.cpio like this:

cpio -t < rootfs.cpio

and saw that there is /dev/ttyS0.

Have I missed something in configuring the filesystem? Or should I use
filesystem in

*/output/target*

to somehow create device(s) there (Buildroot does not do that), and then
rebuild the filesystem?

I'm new to Buildroot, so any hint or suggestion is more than welcome.

Thanks a lot in advance,

Mihajlo
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120709/8ecdc8c1/attachment.html>
