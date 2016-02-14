From: Johan Sagaert <sagaert.johan@proximus.be>
Date: Mon, 15 Feb 2016 00:01:07 +0100
Subject: [Buildroot] problem adding new package libcapn
Message-ID: <56C10733.8040706@proximus.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

I am trying to add a new package libcapn

from the README.md

## Installation
### on *nix
__Requirements__

- [CMake](http://cmake.org) >= 2.8.5
- Clang 3 and later or GCC 4.6 and later
- make

__Build instructions__

$ git clone https://github.com/adobkin/libcapn.git
$ git submodule update --init
$ mkdir build
$ cd build
$ cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ../
$ make
$ sudo make install
```


1) I am not sure how the git submodule update --init is handled in 
buildroot.

2) Building yields this error:

rm -f /home/buildroot12git/output/build/digital_io-TX28_V102/.stamp_built
 >>> libcapn 7a6dc662e9daa864f687 Configuring
(mkdir -p 
/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/ && cd 
/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/ && rm -f 
CMakeCache.txt && 
PATH="/home/buildroot12git/output/host/bin:/home/buildroot12git/output/host/sbin:/home/buildroot12git/output/host/usr/bin:/home/buildroot12git/output/host/usr/sbin:/root/google-cloud-sdk/bin:/root/google-cloud-sdk/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/buildroot12git/output/build/host-cmake-3.0.2/bin" 
/home/buildroot12git/output/host/usr/bin/cmake 
/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/ 
-DCMAKE_TOOLCHAIN_FILE="/home/buildroot12git/output/host/usr/share/buildroot/toolchainfile.cmake" 
-DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="/usr" 
-DCMAKE_COLOR_MAKEFILE=OFF -DBUILD_DOC=OFF -DBUILD_DOCS=OFF 
-DBUILD_EXAMPLE=OFF -DBUILD_EXAMPLES=OFF -DBUILD_TEST=OFF 
-DBUILD_TESTS=OFF -DBUILD_TESTING=OFF -DBUILD_SHARED_LIBS=ON 
-DUSE_CCACHE=OFF   )
-- Looking for include file ctype.h
-- Looking for include file ctype.h - found
-- Looking for include file inttypes.h
-- Looking for include file inttypes.h - found
-- Looking for include file stdint.h
-- Looking for include file stdint.h - found
-- Looking for include file unistd.h
-- Looking for include file unistd.h - found
-- Looking for include file netinet/in.h
-- Looking for include file netinet/in.h - found
-- Looking for include file arpa/inet.h
-- Looking for include file arpa/inet.h - found
-- Looking for include file netdb.h
-- Looking for include file netdb.h - found
-- Looking for include file sys/fcntl.h
-- Looking for include file sys/fcntl.h - found
-- Looking for include file sys/socket.h
-- Looking for include file sys/socket.h - found
-- Looking for include file strings.h
-- Looking for include file strings.h - found
-- Looking for strerror_r
-- Looking for strerror_r - found
-- Performing test APN_HAVE_GLIBC_STRERROR_R
CMake Error: TRY_RUN() invoked in cross-compiling mode, please set the 
following cache variables appropriately:
    APN_HAVE_GLIBC_STRERROR_R (advanced)
    APN_HAVE_GLIBC_STRERROR_R__TRYRUN_OUTPUT (advanced)
For details see 
/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/TryRunResults.cmake
-- Performing test APN_HAVE_GLIBC_STRERROR_R - Failed
-- Performing test APN_HAVE_POSIX_STRERROR_R
CMake Error: TRY_RUN() invoked in cross-compiling mode, please set the 
following cache variables appropriately:
    APN_HAVE_POSIX_STRERROR_R (advanced)
    APN_HAVE_POSIX_STRERROR_R__TRYRUN_OUTPUT (advanced)
For details see 
/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/TryRunResults.cmake
-- Performing test APN_HAVE_POSIX_STRERROR_R - Failed
-- Found OpenSSL: 
/home/buildroot12git/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libssl.so;/home/buildroot12git/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libcrypto.so 
(found version "1.0.2c")
CMake Error at 
/home/buildroot12git/output/host/usr/share/cmake-3.1/Modules/ExternalProject.cmake:1584 
(message):
   error: no download info for 'jansson' -- please specify 
existing/non-empty
   SOURCE_DIR or one of URL, CVS_REPOSITORY and CVS_MODULE, SVN_REPOSITORY,
   GIT_REPOSITORY, HG_REPOSITORY or DOWNLOAD_COMMAND
Call Stack (most recent call first):
/home/buildroot12git/output/host/usr/share/cmake-3.1/Modules/ExternalProject.cmake:1994 
(_ep_add_download_command)
   CMakeLists.txt:209 (ExternalProject_Add)


-- Configuring incomplete, errors occurred!
See also 
"/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/CMakeFiles/CMakeOutput.log".
make: *** 
[/home/buildroot12git/output/build/libcapn-7a6dc662e9daa864f687/.stamp_configured] 
Error 1



   I included CMakeOutput.log .


  Config .in
========
config BR2_PACKAGE_LIBCAPN
     bool "libcapn"
     help
       libcapn is a C Library to interact with the
       Apple Push Notification Service (APNs for short)
       using simple and intuitive API.
       With the library you can easily send push
       notifications to iOS and OS X (>= 10.8) devices.

       http://libcapn.org



libcapn.mk
=========
################################################################################
#
# libcapn
#
################################################################################

LIBCAPN_VERSION = 7a6dc662e9daa864f687
LIBCAPN_SITE = $(call github,adobkin,libcapn,$(LIBCAPN_VERSION))
LIBCAPNLICENSE = GPL

$(eval $(cmake-package))
