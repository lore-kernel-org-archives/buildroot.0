From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Thu, 24 Feb 2011 11:37:57 -0600
Subject: [Buildroot] New Buildroot install setup issues
Message-ID: <0D753D10438DA54287A00B027084269764D0949BF6@AUSP01VMBX24.collaborationhost.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

I am setting up a new system with Buildroot and ran into a problem that I
have not seen before.

The system has a fresh install of Fedora 14 on it.  I cloned a new copy of
Buildroot last night then did a make menuconfig and setup everything like
my current system.  The problem occurs when setting up the external-toolchain.

mkdir -p /export/kdrive/mvr/mx35/devel/buildroot/output/external-toolchain
bzcat /export/kdrive/mvr/mx35/devel/buildroot/dl/arm-2010q1-202-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2 | tar --strip-components=1 -C /export/kdrive/mvr/mx35/devel/buildroot/output/external-toolchain  -xf -
/din/sh: /export/kdrive/mvr/mx35/devel/buildroot/output/external-toolchain/bin/arm-none-linux-gnueabi-gcc: /lib/ld-linux.so.2: bad ELF interpreter: No such file or directory
readlink: missing operand
Try `readlink --help` for more information.
/bin/sh: line 5: @echo: command not found
make: *** [/export/kdrive/mvr/mx35/devel/buildroot/output/stamps/ext-toolchain-installed] Error 1

Any ideas?

Thanks,
Hartley
