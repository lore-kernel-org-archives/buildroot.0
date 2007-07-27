From: Gururaja Hebbar K R <gururajakr@sanyo.co.in>
Date: Fri, 27 Jul 2007 05:59:59 +0530
Subject: [Buildroot] toolchain build failing after using latest buildroot
	snapshot of 250707
Message-ID: <C03A3C267DDF184EA523BBAB577BF924C22E5D@blrexsr1.slti.sanyo.co.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

I had no issues building ARM Little Indian Toolchain with earlier
Snapshots(with little exceptions of gettext & libxml). But after using
latest buildroot snapshot of 250707 i am getting error as 

"the directory that should contain system headers does not exist"
-->detailed error message at the end of mail

when doing make world. I searched the  net & found that its because of
fixinc problem when building crosscompiler. but i see that the patch is
already applied & i am not able to solve it.

kindly help me to correct the same.

I am using 

arm & arm926 eabi & buildroot toolchain
uClibc 0.9.29
gcc-4.2.0
gettext,libintl,libxml2,libsys,ncurses,busybox-1.6.1,freetype &
fontconfig --> all these are selected


Regards
Gururaja


<snip>

<snip>

<snip>

mv tmp-specs specs
echo |
/home/guru/project/original/toolchains/buildroot/toolchain_build_arm/gcc
-4.2.0-initi./gcc/xgcc
-B/home/guru/project/original/toolchains/buildroot/toolchain_build_arm/g
cc-4.2.0itial/./gcc/
-B/home/guru/project/original/toolchains/buildroot/build_arm/staging_dir
/usr/alinux-uclibcgnueabi/bin/
-B/home/guru/project/original/toolchains/buildroot/build_arm/stagidir/us
r/arm-linux-uclibcgnueabi/lib/
-isystem
/home/guru/project/original/toolchains/buildr/build_arm/staging_dir/usr/
arm-linux-uclibcgnueabi/include
-isystem
/home/guru/project/origl/toolchains/buildroot/build_arm/staging_dir/usr/
arm-linux-uclibcgnueabi/sys-include
-E -dM| \
          sed -n -e 's/^#define \([^_][a-zA-Z0-9_]*\).*/\1/p' \
                 -e 's/^#define \(_[^_A-Z][a-zA-Z0-9_]*\).*/\1/p' | \
          sort -u > tmp-macro_list
/bin/sh
/home/guru/project/original/toolchains/buildroot/toolchain_build_arm/gcc
-4.2.0/gcc/move-if-change
tmp-macro_list macro_list
echo timestamp > s-macro_list
The directory that should contain system headers does not exist:
 
/home/guru/project/original/toolchains/buildroot/toolchain_build_arm/uCl
ibc_dev//usr/incl
make[2]: *** [stmp-fixinc] Error 1
make[2]: Leaving directory
`/home/guru/project/original/toolchains/buildroot/toolchain_builrm/gcc-4
.2.0-initial/gcc'
make[1]: *** [all-gcc] Error 2
make[1]: Leaving directory
`/home/guru/project/original/toolchains/buildroot/toolchain_builrm/gcc-4
.2.0-initial'
make: ***
[/home/guru/project/original/toolchains/buildroot/toolchain_build_arm/gc
c-4.2.0-iial/.compiled]
Error 2
