From: Peter =?iso-8859-1?q?H=FCwe?= <PeterHuewe@gmx.de>
Date: Tue, 27 Jul 2010 03:14:14 +0200
Subject: [Buildroot] AVR32 is broken (toolchain)
In-Reply-To: <20100723231850.636bfab9@surf>
References: <AANLkTinBXtX-xDYtM5V8pTrwNpkDKBHSpz9MKnQ8mypa@mail.gmail.com>
	<AANLkTi=x4Ez1ZimcV4Nc3aCym=+K=ds9zUaM0uae_RWa@mail.gmail.com>
	<20100723231850.636bfab9@surf>
Message-ID: <201007270314.15113.PeterHuewe@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Freitag 23 Juli 2010 23:18:50 schrieb Thomas Petazzoni:
> Thiago A. Corr?a <thiago.correa@gmail.com> wrote:
> >    Your patch worked fine for me and now I'm able to build the
> > toolchain.
> 
> Great!
> 
> I will make some more testing with my patch and I'll push it soon.

Hi Thomas,

I just tried to compile the atngw100_defconfig using your patch and the latest 
git repo but unfortunately it fails while building host-lzo

>>> host-lzo 2.03 Configuring
...
configure: loading cache /avr/buildroot/output/build/host-config.cache
configure: Configuring LZO 2.03
checking build system type... (cached) x86_64-unknown-linux-gnu
checking host system type... (cached) x86_64-unknown-linux-gnu
checking target system type... config.sub: missing argument
Try `config.sub --help' for more information.
configure: error: /bin/sh autoconf/config.sub  failed
make: *** [/avr/buildroot/output/build/host-lzo-2.03/.stamp_configured] Error 
1

You can find the whole log at http://dpaste.com/hold/222214/

Do you think this is related to the original problem?
I'm running buildroot on a 64-bit gentoo installation - 
gcc: x86_64-pc-linux-gnu-4.1.2
Es werden eingebaute Spezifikationen verwendet.
Ziel: x86_64-pc-linux-gnu
Konfiguriert mit: /var/tmp/portage/sys-
devel/gcc-4.1.2/work/gcc-4.1.2/configure --prefix=/usr --bindir=/usr/x86_64-
pc-linux-gnu/gcc-bin/4.1.2 --includedir=/usr/lib/gcc/x86_64-pc-linux-
gnu/4.1.2/include --datadir=/usr/share/gcc-data/x86_64-pc-linux-gnu/4.1.2 --
mandir=/usr/share/gcc-data/x86_64-pc-linux-gnu/4.1.2/man --
infodir=/usr/share/gcc-data/x86_64-pc-linux-gnu/4.1.2/info --with-gxx-include-
dir=/usr/lib/gcc/x86_64-pc-linux-gnu/4.1.2/include/g++-v4 --host=x86_64-pc-
linux-gnu --build=x86_64-pc-linux-gnu --disable-altivec --enable-nls --
without-included-gettext --with-system-zlib --disable-checking --disable-
werror --enable-secureplt --enable-multilib --enable-libmudflap --disable-
libssp --enable-java-awt=gtk --enable-languages=c,c++,java,treelang,fortran --
enable-shared --enable-threads=posix --enable-__cxa_atexit --enable-
clocale=gnu
Thread-Modell: posix
gcc-Version 4.1.2 (Gentoo 4.1.2 p1.3)


Thanks,
Peter
