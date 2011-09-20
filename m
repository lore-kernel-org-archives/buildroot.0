From: Rishi <rishid+mailman@gmail.com>
Date: Tue, 20 Sep 2011 12:53:29 -0400
Subject: [Buildroot] Building hangs on a RHEL 6 machine
In-Reply-To: <20110920173828.47621a60@skate>
References: <CAJbs9BHXcxhVOCoSKFykn1TEXw=DeJCRPExkNy94h-DPOUVm+g@mail.gmail.com>
 <CAJbs9BHpm3Tm-0eEA1gH-qqZf1WSnt7ny=tDuPOROocBGFLMgw@mail.gmail.com>
 <20110920173521.498d8647@skate> <20110920173828.47621a60@skate>
Message-ID: <CAJbs9BEpTofqb7=40SLkPtKdk4-UpheJ3ph+S-LoqYzrQqqeXQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I will try it with CentOS 6 tonight.  Here is the ps auxf output, if this
helps at all.


user  28955 13.8  0.2  13668 10432 pts/1    S    12:37   0:01
 \_ make V=1
user  29133  0.7  0.0   5268  1980 pts/1    S    12:37   0:00              |
  \_ /usr/bin/make -j2 -C
/home/user/workarea/buildroot/output/toolchain/gcc-4.4.6-initial all-gcc
user  29135  0.0  0.0   5048  1364 pts/1    S    12:37   0:00              |
      \_ /bin/sh -c r=`${PWDCMD-pwd}`; export r; \?s=`cd
/home/user/workarea/buildroot/output/toolchain/gcc-4.4.6; ${PWDCMD-pwd}`;
export s; \?test ! -f ./libiberty/Makefile || exit 0; \?/bin/sh
/home/user/workarea/buildroot/output/toolchain/gcc-4.4.6/mkinstalldirs
./libiberty ; \?FLEX="flex"; export FLEX; LEX="flex"; export LEX;
BISON="bison"; export BISON; YACC="bison -y"; export YACC; M4="m4"; export
M4; MAKEINFO="makeinfo"; export MAKEINFO; CC="/usr/bin/gcc"; export CC;
ADA_CFLAGS=""; export ADA_CFLAGS; CFLAGS="-O2
-I/home/user/workarea/buildroot/output/host/include
-I/home/user/workarea/buildroot/output/host/usr/include"; export CFLAGS;
CONFIG_SHELL="/bin/sh"; export CONFIG_SHELL; CXX="/usr/bin/g++"; export CXX;
CXXFLAGS="-I/home/user/workarea/buildroot/output/host/include
-I/home/user/workarea/buildroot/output/host/usr/include"; export CXXFLAGS;
AR="/usr/bin/ar"; export AR; AS="/usr/bin/as"; export AS;
CC_FOR_BUILD="/usr/bin/gcc"; export CC_FOR_BUILD; DLLTOOL="dlltool"; export
DLLTOOL; LD="/usr/bin/ld"; export LD;
LDFLAGS="-L/home/user/workarea/buildroot/output/host/lib
-L/home/user/workarea/buildroot/output/host/usr/lib
-Wl,-rpath,/home/user/workarea/buildroot/output/host/usr/lib"; export
LDFLAGS; NM="/usr/bin/nm"; export NM; RANLIB="ranlib"; export RANLIB;
WINDRES="windres"; export WINDRES; WINDMC="windmc"; export WINDMC;
OBJCOPY=""; export OBJCOPY; OBJDUMP="objdump"; export OBJDUMP;
AR_FOR_TARGET="/home/user/workarea/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/bin/ar";
export AR_FOR_TARGET;
AS_FOR_TARGET="/home/user/workarea/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/bin/as";
export AS_FOR_TARGET; GCC_FOR_TARGET=" $r/./gcc/xgcc -B$r/./gcc/
-B/home/user/workarea/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/bin/
-B/home/user/workarea/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/lib/
-isystem
/home/user/workarea/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/include
-isystem
/home/user/workarea/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sys-include";
export GCC_FOR_TARGET;
LD_FOR_TARGET="/home/user/workarea/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/bin/ld";
export LD_FOR_TARGET;
NM_FOR_TARGET="/home/user/workarea/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/bin/nm";
export NM_FOR_TARGET;
OBJDUMP_FOR_TARGET="/home/user/workarea/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/bin/objdump";
export OBJDUMP_FOR_TARGET;
RANLIB_FOR_TARGET="/home/user/workarea/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/bin/ranlib";
export RANLIB_FOR_TARGET;
TOPLEVEL_CONFIGURE_ARGUMENTS="/home/user/workarea/buildroot/output/toolchain/gcc-4.4.6/configure
--prefix=/home/user/workarea/buildroot/output/host/usr
--build=i686-pc-linux-gnu --host=i686-pc-linux-gnu
--target=arm-unknown-linux-uclibcgnueabi --enable-languages=c
--with-sysroot=/home/user/workarea/buildroot/output/toolchain/uClibc_dev/
--disable-__cxa_atexit --enable-target-optspace --disable-libquadmath
--disable-libgomp --with-gnu-ld --disable-shared --disable-libssp
--without-headers --with-newlib --disable-multilib --enable-tls
--with-gmp=/home/user/workarea/buildroot/output/host/usr
--with-mpfr=/home/user/workarea/buildroot/output/host/usr --disable-nls
--enable-threads --disable-decimal-float --with-float=soft
--with-abi=aapcs-linux --with-arch=armv6j --with-tune=arm1136jf-s
--with-pkgversion='Buildroot 2011.11-git-00081-g25c117f' --with-bugurl=
http://bugs.buildroot.net/"; export TOPLEVEL_CONFIGURE_ARGUMENTS;
GMPLIBS="-L/home/user/workarea/buildroot/output/host/usr/lib
-L/home/user/workarea/buildroot/output/host/usr/lib -lmpfr -lgmp"; export
GMPLIBS; GMPINC="-I/home/user/workarea/buildroot/output/host/usr/include
-I/home/user/
user  29150  0.5  0.0   5100  1416 pts/1    S    12:37   0:00              |
          \_ /bin/sh
