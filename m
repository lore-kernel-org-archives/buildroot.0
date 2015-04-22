From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Apr 2015 09:34:52 +0200
Subject: [Buildroot] [PATCH 1/1] heimdal: needs host-flex and explicitly
 set -lpthread
In-Reply-To: <5537287A.9070505@gmail.com>
References: <1429466003-4595-1-git-send-email-bluemrp9@gmail.com>
 <20150420223532.5677fb5f@free-electrons.com>
 <5535AFDE.9060704@gmail.com>
 <20150421091153.54b44a73@free-electrons.com>
 <5537287A.9070505@gmail.com>
Message-ID: <20150422093452.082de610@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ryan Coe,

On Tue, 21 Apr 2015 21:50:02 -0700, Ryan Coe wrote:

> (cd 
> /home/ryan/devel/buildroot/buildroot-git/output/build/host-heimdal-1.5.3/ && 
> rm -rf config.cache; 
> PATH="/home/ryan/devel/buildroot/buildroot-git/output/host/bin:/home/ryan/devel/buildroot/buildroot-git/output/host/sbin:/home/ryan/devel/buildroot/buildroot-git/output/host/usr/bin:/home/ryan/devel/buildroot/buildroot-git/output/host/usr/sbin:/home/ryan/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games" 
> AR="/usr/bin/ar" AS="/usr/bin/as" LD="/usr/bin/ld" NM="/usr/bin/nm" 
> CC="/usr/bin/gcc" GCC="/usr/bin/gcc" CXX="/usr/bin/g++" 
> CPP="/usr/bin/cpp" OBJCOPY="/usr/bin/objcopy" RANLIB="/usr/bin/ranlib" 
> CPPFLAGS="-I/home/ryan/devel/buildroot/buildroot-git/output/host/usr/include" 
> CFLAGS="-O2 
> -I/home/ryan/devel/buildroot/buildroot-git/output/host/usr/include" 
> CXXFLAGS="-O2 
> -I/home/ryan/devel/buildroot/buildroot-git/output/host/usr/include" 
> LDFLAGS="-L/home/ryan/devel/buildroot/buildroot-git/output/host/lib 
> -L/home/ryan/devel/buildroot/buildroot-git/output/host/usr/lib 
> -Wl,-rpath,/home/ryan/devel/buildroot/buildroot-git/output/host/usr/lib" 
> PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 
> PKG_CONFIG="/home/ryan/devel/buildroot/buildroot-git/output/host/usr/bin/pkg-config" 
> PKG_CONFIG_SYSROOT_DIR="/" 
> PKG_CONFIG_LIBDIR="/home/ryan/devel/buildroot/buildroot-git/output/host/usr/lib/pkgconfig:/home/ryan/devel/buildroot/buildroot-git/output/host/usr/share/pkgconfig" 
> LD_LIBRARY_PATH="/home/ryan/devel/buildroot/buildroot-git/output/host/usr/lib" 
> INTLTOOL_PERL=/usr/bin/perl CFLAGS="-O2 
> -I/home/ryan/devel/buildroot/buildroot-git/output/host/usr/include" 
> LDFLAGS="-L/home/ryan/devel/buildroot/buildroot-git/output/host/lib 
> -L/home/ryan/devel/buildroot/buildroot-git/output/host/usr/lib 
> -Wl,-rpath,/home/ryan/devel/buildroot/buildroot-git/output/host/usr/lib" 
> MAKEINFO=true CONFIG_SITE=/dev/null ./configure 
> --prefix="/home/ryan/devel/buildroot/buildroot-git/output/host/usr" 
> --sysconfdir="/home/ryan/devel/buildroot/buildroot-git/output/host/etc" 
> --localstatedir="/home/ryan/devel/buildroot/buildroot-git/output/host/var" 
> --enable-shared --disable-static --disable-gtk-doc 
> --disable-gtk-doc-html --disable-doc --disable-docs 
> --disable-documentation --disable-debug --with-xmlto=no --with-fop=no 
> --disable-dependency-tracking  --with-x=no --disable-shared 

You don't have my patch applied here. There's still only --with-x=no,
and none of the other --without that my patch is adding.

Please test with the patch applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
