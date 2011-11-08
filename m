From: Paul Diem <PCDiem@FoxValley.net>
Date: Tue, 08 Nov 2011 17:35:02 -0600
Subject: [Buildroot] Multiple Target Architectures
Message-ID: <4EB9BCA6.4010206@FoxValley.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A few years ago I built a system using uClibc on x86. I used buildroot 
to build the initial filesystem for my development machine. My target 
machines have always been x86 so I've been able build everything 
natively from within that environment.

I'm now looking at building the same system for MikroTik RouterBoards so 
I will need to cross compile to PPC and MIPS. I've having a hard time 
grasping how to do this though. Can I simply build gcc for the other 
architectures on my current development system and then build for the 
target? I know I can use buildroot to build a root filesystem for each 
target architecture but it seems like I would have to run buildroot 
every time I make a small code change and buildroot will go through the 
whole process of rebuilding the toolchain each time.

I'm sure I'm missing something simple but I'm not sure what it is. 
Basically, I have a kernel, uClibc, busybox and some other packages that 
I want to be able to compile/cross-compile on an x86 host for x86, PPC 
and MIPS targets. What's the easiest/best way to do that?

BTW, I tried to use buildroot to build for a target arch of MIPS, the 
build failed with:
/usr/src/naos/buildroot-2011.08/output/host/usr/bin/mips-unknown-linux-uclibc-ar: 
error while loading shared libraries: 
/usr/src/naos/buildroot-2011.08/output/build/binutils-2.21/./bfd/.libs/libbfd-2.21.so: 
ELF file data encoding not little-endian

Thanks in advance for any pointers,
-- 
Paul C Diem
PCDiem at FoxValley.net
