From: Piotr Grudzinski <piotr@powersmiths.com>
Date: Wed, 9 Jan 2008 14:46:12 -0500
Subject: [Buildroot] Kernel headers
References: <001e01c852d9$00a65220$7b01a8c0@Piotr>
	<014801c852ed$4b5bbfd0$6103170a@atmel.com>
Message-ID: <007501c852f8$4be56130$7b01a8c0@Piotr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have created my toolchain with the buildroot program but even the simplest 
program built with it fails (with an illegal instruction) when tested on a 
system from uclinux.org. Both are based on kernel 2.6.22.x and uClibc 
0.9.29. So the idea was to take header and uClibc from the working 
distribution and rebuild the toolchain.
Now it looks like the problem is in uClibc; both libs are 0.9.29 but they 
have different arm/crt1.s files.

Regards,
Piotr

----- Original Message ----- 

> Is it possible to use kernel headers which are already on my system?



Anything is possible in an infinite universe.
In this case, it will probably require changing the 
toolchain_build_<arch>/linux
link to point at your kernel headers after they have been extracted,'
or do it before the kernel headers generated and then fullfil the
Makefile needs so they do not get overwritten

Question is: Whats the benefit of doing that

Best Regards
Ulf Samuelsson
