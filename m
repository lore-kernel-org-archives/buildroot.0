From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 12 Jan 2009 10:22:57 +0100
Subject: [Buildroot] arch support
In-Reply-To: <20090112090745.GB25148@mx.loc> (Bernhard Reutner-Fischer's
	message of "Mon\, 12 Jan 2009 10\:07\:45 +0100")
References: <87ljtgj44z.fsf@macbook.be.48ers.dk>
	<20090112090745.GB25148@mx.loc>
Message-ID: <878wpgj2tq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernhard" == Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> writes:

Hi,

 >> Status:
 >> 
 >> alpha: broken in libpthread

 Bernhard> alpha currently only supports static builds and no threads, IIRC.

Ok, I'll fixup Kconfig deps then.

 >> arm: ok
 >> armeb: ok
 >> avr32: ok (uclibc-0.9.29-avr32, binutils-2.17-avr32, gcc-4.2.2-avr32)
 >> cris: broken in kernel headers

 Bernhard> This was already fixed, build tested fine for me some time ago.

I'll try your tree and port over fixes if needed.

 >> m68k: gcc ICE

 Bernhard> This is fixed with gcc trunk (i.e. 4.4.0).

Ok, we won't get that in BR before the release, so I'll mark it as
BROKEN for now.

 >> mips: ok
 >> mipsel: ok
 >> nios2: broken in kernel headers

 Bernhard> Would need love as it's a bit outdated.

Exactly, and apparently no one cares, so I'll mark it as BROKEN for
now. Is nios2 support evan available in upstream gcc?

 >> powerpc: ok
 >> s390: broken in uclibc

 Bernhard> s/broken/not yet supported/

True, but the outcome is the same ;)

 >> sh4: ok
 >> sh64: broken in kernel headers (merged with sh?)

 Bernhard> both sh64 and sh* build fine for me.

Ok, will check.

 >> x86_64: broken in uclibc

 Bernhard> works for me. What's failing?

uclibc build - See bottom of http://uclibc.org/~jacmet/br/x86_64.log

 >> - alpha: I'll retry with the "new" pthreads and see if that works
 >> - ia64 and sparc issue seems similar, will ask on the uclibc list
 >> - sh64: Anyone knows if that got merged with sh4 like powerpc did?

 Bernhard> there are SH and SH64. SH[234] are just SH variants -- think
 Bernhard> i?86 or mips?e{l,b}

Yes, but the kernel only has arch/sh - Should that also be used for
sh64?

 >> - s390: Shouldn't really have been added in the first place as there's
 >> no uclibc support. Will remove (Bernhard agrees)

 Bernhard> Strictly speaking this should depend on
 Bernhard> !BR2_TOOLCHAIN_BUILDROOT until it is supported in uClibc. I
 Bernhard> agree that it could just me removed from BR for now.

Ok, will do.

-- 
Bye, Peter Korsgaard
