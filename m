From: Cjw X <cjwfirmware@vxmdesign.com>
Date: Thu, 9 Jul 2015 17:40:10 -0400
Subject: [Buildroot] Buildroot for STM32F4 with Nuttx kernel
Message-ID: <CAOudHSXE+XrCKsi=bT+XjfTUhU3W9YiW=MjjJN2t9KEX8nzh-Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In case anyone is interested....

I modified buildroot to create a distribution for the STM32F4 processor.
(It should be fairly portable to different Cortex-M processors though, the
STM32F4 is the only one I've tested so far).

So far it:
Builds the toolchain
Builds a modified Nuttx RTOS
Builds the icsp tools for programming and debugging (openocd/gdb)
It also integrates the filesystem buildroot generates into the Nuttx kernel
so it shows up in Nuttx's filesystem.

It still has a ways to go, but right now it builds everything and works on
my hardware.
So far I've tested it on hardware I built, and on the STM32F407 discovery
board with the attached baseboard.

You can find instructions here http://www.vxmdesign.com/STM32.html
The git repo is https://github.com/vxmdesign/prjpluto.git and
vdsc_defconfig is the config for the discovery board.

Happy programming!
-Chris
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150709/39e29204/attachment.html>
