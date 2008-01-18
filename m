From: Andrey Kovalev <aka@pxe.ru>
Date: Fri, 18 Jan 2008 11:30:50 +0400
Subject: [Buildroot] make - Segmentation fault
Message-ID: <479055AA.7090402@pxe.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I use snapshot buildroot-20080117.tar.bz2 (the same results were with 
previous snapshots for at least one month). I've made only these changes 
to default configuration:
- check "Target options / Generic development system"
- check "Toolchain / Enable WCHAR support"
- set "Kernel type" to (none).

Then make. Then chroot to buildroot:

chroot project_build_i386/uclibc/root /bin/su -
[root at compiler ~]# cd tmp
[root at compiler tmp]# tar -xjf uClibc-0.9.29.tar.bz2
[root at compiler tmp]# cd uClibc-0.9.29
[root at compiler uClibc-0.9.29]# make clean
rm -f lib*/*.a ldso/*/*.a libpthread/*/*.a
rm -f include/fpu_control.h include/dl-osinfo.h include/hp-timing.h
make -C extra/locale locale_clean
rm -f ../../extra/locale/gen_collate ../../extra/locale/gen_wc8bit
../../extra/locale/gen_wctype ../../extra/locale/locale_data.c
../../extra/locale/{*.{o,os,txt},gen_locale,gen_ldc}
rm -f
../../extra/locale/{uClibc_locale_data,lt_defines,c8tables,wctables,locale_tables,locale_collate}.h 


make[1]: *** [locale_clean] Segmentation fault
make: *** [clean] Error 2


But in the same buildroot I succeed to compile linux kernel.
And make mrproper in kernel tree works too.

How can it be fixed?

-- 
Andrey
