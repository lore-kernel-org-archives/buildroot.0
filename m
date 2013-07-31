From: anjohn <andre.johnigk@iml.fraunhofer.de>
Date: Wed, 31 Jul 2013 06:21:56 -0700 (PDT)
Subject: [Buildroot] Kernel freezes after loading with qemu
Message-ID: <1375276916286-49198.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I just started to play around with buildroot. I managed to compile a kernel
with the option "initial RAM linked into linux kernel" and "(tty1) Port to
run a getty on" and I could load it with qemu and it worked. I could login
and wander around in the ram filesystem.

As second step I wanted to create a bootable disk image with my custom
kernel and filesystem. I disenabled the option "initial RAM linked into
linux kernel", enabled that I get an ext2 filesystem image and marked the
option "install kernel image to /boot in target".
I also configured the kernel and marked the option "second extended file
system".

I build no packages, except for nano and grub as boot loader ...

then I
 - created a disk image of 32 mb with dd
 - made a primary partition on it with fdisk
 - made an ext2 filesystem on it with mkfs
 - copied the contend of my rootfs.ext2 into the filesystem
 - installed Grub that uses the boot files that were genereted by buildroot

Then I booted my recently created kernel by the command "qemu -hda hdd.img".
I could chose my kernel in the boot menu and then it started to load the
kernel.

It allways freezes after the line
"swapper/0 (1) used greatest stack depth: 5740 bytes left"

Some other strange thing is the message
"Filesystem type is ext2fs, partition type 0x83."
that appears right after the info that the system will boot now.

I just want a bootable disk image with linux kernel and a minimal filesystem
on a primary partition.

Were is the error in my method?
What other method would you recommend to get such an bootable disk image?

Thaaaank you veeery much!!! 



--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/Kernel-freezes-after-loading-with-qemu-tp49198.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