/home/user/workarea/buildroot/output/toolchain/gcc-4.4.6/libiberty/configure
--cache-file=./config.cache
--prefix=/home/user/workarea/buildroot/output/host/usr
--with-sysroot=/home/user/workarea/buildroot/output/toolchain/uClibc_dev/
--disable-__cxa_atexit --enable-target-optspace --disable-libquadmath
--disable-libgomp --with-gnu-ld --disable-shared --disable-libssp
--without-headers --with-newlib --disable-multilib --enable-tls
--with-gmp=/home/user/workarea/buildroot/output/host/usr
--with-mpfr=/home/user/workarea/buildroot/output/host/usr --disable-nls
--enable-threads --disable-decimal-float --with-float=soft
--with-abi=aapcs-linux --with-arch=armv6j --with-tune=arm1136jf-s
--with-pkgversion=Buildroot 2011.11-git-00081-g25c117f --with-bugurl=
http://bugs.buildroot.net/ --enable-languages=c
--program-transform-name=s,^,arm-unknown-linux-uclibcgnueabi-,
--build=i686-pc-linux-gnu --host=i686-pc-linux-gnu
--target=arm-unknown-linux-uclibcgnueabi
--srcdir=/home/user/workarea/buildroot/output/toolchain/gcc-4.4.6/libiberty
user  29507  0.2  0.1  10388  5864 pts/1    S    12:37   0:00              |
              \_ /bin/sh
