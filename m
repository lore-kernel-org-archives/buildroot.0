From: Faisal Mehmood <f.m3hm00d@gmail.com>
Date: Wed, 5 Sep 2018 10:51:26 +0000
Subject: [Buildroot] Fwd: Beginner help: Compilation errors for bison,
 ncurses and arm-buildroot-linux-uclibcgnueabihf
In-Reply-To: <2e07e3d7-26f8-3ae2-1f19-26f60210cb36@mind.be>
References: <CAL8qis=5F5kDuMjpsZJZLbnAkFKBVaH_V1CcV6uuK5Lu1ooPAw@mail.gmail.com>
 <20180904102005.1d63cc85@windsurf>
 <CAL8qisnsRCYbC5+x8GAT+wZ_qiB=6EGBUVkK=GRk0JHy-T4ifA@mail.gmail.com>
 <CAL8qisnNqN9Mn1wM2FiMmgs3phgke4RF4xNCxprm3s-i4VAkqw@mail.gmail.com>
 <2e07e3d7-26f8-3ae2-1f19-26f60210cb36@mind.be>
Message-ID: <CAL8qiskVCBMOhxXd9inWKqsUW1-j3F75W17OzoOPmeh3dHM0dg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Sep 4, 2018 at 8:18 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>  As Thomas mentioned, for some reason you don't seem to be able to build a
> shared library.
>
>  To debug this, could you re-run (without cleaning) with BR2_DEBUG_WRAPPER=1 in
> the environment? And also make it verbose, with V=1. And disable parallel build. So
>
> BR2_DEBUG_WRAPPER=1 make V=1 BR2_JLEVEL=1

Running this make on (uncleaned) Build Station 1, I got the same error
as before. No difference in output other than a bit more logs.

>
> [snip]
> >>  - Your Buildroot .config file
>
>  To make it smaller, you can run 'make savedefconfig' and include that in the mail.
>
>  But anyway, the interesting bit is
>
> BR2_RELRO_FULL=y
>
> Full relro is currently broken. See the bug report [1] and the patches to fix it
> [2].

Thanks for the very helpful input. I set BR2_RELRO_PARTIAL=y after
reading the bug report. Building clean on Build Station 1, it managed
to avoid the earlier errors. So that's a win. But at a later stage of
compilation I got a new error [7].

I set BR2_RELRO_NONE=y on Build Station 2. That build is under way.
I'll let you know the results.

Could someone suggest a recommended distro and buildroot version that
I could run without having to face these compilation errors?

Kind regards,
m3hm00d

######################7#7#7#7#7#7#7#7#7#7########################
>>> host-file 5.33 Building
PATH="/home/user/Downloads/buildroot-2018.08-rc3/output/host/bin:/home/kenobi/Downloads/buildroot-2018.08-rc3/output/host/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"
PKG_CONFIG="/home/user/Downloads/buildroot-2018.08-rc3/output/host/bin/pkg-config"
PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1
PKG_CONFIG_ALLOW_SYSTEM_LIBS=1
PKG_CONFIG_LIBDIR="/home/user/Downloads/buildroot-2018.08-rc3/output/host/lib/pkgconfig:/home/kenobi/Downloads/buildroot-2018.08-rc3/output/host/share/pkgconfig"
 /usr/bin/make -j9  -C
/home/user/Downloads/buildroot-2018.08-rc3/output/build/host-file-5.33/
make[1]: Entering directory
'/home/user/Downloads/buildroot-2018.08-rc3/output/build/host-file-5.33'
/usr/bin/make  all-recursive
make[2]: Entering directory
'/home/user/Downloads/buildroot-2018.08-rc3/output/build/host-file-5.33'
Making all in src
make[3]: Entering directory
'/home/user/Downloads/buildroot-2018.08-rc3/output/build/host-file-5.33/src'
sed -e "s/X.YY/$(echo 5.33 | tr -d .)/" < ../src/magic.h.in > magic.h
/usr/bin/make  all-am
make[4]: Entering directory
'/home/user/Downloads/buildroot-2018.08-rc3/output/build/host-file-5.33/src'
  CC       buffer.lo
  CC       apprentice.lo
  CC       magic.lo
  CC       softmagic.lo
  CC       ascmagic.lo
  CC       encoding.lo
  CC       compress.lo
  CC       is_tar.lo
  CC       readelf.lo
  CC       print.lo
  CC       fsmagic.lo
  CC       funcs.lo
  CC       apptype.lo
  CC       der.lo
  CC       cdf.lo
  CC       cdf_time.lo
  CC       readcdf.lo
readelf.c: In function 'donote':
readelf.c:1027:13: warning: 'nh64.n_type' may be used uninitialized in
this function [-Wmaybe-uninitialized]
  Elf64_Nhdr nh64;
             ^~~~
readelf.c:1026:13: warning: 'nh32.n_type' may be used uninitialized in
this function [-Wmaybe-uninitialized]
  Elf32_Nhdr nh32;
             ^~~~
  CC       strlcpy.lo
  CC       strlcat.lo
  CC       fmtcheck.lo
  CC       file.o
  CC       seccomp.o
  CCLD     libmagic.la
  CCLD     file
make[4]: Leaving directory
'/home/user/Downloads/buildroot-2018.08-rc3/output/build/host-file-5.33/src'
make[3]: Leaving directory
'/home/user/Downloads/buildroot-2018.08-rc3/output/build/host-file-5.33/src'
Making all in magic
make[3]: Entering directory
'/home/user/Downloads/buildroot-2018.08-rc3/output/build/host-file-5.33/magic'
../src/file -C -m magic
make[3]: *** [Makefile:764: magic.mgc] Bad system call
make[3]: Leaving directory
'/home/user/Downloads/buildroot-2018.08-rc3/output/build/host-file-5.33/magic'
make[2]: *** [Makefile:360: all-recursive] Error 1
make[2]: Leaving directory
'/home/user/Downloads/buildroot-2018.08-rc3/output/build/host-file-5.33'
make[1]: *** [Makefile:291: all] Error 2
make[1]: Leaving directory
'/home/user/Downloads/buildroot-2018.08-rc3/output/build/host-file-5.33'
make: *** [package/pkg-generic.mk:232:
/home/user/Downloads/buildroot-2018.08-rc3/output/build/host-file-5.33/.stamp_built]
Error 2
######################7#7#7#7#7#7#7#7#7#7########################
