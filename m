From: Daniel Endres <d.endres@meteocontrol.de>
Date: Wed, 13 Aug 2008 16:45:15 +0200
Subject: [Buildroot] Error during make
Message-ID: <48A2F37B.6060308@meteocontrol.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Guys,

I'm trying to build a toolchain as well as rootfs for a mipsel device.

Therefore I'd like to use buildroot. The problem is that I'm getting
some undefined references errors during the awk-build. Obviously the
errors are due to a missing math-library.

I've just downloaded the latest snapshot in the first place and tried
the svn-version later on.
Both giving me the same errors.

I've just done a "make menuconfig" for buildroot, changed the target to
mipsel, exited and hit "make".
I don't know if I'm wrong, but shouldn't a clean build succeed ?

Below I've posted my error-log. Hopefully some could point me in the
right direction.
Thanks in advance,

Greetings Daniel

miscutils/lib.a(dc.o): In function `power':
dc.c:(.text.power+0x50): undefined reference to `pow'
editors/lib.a(awk.o): In function `evaluate':
awk.c:(.text.evaluate+0x10ec): undefined reference to `cos'
awk.c:(.text.evaluate+0x1110): undefined reference to `exp'
awk.c:(.text.evaluate+0x111c): undefined reference to `log'
awk.c:(.text.evaluate+0x1140): undefined reference to `sin'
awk.c:(.text.evaluate+0x1158): undefined reference to `sqrt'
awk.c:(.text.evaluate+0x16a0): undefined reference to `atan2'
awk.c:(.text.evaluate+0x27b0): undefined reference to `pow'
collect2: ld returned 1 exit status
make[1]: *** [busybox_unstripped] Error 1
make[1]: Leaving directory
`/home/nexus/uclibc/buildroot/project_build_mipsel/uclibc/busybox-1.11.1'
make: ***
[/home/nexus/uclibc/buildroot/project_build_mipsel/uclibc/busybox-1.11.1/busybox] 

Error 2
