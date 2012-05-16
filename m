From: chrisgriffith at cox.net <chrisgriffith@cox.net>
Date: Wed, 16 May 2012 16:24:53 -0700
Subject: [Buildroot] microblazeel_v2 are 64-bit executables
Message-ID: <20120516192453.7GAXH.715646.imail@fed1rmwml114>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone, I hope this is a good place for this, I did search the archives and the buglist, and I think it's more informational than a bug.

As background, I'm using buildroot-2012.05-rc1 on Ubuntu 11.10 inside VirtualBox on Windows 7, targeting a MicroBlaze AXI system with MMU on a Xilinx ML605 development board.

The little endian microblaze toolchain that buildroot auto-downloads from Xilinx's website is the "V2" or version 2, which is a 64-bit build (and therefore didn't work for me at first, you get "cannot execute binary file"). Running (for example) 'file gcc' on the downloaded tools results in

chris at chris-VirtualBox:~/buildroot/buildroot-2012.05-rc1/output/host/opt/ext-toolchain/microblazeel-unknown-linux-gnu/bin$ file gcc
gcc: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux 2.6.15, not stripped

In contrast, the "V1" or version 1 builds of the toolchain gives 

chris at chris-VirtualBox:~/mblinux/microblaze_v1.0_le/microblazeel-unknown-linux-gnu/microblazeel-unknown-linux-gnu/bin$ file gcc
gcc: ELF 32-bit LSB executable, Intel 80386, version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux 2.6.9, not stripped

So it's not a dealbreaker to use the external V1 tools and say so in the buildroot config, I just thought you might like to know that the default downloaded MB toolchain doesn't always work from the get-go and maybe put in a warning or something.

Hope that helps somebody out,
Chris
