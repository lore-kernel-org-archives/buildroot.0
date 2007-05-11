From: Alex Parkinson <okalex@gmail.com>
Date: Fri, 11 May 2007 09:57:40 -0400
Subject: [Buildroot] libgcc.a and hardware vs. software FP
Message-ID: <1ec5776b0705110657p4acd925dn2995136dbc42073c@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

I'm currently trying to build U-Boot v1.2.0 for an Atmel AT91SAM9260
using gcc v4.1.2, binutils v2.17, and uClibc v0.98.2 built with
Buildroot.  I'm coming across an error stating that libgcc.a uses
hardware FP, whereas u-boot uses software FP.  I've been told by
Wolfgang Denk, the creator of U-Boot, that my toolchain is using
hardware FP unconditionally.  How can I rebuild my toolchain using
Buildroot to accommodate software FP, but still be useful for
compiling the Linux kernel?  I've tried selecting the option to use
software FP by default, but it failed to compile (browsing the lists,
I see that this is a current bug).  I've also tried changing the
uClibc configuration which selects whether the target has an FPU (I'm
actually not sure what the proper setting is for this).

Cheers,
Alex Parkinson
