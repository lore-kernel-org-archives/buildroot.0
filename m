From: Hebbar <gururajakr@sanyo.co.in>
Date: Wed, 25 Jul 2007 01:35:54 -0700 (PDT)
Subject: [Buildroot] error building arm toolchain with latest snapshot-
 error says missing system headers
Message-ID: <11778512.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi All,

With "make world" i am getting this error. i was not getting this error with
previous buildroot version.

mv tmp-specs specs
echo |
/home/guru/project/original/toolchains/buildroot/toolchain_build_arm/gcc-4.2.0-initi./gcc/xgcc
-B/home/guru/project/original/toolchains/buildroot/toolchain_build_arm/gcc-4.2.0itial/./gcc/
-B/home/guru/project/original/toolchains/buildroot/build_arm/staging_dir/usr/alinux-uclibcgnueabi/bin/
-B/home/guru/project/original/toolchains/buildroot/build_arm/stagidir/usr/arm-linux-uclibcgnueabi/lib/
-isystem
/home/guru/project/original/toolchains/buildr/build_arm/staging_dir/usr/arm-linux-uclibcgnueabi/include
-isystem
/home/guru/project/origl/toolchains/buildroot/build_arm/staging_dir/usr/arm-linux-uclibcgnueabi/sys-include
-E -dM| \
          sed -n -e 's/^#define \([^_][a-zA-Z0-9_]*\).*/\1/p' \
                 -e 's/^#define \(_[^_A-Z][a-zA-Z0-9_]*\).*/\1/p' | \
          sort -u > tmp-macro_list
/bin/sh
/home/guru/project/original/toolchains/buildroot/toolchain_build_arm/gcc-4.2.0/gcc/move-if-change
tmp-macro_list macro_list
echo timestamp > s-macro_list
The directory that should contain system headers does not exist:
 
/home/guru/project/original/toolchains/buildroot/toolchain_build_arm/uClibc_dev//usr/incl
make[2]: *** [stmp-fixinc] Error 1
make[2]: Leaving directory
`/home/guru/project/original/toolchains/buildroot/toolchain_builrm/gcc-4.2.0-initial/gcc'
make[1]: *** [all-gcc] Error 2
make[1]: Leaving directory
`/home/guru/project/original/toolchains/buildroot/toolchain_builrm/gcc-4.2.0-initial'
make: ***
[/home/guru/project/original/toolchains/buildroot/toolchain_build_arm/gcc-4.2.0-iial/.compiled]
Error 2


Using latest Buildroot-snapshot version for building arm toolchain with eabi
feature with buildroot toolchain

Regards
Gururaja
-- 
View this message in context: http://www.nabble.com/error-building-arm-toolchain-with-latest-snapshot--error-says-missing-system-headers-tf4140817.html#a11778512
Sent from the BuildRoot mailing list archive at Nabble.com.
