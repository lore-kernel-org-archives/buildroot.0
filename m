From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Jan 2016 15:07:31 +0100
Subject: [Buildroot] PowerPC64 toolchain not building
Message-ID: <20160123150731.1c1db4b0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Cody,

Back in 2014, you added support for PowerPC64 (BE and LE) in Buildroot.
Today, I wanted to build a PowerPC64 toolchain, and it appears that:

 * The default configuration (gcc 4.9, binutils 2.24)
 * gcc 4.9 + binutils 2.25
 * gcc 5.3 + binutils 2.25

do not build, all are failing with the following error message during
the host-gcc-final build:

/tmp/ccQDkG0a.s: Assembler messages:
/tmp/ccQDkG0a.s:19: Error: operand out of domain (7 is not a multiple of 2)

Note that I have only tested BE and not LE, so I don't know if LE is
also affected or if LE works fine.

Would you have the possibility to look into this issue ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
