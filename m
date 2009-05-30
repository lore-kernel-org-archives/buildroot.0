From: Peter Weichai <peterweichai@yahoo.com>
Date: Fri, 29 May 2009 20:50:34 -0700 (PDT)
Subject: [Buildroot]  202: Illegal number: gcc
Message-ID: <982805.89309.qm@web111913.mail.gq1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I tried with buildroot-2009.02, now all the dependencies looks good but it ended with another gcc internal problem. Any idea? What is the recommended buildroot version to use?

Thanks

---------------------------------------------------------------------------------------------------------

Checking build system dependencies:
BUILDROOT_DL_DIR clean:??? ??? ??? ??? Ok
CC clean:??? ??? ??? ??? ??? Ok
CXX clean:??? ??? ??? ??? ??? Ok
CPP clean:??? ??? ??? ??? ??? Ok
CFLAGS clean:??? ??? ??? ??? ??? Ok
INCLUDES clean:??? ??? ??? ??? ??? Ok
CXXFLAGS clean:??? ??? ??? ??? ??? Ok
which installed:??? ??? ??? ??? Ok
sed works:??? ??? ??? ??? ??? Ok (/bin/sed)
GNU make version '3.81':??? ??? ??? Ok
C compiler '/usr/bin/gcc'
C compiler version '4.3.2':??? ??? ??? Ok
C++ compiler '/usr/bin/g++'
C++ compiler version '4.3.2':??? ??? ??? Ok
awk installed:??? ??? ??? ??? ??? Ok
bash installed:??? ??? ??? ??? ??? Ok
bison installed:??? ??? ??? ??? Ok
flex installed:??? ??? ??? ??? ??? Ok
gettext installed:??? ??? ??? ??? Ok
makeinfo installed:??? ??? ??? ??? Ok
Build system dependencies:??? ??? ??? Ok

choonghooi at NASAEX1410213:~/lab/buildroot-2009.02$ make

Checking build system dependencies:
BUILDROOT_DL_DIR clean:??? ??? ??? ??? Ok
CC clean:??? ??? ??? ??? ??? Ok
CXX clean:??? ??? ??? ??? ??? Ok
CPP clean:??? ??? ??? ??? ??? Ok
CFLAGS clean:??? ??? ??? ??? ??? Ok
INCLUDES clean:??? ??? ??? ??? ??? Ok
CXXFLAGS clean:??? ??? ??? ??? ??? Ok
which installed:??? ??? ??? ??? Ok
sed works:??? ??? ??? ??? ??? Ok (/bin/sed)
GNU make version '3.81':??? ??? ??? Ok
C compiler '/usr/bin/gcc'
C compiler version '4.3.2':??? ??? ??? Ok
C++ compiler '/usr/bin/g++'
C++ compiler version '4.3.2':??? ??? ??? Ok
awk installed:??? ??? ??? ??? ??? Ok
bash installed:??? ??? ??? ??? ??? Ok
bison installed:??? ??? ??? ??? Ok
flex installed:??? ??? ??? ??? ??? Ok
gettext installed:??? ??? ??? ??? Ok
makeinfo installed:??? ??? ??? ??? Ok
Build system dependencies:??? ??? ??? Ok

