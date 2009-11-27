From: Joachim Pihl <jpihl@nevion.com>
Date: Fri, 27 Nov 2009 19:09:27 +0100
Subject: [Buildroot] 2009.11-rc1 build failure
In-Reply-To: <87eink70bd.fsf@macbook.be.48ers.dk>
References: <op.u3z7srteyqa4qb@jap-lappis> <873a419x3e.fsf@macbook.be.48ers.dk>
	<op.u31nbqpqyqa4qb@jap-lappis.nevion.com>
	<87eink70bd.fsf@macbook.be.48ers.dk>
Message-ID: <op.u32fd1kwyqa4qb@jap-lappis>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 27 Nov 2009 11:02:14 +0100, Peter Korsgaard <jacmet@uclibc.org>
wrote:
> Argh, sorry - I have too many /tmp/.config* files :/
>
> Your fix is then to use the 2.6.27.x version instead of hardcoding
> 2.6.27.10 - That will make you use 2.6.27.39 which has the getline fix.
>
> Notice that your kernel headers version doesn't need to be the same as
> the kernel version you're using.

Noted. Tried punching in 2.6.27.x, that failed miserably, but 2.6.27.39
worked - all the way up to the next hiccup:

...
checking dynamic linker characteristics... GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
appending configuration tag "F77" to libtool
checking for arm-linux-gcc... (cached)
/home/jpihl/system_controller/buildroot-2009.11_rc1/output/staging/usr/bin/arm-linux-uclibcgnueabi-gcc
-Os -pipe -O3
-I/home/jpihl/system_controller/buildroot-2009.11_rc1/output/staging/usr/include
-I/home/jpihl/system_controller/buildroot-2009.11_rc1/output/staging/include
--sysroot=/home/jpihl/system_controller/buildroot-2009.11_rc1/output/staging/
-isysroot
/home/jpihl/system_controller/buildroot-2009.11_rc1/output/staging
-mtune=xscale -march=armv5te -mabi=aapcs-linux -msoft-float
checking whether we are using the GNU C compiler... (cached) yes
checking whether
/home/jpihl/system_controller/buildroot-2009.11_rc1/output/staging/usr/bin/arm-linux-uclibcgnueabi-gcc
-Os -pipe -O3
-I/home/jpihl/system_controller/buildroot-2009.11_rc1/output/staging/usr/include
-I/home/jpihl/system_controller/buildroot-2009.11_rc1/output/staging/include
--sysroot=/home/jpihl/system_controller/buildroot-2009.11_rc1/output/staging/
-isysroot
/home/jpihl/system_controller/buildroot-2009.11_rc1/output/staging
-mtune=xscale -march=armv5te -mabi=aapcs-linux -msoft-float accepts -g...
(cached) yes
checking for
/home/jpihl/system_controller/buildroot-2009.11_rc1/output/staging/usr/bin/arm-linux-uclibcgnueabi-gcc
-Os -pipe -O3
-I/home/jpihl/system_controller/buildroot-2009.11_rc1/output/staging/usr/include
-I/home/jpihl/system_controller/buildroot-2009.11_rc1/output/staging/include
--sysroot=/home/jpihl/system_controller/buildroot-2009.11_rc1/output/staging/
-isysroot
/home/jpihl/system_controller/buildroot-2009.11_rc1/output/staging
-mtune=xscale -march=armv5te -mabi=aapcs-linux -msoft-float option to
accept ISO C89... (cached) none needed
checking dependency style of
/home/jpihl/system_controller/buildroot-2009.11_rc1/output/staging/usr/bin/arm-linux-uclibcgnueabi-gcc
-Os -pipe -O3
-I/home/jpihl/system_controller/buildroot-2009.11_rc1/output/staging/usr/include
-I/home/jpihl/system_controller/buildroot-2009.11_rc1/output/staging/include
--sysroot=/home/jpihl/system_controller/buildroot-2009.11_rc1/output/staging/
-isysroot
/home/jpihl/system_controller/buildroot-2009.11_rc1/output/staging
-mtune=xscale -march=armv5te -mabi=aapcs-linux -msoft-float... (cached)
gcc3
checking how to run the C preprocessor...
/home/jpihl/system_controller/buildroot-2009.11_rc1/output/staging/usr/bin/arm-linux-uclibcgnueabi-cpp
-Os -pipe -O3
-I/home/jpihl/system_controller/buildroot-2009.11_rc1/output/staging/usr/include
-I/home/jpihl/system_controller/buildroot-2009.11_rc1/output/staging/include
--sysroot=/home/jpihl/system_controller/buildroot-2009.11_rc1/output/staging/
-isysroot
/home/jpihl/system_controller/buildroot-2009.11_rc1/output/staging
-mtune=xscale -march=armv5te -mabi=aapcs-linux -msoft-float
checking whether we are using the GNU C++ compiler... (cached) yes
checking whether
/home/jpihl/system_controller/buildroot-2009.11_rc1/output/staging/usr/bin/arm-linux-uclibcgnueabi-g++
-Os -pipe -O3
-I/home/jpihl/system_controller/buildroot-2009.11_rc1/output/staging/usr/include
-I/home/jpihl/system_controller/buildroot-2009.11_rc1/output/staging/include
--sysroot=/home/jpihl/system_controller/buildroot-2009.11_rc1/output/staging/
-isysroot
/home/jpihl/system_controller/buildroot-2009.11_rc1/output/staging
-mtune=xscale -march=armv5te -mabi=aapcs-linux -msoft-float accepts -g...
(cached) yes
checking dependency style of
/home/jpihl/system_controller/buildroot-2009.11_rc1/output/staging/usr/bin/arm-linux-uclibcgnueabi-g++
-Os -pipe -O3
-I/home/jpihl/system_controller/buildroot-2009.11_rc1/output/staging/usr/include
-I/home/jpihl/system_controller/buildroot-2009.11_rc1/output/staging/include
--sysroot=/home/jpihl/system_controller/buildroot-2009.11_rc1/output/staging/
-isysroot
/home/jpihl/system_controller/buildroot-2009.11_rc1/output/staging
-mtune=xscale -march=armv5te -mabi=aapcs-linux -msoft-float... (cached)
gcc3
checking for ld...
/home/jpihl/system_controller/buildroot-2009.11_rc1/output/staging/usr/bin/arm-linux-uclibcgnueabi-ld
checking for kernel OProfile support... yes
checking whether malloc attribute is understood... no
checking whether __builtin_expect is understood... yes
checking for sched_setaffinity... yes
checking for perfmonctl... no
checking for poptGetContext in -lpopt... yes
checking libiberty.h usability... yes
checking libiberty.h presence... yes
checking for libiberty.h... yes
checking for cplus_demangle in -liberty... yes
checking for xcalloc... yes
checking for xmemdup... yes
checking for dlopen in -ldl... yes
checking for main in -lintl... no
checking for bfd_openr in -lbfd... no
configure: error: bfd library not found
make: ***
[/home/jpihl/system_controller/buildroot-2009.11_rc1/output/build/oprofile-0.9.4/.stamp_configured]
Error 1


OProfile does not want to build, and a brief search in the config menus
didn't reveal any options containing "bfd". As far as I could tell from
the OProfile pages, it should work for the PXA processors?

-- 
Using Opera's revolutionary e-mail client: http://www.opera.com/mail/
