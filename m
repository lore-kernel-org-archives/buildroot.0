From: David Picard <dplamp@gmx.com>
Date: Tue, 29 Jan 2019 19:28:31 +0100
Subject: [Buildroot] flags to build Qt5 for AMD Geode LX arch ?
Message-ID: <bb5b237e-ba8d-6857-f475-1960a6375112@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I can build Qt5 successfully. I tested my custom application in QEMU, 
with the same disk.img that I use on the read target (AMD Geode LX).

But on the target, whenever I link one of my programs with Qt5, it 
terminates straight away with a SIGILL (illegal instruction). Including 
a simple printf("Hello world") that doesn't include nor call in Qt5.

With gdbserver + gdb, I could find the instruction where the SIGILL is 
thrown :
movq?? %xmm0,0x8(%esp)
with op code :
66 0F D6 44 24 08

I'm not fluent in assembly code, but my guess is that the instruction is 
not be supported by my CPU. Flags of /proc/cpuinfo : fpu de pse tsc msr 
cx8 sep pge cmov clflush mmx mmxext 3dnowext 3dnow cpuid 3dnowprefetch 
vmmcall

I thought I could pass e.g. -march=geode when I build Qt. But I don't 
know how to do it. I noticed a arch.conf file in the build directory but 
it gest overwritten when I make qt5base-reconfigure...

David
