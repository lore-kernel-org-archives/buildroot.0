From: Andrew Wiley <debio264@gmail.com>
Date: Fri, 23 Jan 2009 20:40:43 -0600
Subject: [Buildroot] Some Questions - root placement, Initramfs, dev nodes
Message-ID: <ecbbfeda0901231840q30263e2ax3ab8ba4708776c5@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Let my start by saying that I'm not new to linux, but I am new to
embedded linux. I've been spoiled really, if only because I've never
had to live with uDev, and so much of what I'm having to worry about
now is done automagically in my desktop linux distro.
Anyway, I have linux running on a Cirrus Labs EDB9302. So far, I've
just been using buildroot to make a ramdisk, putting in a few kernel
modules and a few apps, and putting it on the board in flash memory. I
also put in a cross compiled kernel. The bootloader (RedBoot) loads
the ramdisk and boots the kernel; the kernel finds the ramdisk, and
away it goes.

The trick is that this isn't really a permanent solution. I have 16 MB
of RAM on the board, so I could potentially have about 10 MB for a
root filesystem, and I have 32 MB of RAM. I would like to avoid the
use of a ramdisk (I only used it because that's what Cirrus Labs uses)
because it takes away RAM and loses all changes on reboot. I see two
ways to avoid one. Firstly, I could write directly to the flash
memory, but that seems like a bad idea because I still have a pretty
small space limit and the flash memory probably has a very finite
life. Secondly, I could use the flash memory to host an initramfs,
which, as I understand it, would allow me to boot, load drivers, mount
an external flash drive as root, and reclaim the space the initramfs
took up. Once again, the flash drive has a finite life, but it can be
replaced easily.
What's the normal approach to this? The board I'm working with is
being used for robotics projects by beginner programmers, so I would
like to have as complete a system as possible to make programming
simpler. Ideally, the board would be it's own development system, with
a native compiler toolchain.
Is this a realistic goal? Have I understood the initramfs correctly?
How would I set up something like this?

Also, my board has two serial ports, ttyAM0 and ttyAM1. I copied the
/dev nodes from the official Cirrus Labs firmware (I sent another
email about this a while back), and while ttyAM0 works perfectly,
ttyAM1 doesn't seem to respond to anything I do. Programs can open the
port, set speeds, and write to it without errors, but these actions
have no effect. As I said, I've never had to work without uDev, so how
do I find the major and minor information for this serial port?

Thanks for any help you can offer, and feel free to tell me I'm a
clueless idiot,
Andrew Wiley
