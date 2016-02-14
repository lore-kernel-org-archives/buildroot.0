From: Johan Sagaert <sagaert.johan@proximus.be>
Date: Mon, 15 Feb 2016 00:26:56 +0100
Subject: [Buildroot] problem adding new package libcapn
In-Reply-To: <56C10733.8040706@proximus.be>
References: <56C10733.8040706@proximus.be>
Message-ID: <56C10D40.2060603@proximus.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Oops hit the send button before adding the log file.

Op 15/02/2016 om 0:01 schreef Johan Sagaert:
> Hi
>
> I am trying to add a new package libcapn
>
> from the README.md
>
> ## Installation
> ### on *nix
> __Requirements__
>
> - [CMake](http://cmake.org) >= 2.8.5
> - Clang 3 and later or GCC 4.6 and later
> - make
>
> __Build instructions__
>
> $ git clone https://github.com/adobkin/libcapn.git
> $ git submodule update --init
> $ mkdir build
> $ cd build
> $ cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ../
> $ make
> $ sudo make install
> ```
>
>
> 1) I am not sure how the git submodule update --init is handled in 
> buildroot.
>
> 2) Building yields this error:
>
> rm -f /home/buildroot12git/output/build/digital_io-TX28_V102/.stamp_built
> >>> libcapn 7a6dc662e9daa864f687 Configuring
> (mkdir -p 
> /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/ && cd 
> /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/ && rm 
> -f CMakeCache.txt && 
> PATH="/home/buildroot12git/output/host/bin:/home/buildroot12git/output/host/sbin:/home/buildroot12git/output/host/usr/bin:/home/buildroot12git/output/host/usr/sbin:/root/google-cloud-sdk/bin:/root/google-cloud-sdk/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/buildroot12git/output/build/host-cmake-3.0.2/bin" 
> /home/buildroot12git/output/host/usr/bin/cmake 
> /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/ 
> -DCMAKE_TOOLCHAIN_FILE="/home/buildroot12git/output/host/usr/share/buildroot/toolchainfile.cmake" 
> -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="/usr" 
> -DCMAKE_COLOR_MAKEFILE=OFF -DBUILD_DOC=OFF -DBUILD_DOCS=OFF 
> -DBUILD_EXAMPLE=OFF -DBUILD_EXAMPLES=OFF -DBUILD_TEST=OFF 
> -DBUILD_TESTS=OFF -DBUILD_TESTING=OFF -DBUILD_SHARED_LIBS=ON 
> -DUSE_CCACHE=OFF   )
> -- Looking for include file ctype.h
> -- Looking for include file ctype.h - found
> -- Looking for include file inttypes.h
> -- Looking for include file inttypes.h - found
> -- Looking for include file stdint.h
> -- Looking for include file stdint.h - found
> -- Looking for include file unistd.h
> -- Looking for include file unistd.h - found
> -- Looking for include file netinet/in.h
> -- Looking for include file netinet/in.h - found
> -- Looking for include file arpa/inet.h
> -- Looking for include file arpa/inet.h - found
> -- Looking for include file netdb.h
> -- Looking for include file netdb.h - found
> -- Looking for include file sys/fcntl.h
> -- Looking for include file sys/fcntl.h - found
> -- Looking for include file sys/socket.h
> -- Looking for include file sys/socket.h - found
> -- Looking for include file strings.h
> -- Looking for include file strings.h - found
> -- Looking for strerror_r
> -- Looking for strerror_r - found
> -- Performing test APN_HAVE_GLIBC_STRERROR_R
> CMake Error: TRY_RUN() invoked in cross-compiling mode, please set the 
> following cache variables appropriately:
>    APN_HAVE_GLIBC_STRERROR_R (advanced)
>    APN_HAVE_GLIBC_STRERROR_R__TRYRUN_OUTPUT (advanced)
> For details see 
> /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/TryRunResults.cmake
> -- Performing test APN_HAVE_GLIBC_STRERROR_R - Failed
> -- Performing test APN_HAVE_POSIX_STRERROR_R
> CMake Error: TRY_RUN() invoked in cross-compiling mode, please set the 
> following cache variables appropriately:
>    APN_HAVE_POSIX_STRERROR_R (advanced)
>    APN_HAVE_POSIX_STRERROR_R__TRYRUN_OUTPUT (advanced)
> For details see 
> /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/TryRunResults.cmake
> -- Performing test APN_HAVE_POSIX_STRERROR_R - Failed
> -- Found OpenSSL: 
> /home/buildroot12git/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libssl.so;/home/buildroot12git/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libcrypto.so 
> (found version "1.0.2c")
> CMake Error at 
> /home/buildroot12git/output/host/usr/share/cmake-3.1/Modules/ExternalProject.cmake:1584 
> (message):
>   error: no download info for 'jansson' -- please specify 
> existing/non-empty
>   SOURCE_DIR or one of URL, CVS_REPOSITORY and CVS_MODULE, 
> SVN_REPOSITORY,
>   GIT_REPOSITORY, HG_REPOSITORY or DOWNLOAD_COMMAND
> Call Stack (most recent call first):
> /home/buildroot12git/output/host/usr/share/cmake-3.1/Modules/ExternalProject.cmake:1994 
> (_ep_add_download_command)
>   CMakeLists.txt:209 (ExternalProject_Add)
>
>
> -- Configuring incomplete, errors occurred!
> See also 
> "/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeOutput.log".
> make: *** 
> [/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/.stamp_configured] 
> Error 1
>
>
>
>   I included CMakeOutput.log .

First problem is the jansson  dependency,  however i find no hints on 
specifying the path for jansson in the readme.
there is already a jansson package in buildroot, so should these 
makefiles be patched to use the latter ?
Second one is Performing test APN_HAVE_POSIX_STRERROR_R - Failed
not sure why but i am using glibc in the toolchain.

Regards Johan

>
>  Config .in
> ========
> config BR2_PACKAGE_LIBCAPN
>     bool "libcapn"
>     help
>       libcapn is a C Library to interact with the
>       Apple Push Notification Service (APNs for short)
>       using simple and intuitive API.
>       With the library you can easily send push
>       notifications to iOS and OS X (>= 10.8) devices.
>
>       http://libcapn.org
>
>
>
> libcapn.mk
> =========
> ################################################################################ 
>
> #
> # libcapn
> #
> ################################################################################ 
>
>
> LIBCAPN_VERSION = 7a6dc662e9daa864f687
> LIBCAPN_SITE = $(call github,adobkin,libcapn,$(LIBCAPN_VERSION))
> LIBCAPNLICENSE = GPL
>
> $(eval $(cmake-package))
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>

-------------- next part --------------
The target system is: Linux -  - armv5l
The host system is: Linux - 2.6.32-5-686 - i686
Compiling the C compiler identification source file "CMakeCCompilerId.c" succeeded.
Compiler: /home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc 
Build flags: -D_LARGEFILE_SOURCE;-D_LARGEFILE64_SOURCE;-D_FILE_OFFSET_BITS=64;-pipe;-Os;
Id flags: 

The output was:
0


Compilation of the C compiler identification source "CMakeCCompilerId.c" produced "a.out"

The C compiler identification is GNU, found in "/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/3.1.3/CompilerIdC/a.out"

Determining if the C compiler works passed with the following output:
Change Dir: /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp

Run Build Command:"/usr/bin/make" "cmTryCompileExec888986262/fast"
make[1]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTryCompileExec888986262.dir/build.make CMakeFiles/cmTryCompileExec888986262.dir/build
make[2]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_progress_report /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CMakeFiles 1
Building C object CMakeFiles/cmTryCompileExec888986262.dir/testCCompiler.c.o
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe -Os     -o CMakeFiles/cmTryCompileExec888986262.dir/testCCompiler.c.o   -c /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/testCCompiler.c
Linking C executable cmTryCompileExec888986262
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_link_script CMakeFiles/cmTryCompileExec888986262.dir/link.txt --verbose=1
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe -Os      CMakeFiles/cmTryCompileExec888986262.dir/testCCompiler.c.o  -o cmTryCompileExec888986262 -rdynamic 
make[2]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
make[1]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'


Detecting C compiler ABI info compiled with the following output:
Change Dir: /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp

Run Build Command:"/usr/bin/make" "cmTryCompileExec4090782859/fast"
make[1]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTryCompileExec4090782859.dir/build.make CMakeFiles/cmTryCompileExec4090782859.dir/build
make[2]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_progress_report /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CMakeFiles 1
Building C object CMakeFiles/cmTryCompileExec4090782859.dir/CMakeCCompilerABI.c.o
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe -Os     -o CMakeFiles/cmTryCompileExec4090782859.dir/CMakeCCompilerABI.c.o   -c /home/buildroot12git/output/host/usr/share/cmake-3.1/Modules/CMakeCCompilerABI.c
Linking C executable cmTryCompileExec4090782859
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_link_script CMakeFiles/cmTryCompileExec4090782859.dir/link.txt --verbose=1
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe -Os    -v CMakeFiles/cmTryCompileExec4090782859.dir/CMakeCCompilerABI.c.o  -o cmTryCompileExec4090782859 -rdynamic  
Using built-in specs.
COLLECT_GCC=/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc
COLLECT_LTO_WRAPPER=/home/buildroot12git/output/host/usr/libexec/gcc/arm-buildroot-linux-gnueabi/4.9.3/lto-wrapper
Target: arm-buildroot-linux-gnueabi
Configured with: ./configure --prefix=/home/buildroot12git/output/host/usr --sysconfdir=/home/buildroot12git/output/host/etc --enable-static --target=arm-buildroot-linux-gnueabi --with-sysroot=/home/buildroot12git/output/host/usr/arm-buildroot-linux-gnueabi/sysroot --disable-__cxa_atexit --with-gnu-ld --disable-libssp --disable-multilib --with-gmp=/home/buildroot12git/output/host/usr --with-mpfr=/home/buildroot12git/output/host/usr --with-pkgversion='Buildroot 2015.08-git-00037-g52a44dd-dirty' --with-bugurl=http://bugs.buildroot.net/ --enable-target-optspace --disable-libquadmath --enable-tls --disable-libmudflap --enable-threads --with-mpc=/home/buildroot12git/output/host/usr --with-isl=/home/buildroot12git/output/host/usr --with-cloog=/home/buildroot12git/output/host/usr --with-float=soft --disable-decimal-float --with-abi=aapcs-linux --with-cpu=arm926ej-s --with-float=soft --with-mode=arm --enable-languages=c,c++ --enable-poison-system-directories --with-build-time-tools=/home/buildroot12git/output/host/usr/arm-buildroot-linux-gnueabi/bin --enable-shared --disable-libgomp
Thread model: posix
gcc version 4.9.3 (Buildroot 2015.08-git-00037-g52a44dd-dirty) 
COMPILER_PATH=/home/buildroot12git/output/host/usr/libexec/gcc/arm-buildroot-linux-gnueabi/4.9.3/:/home/buildroot12git/output/host/usr/libexec/gcc/arm-buildroot-linux-gnueabi/4.9.3/:/home/buildroot12git/output/host/usr/libexec/gcc/arm-buildroot-linux-gnueabi/:/home/buildroot12git/output/host/usr/lib/gcc/arm-buildroot-linux-gnueabi/4.9.3/:/home/buildroot12git/output/host/usr/lib/gcc/arm-buildroot-linux-gnueabi/:/home/buildroot12git/output/host/usr/lib/gcc/arm-buildroot-linux-gnueabi/4.9.3/../../../../arm-buildroot-linux-gnueabi/bin/
LIBRARY_PATH=/home/buildroot12git/output/host/usr/lib/gcc/arm-buildroot-linux-gnueabi/4.9.3/:/home/buildroot12git/output/host/usr/lib/gcc/arm-buildroot-linux-gnueabi/4.9.3/../../../../arm-buildroot-linux-gnueabi/lib/:/home/buildroot12git/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/lib/:/home/buildroot12git/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/
COLLECT_GCC_OPTIONS='-D' '_LARGEFILE_SOURCE' '-D' '_LARGEFILE64_SOURCE' '-D' '_FILE_OFFSET_BITS=64' '-pipe' '-Os' '-v' '-o' 'cmTryCompileExec4090782859' '-rdynamic' '-mcpu=arm926ej-s' '-mfloat-abi=soft' '-mabi=aapcs-linux' '-marm' '-mtls-dialect=gnu'
 /home/buildroot12git/output/host/usr/libexec/gcc/arm-buildroot-linux-gnueabi/4.9.3/collect2 -plugin /home/buildroot12git/output/host/usr/libexec/gcc/arm-buildroot-linux-gnueabi/4.9.3/liblto_plugin.so -plugin-opt=/home/buildroot12git/output/host/usr/libexec/gcc/arm-buildroot-linux-gnueabi/4.9.3/lto-wrapper -plugin-opt=-fresolution=/tmp/ccn1NTKw.res -plugin-opt=-pass-through=-lgcc -plugin-opt=-pass-through=-lgcc_s -plugin-opt=-pass-through=-lc -plugin-opt=-pass-through=-lgcc -plugin-opt=-pass-through=-lgcc_s --sysroot=/home/buildroot12git/output/host/usr/arm-buildroot-linux-gnueabi/sysroot --eh-frame-hdr -export-dynamic -dynamic-linker /lib/ld-linux.so.3 -X -m armelf_linux_eabi -o cmTryCompileExec4090782859 /home/buildroot12git/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/crt1.o /home/buildroot12git/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/crti.o /home/buildroot12git/output/host/usr/lib/gcc/arm-buildroot-linux-gnueabi/4.9.3/crtbegin.o -L/home/buildroot12git/output/host/usr/lib/gcc/arm-buildroot-linux-gnueabi/4.9.3 -L/home/buildroot12git/output/host/usr/lib/gcc/arm-buildroot-linux-gnueabi/4.9.3/../../../../arm-buildroot-linux-gnueabi/lib -L/home/buildroot12git/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/lib -L/home/buildroot12git/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib CMakeFiles/cmTryCompileExec4090782859.dir/CMakeCCompilerABI.c.o -lgcc --as-needed -lgcc_s --no-as-needed -lc -lgcc --as-needed -lgcc_s --no-as-needed /home/buildroot12git/output/host/usr/lib/gcc/arm-buildroot-linux-gnueabi/4.9.3/crtend.o /home/buildroot12git/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/crtn.o
make[2]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
make[1]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'


Parsed C implicit link information from above output:
  link line regex: [^( *|.*[/\])(arm-buildroot-linux-gnueabi-ld|([^/\]+-)?ld|collect2)[^/\]*( |$)]
  ignore line: [Change Dir: /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp]
  ignore line: []
  ignore line: [Run Build Command:"/usr/bin/make" "cmTryCompileExec4090782859/fast"]
  ignore line: [make[1]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp']
  ignore line: [/usr/bin/make -f CMakeFiles/cmTryCompileExec4090782859.dir/build.make CMakeFiles/cmTryCompileExec4090782859.dir/build]
  ignore line: [make[2]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp']
  ignore line: [/home/buildroot12git/output/host/usr/bin/cmake -E cmake_progress_report /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CMakeFiles 1]
  ignore line: [Building C object CMakeFiles/cmTryCompileExec4090782859.dir/CMakeCCompilerABI.c.o]
  ignore line: [/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe -Os     -o CMakeFiles/cmTryCompileExec4090782859.dir/CMakeCCompilerABI.c.o   -c /home/buildroot12git/output/host/usr/share/cmake-3.1/Modules/CMakeCCompilerABI.c]
  ignore line: [Linking C executable cmTryCompileExec4090782859]
  ignore line: [/home/buildroot12git/output/host/usr/bin/cmake -E cmake_link_script CMakeFiles/cmTryCompileExec4090782859.dir/link.txt --verbose=1]
  ignore line: [/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe -Os    -v CMakeFiles/cmTryCompileExec4090782859.dir/CMakeCCompilerABI.c.o  -o cmTryCompileExec4090782859 -rdynamic  ]
  ignore line: [Using built-in specs.]
  ignore line: [COLLECT_GCC=/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc]
  ignore line: [COLLECT_LTO_WRAPPER=/home/buildroot12git/output/host/usr/libexec/gcc/arm-buildroot-linux-gnueabi/4.9.3/lto-wrapper]
  ignore line: [Target: arm-buildroot-linux-gnueabi]
  ignore line: [Configured with: ./configure --prefix=/home/buildroot12git/output/host/usr --sysconfdir=/home/buildroot12git/output/host/etc --enable-static --target=arm-buildroot-linux-gnueabi --with-sysroot=/home/buildroot12git/output/host/usr/arm-buildroot-linux-gnueabi/sysroot --disable-__cxa_atexit --with-gnu-ld --disable-libssp --disable-multilib --with-gmp=/home/buildroot12git/output/host/usr --with-mpfr=/home/buildroot12git/output/host/usr --with-pkgversion='Buildroot 2015.08-git-00037-g52a44dd-dirty' --with-bugurl=http://bugs.buildroot.net/ --enable-target-optspace --disable-libquadmath --enable-tls --disable-libmudflap --enable-threads --with-mpc=/home/buildroot12git/output/host/usr --with-isl=/home/buildroot12git/output/host/usr --with-cloog=/home/buildroot12git/output/host/usr --with-float=soft --disable-decimal-float --with-abi=aapcs-linux --with-cpu=arm926ej-s --with-float=soft --with-mode=arm --enable-languages=c,c++ --enable-poison-system-directories --with-build-time-tools=/home/buildroot12git/output/host/usr/arm-buildroot-linux-gnueabi/bin --enable-shared --disable-libgomp]
  ignore line: [Thread model: posix]
  ignore line: [gcc version 4.9.3 (Buildroot 2015.08-git-00037-g52a44dd-dirty) ]
  ignore line: [COMPILER_PATH=/home/buildroot12git/output/host/usr/libexec/gcc/arm-buildroot-linux-gnueabi/4.9.3/:/home/buildroot12git/output/host/usr/libexec/gcc/arm-buildroot-linux-gnueabi/4.9.3/:/home/buildroot12git/output/host/usr/libexec/gcc/arm-buildroot-linux-gnueabi/:/home/buildroot12git/output/host/usr/lib/gcc/arm-buildroot-linux-gnueabi/4.9.3/:/home/buildroot12git/output/host/usr/lib/gcc/arm-buildroot-linux-gnueabi/:/home/buildroot12git/output/host/usr/lib/gcc/arm-buildroot-linux-gnueabi/4.9.3/../../../../arm-buildroot-linux-gnueabi/bin/]
  ignore line: [LIBRARY_PATH=/home/buildroot12git/output/host/usr/lib/gcc/arm-buildroot-linux-gnueabi/4.9.3/:/home/buildroot12git/output/host/usr/lib/gcc/arm-buildroot-linux-gnueabi/4.9.3/../../../../arm-buildroot-linux-gnueabi/lib/:/home/buildroot12git/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/lib/:/home/buildroot12git/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/]
  ignore line: [COLLECT_GCC_OPTIONS='-D' '_LARGEFILE_SOURCE' '-D' '_LARGEFILE64_SOURCE' '-D' '_FILE_OFFSET_BITS=64' '-pipe' '-Os' '-v' '-o' 'cmTryCompileExec4090782859' '-rdynamic' '-mcpu=arm926ej-s' '-mfloat-abi=soft' '-mabi=aapcs-linux' '-marm' '-mtls-dialect=gnu']
  link line: [ /home/buildroot12git/output/host/usr/libexec/gcc/arm-buildroot-linux-gnueabi/4.9.3/collect2 -plugin /home/buildroot12git/output/host/usr/libexec/gcc/arm-buildroot-linux-gnueabi/4.9.3/liblto_plugin.so -plugin-opt=/home/buildroot12git/output/host/usr/libexec/gcc/arm-buildroot-linux-gnueabi/4.9.3/lto-wrapper -plugin-opt=-fresolution=/tmp/ccn1NTKw.res -plugin-opt=-pass-through=-lgcc -plugin-opt=-pass-through=-lgcc_s -plugin-opt=-pass-through=-lc -plugin-opt=-pass-through=-lgcc -plugin-opt=-pass-through=-lgcc_s --sysroot=/home/buildroot12git/output/host/usr/arm-buildroot-linux-gnueabi/sysroot --eh-frame-hdr -export-dynamic -dynamic-linker /lib/ld-linux.so.3 -X -m armelf_linux_eabi -o cmTryCompileExec4090782859 /home/buildroot12git/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/crt1.o /home/buildroot12git/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/crti.o /home/buildroot12git/output/host/usr/lib/gcc/arm-buildroot-linux-gnueabi/4.9.3/crtbegin.o -L/home/buildroot12git/output/host/usr/lib/gcc/arm-buildroot-linux-gnueabi/4.9.3 -L/home/buildroot12git/output/host/usr/lib/gcc/arm-buildroot-linux-gnueabi/4.9.3/../../../../arm-buildroot-linux-gnueabi/lib -L/home/buildroot12git/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/lib -L/home/buildroot12git/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib CMakeFiles/cmTryCompileExec4090782859.dir/CMakeCCompilerABI.c.o -lgcc --as-needed -lgcc_s --no-as-needed -lc -lgcc --as-needed -lgcc_s --no-as-needed /home/buildroot12git/output/host/usr/lib/gcc/arm-buildroot-linux-gnueabi/4.9.3/crtend.o /home/buildroot12git/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/crtn.o]
    arg [/home/buildroot12git/output/host/usr/libexec/gcc/arm-buildroot-linux-gnueabi/4.9.3/collect2] ==> ignore
    arg [-plugin] ==> ignore
    arg [/home/buildroot12git/output/host/usr/libexec/gcc/arm-buildroot-linux-gnueabi/4.9.3/liblto_plugin.so] ==> ignore
    arg [-plugin-opt=/home/buildroot12git/output/host/usr/libexec/gcc/arm-buildroot-linux-gnueabi/4.9.3/lto-wrapper] ==> ignore
    arg [-plugin-opt=-fresolution=/tmp/ccn1NTKw.res] ==> ignore
    arg [-plugin-opt=-pass-through=-lgcc] ==> ignore
    arg [-plugin-opt=-pass-through=-lgcc_s] ==> ignore
    arg [-plugin-opt=-pass-through=-lc] ==> ignore
    arg [-plugin-opt=-pass-through=-lgcc] ==> ignore
    arg [-plugin-opt=-pass-through=-lgcc_s] ==> ignore
    arg [--sysroot=/home/buildroot12git/output/host/usr/arm-buildroot-linux-gnueabi/sysroot] ==> ignore
    arg [--eh-frame-hdr] ==> ignore
    arg [-export-dynamic] ==> ignore
    arg [-dynamic-linker] ==> ignore
    arg [/lib/ld-linux.so.3] ==> ignore
    arg [-X] ==> ignore
    arg [-m] ==> ignore
    arg [armelf_linux_eabi] ==> ignore
    arg [-o] ==> ignore
    arg [cmTryCompileExec4090782859] ==> ignore
    arg [/home/buildroot12git/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/crt1.o] ==> ignore
    arg [/home/buildroot12git/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/crti.o] ==> ignore
    arg [/home/buildroot12git/output/host/usr/lib/gcc/arm-buildroot-linux-gnueabi/4.9.3/crtbegin.o] ==> ignore
    arg [-L/home/buildroot12git/output/host/usr/lib/gcc/arm-buildroot-linux-gnueabi/4.9.3] ==> dir [/home/buildroot12git/output/host/usr/lib/gcc/arm-buildroot-linux-gnueabi/4.9.3]
    arg [-L/home/buildroot12git/output/host/usr/lib/gcc/arm-buildroot-linux-gnueabi/4.9.3/../../../../arm-buildroot-linux-gnueabi/lib] ==> dir [/home/buildroot12git/output/host/usr/lib/gcc/arm-buildroot-linux-gnueabi/4.9.3/../../../../arm-buildroot-linux-gnueabi/lib]
    arg [-L/home/buildroot12git/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/lib] ==> dir [/home/buildroot12git/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/lib]
    arg [-L/home/buildroot12git/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib] ==> dir [/home/buildroot12git/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib]
    arg [CMakeFiles/cmTryCompileExec4090782859.dir/CMakeCCompilerABI.c.o] ==> ignore
    arg [-lgcc] ==> lib [gcc]
    arg [--as-needed] ==> ignore
    arg [-lgcc_s] ==> lib [gcc_s]
    arg [--no-as-needed] ==> ignore
    arg [-lc] ==> lib [c]
    arg [-lgcc] ==> lib [gcc]
    arg [--as-needed] ==> ignore
    arg [-lgcc_s] ==> lib [gcc_s]
    arg [--no-as-needed] ==> ignore
    arg [/home/buildroot12git/output/host/usr/lib/gcc/arm-buildroot-linux-gnueabi/4.9.3/crtend.o] ==> ignore
    arg [/home/buildroot12git/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/crtn.o] ==> ignore
  remove lib [gcc]
  remove lib [gcc_s]
  remove lib [gcc]
  remove lib [gcc_s]
  collapse library dir [/home/buildroot12git/output/host/usr/lib/gcc/arm-buildroot-linux-gnueabi/4.9.3] ==> [/home/buildroot12git/output/host/usr/lib/gcc/arm-buildroot-linux-gnueabi/4.9.3]
  collapse library dir [/home/buildroot12git/output/host/usr/lib/gcc/arm-buildroot-linux-gnueabi/4.9.3/../../../../arm-buildroot-linux-gnueabi/lib] ==> [/home/buildroot12git/output/host/usr/arm-buildroot-linux-gnueabi/lib]
  collapse library dir [/home/buildroot12git/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/lib] ==> [/home/buildroot12git/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/lib]
  collapse library dir [/home/buildroot12git/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib] ==> [/home/buildroot12git/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib]
  implicit libs: [c]
  implicit dirs: [/home/buildroot12git/output/host/usr/lib/gcc/arm-buildroot-linux-gnueabi/4.9.3;/home/buildroot12git/output/host/usr/arm-buildroot-linux-gnueabi/lib;/home/buildroot12git/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/lib;/home/buildroot12git/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib]
  implicit fwks: []




Detecting C [-std=c90] compiler features compiled with the following output:
Change Dir: /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp

Run Build Command:"/usr/bin/make" "cmTryCompileExec2538631075/fast"
make[1]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTryCompileExec2538631075.dir/build.make CMakeFiles/cmTryCompileExec2538631075.dir/build
make[2]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_progress_report /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CMakeFiles 1
Building C object CMakeFiles/cmTryCompileExec2538631075.dir/feature_tests.c.o
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe -Os     -std=c90 -o CMakeFiles/cmTryCompileExec2538631075.dir/feature_tests.c.o   -c /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/feature_tests.c
Linking C executable cmTryCompileExec2538631075
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_link_script CMakeFiles/cmTryCompileExec2538631075.dir/link.txt --verbose=1
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe -Os      CMakeFiles/cmTryCompileExec2538631075.dir/feature_tests.c.o  -o cmTryCompileExec2538631075 -rdynamic 
make[2]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
make[1]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'


    Feature record: C_FEATURE:1c_function_prototypes
    Feature record: C_FEATURE:0c_restrict
    Feature record: C_FEATURE:0c_static_assert
    Feature record: C_FEATURE:0c_variadic_macros


Detecting C [-std=c99] compiler features compiled with the following output:
Change Dir: /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp

Run Build Command:"/usr/bin/make" "cmTryCompileExec3537131510/fast"
make[1]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTryCompileExec3537131510.dir/build.make CMakeFiles/cmTryCompileExec3537131510.dir/build
make[2]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_progress_report /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CMakeFiles 1
Building C object CMakeFiles/cmTryCompileExec3537131510.dir/feature_tests.c.o
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe -Os     -std=c99 -o CMakeFiles/cmTryCompileExec3537131510.dir/feature_tests.c.o   -c /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/feature_tests.c
Linking C executable cmTryCompileExec3537131510
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_link_script CMakeFiles/cmTryCompileExec3537131510.dir/link.txt --verbose=1
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe -Os      CMakeFiles/cmTryCompileExec3537131510.dir/feature_tests.c.o  -o cmTryCompileExec3537131510 -rdynamic 
make[2]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
make[1]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'


    Feature record: C_FEATURE:0c_function_prototypes
    Feature record: C_FEATURE:1c_restrict
    Feature record: C_FEATURE:0c_static_assert
    Feature record: C_FEATURE:1c_variadic_macros


Detecting C [-std=c11] compiler features compiled with the following output:
Change Dir: /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp

Run Build Command:"/usr/bin/make" "cmTryCompileExec3238810200/fast"
make[1]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTryCompileExec3238810200.dir/build.make CMakeFiles/cmTryCompileExec3238810200.dir/build
make[2]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_progress_report /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CMakeFiles 1
Building C object CMakeFiles/cmTryCompileExec3238810200.dir/feature_tests.c.o
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe -Os     -std=c11 -o CMakeFiles/cmTryCompileExec3238810200.dir/feature_tests.c.o   -c /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/feature_tests.c
Linking C executable cmTryCompileExec3238810200
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_link_script CMakeFiles/cmTryCompileExec3238810200.dir/link.txt --verbose=1
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe -Os      CMakeFiles/cmTryCompileExec3238810200.dir/feature_tests.c.o  -o cmTryCompileExec3238810200 -rdynamic 
make[2]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
make[1]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'


    Feature record: C_FEATURE:0c_function_prototypes
    Feature record: C_FEATURE:1c_restrict
    Feature record: C_FEATURE:1c_static_assert
    Feature record: C_FEATURE:1c_variadic_macros
Determining if files ctype.h exist passed with the following output:
Change Dir: /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp

Run Build Command:"/usr/bin/make" "cmTryCompileExec1994236475/fast"
make[1]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTryCompileExec1994236475.dir/build.make CMakeFiles/cmTryCompileExec1994236475.dir/build
make[2]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_progress_report /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CMakeFiles 1
Building C object CMakeFiles/cmTryCompileExec1994236475.dir/CheckIncludeFiles.c.o
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc   -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic    -o CMakeFiles/cmTryCompileExec1994236475.dir/CheckIncludeFiles.c.o   -c /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CheckIncludeFiles.c
Linking C executable cmTryCompileExec1994236475
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_link_script CMakeFiles/cmTryCompileExec1994236475.dir/link.txt --verbose=1
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc  -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic     CMakeFiles/cmTryCompileExec1994236475.dir/CheckIncludeFiles.c.o  -o cmTryCompileExec1994236475 -rdynamic 
make[2]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
make[1]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'


Determining if files inttypes.h exist passed with the following output:
Change Dir: /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp

Run Build Command:"/usr/bin/make" "cmTryCompileExec1815971298/fast"
make[1]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTryCompileExec1815971298.dir/build.make CMakeFiles/cmTryCompileExec1815971298.dir/build
make[2]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_progress_report /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CMakeFiles 1
Building C object CMakeFiles/cmTryCompileExec1815971298.dir/CheckIncludeFiles.c.o
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc   -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic    -o CMakeFiles/cmTryCompileExec1815971298.dir/CheckIncludeFiles.c.o   -c /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CheckIncludeFiles.c
Linking C executable cmTryCompileExec1815971298
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_link_script CMakeFiles/cmTryCompileExec1815971298.dir/link.txt --verbose=1
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc  -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic     CMakeFiles/cmTryCompileExec1815971298.dir/CheckIncludeFiles.c.o  -o cmTryCompileExec1815971298 -rdynamic 
make[2]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
make[1]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'


Determining if files stdint.h exist passed with the following output:
Change Dir: /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp

Run Build Command:"/usr/bin/make" "cmTryCompileExec2389913787/fast"
make[1]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTryCompileExec2389913787.dir/build.make CMakeFiles/cmTryCompileExec2389913787.dir/build
make[2]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_progress_report /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CMakeFiles 1
Building C object CMakeFiles/cmTryCompileExec2389913787.dir/CheckIncludeFiles.c.o
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc   -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic    -o CMakeFiles/cmTryCompileExec2389913787.dir/CheckIncludeFiles.c.o   -c /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CheckIncludeFiles.c
Linking C executable cmTryCompileExec2389913787
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_link_script CMakeFiles/cmTryCompileExec2389913787.dir/link.txt --verbose=1
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc  -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic     CMakeFiles/cmTryCompileExec2389913787.dir/CheckIncludeFiles.c.o  -o cmTryCompileExec2389913787 -rdynamic 
make[2]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
make[1]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'


Determining if files unistd.h exist passed with the following output:
Change Dir: /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp

Run Build Command:"/usr/bin/make" "cmTryCompileExec2537710784/fast"
make[1]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTryCompileExec2537710784.dir/build.make CMakeFiles/cmTryCompileExec2537710784.dir/build
make[2]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_progress_report /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CMakeFiles 1
Building C object CMakeFiles/cmTryCompileExec2537710784.dir/CheckIncludeFiles.c.o
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc   -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic    -o CMakeFiles/cmTryCompileExec2537710784.dir/CheckIncludeFiles.c.o   -c /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CheckIncludeFiles.c
Linking C executable cmTryCompileExec2537710784
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_link_script CMakeFiles/cmTryCompileExec2537710784.dir/link.txt --verbose=1
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc  -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic     CMakeFiles/cmTryCompileExec2537710784.dir/CheckIncludeFiles.c.o  -o cmTryCompileExec2537710784 -rdynamic 
make[2]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
make[1]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'


Determining if files netinet/in.h exist passed with the following output:
Change Dir: /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp

Run Build Command:"/usr/bin/make" "cmTryCompileExec3610402288/fast"
make[1]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTryCompileExec3610402288.dir/build.make CMakeFiles/cmTryCompileExec3610402288.dir/build
make[2]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_progress_report /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CMakeFiles 1
Building C object CMakeFiles/cmTryCompileExec3610402288.dir/CheckIncludeFiles.c.o
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc   -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic    -o CMakeFiles/cmTryCompileExec3610402288.dir/CheckIncludeFiles.c.o   -c /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CheckIncludeFiles.c
Linking C executable cmTryCompileExec3610402288
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_link_script CMakeFiles/cmTryCompileExec3610402288.dir/link.txt --verbose=1
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc  -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic     CMakeFiles/cmTryCompileExec3610402288.dir/CheckIncludeFiles.c.o  -o cmTryCompileExec3610402288 -rdynamic 
make[2]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
make[1]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'


Determining if files arpa/inet.h exist passed with the following output:
Change Dir: /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp

Run Build Command:"/usr/bin/make" "cmTryCompileExec3727859393/fast"
make[1]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTryCompileExec3727859393.dir/build.make CMakeFiles/cmTryCompileExec3727859393.dir/build
make[2]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_progress_report /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CMakeFiles 1
Building C object CMakeFiles/cmTryCompileExec3727859393.dir/CheckIncludeFiles.c.o
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc   -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic    -o CMakeFiles/cmTryCompileExec3727859393.dir/CheckIncludeFiles.c.o   -c /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CheckIncludeFiles.c
Linking C executable cmTryCompileExec3727859393
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_link_script CMakeFiles/cmTryCompileExec3727859393.dir/link.txt --verbose=1
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc  -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic     CMakeFiles/cmTryCompileExec3727859393.dir/CheckIncludeFiles.c.o  -o cmTryCompileExec3727859393 -rdynamic 
make[2]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
make[1]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'


Determining if files netdb.h exist passed with the following output:
Change Dir: /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp

Run Build Command:"/usr/bin/make" "cmTryCompileExec2702760086/fast"
make[1]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTryCompileExec2702760086.dir/build.make CMakeFiles/cmTryCompileExec2702760086.dir/build
make[2]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_progress_report /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CMakeFiles 1
Building C object CMakeFiles/cmTryCompileExec2702760086.dir/CheckIncludeFiles.c.o
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc   -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic    -o CMakeFiles/cmTryCompileExec2702760086.dir/CheckIncludeFiles.c.o   -c /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CheckIncludeFiles.c
Linking C executable cmTryCompileExec2702760086
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_link_script CMakeFiles/cmTryCompileExec2702760086.dir/link.txt --verbose=1
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc  -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic     CMakeFiles/cmTryCompileExec2702760086.dir/CheckIncludeFiles.c.o  -o cmTryCompileExec2702760086 -rdynamic 
make[2]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
make[1]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'


Determining if files sys/fcntl.h exist passed with the following output:
Change Dir: /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp

Run Build Command:"/usr/bin/make" "cmTryCompileExec4138034952/fast"
make[1]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTryCompileExec4138034952.dir/build.make CMakeFiles/cmTryCompileExec4138034952.dir/build
make[2]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_progress_report /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CMakeFiles 1
Building C object CMakeFiles/cmTryCompileExec4138034952.dir/CheckIncludeFiles.c.o
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc   -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic    -o CMakeFiles/cmTryCompileExec4138034952.dir/CheckIncludeFiles.c.o   -c /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CheckIncludeFiles.c
Linking C executable cmTryCompileExec4138034952
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_link_script CMakeFiles/cmTryCompileExec4138034952.dir/link.txt --verbose=1
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc  -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic     CMakeFiles/cmTryCompileExec4138034952.dir/CheckIncludeFiles.c.o  -o cmTryCompileExec4138034952 -rdynamic 
make[2]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
make[1]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'


Determining if files sys/socket.h exist passed with the following output:
Change Dir: /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp

Run Build Command:"/usr/bin/make" "cmTryCompileExec1102712165/fast"
make[1]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTryCompileExec1102712165.dir/build.make CMakeFiles/cmTryCompileExec1102712165.dir/build
make[2]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_progress_report /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CMakeFiles 1
Building C object CMakeFiles/cmTryCompileExec1102712165.dir/CheckIncludeFiles.c.o
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc   -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic    -o CMakeFiles/cmTryCompileExec1102712165.dir/CheckIncludeFiles.c.o   -c /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CheckIncludeFiles.c
Linking C executable cmTryCompileExec1102712165
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_link_script CMakeFiles/cmTryCompileExec1102712165.dir/link.txt --verbose=1
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc  -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic     CMakeFiles/cmTryCompileExec1102712165.dir/CheckIncludeFiles.c.o  -o cmTryCompileExec1102712165 -rdynamic 
make[2]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
make[1]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'


Determining if files strings.h exist passed with the following output:
Change Dir: /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp

Run Build Command:"/usr/bin/make" "cmTryCompileExec3117624703/fast"
make[1]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTryCompileExec3117624703.dir/build.make CMakeFiles/cmTryCompileExec3117624703.dir/build
make[2]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_progress_report /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CMakeFiles 1
Building C object CMakeFiles/cmTryCompileExec3117624703.dir/CheckIncludeFiles.c.o
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc   -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic    -o CMakeFiles/cmTryCompileExec3117624703.dir/CheckIncludeFiles.c.o   -c /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CheckIncludeFiles.c
Linking C executable cmTryCompileExec3117624703
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_link_script CMakeFiles/cmTryCompileExec3117624703.dir/link.txt --verbose=1
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc  -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic     CMakeFiles/cmTryCompileExec3117624703.dir/CheckIncludeFiles.c.o  -o cmTryCompileExec3117624703 -rdynamic 
make[2]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
make[1]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'


Determining if the function strerror_r exists passed with the following output:
Change Dir: /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp

Run Build Command:"/usr/bin/make" "cmTryCompileExec2918828624/fast"
make[1]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTryCompileExec2918828624.dir/build.make CMakeFiles/cmTryCompileExec2918828624.dir/build
make[2]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_progress_report /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CMakeFiles 1
Building C object CMakeFiles/cmTryCompileExec2918828624.dir/CheckFunctionExists.c.o
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc   -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic -DCHECK_FUNCTION_EXISTS=strerror_r   -o CMakeFiles/cmTryCompileExec2918828624.dir/CheckFunctionExists.c.o   -c /home/buildroot12git/output/host/usr/share/cmake-3.1/Modules/CheckFunctionExists.c
Linking C executable cmTryCompileExec2918828624
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_link_script CMakeFiles/cmTryCompileExec2918828624.dir/link.txt --verbose=1
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc  -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic -DCHECK_FUNCTION_EXISTS=strerror_r    CMakeFiles/cmTryCompileExec2918828624.dir/CheckFunctionExists.c.o  -o cmTryCompileExec2918828624 -rdynamic 
make[2]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
make[1]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'


Determining if files ctype.h exist passed with the following output:
Change Dir: /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp

Run Build Command:"/usr/bin/make" "cmTryCompileExec1060545867/fast"
make[1]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTryCompileExec1060545867.dir/build.make CMakeFiles/cmTryCompileExec1060545867.dir/build
make[2]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_progress_report /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CMakeFiles 1
Building C object CMakeFiles/cmTryCompileExec1060545867.dir/CheckIncludeFiles.c.o
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc   -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic    -o CMakeFiles/cmTryCompileExec1060545867.dir/CheckIncludeFiles.c.o   -c /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CheckIncludeFiles.c
Linking C executable cmTryCompileExec1060545867
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_link_script CMakeFiles/cmTryCompileExec1060545867.dir/link.txt --verbose=1
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc  -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic     CMakeFiles/cmTryCompileExec1060545867.dir/CheckIncludeFiles.c.o  -o cmTryCompileExec1060545867 -rdynamic 
make[2]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
make[1]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'


Determining if files inttypes.h exist passed with the following output:
Change Dir: /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp

Run Build Command:"/usr/bin/make" "cmTryCompileExec1819654801/fast"
make[1]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTryCompileExec1819654801.dir/build.make CMakeFiles/cmTryCompileExec1819654801.dir/build
make[2]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_progress_report /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CMakeFiles 1
Building C object CMakeFiles/cmTryCompileExec1819654801.dir/CheckIncludeFiles.c.o
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc   -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic    -o CMakeFiles/cmTryCompileExec1819654801.dir/CheckIncludeFiles.c.o   -c /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CheckIncludeFiles.c
Linking C executable cmTryCompileExec1819654801
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_link_script CMakeFiles/cmTryCompileExec1819654801.dir/link.txt --verbose=1
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc  -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic     CMakeFiles/cmTryCompileExec1819654801.dir/CheckIncludeFiles.c.o  -o cmTryCompileExec1819654801 -rdynamic 
make[2]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
make[1]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'


Determining if files stdint.h exist passed with the following output:
Change Dir: /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp

Run Build Command:"/usr/bin/make" "cmTryCompileExec1261975177/fast"
make[1]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTryCompileExec1261975177.dir/build.make CMakeFiles/cmTryCompileExec1261975177.dir/build
make[2]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_progress_report /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CMakeFiles 1
Building C object CMakeFiles/cmTryCompileExec1261975177.dir/CheckIncludeFiles.c.o
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc   -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic    -o CMakeFiles/cmTryCompileExec1261975177.dir/CheckIncludeFiles.c.o   -c /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CheckIncludeFiles.c
Linking C executable cmTryCompileExec1261975177
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_link_script CMakeFiles/cmTryCompileExec1261975177.dir/link.txt --verbose=1
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc  -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic     CMakeFiles/cmTryCompileExec1261975177.dir/CheckIncludeFiles.c.o  -o cmTryCompileExec1261975177 -rdynamic 
make[2]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
make[1]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'


Determining if files unistd.h exist passed with the following output:
Change Dir: /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp

Run Build Command:"/usr/bin/make" "cmTryCompileExec2686613858/fast"
make[1]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTryCompileExec2686613858.dir/build.make CMakeFiles/cmTryCompileExec2686613858.dir/build
make[2]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_progress_report /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CMakeFiles 1
Building C object CMakeFiles/cmTryCompileExec2686613858.dir/CheckIncludeFiles.c.o
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc   -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic    -o CMakeFiles/cmTryCompileExec2686613858.dir/CheckIncludeFiles.c.o   -c /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CheckIncludeFiles.c
Linking C executable cmTryCompileExec2686613858
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_link_script CMakeFiles/cmTryCompileExec2686613858.dir/link.txt --verbose=1
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc  -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic     CMakeFiles/cmTryCompileExec2686613858.dir/CheckIncludeFiles.c.o  -o cmTryCompileExec2686613858 -rdynamic 
make[2]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
make[1]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'


Determining if files netinet/in.h exist passed with the following output:
Change Dir: /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp

Run Build Command:"/usr/bin/make" "cmTryCompileExec3609017360/fast"
make[1]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTryCompileExec3609017360.dir/build.make CMakeFiles/cmTryCompileExec3609017360.dir/build
make[2]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_progress_report /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CMakeFiles 1
Building C object CMakeFiles/cmTryCompileExec3609017360.dir/CheckIncludeFiles.c.o
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc   -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic    -o CMakeFiles/cmTryCompileExec3609017360.dir/CheckIncludeFiles.c.o   -c /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CheckIncludeFiles.c
Linking C executable cmTryCompileExec3609017360
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_link_script CMakeFiles/cmTryCompileExec3609017360.dir/link.txt --verbose=1
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc  -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic     CMakeFiles/cmTryCompileExec3609017360.dir/CheckIncludeFiles.c.o  -o cmTryCompileExec3609017360 -rdynamic 
make[2]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
make[1]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'


Determining if files arpa/inet.h exist passed with the following output:
Change Dir: /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp

Run Build Command:"/usr/bin/make" "cmTryCompileExec2728452451/fast"
make[1]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTryCompileExec2728452451.dir/build.make CMakeFiles/cmTryCompileExec2728452451.dir/build
make[2]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_progress_report /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CMakeFiles 1
Building C object CMakeFiles/cmTryCompileExec2728452451.dir/CheckIncludeFiles.c.o
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc   -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic    -o CMakeFiles/cmTryCompileExec2728452451.dir/CheckIncludeFiles.c.o   -c /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CheckIncludeFiles.c
Linking C executable cmTryCompileExec2728452451
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_link_script CMakeFiles/cmTryCompileExec2728452451.dir/link.txt --verbose=1
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc  -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic     CMakeFiles/cmTryCompileExec2728452451.dir/CheckIncludeFiles.c.o  -o cmTryCompileExec2728452451 -rdynamic 
make[2]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
make[1]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'


Determining if files netdb.h exist passed with the following output:
Change Dir: /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp

Run Build Command:"/usr/bin/make" "cmTryCompileExec742472169/fast"
make[1]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTryCompileExec742472169.dir/build.make CMakeFiles/cmTryCompileExec742472169.dir/build
make[2]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_progress_report /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CMakeFiles 1
Building C object CMakeFiles/cmTryCompileExec742472169.dir/CheckIncludeFiles.c.o
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc   -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic    -o CMakeFiles/cmTryCompileExec742472169.dir/CheckIncludeFiles.c.o   -c /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CheckIncludeFiles.c
Linking C executable cmTryCompileExec742472169
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_link_script CMakeFiles/cmTryCompileExec742472169.dir/link.txt --verbose=1
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc  -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic     CMakeFiles/cmTryCompileExec742472169.dir/CheckIncludeFiles.c.o  -o cmTryCompileExec742472169 -rdynamic 
make[2]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
make[1]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'


Determining if files sys/fcntl.h exist passed with the following output:
Change Dir: /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp

Run Build Command:"/usr/bin/make" "cmTryCompileExec390004541/fast"
make[1]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTryCompileExec390004541.dir/build.make CMakeFiles/cmTryCompileExec390004541.dir/build
make[2]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_progress_report /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CMakeFiles 1
Building C object CMakeFiles/cmTryCompileExec390004541.dir/CheckIncludeFiles.c.o
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc   -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic    -o CMakeFiles/cmTryCompileExec390004541.dir/CheckIncludeFiles.c.o   -c /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CheckIncludeFiles.c
Linking C executable cmTryCompileExec390004541
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_link_script CMakeFiles/cmTryCompileExec390004541.dir/link.txt --verbose=1
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc  -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic     CMakeFiles/cmTryCompileExec390004541.dir/CheckIncludeFiles.c.o  -o cmTryCompileExec390004541 -rdynamic 
make[2]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
make[1]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'


Determining if files sys/socket.h exist passed with the following output:
Change Dir: /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp

Run Build Command:"/usr/bin/make" "cmTryCompileExec430999523/fast"
make[1]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTryCompileExec430999523.dir/build.make CMakeFiles/cmTryCompileExec430999523.dir/build
make[2]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_progress_report /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CMakeFiles 1
Building C object CMakeFiles/cmTryCompileExec430999523.dir/CheckIncludeFiles.c.o
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc   -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic    -o CMakeFiles/cmTryCompileExec430999523.dir/CheckIncludeFiles.c.o   -c /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CheckIncludeFiles.c
Linking C executable cmTryCompileExec430999523
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_link_script CMakeFiles/cmTryCompileExec430999523.dir/link.txt --verbose=1
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc  -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic     CMakeFiles/cmTryCompileExec430999523.dir/CheckIncludeFiles.c.o  -o cmTryCompileExec430999523 -rdynamic 
make[2]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
make[1]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'


Determining if files strings.h exist passed with the following output:
Change Dir: /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp

Run Build Command:"/usr/bin/make" "cmTryCompileExec1452034148/fast"
make[1]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTryCompileExec1452034148.dir/build.make CMakeFiles/cmTryCompileExec1452034148.dir/build
make[2]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_progress_report /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CMakeFiles 1
Building C object CMakeFiles/cmTryCompileExec1452034148.dir/CheckIncludeFiles.c.o
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc   -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic    -o CMakeFiles/cmTryCompileExec1452034148.dir/CheckIncludeFiles.c.o   -c /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CheckIncludeFiles.c
Linking C executable cmTryCompileExec1452034148
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_link_script CMakeFiles/cmTryCompileExec1452034148.dir/link.txt --verbose=1
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc  -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic     CMakeFiles/cmTryCompileExec1452034148.dir/CheckIncludeFiles.c.o  -o cmTryCompileExec1452034148 -rdynamic 
make[2]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
make[1]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'


Determining if the function strerror_r exists passed with the following output:
Change Dir: /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp

Run Build Command:"/usr/bin/make" "cmTryCompileExec515435016/fast"
make[1]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTryCompileExec515435016.dir/build.make CMakeFiles/cmTryCompileExec515435016.dir/build
make[2]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_progress_report /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CMakeFiles 1
Building C object CMakeFiles/cmTryCompileExec515435016.dir/CheckFunctionExists.c.o
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc   -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic -DCHECK_FUNCTION_EXISTS=strerror_r   -o CMakeFiles/cmTryCompileExec515435016.dir/CheckFunctionExists.c.o   -c /home/buildroot12git/output/host/usr/share/cmake-3.1/Modules/CheckFunctionExists.c
Linking C executable cmTryCompileExec515435016
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_link_script CMakeFiles/cmTryCompileExec515435016.dir/link.txt --verbose=1
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc  -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic -DCHECK_FUNCTION_EXISTS=strerror_r    CMakeFiles/cmTryCompileExec515435016.dir/CheckFunctionExists.c.o  -o cmTryCompileExec515435016 -rdynamic 
make[2]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
make[1]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'


Determining if files ctype.h exist passed with the following output:
Change Dir: /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp

Run Build Command:"/usr/bin/make" "cmTryCompileExec3546097332/fast"
make[1]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTryCompileExec3546097332.dir/build.make CMakeFiles/cmTryCompileExec3546097332.dir/build
make[2]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_progress_report /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CMakeFiles 1
Building C object CMakeFiles/cmTryCompileExec3546097332.dir/CheckIncludeFiles.c.o
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc   -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic    -o CMakeFiles/cmTryCompileExec3546097332.dir/CheckIncludeFiles.c.o   -c /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CheckIncludeFiles.c
Linking C executable cmTryCompileExec3546097332
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_link_script CMakeFiles/cmTryCompileExec3546097332.dir/link.txt --verbose=1
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc  -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic     CMakeFiles/cmTryCompileExec3546097332.dir/CheckIncludeFiles.c.o  -o cmTryCompileExec3546097332 -rdynamic 
make[2]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
make[1]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'


Determining if files inttypes.h exist passed with the following output:
Change Dir: /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp

Run Build Command:"/usr/bin/make" "cmTryCompileExec2158401772/fast"
make[1]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTryCompileExec2158401772.dir/build.make CMakeFiles/cmTryCompileExec2158401772.dir/build
make[2]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_progress_report /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CMakeFiles 1
Building C object CMakeFiles/cmTryCompileExec2158401772.dir/CheckIncludeFiles.c.o
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc   -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic    -o CMakeFiles/cmTryCompileExec2158401772.dir/CheckIncludeFiles.c.o   -c /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CheckIncludeFiles.c
Linking C executable cmTryCompileExec2158401772
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_link_script CMakeFiles/cmTryCompileExec2158401772.dir/link.txt --verbose=1
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc  -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic     CMakeFiles/cmTryCompileExec2158401772.dir/CheckIncludeFiles.c.o  -o cmTryCompileExec2158401772 -rdynamic 
make[2]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
make[1]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'


Determining if files stdint.h exist passed with the following output:
Change Dir: /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp

Run Build Command:"/usr/bin/make" "cmTryCompileExec3145508973/fast"
make[1]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTryCompileExec3145508973.dir/build.make CMakeFiles/cmTryCompileExec3145508973.dir/build
make[2]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_progress_report /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CMakeFiles 1
Building C object CMakeFiles/cmTryCompileExec3145508973.dir/CheckIncludeFiles.c.o
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc   -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic    -o CMakeFiles/cmTryCompileExec3145508973.dir/CheckIncludeFiles.c.o   -c /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CheckIncludeFiles.c
Linking C executable cmTryCompileExec3145508973
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_link_script CMakeFiles/cmTryCompileExec3145508973.dir/link.txt --verbose=1
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc  -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic     CMakeFiles/cmTryCompileExec3145508973.dir/CheckIncludeFiles.c.o  -o cmTryCompileExec3145508973 -rdynamic 
make[2]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
make[1]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'


Determining if files unistd.h exist passed with the following output:
Change Dir: /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp

Run Build Command:"/usr/bin/make" "cmTryCompileExec1719321266/fast"
make[1]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTryCompileExec1719321266.dir/build.make CMakeFiles/cmTryCompileExec1719321266.dir/build
make[2]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_progress_report /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CMakeFiles 1
Building C object CMakeFiles/cmTryCompileExec1719321266.dir/CheckIncludeFiles.c.o
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc   -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic    -o CMakeFiles/cmTryCompileExec1719321266.dir/CheckIncludeFiles.c.o   -c /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CheckIncludeFiles.c
Linking C executable cmTryCompileExec1719321266
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_link_script CMakeFiles/cmTryCompileExec1719321266.dir/link.txt --verbose=1
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc  -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic     CMakeFiles/cmTryCompileExec1719321266.dir/CheckIncludeFiles.c.o  -o cmTryCompileExec1719321266 -rdynamic 
make[2]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
make[1]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'


Determining if files netinet/in.h exist passed with the following output:
Change Dir: /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp

Run Build Command:"/usr/bin/make" "cmTryCompileExec1226644823/fast"
make[1]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTryCompileExec1226644823.dir/build.make CMakeFiles/cmTryCompileExec1226644823.dir/build
make[2]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_progress_report /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CMakeFiles 1
Building C object CMakeFiles/cmTryCompileExec1226644823.dir/CheckIncludeFiles.c.o
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc   -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic    -o CMakeFiles/cmTryCompileExec1226644823.dir/CheckIncludeFiles.c.o   -c /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CheckIncludeFiles.c
Linking C executable cmTryCompileExec1226644823
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_link_script CMakeFiles/cmTryCompileExec1226644823.dir/link.txt --verbose=1
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc  -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic     CMakeFiles/cmTryCompileExec1226644823.dir/CheckIncludeFiles.c.o  -o cmTryCompileExec1226644823 -rdynamic 
make[2]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
make[1]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'


Determining if files arpa/inet.h exist passed with the following output:
Change Dir: /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp

Run Build Command:"/usr/bin/make" "cmTryCompileExec3841667989/fast"
make[1]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTryCompileExec3841667989.dir/build.make CMakeFiles/cmTryCompileExec3841667989.dir/build
make[2]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_progress_report /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CMakeFiles 1
Building C object CMakeFiles/cmTryCompileExec3841667989.dir/CheckIncludeFiles.c.o
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc   -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic    -o CMakeFiles/cmTryCompileExec3841667989.dir/CheckIncludeFiles.c.o   -c /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CheckIncludeFiles.c
Linking C executable cmTryCompileExec3841667989
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_link_script CMakeFiles/cmTryCompileExec3841667989.dir/link.txt --verbose=1
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc  -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic     CMakeFiles/cmTryCompileExec3841667989.dir/CheckIncludeFiles.c.o  -o cmTryCompileExec3841667989 -rdynamic 
make[2]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
make[1]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'


Determining if files netdb.h exist passed with the following output:
Change Dir: /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp

Run Build Command:"/usr/bin/make" "cmTryCompileExec4134039909/fast"
make[1]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTryCompileExec4134039909.dir/build.make CMakeFiles/cmTryCompileExec4134039909.dir/build
make[2]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_progress_report /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CMakeFiles 1
Building C object CMakeFiles/cmTryCompileExec4134039909.dir/CheckIncludeFiles.c.o
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc   -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic    -o CMakeFiles/cmTryCompileExec4134039909.dir/CheckIncludeFiles.c.o   -c /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CheckIncludeFiles.c
Linking C executable cmTryCompileExec4134039909
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_link_script CMakeFiles/cmTryCompileExec4134039909.dir/link.txt --verbose=1
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc  -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic     CMakeFiles/cmTryCompileExec4134039909.dir/CheckIncludeFiles.c.o  -o cmTryCompileExec4134039909 -rdynamic 
make[2]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
make[1]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'


Determining if files sys/fcntl.h exist passed with the following output:
Change Dir: /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp

Run Build Command:"/usr/bin/make" "cmTryCompileExec3836028808/fast"
make[1]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTryCompileExec3836028808.dir/build.make CMakeFiles/cmTryCompileExec3836028808.dir/build
make[2]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_progress_report /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CMakeFiles 1
Building C object CMakeFiles/cmTryCompileExec3836028808.dir/CheckIncludeFiles.c.o
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc   -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic    -o CMakeFiles/cmTryCompileExec3836028808.dir/CheckIncludeFiles.c.o   -c /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CheckIncludeFiles.c
Linking C executable cmTryCompileExec3836028808
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_link_script CMakeFiles/cmTryCompileExec3836028808.dir/link.txt --verbose=1
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc  -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic     CMakeFiles/cmTryCompileExec3836028808.dir/CheckIncludeFiles.c.o  -o cmTryCompileExec3836028808 -rdynamic 
make[2]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
make[1]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'


Determining if files sys/socket.h exist passed with the following output:
Change Dir: /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp

Run Build Command:"/usr/bin/make" "cmTryCompileExec60077992/fast"
make[1]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTryCompileExec60077992.dir/build.make CMakeFiles/cmTryCompileExec60077992.dir/build
make[2]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_progress_report /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CMakeFiles 1
Building C object CMakeFiles/cmTryCompileExec60077992.dir/CheckIncludeFiles.c.o
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc   -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic    -o CMakeFiles/cmTryCompileExec60077992.dir/CheckIncludeFiles.c.o   -c /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CheckIncludeFiles.c
Linking C executable cmTryCompileExec60077992
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_link_script CMakeFiles/cmTryCompileExec60077992.dir/link.txt --verbose=1
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc  -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic     CMakeFiles/cmTryCompileExec60077992.dir/CheckIncludeFiles.c.o  -o cmTryCompileExec60077992 -rdynamic 
make[2]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
make[1]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'


Determining if files strings.h exist passed with the following output:
Change Dir: /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp

Run Build Command:"/usr/bin/make" "cmTryCompileExec2442770026/fast"
make[1]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTryCompileExec2442770026.dir/build.make CMakeFiles/cmTryCompileExec2442770026.dir/build
make[2]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_progress_report /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CMakeFiles 1
Building C object CMakeFiles/cmTryCompileExec2442770026.dir/CheckIncludeFiles.c.o
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc   -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic    -o CMakeFiles/cmTryCompileExec2442770026.dir/CheckIncludeFiles.c.o   -c /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CheckIncludeFiles.c
Linking C executable cmTryCompileExec2442770026
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_link_script CMakeFiles/cmTryCompileExec2442770026.dir/link.txt --verbose=1
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc  -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic     CMakeFiles/cmTryCompileExec2442770026.dir/CheckIncludeFiles.c.o  -o cmTryCompileExec2442770026 -rdynamic 
make[2]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
make[1]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'


Determining if the function strerror_r exists passed with the following output:
Change Dir: /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp

Run Build Command:"/usr/bin/make" "cmTryCompileExec3447767588/fast"
make[1]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTryCompileExec3447767588.dir/build.make CMakeFiles/cmTryCompileExec3447767588.dir/build
make[2]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_progress_report /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CMakeFiles 1
Building C object CMakeFiles/cmTryCompileExec3447767588.dir/CheckFunctionExists.c.o
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc   -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic -DCHECK_FUNCTION_EXISTS=strerror_r   -o CMakeFiles/cmTryCompileExec3447767588.dir/CheckFunctionExists.c.o   -c /home/buildroot12git/output/host/usr/share/cmake-3.1/Modules/CheckFunctionExists.c
Linking C executable cmTryCompileExec3447767588
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_link_script CMakeFiles/cmTryCompileExec3447767588.dir/link.txt --verbose=1
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc  -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic -DCHECK_FUNCTION_EXISTS=strerror_r    CMakeFiles/cmTryCompileExec3447767588.dir/CheckFunctionExists.c.o  -o cmTryCompileExec3447767588 -rdynamic 
make[2]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
make[1]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'


Determining if files ctype.h exist passed with the following output:
Change Dir: /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp

Run Build Command:"/usr/bin/make" "cmTryCompileExec2692754363/fast"
make[1]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTryCompileExec2692754363.dir/build.make CMakeFiles/cmTryCompileExec2692754363.dir/build
make[2]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_progress_report /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CMakeFiles 1
Building C object CMakeFiles/cmTryCompileExec2692754363.dir/CheckIncludeFiles.c.o
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc   -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic    -o CMakeFiles/cmTryCompileExec2692754363.dir/CheckIncludeFiles.c.o   -c /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CheckIncludeFiles.c
Linking C executable cmTryCompileExec2692754363
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_link_script CMakeFiles/cmTryCompileExec2692754363.dir/link.txt --verbose=1
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc  -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic     CMakeFiles/cmTryCompileExec2692754363.dir/CheckIncludeFiles.c.o  -o cmTryCompileExec2692754363 -rdynamic 
make[2]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
make[1]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'


Determining if files inttypes.h exist passed with the following output:
Change Dir: /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp

Run Build Command:"/usr/bin/make" "cmTryCompileExec3311860461/fast"
make[1]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTryCompileExec3311860461.dir/build.make CMakeFiles/cmTryCompileExec3311860461.dir/build
make[2]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_progress_report /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CMakeFiles 1
Building C object CMakeFiles/cmTryCompileExec3311860461.dir/CheckIncludeFiles.c.o
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc   -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic    -o CMakeFiles/cmTryCompileExec3311860461.dir/CheckIncludeFiles.c.o   -c /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CheckIncludeFiles.c
Linking C executable cmTryCompileExec3311860461
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_link_script CMakeFiles/cmTryCompileExec3311860461.dir/link.txt --verbose=1
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc  -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic     CMakeFiles/cmTryCompileExec3311860461.dir/CheckIncludeFiles.c.o  -o cmTryCompileExec3311860461 -rdynamic 
make[2]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
make[1]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'


Determining if files stdint.h exist passed with the following output:
Change Dir: /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp

Run Build Command:"/usr/bin/make" "cmTryCompileExec1413510563/fast"
make[1]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTryCompileExec1413510563.dir/build.make CMakeFiles/cmTryCompileExec1413510563.dir/build
make[2]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_progress_report /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CMakeFiles 1
Building C object CMakeFiles/cmTryCompileExec1413510563.dir/CheckIncludeFiles.c.o
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc   -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic    -o CMakeFiles/cmTryCompileExec1413510563.dir/CheckIncludeFiles.c.o   -c /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CheckIncludeFiles.c
Linking C executable cmTryCompileExec1413510563
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_link_script CMakeFiles/cmTryCompileExec1413510563.dir/link.txt --verbose=1
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc  -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic     CMakeFiles/cmTryCompileExec1413510563.dir/CheckIncludeFiles.c.o  -o cmTryCompileExec1413510563 -rdynamic 
make[2]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
make[1]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'


Determining if files unistd.h exist passed with the following output:
Change Dir: /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp

Run Build Command:"/usr/bin/make" "cmTryCompileExec3029382108/fast"
make[1]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTryCompileExec3029382108.dir/build.make CMakeFiles/cmTryCompileExec3029382108.dir/build
make[2]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_progress_report /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CMakeFiles 1
Building C object CMakeFiles/cmTryCompileExec3029382108.dir/CheckIncludeFiles.c.o
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc   -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic    -o CMakeFiles/cmTryCompileExec3029382108.dir/CheckIncludeFiles.c.o   -c /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CheckIncludeFiles.c
Linking C executable cmTryCompileExec3029382108
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_link_script CMakeFiles/cmTryCompileExec3029382108.dir/link.txt --verbose=1
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc  -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic     CMakeFiles/cmTryCompileExec3029382108.dir/CheckIncludeFiles.c.o  -o cmTryCompileExec3029382108 -rdynamic 
make[2]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
make[1]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'


Determining if files netinet/in.h exist passed with the following output:
Change Dir: /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp

Run Build Command:"/usr/bin/make" "cmTryCompileExec469683280/fast"
make[1]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTryCompileExec469683280.dir/build.make CMakeFiles/cmTryCompileExec469683280.dir/build
make[2]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_progress_report /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CMakeFiles 1
Building C object CMakeFiles/cmTryCompileExec469683280.dir/CheckIncludeFiles.c.o
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc   -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic    -o CMakeFiles/cmTryCompileExec469683280.dir/CheckIncludeFiles.c.o   -c /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CheckIncludeFiles.c
Linking C executable cmTryCompileExec469683280
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_link_script CMakeFiles/cmTryCompileExec469683280.dir/link.txt --verbose=1
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc  -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic     CMakeFiles/cmTryCompileExec469683280.dir/CheckIncludeFiles.c.o  -o cmTryCompileExec469683280 -rdynamic 
make[2]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
make[1]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'


Determining if files arpa/inet.h exist passed with the following output:
Change Dir: /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp

Run Build Command:"/usr/bin/make" "cmTryCompileExec1297408112/fast"
make[1]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTryCompileExec1297408112.dir/build.make CMakeFiles/cmTryCompileExec1297408112.dir/build
make[2]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_progress_report /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CMakeFiles 1
Building C object CMakeFiles/cmTryCompileExec1297408112.dir/CheckIncludeFiles.c.o
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc   -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic    -o CMakeFiles/cmTryCompileExec1297408112.dir/CheckIncludeFiles.c.o   -c /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CheckIncludeFiles.c
Linking C executable cmTryCompileExec1297408112
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_link_script CMakeFiles/cmTryCompileExec1297408112.dir/link.txt --verbose=1
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc  -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic     CMakeFiles/cmTryCompileExec1297408112.dir/CheckIncludeFiles.c.o  -o cmTryCompileExec1297408112 -rdynamic 
make[2]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
make[1]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'


Determining if files netdb.h exist passed with the following output:
Change Dir: /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp

Run Build Command:"/usr/bin/make" "cmTryCompileExec2174385282/fast"
make[1]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTryCompileExec2174385282.dir/build.make CMakeFiles/cmTryCompileExec2174385282.dir/build
make[2]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_progress_report /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CMakeFiles 1
Building C object CMakeFiles/cmTryCompileExec2174385282.dir/CheckIncludeFiles.c.o
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc   -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic    -o CMakeFiles/cmTryCompileExec2174385282.dir/CheckIncludeFiles.c.o   -c /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CheckIncludeFiles.c
Linking C executable cmTryCompileExec2174385282
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_link_script CMakeFiles/cmTryCompileExec2174385282.dir/link.txt --verbose=1
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc  -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic     CMakeFiles/cmTryCompileExec2174385282.dir/CheckIncludeFiles.c.o  -o cmTryCompileExec2174385282 -rdynamic 
make[2]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
make[1]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'


Determining if files sys/fcntl.h exist passed with the following output:
Change Dir: /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp

Run Build Command:"/usr/bin/make" "cmTryCompileExec2488717553/fast"
make[1]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTryCompileExec2488717553.dir/build.make CMakeFiles/cmTryCompileExec2488717553.dir/build
make[2]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_progress_report /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CMakeFiles 1
Building C object CMakeFiles/cmTryCompileExec2488717553.dir/CheckIncludeFiles.c.o
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc   -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic    -o CMakeFiles/cmTryCompileExec2488717553.dir/CheckIncludeFiles.c.o   -c /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CheckIncludeFiles.c
Linking C executable cmTryCompileExec2488717553
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_link_script CMakeFiles/cmTryCompileExec2488717553.dir/link.txt --verbose=1
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc  -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic     CMakeFiles/cmTryCompileExec2488717553.dir/CheckIncludeFiles.c.o  -o cmTryCompileExec2488717553 -rdynamic 
make[2]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
make[1]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'


Determining if files sys/socket.h exist passed with the following output:
Change Dir: /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp

Run Build Command:"/usr/bin/make" "cmTryCompileExec3466709943/fast"
make[1]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTryCompileExec3466709943.dir/build.make CMakeFiles/cmTryCompileExec3466709943.dir/build
make[2]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_progress_report /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CMakeFiles 1
Building C object CMakeFiles/cmTryCompileExec3466709943.dir/CheckIncludeFiles.c.o
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc   -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic    -o CMakeFiles/cmTryCompileExec3466709943.dir/CheckIncludeFiles.c.o   -c /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CheckIncludeFiles.c
Linking C executable cmTryCompileExec3466709943
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_link_script CMakeFiles/cmTryCompileExec3466709943.dir/link.txt --verbose=1
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc  -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic     CMakeFiles/cmTryCompileExec3466709943.dir/CheckIncludeFiles.c.o  -o cmTryCompileExec3466709943 -rdynamic 
make[2]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
make[1]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'


Determining if files strings.h exist passed with the following output:
Change Dir: /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp

Run Build Command:"/usr/bin/make" "cmTryCompileExec1811272080/fast"
make[1]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTryCompileExec1811272080.dir/build.make CMakeFiles/cmTryCompileExec1811272080.dir/build
make[2]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_progress_report /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CMakeFiles 1
Building C object CMakeFiles/cmTryCompileExec1811272080.dir/CheckIncludeFiles.c.o
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc   -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic    -o CMakeFiles/cmTryCompileExec1811272080.dir/CheckIncludeFiles.c.o   -c /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CheckIncludeFiles.c
Linking C executable cmTryCompileExec1811272080
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_link_script CMakeFiles/cmTryCompileExec1811272080.dir/link.txt --verbose=1
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc  -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic     CMakeFiles/cmTryCompileExec1811272080.dir/CheckIncludeFiles.c.o  -o cmTryCompileExec1811272080 -rdynamic 
make[2]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
make[1]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'


Determining if the function strerror_r exists passed with the following output:
Change Dir: /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp

Run Build Command:"/usr/bin/make" "cmTryCompileExec2683939616/fast"
make[1]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTryCompileExec2683939616.dir/build.make CMakeFiles/cmTryCompileExec2683939616.dir/build
make[2]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_progress_report /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CMakeFiles 1
Building C object CMakeFiles/cmTryCompileExec2683939616.dir/CheckFunctionExists.c.o
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc   -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic -DCHECK_FUNCTION_EXISTS=strerror_r   -o CMakeFiles/cmTryCompileExec2683939616.dir/CheckFunctionExists.c.o   -c /home/buildroot12git/output/host/usr/share/cmake-3.1/Modules/CheckFunctionExists.c
Linking C executable cmTryCompileExec2683939616
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_link_script CMakeFiles/cmTryCompileExec2683939616.dir/link.txt --verbose=1
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc  -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic -DCHECK_FUNCTION_EXISTS=strerror_r    CMakeFiles/cmTryCompileExec2683939616.dir/CheckFunctionExists.c.o  -o cmTryCompileExec2683939616 -rdynamic 
make[2]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
make[1]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'


Determining if files ctype.h exist passed with the following output:
Change Dir: /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp

Run Build Command:"/usr/bin/make" "cmTryCompileExec1838881023/fast"
make[1]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTryCompileExec1838881023.dir/build.make CMakeFiles/cmTryCompileExec1838881023.dir/build
make[2]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_progress_report /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CMakeFiles 1
Building C object CMakeFiles/cmTryCompileExec1838881023.dir/CheckIncludeFiles.c.o
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc   -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic    -o CMakeFiles/cmTryCompileExec1838881023.dir/CheckIncludeFiles.c.o   -c /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CheckIncludeFiles.c
Linking C executable cmTryCompileExec1838881023
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_link_script CMakeFiles/cmTryCompileExec1838881023.dir/link.txt --verbose=1
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc  -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic     CMakeFiles/cmTryCompileExec1838881023.dir/CheckIncludeFiles.c.o  -o cmTryCompileExec1838881023 -rdynamic 
make[2]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
make[1]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'


Determining if files inttypes.h exist passed with the following output:
Change Dir: /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp

Run Build Command:"/usr/bin/make" "cmTryCompileExec1831174162/fast"
make[1]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTryCompileExec1831174162.dir/build.make CMakeFiles/cmTryCompileExec1831174162.dir/build
make[2]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_progress_report /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CMakeFiles 1
Building C object CMakeFiles/cmTryCompileExec1831174162.dir/CheckIncludeFiles.c.o
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc   -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic    -o CMakeFiles/cmTryCompileExec1831174162.dir/CheckIncludeFiles.c.o   -c /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CheckIncludeFiles.c
Linking C executable cmTryCompileExec1831174162
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_link_script CMakeFiles/cmTryCompileExec1831174162.dir/link.txt --verbose=1
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc  -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic     CMakeFiles/cmTryCompileExec1831174162.dir/CheckIncludeFiles.c.o  -o cmTryCompileExec1831174162 -rdynamic 
make[2]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
make[1]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'


Determining if files stdint.h exist passed with the following output:
Change Dir: /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp

Run Build Command:"/usr/bin/make" "cmTryCompileExec3239625514/fast"
make[1]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTryCompileExec3239625514.dir/build.make CMakeFiles/cmTryCompileExec3239625514.dir/build
make[2]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_progress_report /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CMakeFiles 1
Building C object CMakeFiles/cmTryCompileExec3239625514.dir/CheckIncludeFiles.c.o
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc   -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic    -o CMakeFiles/cmTryCompileExec3239625514.dir/CheckIncludeFiles.c.o   -c /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CheckIncludeFiles.c
Linking C executable cmTryCompileExec3239625514
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_link_script CMakeFiles/cmTryCompileExec3239625514.dir/link.txt --verbose=1
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc  -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic     CMakeFiles/cmTryCompileExec3239625514.dir/CheckIncludeFiles.c.o  -o cmTryCompileExec3239625514 -rdynamic 
make[2]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
make[1]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'


Determining if files unistd.h exist passed with the following output:
Change Dir: /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp

Run Build Command:"/usr/bin/make" "cmTryCompileExec752108117/fast"
make[1]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTryCompileExec752108117.dir/build.make CMakeFiles/cmTryCompileExec752108117.dir/build
make[2]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_progress_report /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CMakeFiles 1
Building C object CMakeFiles/cmTryCompileExec752108117.dir/CheckIncludeFiles.c.o
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc   -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic    -o CMakeFiles/cmTryCompileExec752108117.dir/CheckIncludeFiles.c.o   -c /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CheckIncludeFiles.c
Linking C executable cmTryCompileExec752108117
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_link_script CMakeFiles/cmTryCompileExec752108117.dir/link.txt --verbose=1
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc  -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic     CMakeFiles/cmTryCompileExec752108117.dir/CheckIncludeFiles.c.o  -o cmTryCompileExec752108117 -rdynamic 
make[2]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
make[1]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'


Determining if files netinet/in.h exist passed with the following output:
Change Dir: /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp

Run Build Command:"/usr/bin/make" "cmTryCompileExec53174491/fast"
make[1]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTryCompileExec53174491.dir/build.make CMakeFiles/cmTryCompileExec53174491.dir/build
make[2]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_progress_report /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CMakeFiles 1
Building C object CMakeFiles/cmTryCompileExec53174491.dir/CheckIncludeFiles.c.o
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc   -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic    -o CMakeFiles/cmTryCompileExec53174491.dir/CheckIncludeFiles.c.o   -c /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CheckIncludeFiles.c
Linking C executable cmTryCompileExec53174491
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_link_script CMakeFiles/cmTryCompileExec53174491.dir/link.txt --verbose=1
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc  -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic     CMakeFiles/cmTryCompileExec53174491.dir/CheckIncludeFiles.c.o  -o cmTryCompileExec53174491 -rdynamic 
make[2]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
make[1]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'


Determining if files arpa/inet.h exist passed with the following output:
Change Dir: /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp

Run Build Command:"/usr/bin/make" "cmTryCompileExec283687291/fast"
make[1]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTryCompileExec283687291.dir/build.make CMakeFiles/cmTryCompileExec283687291.dir/build
make[2]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_progress_report /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CMakeFiles 1
Building C object CMakeFiles/cmTryCompileExec283687291.dir/CheckIncludeFiles.c.o
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc   -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic    -o CMakeFiles/cmTryCompileExec283687291.dir/CheckIncludeFiles.c.o   -c /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CheckIncludeFiles.c
Linking C executable cmTryCompileExec283687291
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_link_script CMakeFiles/cmTryCompileExec283687291.dir/link.txt --verbose=1
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc  -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic     CMakeFiles/cmTryCompileExec283687291.dir/CheckIncludeFiles.c.o  -o cmTryCompileExec283687291 -rdynamic 
make[2]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
make[1]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'


Determining if files netdb.h exist passed with the following output:
Change Dir: /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp

Run Build Command:"/usr/bin/make" "cmTryCompileExec1120752873/fast"
make[1]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTryCompileExec1120752873.dir/build.make CMakeFiles/cmTryCompileExec1120752873.dir/build
make[2]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_progress_report /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CMakeFiles 1
Building C object CMakeFiles/cmTryCompileExec1120752873.dir/CheckIncludeFiles.c.o
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc   -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic    -o CMakeFiles/cmTryCompileExec1120752873.dir/CheckIncludeFiles.c.o   -c /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CheckIncludeFiles.c
Linking C executable cmTryCompileExec1120752873
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_link_script CMakeFiles/cmTryCompileExec1120752873.dir/link.txt --verbose=1
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc  -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic     CMakeFiles/cmTryCompileExec1120752873.dir/CheckIncludeFiles.c.o  -o cmTryCompileExec1120752873 -rdynamic 
make[2]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
make[1]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'


Determining if files sys/fcntl.h exist passed with the following output:
Change Dir: /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp

Run Build Command:"/usr/bin/make" "cmTryCompileExec3825895203/fast"
make[1]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTryCompileExec3825895203.dir/build.make CMakeFiles/cmTryCompileExec3825895203.dir/build
make[2]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_progress_report /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CMakeFiles 1
Building C object CMakeFiles/cmTryCompileExec3825895203.dir/CheckIncludeFiles.c.o
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc   -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic    -o CMakeFiles/cmTryCompileExec3825895203.dir/CheckIncludeFiles.c.o   -c /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CheckIncludeFiles.c
Linking C executable cmTryCompileExec3825895203
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_link_script CMakeFiles/cmTryCompileExec3825895203.dir/link.txt --verbose=1
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc  -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic     CMakeFiles/cmTryCompileExec3825895203.dir/CheckIncludeFiles.c.o  -o cmTryCompileExec3825895203 -rdynamic 
make[2]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
make[1]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'


Determining if files sys/socket.h exist passed with the following output:
Change Dir: /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp

Run Build Command:"/usr/bin/make" "cmTryCompileExec727901148/fast"
make[1]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTryCompileExec727901148.dir/build.make CMakeFiles/cmTryCompileExec727901148.dir/build
make[2]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_progress_report /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CMakeFiles 1
Building C object CMakeFiles/cmTryCompileExec727901148.dir/CheckIncludeFiles.c.o
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc   -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic    -o CMakeFiles/cmTryCompileExec727901148.dir/CheckIncludeFiles.c.o   -c /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CheckIncludeFiles.c
Linking C executable cmTryCompileExec727901148
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_link_script CMakeFiles/cmTryCompileExec727901148.dir/link.txt --verbose=1
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc  -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic     CMakeFiles/cmTryCompileExec727901148.dir/CheckIncludeFiles.c.o  -o cmTryCompileExec727901148 -rdynamic 
make[2]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
make[1]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'


Determining if files strings.h exist passed with the following output:
Change Dir: /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp

Run Build Command:"/usr/bin/make" "cmTryCompileExec3222265188/fast"
make[1]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTryCompileExec3222265188.dir/build.make CMakeFiles/cmTryCompileExec3222265188.dir/build
make[2]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_progress_report /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CMakeFiles 1
Building C object CMakeFiles/cmTryCompileExec3222265188.dir/CheckIncludeFiles.c.o
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc   -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic    -o CMakeFiles/cmTryCompileExec3222265188.dir/CheckIncludeFiles.c.o   -c /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CheckIncludeFiles.c
Linking C executable cmTryCompileExec3222265188
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_link_script CMakeFiles/cmTryCompileExec3222265188.dir/link.txt --verbose=1
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc  -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic     CMakeFiles/cmTryCompileExec3222265188.dir/CheckIncludeFiles.c.o  -o cmTryCompileExec3222265188 -rdynamic 
make[2]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
make[1]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'


Determining if the function strerror_r exists passed with the following output:
Change Dir: /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp

Run Build Command:"/usr/bin/make" "cmTryCompileExec4277848368/fast"
make[1]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/usr/bin/make -f CMakeFiles/cmTryCompileExec4277848368.dir/build.make CMakeFiles/cmTryCompileExec4277848368.dir/build
make[2]: Entering directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_progress_report /home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp/CMakeFiles 1
Building C object CMakeFiles/cmTryCompileExec4277848368.dir/CheckFunctionExists.c.o
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc   -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic -DCHECK_FUNCTION_EXISTS=strerror_r   -o CMakeFiles/cmTryCompileExec4277848368.dir/CheckFunctionExists.c.o   -c /home/buildroot12git/output/host/usr/share/cmake-3.1/Modules/CheckFunctionExists.c
Linking C executable cmTryCompileExec4277848368
/home/buildroot12git/output/host/usr/bin/cmake -E cmake_link_script CMakeFiles/cmTryCompileExec4277848368.dir/link.txt --verbose=1
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc  -std=c99 -D_POSIX_C_SOURCE=200112L -Wno-deprecated -Wall -Wextra -Wimplicit -fPIC -W -Wformat-security -pedantic -DCHECK_FUNCTION_EXISTS=strerror_r    CMakeFiles/cmTryCompileExec4277848368.dir/CheckFunctionExists.c.o  -o cmTryCompileExec4277848368 -rdynamic 
make[2]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
make[1]: Leaving directory `/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeTmp'