rm -rf /home/choonghooi/lab/buildroot-2009.02/project_build_i686/uclibc/buildroot-config
mkdir -p /home/choonghooi/lab/buildroot-2009.02/project_build_i686/uclibc
cp -dpRf package/config/buildroot-config /home/choonghooi/lab/buildroot-2009.02/project_build_i686/uclibc/buildroot-config
# gcc >= 4.3.0 have to also build all-target-libgcc
/usr/bin/make -j1 -C /home/choonghooi/lab/buildroot-2009.02/toolchain_build_i686/gcc-4.3.2-initial all-gcc all-target-libgcc
make[1]: Entering directory `/home/choonghooi/lab/buildroot-2009.02/toolchain_build_i686/gcc-4.3.2-initial'
make[2]: Entering directory `/home/choonghooi/lab/buildroot-2009.02/toolchain_build_i686/gcc-4.3.2-initial/libiberty'
make[3]: Entering directory `/home/choonghooi/lab/buildroot-2009.02/toolchain_build_i686/gcc-4.3.2-initial/libiberty/testsuite'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory `/home/choonghooi/lab/buildroot-2009.02/toolchain_build_i686/gcc-4.3.2-initial/libiberty/testsuite'
make[2]: Leaving directory `/home/choonghooi/lab/buildroot-2009.02/toolchain_build_i686/gcc-4.3.2-initial/libiberty'
make[2]: Entering directory `/home/choonghooi/lab/buildroot-2009.02/toolchain_build_i686/gcc-4.3.2-initial/intl'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/home/choonghooi/lab/buildroot-2009.02/toolchain_build_i686/gcc-4.3.2-initial/intl'
make[2]: Entering directory `/home/choonghooi/lab/buildroot-2009.02/toolchain_build_i686/gcc-4.3.2-initial/build-i386-pc-linux-gnu/libiberty'
make[3]: Entering directory `/home/choonghooi/lab/buildroot-2009.02/toolchain_build_i686/gcc-4.3.2-initial/build-i386-pc-linux-gnu/libiberty/testsuite'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory `/home/choonghooi/lab/buildroot-2009.02/toolchain_build_i686/gcc-4.3.2-initial/build-i386-pc-linux-gnu/libiberty/testsuite'
make[2]: Leaving directory `/home/choonghooi/lab/buildroot-2009.02/toolchain_build_i686/gcc-4.3.2-initial/build-i386-pc-linux-gnu/libiberty'
make[2]: Entering directory `/home/choonghooi/lab/buildroot-2009.02/toolchain_build_i686/gcc-4.3.2-initial/build-i386-pc-linux-gnu/fixincludes'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/home/choonghooi/lab/buildroot-2009.02/toolchain_build_i686/gcc-4.3.2-initial/build-i386-pc-linux-gnu/fixincludes'
make[2]: Entering directory `/home/choonghooi/lab/buildroot-2009.02/toolchain_build_i686/gcc-4.3.2-initial/libcpp'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/home/choonghooi/lab/buildroot-2009.02/toolchain_build_i686/gcc-4.3.2-initial/libcpp'
make[2]: Entering directory `/home/choonghooi/lab/buildroot-2009.02/toolchain_build_i686/gcc-4.3.2-initial/libdecnumber'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/home/choonghooi/lab/buildroot-2009.02/toolchain_build_i686/gcc-4.3.2-initial/libdecnumber'
make[2]: Entering directory `/home/choonghooi/lab/buildroot-2009.02/toolchain_build_i686/gcc-4.3.2-initial/fixincludes'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/home/choonghooi/lab/buildroot-2009.02/toolchain_build_i686/gcc-4.3.2-initial/fixincludes'
make[2]: Entering directory `/home/choonghooi/lab/buildroot-2009.02/toolchain_build_i686/gcc-4.3.2-initial/gcc'
/usr/bin/gcc? -c?? -g -O2 -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE? -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros ??? ??? ??? ??? ???? -Wno-overlength-strings??? -DHAVE_CONFIG_H -I. -I. -I/home/choonghooi/lab/buildroot-2009.02/toolchain_build_i686/gcc-4.3.2/gcc -I/home/choonghooi/lab/buildroot-2009.02/toolchain_build_i686/gcc-4.3.2/gcc/. -I/home/choonghooi/lab/buildroot-2009.02/toolchain_build_i686/gcc-4.3.2/gcc/../include -I/home/choonghooi/lab/buildroot-2009.02/toolchain_build_i686/gcc-4.3.2/gcc/../libcpp/include -I/home/choonghooi/lab/buildroot-2009.02/toolchain_build_i686/gmp/include -I/home/choonghooi/lab/buildroot-2009.02/toolchain_build_i686/mpfr/include -I/home/choonghooi/lab/buildroot-2009.02/toolchain_build_i686/gcc-4.3.2/gcc/../libdecnumber
 -I/home/choonghooi/lab/buildroot-2009.02/toolchain_build_i686/gcc-4.3.2/gcc/../libdecnumber/dpd -I../libdecnumber??? insn-attrtab.c -o insn-attrtab.o
