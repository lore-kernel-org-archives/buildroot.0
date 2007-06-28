From: Stuart Wood <stuart.wood@labxtechnologies.com>
Date: Thu, 28 Jun 2007 15:54:22 -0400
Subject: [Buildroot]  ARM EABI builds
Message-ID: <002a01c7b9be$22a79000$7100a8c0@SDW>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Just a note on what Tom said about user land application. I've already 
found that I had to add -march=armv4t to properly build my application, Just
because gcc was not using the right load register code for the data 
size I wanted to read. It would use ldrw instead of ldrh. So, It would 
help avoid those errors.

Stuart

Tom wrote:
> 
> I did think about adding -mcpu=<cpu> to the build CFLAGS, but that is
> not going to help with the problem that libgcc is not going to be 
> compiled correctly.
> 
Why not? The kernel image, built with the same "incorrect" toolchain, 
must have used only ARMv4 instructions. If it hadn't, I would have never 
gotten far enough to even execute vprintf, libc. I would suspect that 
the kernel does a better job of setting -mcpu, -mtune. Thus these 
options should work for libc too. What makes you think that it wouldn't 
work for libc, have you tried? (PS: Even if it did, bug #1406 is 
probably the better fix, in particular as buildroot users might use its 
toolchain to build their own code w/o always setting these options)


_______________________________________________
buildroot mailing list
buildroot at uclibc.org http://busybox.net/mailman/listinfo/buildroot
