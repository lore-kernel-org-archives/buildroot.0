From: Waldemar Brodkorb <wbx@openadk.org>
Date: Thu, 28 Jan 2016 10:47:02 +0100
Subject: [Buildroot] PowerPC64 toolchain not building
In-Reply-To: <20160128024442.GA5589@tungsten.ozlabs.ibm.com>
References: <20160123150731.1c1db4b0@free-electrons.com>
 <20160124191236.GQ17143@waldemar-brodkorb.de>
 <20160124213607.6e3b1257@free-electrons.com>
 <20160127043858.GB6719@tungsten.ozlabs.ibm.com>
 <20160127093256.77169e7d@free-electrons.com>
 <20160128024442.GA5589@tungsten.ozlabs.ibm.com>
Message-ID: <20160128094702.GA17327@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sam,
Sam Bobroff wrote,

> On Wed, Jan 27, 2016 at 09:32:56AM +0100, Thomas Petazzoni wrote:
> > Hello,
> > 
> > On Wed, 27 Jan 2016 15:38:58 +1100, Sam Bobroff wrote:
> > 
> > > I have a bit of experience with buildroot on PowerPC64 so I also attempted to
> > > replicate this, but I could not. I don't know the rest of your config but I
> > > did match the values you posted above. An operand error like that could be
> > > related to the specific architecture version the assembler is expecting, so
> > > changing the "target architecture variant" is probably worth trying (try
> > > "generic").
> > 
> > Thanks a lot for having looked at the problem!
> > 
> > You need to select the power8 processor for the issue to reproduce. It
> > doesn't appear with power7 for example.
> 
> Hmm, while that's not surprising, I've used that combination of options (power8
> big-endian with gcc 4.9.x and gcc 5.x) and it works fine for me. Have you tried
> building from completely clean, including clearing or disabling ccache?
> 
> Maybe the host architecture matters? Is that x86_64? What gcc do you have on
> the host?

At gcc-final time?
I tried on Ubuntu 14.04 and Debian/wheezy with the same result:
gcc -v
Using built-in specs.
COLLECT_GCC=/usr/bin/gcc-4.8.real
COLLECT_LTO_WRAPPER=/usr/lib/gcc/x86_64-linux-gnu/4.8/lto-wrapper
Target: x86_64-linux-gnu
Configured with: ../src/configure -v --with-pkgversion='Ubuntu
4.8.4-2ubuntu1~14.04'
--with-bugurl=file:///usr/share/doc/gcc-4.8/README.Bugs
--enable-languages=c,c++,java,go,d,fortran,objc,obj-c++
--prefix=/usr --program-suffix=-4.8 --enable-shared
--enable-linker-build-id --libexecdir=/usr/lib
--without-included-gettext --enable-threads=posix
--with-gxx-include-dir=/usr/include/c++/4.8 --libdir=/usr/lib
--enable-nls --with-sysroot=/ --enable-clocale=gnu
--enable-libstdcxx-debug --enable-libstdcxx-time=yes
--enable-gnu-unique-object --disable-libmudflap --enable-plugin
--with-system-zlib --disable-browser-plugin --enable-java-awt=gtk
--enable-gtk-cairo
--with-java-home=/usr/lib/jvm/java-1.5.0-gcj-4.8-amd64/jre
--enable-java-home
--with-jvm-root-dir=/usr/lib/jvm/java-1.5.0-gcj-4.8-amd64
--with-jvm-jar-dir=/usr/lib/jvm-exports/java-1.5.0-gcj-4.8-amd64
--with-arch-directory=amd64
--with-ecj-jar=/usr/share/java/eclipse-ecj.jar --enable-objc-gc
--enable-multiarch --disable-werror --with-arch-32=i686
--with-abi=m64 --with-multilib-list=m32,m64,mx32 --with-tune=generic
--enable-checking=release --build=x86_64-linux-gnu
--host=x86_64-linux-gnu --target=x86_64-linux-gnu
Thread model: posix
gcc version 4.8.4 (Ubuntu 4.8.4-2ubuntu1~14.04) 
$ ld -v
GNU ld (GNU Binutils for Ubuntu) 2.24

That is rather strange. Could you provide a full build log
and .config?

make clean
make V=1 &>log
cat .config >> log

best regards
 Waldemar
