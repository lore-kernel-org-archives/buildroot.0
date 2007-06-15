From: Tom <fivemiletom@gmail.com>
Date: Fri, 15 Jun 2007 01:10:21 -0700
Subject: [Buildroot] Arm / buildroot / kernel issue: init crashes?
Message-ID: <4672496D.1060904@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have built an ARM toolchain via buildroot. I am building my kernel 
2.6.21.1 successfully with this toolchain, it boots up OK.

I am compiling a very simple init program (hello world & endless loop) 
'arm-linux-uclibcgnueabi-gcc -static init.c -o init'. It crashes "init 
(1): undefined instruction: pc=00008c60"

Both buildroot and kernel are using EABI. I presume that the headers 
2.6.21.1 (my kernel) and 2.6.20.4 (buildroot) are close enough in 
respect to system calls.
I tried toolchain and kernel both with and without SOFT_FLOAT(after 
reading a thread "Problem with EABI"), but same crash either way. Tried 
both generic_arm and ARM920T.

I suspect my options for buildroot / uclibc, but don't know what exactly 
to look for, anyone any ideas?

Thanks
Tom
