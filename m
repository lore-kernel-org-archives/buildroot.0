From: Ivan Wagner <ivan.wagner@gmail.com>
Date: Tue, 31 Dec 2013 16:23:08 +0100
Subject: [Buildroot] Unable to compile qt5base
Message-ID: <CA+hj=Mp9Y0ROZDd-zC0tKHa--vGYx_VmO9LAUuuj8xYD1N9OpA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear all,

I'm trying to compile qt5base by issuing the following command after
buildroot has been configured: make qt5base-config

I'm using Mentor Graphics' v. arm-2013.11.0.33 as an external toolchain.

For some reason I need to compile pkgconf and somehow I'm unable to
compile...

2013-12-31 16:11:32 (539 KB/s) -
`/home/ivan/projects/buildroot/dl/pkgconf-0.8.9.tar.bz2.tmp' saved
[80211/80211]

>>> host-pkgconf 0.8.9 Extracting
bzcat /home/ivan/projects/buildroot/dl/pkgconf-0.8.9.tar.bz2 | tar
--strip-components=1 -C
/home/ivan/projects/buildroot/output/build/host-pkgconf-0.8.9  -xf -
>>> host-pkgconf 0.8.9 Patching

Applying pkgconf-fix-variable.patch using patch:
patching file main.c
>>> host-pkgconf 0.8.9 Updating config.sub and config.guess
for file in config.guess config.sub; do for i in $(find
/home/ivan/projects/buildroot/output/build/host-pkgconf-0.8.9 -name $file);
do cp support/gnuconfig/$file $i; done; done
>>> host-pkgconf 0.8.9 Patching libtool
>>> host-pkgconf 0.8.9 Configuring
(cd /home/ivan/projects/buildroot/output/build/host-pkgconf-0.8.9/ && rm
-rf config.cache;
PATH=/home/ivan/projects/buildroot/output/host/bin:/home/ivan/projects/buildroot/output/host/usr/bin:/home/ivan/projects/git-repos/cakephp/lib/Cake/Console:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
AR="/usr/bin/ar" AS="/usr/bin/as" LD="/usr/bin/ld" NM="/usr/bin/nm"
CC="/home/ivan/projects/buildroot/output/host/usr/bin/ccache /usr/bin/gcc"
GCC="/home/ivan/projects/buildroot/output/host/usr/bin/ccache /usr/bin/gcc"
CXX="/home/ivan/projects/buildroot/output/host/usr/bin/ccache /usr/bin/g++"
CPP="/usr/bin/cpp" OBJCOPY="/usr/bin/objcopy" RANLIB="/usr/bin/ranlib"
CPPFLAGS="-I/home/ivan/projects/buildroot/output/host/usr/include"
CFLAGS="-O2 -I/home/ivan/projects/buildroot/output/host/usr/include"
CXXFLAGS="-O2 -I/home/ivan/projects/buildroot/output/host/usr/include"
LDFLAGS="-L/home/ivan/projects/buildroot/output/host/lib
-L/home/ivan/projects/buildroot/output/host/usr/lib
-Wl,-rpath,/home/ivan/projects/buildroot/output/host/usr/lib"
PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=1
PKG_CONFIG="/home/ivan/projects/buildroot/output/host/usr/bin/pkg-config"
PKG_CONFIG_SYSROOT_DIR="/"
PKG_CONFIG_LIBDIR="/home/ivan/projects/buildroot/output/host/usr/lib/pkgconfig:/home/ivan/projects/buildroot/output/host/usr/share/pkgconfig"
PERLLIB="/home/ivan/projects/buildroot/output/host/usr/lib/perl"
LD_LIBRARY_PATH="/home/ivan/projects/buildroot/output/host/usr/lib:"
CFLAGS="-O2 -I/home/ivan/projects/buildroot/output/host/usr/include"
LDFLAGS="-L/home/ivan/projects/buildroot/output/host/lib
-L/home/ivan/projects/buildroot/output/host/usr/lib
-Wl,-rpath,/home/ivan/projects/buildroot/output/host/usr/lib"  ./configure
--prefix="/home/ivan/projects/buildroot/output/host/usr"
--sysconfdir="/home/ivan/projects/buildroot/output/host/etc"
--enable-shared --disable-static --disable-gtk-doc --disable-doc
--disable-docs --disable-documentation --with-xmlto=no --with-fop=no   )
configure: WARNING: unrecognized options: --enable-shared,
--disable-static, --disable-gtk-doc, --disable-doc, --disable-docs,
--disable-documentation, --with-xmlto, --with-fop
checking for gcc...
/home/ivan/projects/buildroot/output/host/usr/bin/ccache /usr/bin/gcc
checking whether the C compiler works... no
configure: error: in
`/home/ivan/projects/buildroot/output/build/host-pkgconf-0.8.9':
configure: error: C compiler cannot create executables
See `config.log' for more details
make: ***
[/home/ivan/projects/buildroot/output/build/host-pkgconf-0.8.9/.stamp_configured]
Error 77

I don't understand why the C compiler is not working.

Thank you very much,

best regards,

Ivan
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131231/4b5403df/attachment.html>
