From: Shinya Kuribayashi <skuribay@ruby.dti.ne.jp>
Date: Sun, 18 Jan 2009 17:48:06 +0900
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
In-Reply-To: <873afh2enj.fsf@macbook.be.48ers.dk>
References: <20090116141347.DD52277567@busybox.osuosl.org>	<4971FB3A.4050904@ruby.dti.ne.jp>
	<87fxjh3nhq.fsf@macbook.be.48ers.dk>	<4972649E.2010609@ruby.dti.ne.jp>
	<873afh2enj.fsf@macbook.be.48ers.dk>
Message-ID: <4972ECC6.7010608@ruby.dti.ne.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard wrote:
> And what host GCC version are you using?
> I just tried a build with HOSTCC=gcc-4.1 and it indeed fails for me
> (but with another error):

From the previous make log, it's gcc 4.2.4:

> GNU make version '3.81':                        Ok
> C compiler '/usr/bin/gcc'
> C compiler version '4.2.4':                     Ok
> C++ compiler '/usr/bin/g++'
> C++ compiler version '4.2.4':                   Ok

That's with:

gcc (GCC) 4.2.4 (Ubuntu 4.2.4-1ubuntu3)
Copyright (C) 2007 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

And the builtin specs are:

skuribay at ubuntu:git$ gcc -v < /dev/null 
Using built-in specs.
Target: i486-linux-gnu
Configured with: ../src/configure -v --enable-languages=c,c++,fortran,objc,obj-c++,treelang --prefix=/usr --enable-shared --with-system-zlib --libexecdir=/usr/lib --without-included-gettext --enable-threads=posix --enable-nls --with-gxx-include-dir=/usr/include/c++/4.2 --program-suffix=-4.2 --enable-clocale=gnu --enable-libstdcxx-debug --enable-objc-gc --enable-mpfr --enable-targets=all --enable-checking=release --build=i486-linux-gnu --host=i486-linux-gnu --target=i486-linux-gnu
Thread model: posix
gcc version 4.2.4 (Ubuntu 4.2.4-1ubuntu3)

> Which for a bit of testing seems to be caused by the combination of
> -pedantic and -Wno-overlength-strings (any of the two are ok, but the
> combination isn't).

Hmm.  Could you give it a try with gcc 4.2.x?
