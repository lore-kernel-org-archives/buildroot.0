From: Christof Klaiber <christof.klaiber@merath-maschinen.de>
Date: Thu, 20 Mar 2008 14:06:07 +0100
Subject: [Buildroot] Shell-Weirdness
Message-ID: <1206018367.6470.7.camel@luder>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I built buildroot from svn for i486 and try to run it in qemu.

~/qemu/bin/qemu -hda binaries/uclibc/rootfs.i686.ext2 -kernel
project_build_i686/uclibc/linux-2.6.24.3/arch/i386/boot/bzImage -append
root=/dev/hda

After booting the kernel, it complains about not finding /etc/init.d/rcS
- where did it go? It used to be there in earlier times.

Then I can activate a shell by hitting Enter.

The shell works fine, but whenever I try to enter a command which
contains a "-", I get an error message or the shell blocks.

e.g. 

/ # ls -l
-> terminal blocks

somtimes I can use <ctrl>-c to escape, sometimes I have to quit qemu.

Any suggestions, why this can happen?

Regards,
  Christof
