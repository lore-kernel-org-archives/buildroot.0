From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 12 Jan 2009 09:54:36 +0100
Subject: [Buildroot] arch support
Message-ID: <87ljtgj44z.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I just finished building the defconfigs for all the archs (uclibc
0.9.30 / kernel headers 2.6.28 / binutils 2.19 / gcc 4.3.2 except for
avr32 which does it's own thing)

I'm using those versions instead of the defaults, as I would like to
change the defaults before the release.

Build logs are here: http://uclibc.org/~jacmet/br/

Status:

alpha: broken in libpthread
arm: ok
armeb: ok
avr32: ok (uclibc-0.9.29-avr32, binutils-2.17-avr32, gcc-4.2.2-avr32)
cris: broken in kernel headers
i386: ok
ia64: broken in gcc-final (uclibc link)
m68k: gcc ICE
mips: ok
mipsel: ok
nios2: broken in kernel headers
powerpc: ok
s390: broken in uclibc
sh4: ok
sh64: broken in kernel headers (merged with sh?)
sparc: broken in gcc-final (uclibc link)
sparc64: broken in uclibc/libm
x86_64: broken in uclibc

- alpha: I'll retry with the "new" pthreads and see if that works
- ia64 and sparc issue seems similar, will ask on the uclibc list
- sh64: Anyone knows if that got merged with sh4 like powerpc did?
- s390: Shouldn't really have been added in the first place as there's
  no uclibc support. Will remove (Bernhard agrees)

The others I don't know - Please step up now if you want to see your
favourite arch supported, otherwise I WILL remove it (depends on
BROKEN).

-- 
Bye, Peter Korsgaard
