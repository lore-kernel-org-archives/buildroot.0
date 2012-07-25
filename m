From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 25 Jul 2012 18:24:11 -0300
Subject: [Buildroot] [PATCH 0/2] qemu mips64 sample config
Message-ID: <1343251453-6462-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a small set that introduces the mips64 qemu sample configuration.
It's prerequisite is my mips64 tuple patch or Thomas's updated patch that
enables the mips64 tuple also.
Tested with qemu 1.1.1 it's flaky, i can't say for sure if it's a toolchain,
qemu and/or kernel configuration issue since i lack real mips64 hardware to
test on.
The biggest issue is login segfaulting so you can't login to the new sample
shiny emulation, though you can append the old init=/bin/sh to get things
rolling somehow, though you'll get some other segfaults eventually.

Gustavo Zacarias (2):
  mips64: remove toolchain kludge
  qemu/mips64-malta: add new sample config

 board/qemu/mips64-malta/linux-3.3.config |   78 ++++++++++++++++++++++++++++++
 board/qemu/mips64-malta/readme.txt       |    7 +++
 configs/qemu_mips64_malta_defconfig      |   24 +++++++++
 package/Makefile.in                      |    4 --
 4 files changed, 109 insertions(+), 4 deletions(-)
 create mode 100644 board/qemu/mips64-malta/linux-3.3.config
 create mode 100644 board/qemu/mips64-malta/readme.txt
 create mode 100644 configs/qemu_mips64_malta_defconfig

-- 
1.7.8.6
