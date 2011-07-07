From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 07 Jul 2011 08:47:50 +0200
Subject: [Buildroot] Build Fails with ruby-1.9.2-p0
In-Reply-To: <BANLkTimm-3LX2S8-17VyPhuiaLqZC3m4jg@mail.gmail.com> (Christopher
 Boumenot's message of "Sun, 29 May 2011 11:03:27 -0400")
References: <BANLkTimm-3LX2S8-17VyPhuiaLqZC3m4jg@mail.gmail.com>
Message-ID: <878vsatwmh.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christopher" == Christopher Boumenot <boumenot@gmail.com> writes:

Hi,

 Christopher> I am trying to create a minimal x86 root image that
 Christopher> includes ruby-1.9.2-p0, but the build fails when compiling
 Christopher> ruby.

 Christopher> "/home/boumenot/src/buildroot-2011.05/output/host/usr/bin/ccache /home/boumenot
 Christopher> /src/buildroot-2011.05/output/host/usr/bin/i686-unknown-linux-uclibc-gcc -o
 Christopher> conftest -I../../.ext/include/i686-linux -I../.././include -I../.././ext/
 Christopher> bigdecimal ? ?-pipe -Os ?conftest.c ?-L. -L../.. -L. ?-rdynamic
 Christopher> -Wl,-export-dynamic ? ? -Wl,-R -Wl,/usr/lib -L/usr/lib -lruby-static ?-lpthread
 Christopher> -lrt -ldl -lcrypt -lm ? -lc"
 Christopher> /home/boumenot/src/buildroot-2011.05/output/host/usr/i686-unknown-linux-uclibc/
 Christopher> sysroot/usr/lib/crt1.o: In function `_start':
 Christopher> (.text+0x1d): undefined reference to `__uClibc_main'

So it ends up looking at your host libraries which leads to a linker
error.

 Christopher> This is against buildroot-2011.05. ?I am building on
 Christopher> OpenSuSE v11.4 x86_64?targeting?x86. ?I am using the
 Christopher> default toolchain values for this version of buildroot. ?I
 Christopher> am not sure what other information would help.

The entire .config would be good. I just tried on my Debian x86-64
system with the following defconfig (i586, default gcc version):

BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_PACKAGE_RUBY=y
BR2_PACKAGE_LIBGLIB2=y

Which works without problems.

-- 
Bye, Peter Korsgaard
