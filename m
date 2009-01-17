From: Shinya Kuribayashi <skuribay@ruby.dti.ne.jp>
Date: Sun, 18 Jan 2009 00:37:30 +0900
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
In-Reply-To: <20090116141347.DD52277567@busybox.osuosl.org>
References: <20090116141347.DD52277567@busybox.osuosl.org>
Message-ID: <4971FB3A.4050904@ruby.dti.ne.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

jacmet at uclibc.org wrote:
> Author: jacmet
> Date: 2009-01-16 14:13:46 +0000 (Fri, 16 Jan 2009)
> New Revision: 24880
> 
> Log:
> toolchain/gcc: default to 4.3.2 for !AVR32
> 
> Modified:
>    trunk/buildroot/toolchain/gcc/Config.in
> 
> 
> Changeset:
> Modified: trunk/buildroot/toolchain/gcc/Config.in
> ===================================================================
> --- trunk/buildroot/toolchain/gcc/Config.in	2009-01-16 13:56:23 UTC (rev 24879)
> +++ trunk/buildroot/toolchain/gcc/Config.in	2009-01-16 14:13:46 UTC (rev 24880)
> @@ -4,7 +4,7 @@
>  
>  choice
>  	prompt "GCC compiler Version"
> -	default BR2_GCC_VERSION_4_2_4 if !BR2_avr32
> +	default BR2_GCC_VERSION_4_3_2 if !BR2_avr32
>  	default BR2_GCC_VERSION_4_2_3 if BR2_avr32
>  	help
>  	  Select the version of gcc you wish to use.

GCC 4.3.2 bootstrap failed;  mips, mips4 and o32 on Ubuntu 8.04.01.

skuribay at ubuntu:buildroot.git$ make

Checking build system dependencies:
BUILDROOT_DL_DIR clean:                         Ok
CC clean:                                       Ok
CXX clean:                                      Ok
CPP clean:                                      Ok
CFLAGS clean:                                   Ok
INCLUDES clean:                                 Ok
CXXFLAGS clean:                                 Ok
which installed:                                Ok
sed works:                                      Ok (/bin/sed)
GNU make version '3.81':                        Ok
C compiler '/usr/bin/gcc'
C compiler version '4.2.4':                     Ok
C++ compiler '/usr/bin/g++'
C++ compiler version '4.2.4':                   Ok
awk installed:                                  Ok
bash installed:                                 Ok
bison installed:                                Ok
flex installed:                                 Ok
gettext installed:                              Ok
makeinfo installed:                             Ok
Build system dependencies:                      Ok

rm -rf /home/skuribay/git/buildroot.git/project_build_mips/uclibc/buildroot-config
mkdir -p /home/skuribay/git/buildroot.git/project_build_mips/uclibc
cp -dpRf package/config/buildroot-config /home/skuribay/git/buildroot.git/project_build_mips/uclibc/buildroot-config
# gcc >= 4.3.0 have to also build all-target-libgcc
/usr/bin/make -j1 -C /home/skuribay/git/buildroot.git/toolchain_build_mips/gcc-4.3.2-initial all-gcc all-target-libgcc
make[1]: Entering directory `/home/skuribay/git/buildroot.git/toolchain_build_mips/gcc-4.3.2-initial'
make[2]: Entering directory `/home/skuribay/git/buildroot.git/toolchain_build_mips/gcc-4.3.2-initial/libiberty'
make[3]: Entering directory `/home/skuribay/git/buildroot.git/toolchain_build_mips/gcc-4.3.2-initial/libiberty/testsuite'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory `/home/skuribay/git/buildroot.git/toolchain_build_mips/gcc-4.3.2-initial/libiberty/testsuite'
make[2]: Leaving directory `/home/skuribay/git/buildroot.git/toolchain_build_mips/gcc-4.3.2-initial/libiberty'
make[2]: Entering directory `/home/skuribay/git/buildroot.git/toolchain_build_mips/gcc-4.3.2-initial/intl'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/home/skuribay/git/buildroot.git/toolchain_build_mips/gcc-4.3.2-initial/intl'
make[2]: Entering directory `/home/skuribay/git/buildroot.git/toolchain_build_mips/gcc-4.3.2-initial/build-i386-pc-linux-gnu/libiberty'
make[3]: Entering directory `/home/skuribay/git/buildroot.git/toolchain_build_mips/gcc-4.3.2-initial/build-i386-pc-linux-gnu/libiberty/testsuite'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory `/home/skuribay/git/buildroot.git/toolchain_build_mips/gcc-4.3.2-initial/build-i386-pc-linux-gnu/libiberty/testsuite'
make[2]: Leaving directory `/home/skuribay/git/buildroot.git/toolchain_build_mips/gcc-4.3.2-initial/build-i386-pc-linux-gnu/libiberty'
make[2]: Entering directory `/home/skuribay/git/buildroot.git/toolchain_build_mips/gcc-4.3.2-initial/build-i386-pc-linux-gnu/fixincludes'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/home/skuribay/git/buildroot.git/toolchain_build_mips/gcc-4.3.2-initial/build-i386-pc-linux-gnu/fixincludes'
make[2]: Entering directory `/home/skuribay/git/buildroot.git/toolchain_build_mips/gcc-4.3.2-initial/libcpp'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/home/skuribay/git/buildroot.git/toolchain_build_mips/gcc-4.3.2-initial/libcpp'
make[2]: Entering directory `/home/skuribay/git/buildroot.git/toolchain_build_mips/gcc-4.3.2-initial/libdecnumber'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/home/skuribay/git/buildroot.git/toolchain_build_mips/gcc-4.3.2-initial/libdecnumber'
make[2]: Entering directory `/home/skuribay/git/buildroot.git/toolchain_build_mips/gcc-4.3.2-initial/fixincludes'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/home/skuribay/git/buildroot.git/toolchain_build_mips/gcc-4.3.2-initial/fixincludes'
make[2]: Entering directory `/home/skuribay/git/buildroot.git/toolchain_build_mips/gcc-4.3.2-initial/gcc'
make[2]: Leaving directory `/home/skuribay/git/buildroot.git/toolchain_build_mips/gcc-4.3.2-initial/gcc'
Checking multilib configuration for libgcc...
Configuring in mips-linux-uclibc/libgcc
configure: error: cannot compute suffix of object files: cannot compile
See `config.log' for more details.
make[1]: *** [configure-target-libgcc] Error 1
make[1]: Leaving directory `/home/skuribay/git/buildroot.git/toolchain_build_mips/gcc-4.3.2-initial'
make: *** [/home/skuribay/git/buildroot.git/toolchain_build_mips/gcc-4.3.2-initial/.compiled] Error 2
skuribay at ubuntu:buildroot.git$


I happend to find a similar report with my condition[1], but this 4.3.2
bootstrap failure is frequently seen with GCC 4.3 as far as I googled.

Just let you know, thank you.

  Shinya

[1] http://gcc.gnu.org/bugzilla/show_bug.cgi?id=38035
