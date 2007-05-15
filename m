From: Michael Hunold <hunold@linuxtv.org>
Date: Tue, 15 May 2007 10:08:37 +0200
Subject: [Buildroot] Statically linked compiler, linker, ... executables
Message-ID: <46496A85.30201@linuxtv.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

I used a recent buildroot to build a straight-forward MIPS toolchain on
my Ubuntu 7.04 host which went perfectly fine.

I now have my toolchain in /opt/mytoolchain/.

foo at bar: file /opt/mytoolchain/bin/mips-linux-uclibc-gcc
/opt/mytoolchain/bin/mips-linux-uclibc-gcc: ELF 32-bit LSB executable,
Intel 80386, version 1 (SYSV), for GNU/Linux 2.6.0, dynamically linked
(uses shared libs), stripped

Is it possible to tell buildroot (or somebody else in the whole build
process) that the resulting executables for the compiler (in this case
mips-linux-uclibc-gcc) and all the other executables should be
statically linked?

I need to deploy these toolchains to various machines of different age.
The first machine I tried was a Fedora Core 4 machine and starting the
compiler resulted in the following error messages:

/opt/mytoolchain/bin//mips-linux-uclibc-gcc: /lib/libc.so.6: version
`GLIBC_2.4' not found (required by
/opt/mytoolchain/bin//mips-linux-uclibc-gcc)

I think that statically linked executables will overcome this problem.

If you have another suggestion, please let me know.

Best regards
Michael.
