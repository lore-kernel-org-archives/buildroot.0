From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 18 Jan 2009 09:37:36 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
In-Reply-To: <4972649E.2010609@ruby.dti.ne.jp> (Shinya Kuribayashi's message
	of "Sun\, 18 Jan 2009 08\:07\:10 +0900")
References: <20090116141347.DD52277567@busybox.osuosl.org>
	<4971FB3A.4050904@ruby.dti.ne.jp> <87fxjh3nhq.fsf@macbook.be.48ers.dk>
	<4972649E.2010609@ruby.dti.ne.jp>
Message-ID: <873afh2enj.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Shinya" == Shinya Kuribayashi <skuribay@ruby.dti.ne.jp> writes:

Hi,

 >> And 4.2.4 works for you?

 Shinya> Yes (forgot to mention, sorry).

 Shinya> As Frank pointed out, this problem seems to be related to the host gcc
 Shinya> version.  I'll check the config.log and let you know what internally
 Shinya> happens.

And what host GCC version are you using?
I just tried a build with HOSTCC=gcc-4.1 and it indeed fails for me
(but with another error):

gcc-4.1  -c  -W -Wall -Wwrite-strings -Wstrict-prototypes
-Wmissing-prototypes -Wold-style-definition -Wmissing-format-attribute
-Wno-overlength-strings -pedantic -Wno-long-long   -DHAVE_CONFIG_H
-I. -I/tmp/br/mips-4.1/toolchain_build_mips/gcc-4.3.2/fixincludes
-I../include
-I/tmp/br/mips-4.1/toolchain_build_mips/gcc-4.3.2/fixincludes/../include
/tmp/br/mips-4.1/toolchain_build_mips/gcc-4.3.2/fixincludes/fixincl.c
/tmp/br/mips-4.1/toolchain_build_mips/gcc-4.3.2/fixincludes/fixincl.x:7947: warning: string length `575' is greater than the length `509' ISO C89 compilers are required to support
cc1: error: unrecognized command line option "-Wno-overlength-strings"
make[2]: *** [fixincl.o] Error 1
make[2]: Leaving directory
`/home/peko/tmp/br/mips-4.1/toolchain_build_mips/gcc-4.3.2-initial/build-x86_64-pc-linux-gnu/fixincludes'

Which for a bit of testing seems to be caused by the combination of
-pedantic and -Wno-overlength-strings (any of the two are ok, but the
combination isn't).

That's with:

gcc-4.1 (GCC) 4.1.3 20080704 (prerelease) (Debian 4.1.2-24)
Copyright (C) 2006 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

-- 
Bye, Peter Korsgaard