gcc: Internal error: Killed (program cc1)
Please submit a full bug report.
See <file:///usr/share/doc/gcc-4.3/README.Bugs> for instructions.
make[2]: *** [insn-attrtab.o] Error 1
make[2]: Leaving directory `/home/choonghooi/lab/buildroot-2009.02/toolchain_build_i686/gcc-4.3.2-initial/gcc'
make[1]: *** [all-gcc] Error 2


--- On Sat, 5/30/09, Peter Weichai <peterweichai@yahoo.com> wrote:

From: Peter Weichai <peterweichai@yahoo.com>
Subject: [Buildroot] 202: Illegal number: gcc
To: "Peter Korsgaard" <jacmet@uclibc.org>
Cc: buildroot at busybox.net, "Adam McLaurin" <buildroot@irotas.net>
Date: Saturday, May 30, 2009, 12:19 AM

Hi,

gcc -v
Using built-in specs.
Target: i486-linux-gnu
Configured with: ../src/configure -v --with-pkgversion='Ubuntu 4.3.2-1ubuntu12' --with-bugurl=file:///usr/share/doc/gcc-4.3/README.Bugs --enable-languages=c,c++,fortran,objc,obj-c++ --prefix=/usr --enable-shared --with-system-zlib --libexecdir=/usr/lib --without-included-gettext --enable-threads=posix --enable-nls --with-gxx-include-dir=/usr/include/c++/4.3 --program-suffix=-4.3 --enable-clocale=gnu --enable-libstdcxx-debug --enable-objc-gc --enable-mpfr --enable-targets=all --enable-checking=release --build=i486-linux-gnu --host=i486-linux-gnu --target=i486-linux-gnu
Thread model: posix
gcc version 4.3.2 (Ubuntu 4.3.2-1ubuntu12) 


?g++ -v
Using built-in specs.
Target: i486-linux-gnu
Configured with: ../src/configure -v --with-pkgversion='Ubuntu
 4.3.2-1ubuntu12' --with-bugurl=file:///usr/share/doc/gcc-4.3/README.Bugs --enable-languages=c,c++,fortran,objc,obj-c++ --prefix=/usr --enable-shared --with-system-zlib --libexecdir=/usr/lib --without-included-gettext --enable-threads=posix --enable-nls --with-gxx-include-dir=/usr/include/c++/4.3 --program-suffix=-4.3 --enable-clocale=gnu --enable-libstdcxx-debug --enable-objc-gc --enable-mpfr --enable-targets=all --enable-checking=release --build=i486-linux-gnu --host=i486-linux-gnu --target=i486-linux-gnu
Thread model: posix
gcc version 4.3.2 (Ubuntu 4.3.2-1ubuntu12)

Thanks.

--- On Fri, 5/29/09, Adam McLaurin <buildroot@irotas.net> wrote:

From: Adam McLaurin <buildroot@irotas.net>
Subject: Re: [Buildroot] 202: Illegal number: gcc
To: "Peter Korsgaard" <jacmet@uclibc.org>
Cc: "Peter
 Weichai" <peterweichai@yahoo.com>, buildroot at busybox.net
Date: Friday, May 29, 2009, 11:48 PM

On Fri, 29 May 2009 19:53 +0200, "Peter Korsgaard" <jacmet@uclibc.org>
wrote:
> Ok, what does gcc --version and g++ --version return?

-$ g++ -v
Using built-in specs.
Target: i486-linux-gnu
Configured with: ../src/configure -v --with-pkgversion='Ubuntu
4.3.2-1ubuntu12' --with-bugurl=file:///usr/share/doc/gcc-4.3/README.Bugs
--enable-languages=c,c++,fortran,objc,obj-c++ --prefix=/usr
--enable-shared --with-system-zlib --libexecdir=/usr/lib
--without-included-gettext --enable-threads=posix --enable-nls
--with-gxx-include-dir=/usr/include/c++/4.3 --program-suffix=-4.3
--enable-clocale=gnu --enable-libstdcxx-debug --enable-objc-gc
--enable-mpfr --enable-targets=all
 --enable-checking=release
--build=i486-linux-gnu --host=i486-linux-gnu --target=i486-linux-gnu
Thread model: posix
gcc version 4.3.2 (Ubuntu 4.3.2-1ubuntu12) 

-$ gcc -v
Using built-in specs.
Target: i486-linux-gnu
Configured with: ../src/configure -v --with-pkgversion='Ubuntu
4.3.2-1ubuntu12' --with-bugurl=file:///usr/share/doc/gcc-4.3/README.Bugs
--enable-languages=c,c++,fortran,objc,obj-c++ --prefix=/usr
--enable-shared --with-system-zlib --libexecdir=/usr/lib
--without-included-gettext --enable-threads=posix --enable-nls
--with-gxx-include-dir=/usr/include/c++/4.3 --program-suffix=-4.3
--enable-clocale=gnu --enable-libstdcxx-debug --enable-objc-gc
--enable-mpfr --enable-targets=all --enable-checking=release
--build=i486-linux-gnu --host=i486-linux-gnu --target=i486-linux-gnu
Thread model: posix
gcc version 4.3.2 (Ubuntu 4.3.2-1ubuntu12) 





      


      
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090529/34fb0129/attachment-0001.htm>
