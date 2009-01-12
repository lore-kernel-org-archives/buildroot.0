From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Mon, 12 Jan 2009 10:07:45 +0100
Subject: [Buildroot] arch support
In-Reply-To: <87ljtgj44z.fsf@macbook.be.48ers.dk>
References: <87ljtgj44z.fsf@macbook.be.48ers.dk>
Message-ID: <20090112090745.GB25148@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jan 12, 2009 at 09:54:36AM +0100, Peter Korsgaard wrote:
>Hi,
>
>I just finished building the defconfigs for all the archs (uclibc
>0.9.30 / kernel headers 2.6.28 / binutils 2.19 / gcc 4.3.2 except for
>avr32 which does it's own thing)
>
>I'm using those versions instead of the defaults, as I would like to
>change the defaults before the release.
>
>Build logs are here: http://uclibc.org/~jacmet/br/
>
>Status:
>
>alpha: broken in libpthread

alpha currently only supports static builds and no threads, IIRC.
>arm: ok
>armeb: ok
>avr32: ok (uclibc-0.9.29-avr32, binutils-2.17-avr32, gcc-4.2.2-avr32)
>cris: broken in kernel headers

This was already fixed, build tested fine for me some time ago.

>i386: ok
>ia64: broken in gcc-final (uclibc link)

Didn't try this in a long time.

>m68k: gcc ICE

This is fixed with gcc trunk (i.e. 4.4.0).

>mips: ok
>mipsel: ok
>nios2: broken in kernel headers

Would need love as it's a bit outdated.

>powerpc: ok
>s390: broken in uclibc

s/broken/not yet supported/

>sh4: ok
>sh64: broken in kernel headers (merged with sh?)

both sh64 and sh* build fine for me.

>sparc: broken in gcc-final (uclibc link)
>sparc64: broken in uclibc/libm

never tried any sparc

>x86_64: broken in uclibc

works for me. What's failing?
>
>- alpha: I'll retry with the "new" pthreads and see if that works
>- ia64 and sparc issue seems similar, will ask on the uclibc list
>- sh64: Anyone knows if that got merged with sh4 like powerpc did?

there are SH and SH64. SH[234] are just SH variants -- think
i?86 or mips?e{l,b}

>- s390: Shouldn't really have been added in the first place as there's
>  no uclibc support. Will remove (Bernhard agrees)

Strictly speaking this should depend on !BR2_TOOLCHAIN_BUILDROOT until
it is supported in uClibc. I agree that it could just me removed from BR for now.

HTH,
Bernhard