/home/user/workarea/buildroot/output/toolchain/gcc-4.4.6/libiberty/configure
--cache-file=./config.cache
--prefix=/home/user/workarea/buildroot/output/host/usr
--with-sysroot=/home/user/workarea/buildroot/output/toolchain/uClibc_dev/
--disable-__cxa_atexit --enable-target-optspace --disable-libquadmath
--disable-libgomp --with-gnu-ld --disable-shared --disable-libssp
--without-headers --with-newlib --disable-multilib --enable-tls
--with-gmp=/home/user/workarea/buildroot/output/host/usr
--with-mpfr=/home/user/workarea/buildroot/output/host/usr --disable-nls
--enable-threads --disable-decimal-float --with-float=soft
--with-abi=aapcs-linux --with-arch=armv6j --with-tune=arm1136jf-s
--with-pkgversion=Buildroot 2011.11-git-00081-g25c117f --with-bugurl=
http://bugs.buildroot.net/ --enable-languages=c
--program-transform-name=s,^,arm-unknown-linux-uclibcgnueabi-,
--build=i686-pc-linux-gnu --host=i686-pc-linux-gnu
--target=arm-unknown-linux-uclibcgnueabi
--srcdir=/home/user/workarea/buildroot/output/toolchain/gcc-4.4.6/libiberty
user  29530  0.0  0.0   5100   632 pts/1    S    12:38   0:00              |
                  \_ /bin/sh
/home/user/workarea/buildroot/output/toolchain/gcc-4.4.6/libiberty/configure
--cache-file=./config.cache
--prefix=/home/user/workarea/buildroot/output/host/usr
--with-sysroot=/home/user/workarea/buildroot/output/toolchain/uClibc_dev/
--disable-__cxa_atexit --enable-target-optspace --disable-libquadmath
--disable-libgomp --with-gnu-ld --disable-shared --disable-libssp
--without-headers --with-newlib --disable-multilib --enable-tls
--with-gmp=/home/user/workarea/buildroot/output/host/usr
--with-mpfr=/home/user/workarea/buildroot/output/host/usr --disable-nls
--enable-threads --disable-decimal-float --with-float=soft
--with-abi=aapcs-linux --with-arch=armv6j --with-tune=arm1136jf-s
--with-pkgversion=Buildroot 2011.11-git-00081-g25c117f --with-bugurl=
http://bugs.buildroot.net/ --enable-languages=c
--program-transform-name=s,^,arm-unknown-linux-uclibcgnueabi-,
--build=i686-pc-linux-gnu --host=i686-pc-linux-gnu
--target=arm-unknown-linux-uclibcgnueabi
--srcdir=/home/user/workarea/buildroot/output/toolchain/gcc-4.4.6/libiberty
user  29531  0.3  0.0   3100  1340 pts/1    S    12:38   0:00              |
                      \_ sh /tmp/hostinfo-copy-29531.sh
/nfs/adm/bin/hostinfo
user  29558 98.6  0.0   2528   836 pts/1    R    12:38   0:05              |
                          \_ /usr/bin/gawk -v width  -v opt  ??{???msg =
$0???if ((n = length(msg)) == 0)????print ""???while (n > 0) {????if (n <
width) {?????printf "%s%s", nl, msg?????msg = ""????}????else {?????i =
width?????while (substr(msg,i,1) != " ") {??????if (--i <=
0)???????break?????}?????if (i == 0) {??????printf "%s%s", nl, msg??????msg
= ""?????}?????else {??????while (substr(msg,i,1) == " ") {???????if (--i <=
0)????????break??????}??????printf "%s%s", nl, substr(msg,1,i++)??????while
(substr(msg,i,1) == " ") {???????if (++i > n)????????break??????}??????msg =
substr(msg,i)?????}????}????nl = "\n"????n = length(msg)???}??}??END {???if
(opt != "-n")????print ""??}??


On Tue, Sep 20, 2011 at 11:38 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Le Tue, 20 Sep 2011 17:35:21 +0200,
> Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :
>
> > I guess Redhat 6 is now publicly available, so we cannot reproduce the
>
>                       ^^^ not publicly available
>
> Sorry,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110920/6ee22980/attachment-0001.html>
