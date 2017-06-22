From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 22 Jun 2017 08:19:43 +0300
Subject: [Buildroot] building new autotools-based package fails
In-Reply-To: <CAEyMn7ZBRZMOs7MNfAVzz3-PY7XgneNP8WOXt=_p3uk-Okjo7g@mail.gmail.com>
References: <CAEyMn7ZBRZMOs7MNfAVzz3-PY7XgneNP8WOXt=_p3uk-Okjo7g@mail.gmail.com>
Message-ID: <20170622051943.tx4vyvtzvheknr7u@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Heiko,

On Thu, Jun 22, 2017 at 06:56:35AM +0200, Heiko Thiery wrote:
> I want to add a new autotools based package. When building locally
> without buildroot autotools work (1.14). But when using buildroot
> (autotools 1.15) a warning is treated as error. I cannot find a way to
> make this package work. Does autotools 1.15 handle this kind of
> failure other than 1.14? Has anyone any idea or faced a similar issue?
> 
> freeopcua.mk
> #
> # freeopcua
> #
> ################################################################################
> 
> FREEOPCUA_VERSION = 18972fb8ad123d31f9900deb4b362428dd200979
> FREEOPCUA_SITE = $(call github,FreeOpcUa,freeopcua,$(FREEOPCUA_VERSION))
> FREEOPCUA_AUTORECONF = YES
> 
> $(eval $(autotools-package))
> 
> OUTPUT:
> 
> >>> freeopcua 18972fb8ad123d31f9900deb4b362428dd200979 Autoreconfiguring
> cd /home/hthiery/sources/beaglebone/out/build/freeopcua-18972fb8ad123d31f9900deb4b362428dd200979/
> &&  PATH="/home/hthiery/sources/beaglebone/out/host/bin:/home/hthiery/sources/beaglebone/out/host/sbin:/home/hthiery/sources/beaglebone/out/host/usr/bin:/home/hthiery/sources/beaglebone/out/host/usr/sbin:/home/hthiery/.local/bin:/home/hthiery/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games"
> PKG_CONFIG="/home/hthiery/sources/beaglebone/out/host/usr/bin/pkg-config"
> PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1
> PKG_CONFIG_ALLOW_SYSTEM_LIBS=1
> PKG_CONFIG_LIBDIR="/home/hthiery/sources/beaglebone/out/host/usr/lib/pkgconfig:/home/hthiery/sources/beaglebone/out/host/usr/share/pkgconfig"
> AR="/usr/bin/ar" AS="/usr/bin/as" LD="/usr/bin/ld" NM="/usr/bin/nm"
> CC="/usr/bin/gcc" GCC="/usr/bin/gcc" CXX="/usr/bin/g++"
> CPP="/usr/bin/cpp" OBJCOPY="/usr/bin/objcopy" RANLIB="/usr/bin/ranlib"
> CPPFLAGS="-I/home/hthiery/sources/beaglebone/out/host/usr/include"
> CFLAGS="-O2 -I/home/hthiery/sources/beaglebone/out/host/usr/include"
> CXXFLAGS="-O2 -I/home/hthiery/sources/beaglebone/out/host/usr/include"
> LDFLAGS="-L/home/hthiery/sources/beaglebone/out/host/lib
> -L/home/hthiery/sources/beaglebone/out/host/usr/lib
> -Wl,-rpath,/home/hthiery/sources/beaglebone/out/host/usr/lib"
> INTLTOOL_PERL=/usr/bin/perl
> ACLOCAL="/home/hthiery/sources/beaglebone/out/host/usr/bin/aclocal -I
> /home/hthiery/sources/beaglebone/out/host/usr/i586-buildroot-linux-uclibc/sysroot/usr/share/aclocal"
> AUTOCONF="/home/hthiery/sources/beaglebone/out/host/usr/bin/autoconf"
> AUTOHEADER="/home/hthiery/sources/beaglebone/out/host/usr/bin/autoheader"
> AUTOMAKE="/home/hthiery/sources/beaglebone/out/host/usr/bin/automake"
> AUTOPOINT=/bin/true
> /home/hthiery/sources/beaglebone/out/host/usr/bin/autoreconf -f -i -I
> "/home/hthiery/sources/beaglebone/out/host/usr/i586-buildroot-linux-uclibc/sysroot/usr/share/aclocal"
> -I "/home/hthiery/sources/beaglebone/out/host/usr/share/aclocal"
> aclocal: error: couldn't open directory 'm4': Datei oder Verzeichnis
> nicht gefunden

Maybe adding 'mkdir $(@D)/m4' would help. See package/libgpiod/libgpiod.mk, 
for example.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
