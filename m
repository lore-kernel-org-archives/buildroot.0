From: Steve Kenton <skenton@ou.edu>
Date: Thu, 29 Jan 2015 09:06:01 -0600
Subject: [Buildroot] Grub2 and Memtest86+
Message-ID: <54CA4C59.3010107@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've been tinkering with adding memtest86+ V4.20 to the
grub2 menu for my x86 target. It's straight forward.

The questions, is there interest in this and how to
do this only for x86 targets. I've not dug into how
the boot loaders are handled, yet, but it's apparently
different from regular packages. Is there anyone
who keeps track on the grub2 boot loader in buildroot?

Modify ~boot/grub2/grub.cfg to add the memtest entry
and download the memtest86+ source tarball and then
copy/rename the shipped precomp.bin file file to
/boot/memtest86+.bin (It's a bootable 486 binary)

set default="0"
set timeout="5"

menuentry "Buildroot" {
	linux /boot/bzImage root=/dev/sda1 console=tty1 quiet splash=silent
}

menuentry "Memtest86+" {
	linux16 /boot/memtest86+.bin
}

Steve Kenton
