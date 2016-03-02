From: Johan Sagaert <sagaert.johan@proximus.be>
Date: Wed, 2 Mar 2016 14:30:18 +0100
Subject: [Buildroot] [PATCH 1/1] libwebsockets : bump to v1.7.2
In-Reply-To: <20160302091601.7076cc01@free-electrons.com>
References: <1456871425-26152-1-git-send-email-sagaert.johan@proximus.be>
 <20160301233457.2dae9d21@free-electrons.com> <56D63448.4080202@proximus.be>
 <20160302091601.7076cc01@free-electrons.com>
Message-ID: <56D6EAEA.5050709@proximus.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas

Op 2/03/2016 om 9:16 schreef Thomas Petazzoni:
> Johan,
>
> (Please keep the mailing list in Cc: when replying, thanks!)
>
> On Wed, 2 Mar 2016 01:31:04 +0100, Johan Sagaert wrote:
>
>> Just added some comment,
>> Looks like the CMakeLists.txt has been seriously reworked.
>> Did not encounter anything strange while building and using the new
>> version of the lib.
> The patch was originally introduced to make sure that libwebsockets
> would build fine in a BR2_STATIC_LIB=y configuration. Could you verify
> that this is still the case with your update?
>
> Thanks!
>
> Thomas
The static library libwebsockets.a is at .../staging/usr/lib  as well as 
the shared version
having both static and shared libraries enabled in Buildroot.

However when i select static only libraries i get the following build error:
I looks like the extention fails to build.

When adding :
ifeq ($(BR2_STATIC_LIBS),y)
LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_SHARED=OFF
endif

libwebsockets.a builds fine, so i guess this is the way to go.

(should i disable the static build when shared libs are selected ?
both  static and shared are now build when shared libs only is selected 
in Buildroot. )

Regards Johan

libwebsockets-v1.7.2.tar.xz: OK (sha256: 
c7485cada05a7b00975260fe9d09de78cc5b78f28ae51ee4111c680c7a296835)
 >>> libwebsockets v1.7.2 Extracting
xzcat /home/johan/dl/libwebsockets-v1.7.2.tar.xz | tar 
--strip-components=1 -C 
/gitrepos/buildroot/output/build/libwebsockets-v1.7.2   -xf -
 >>> libwebsockets v1.7.2 Patching
 >>> libwebsockets v1.7.2 Configuring
(mkdir -p /gitrepos/buildroot/output/build/libwebsockets-v1.7.2/ && cd 
/gitrepos/buildroot/output/build/libwebsockets-v1.7.2/ && rm -f 
CMakeCache.txt && 
PATH="/gitrepos/buildroot/output/host/bin:/gitrepos/buildroot/output/host/sbin:/gitrepos/buildroot/output/host/usr/bin:/gitrepos/buildroot/output/host/usr/sbin:/root/google-cloud-sdk/bin:/home/buildroot12git/output/host/usr/bin:/home/buildroot12git/output/build/host-cmake-3.1.3/bin:/root/google-cloud-sdk/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" 
/gitrepos/buildroot/output/host/usr/bin/cmake 
/gitrepos/buildroot/output/build/libwebsockets-v1.7.2/ 
-DCMAKE_TOOLCHAIN_FILE="/gitrepos/buildroot/output/host/usr/share/buildroot/toolchainfile.cmake" 
-DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="/usr" 
-DCMAKE_COLOR_MAKEFILE=OFF -DBUILD_DOC=OFF -DBUILD_DOCS=OFF 
-DBUILD_EXAMPLE=OFF -DBUILD_EXAMPLES=OFF -DBUILD_TEST=OFF 
-DBUILD_TESTS=OFF -DBUILD_TESTING=OFF -DBUILD_SHARED_LIBS=OFF 
-DLWS_WITHOUT_TESTAPPS=ON -DLWS_IPV6=ON -DLWS_WITH_SSL=ON 
-DLWS_WITH_LIBEV=OFF -DLWS_WITH_LIBUV=OFF )
-- The C compiler identification is GNU 4.9.3
-- Check for working C compiler: 
/gitrepos/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-gcc
-- Check for working C compiler: 
/gitrepos/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-gcc 
-- works
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Detecting C compile features
-- Detecting C compile features - done
-- 
CMAKE_TOOLCHAIN_FILE='/gitrepos/buildroot/output/host/usr/share/buildroot/toolchainfile.cmake'
-- Found Git: /usr/bin/git
Git commit hash: root at debian605-2016.02-2-gab6c851
-- Performing Test LWS_HAVE_inline
-- Performing Test LWS_HAVE_inline - Success
-- Performing Test LWS_HAVE___inline__
-- Performing Test LWS_HAVE___inline__ - Success
-- Performing Test LWS_HAVE___inline
-- Performing Test LWS_HAVE___inline - Success
-- Looking for bzero
-- Looking for bzero - found
-- Looking for fork
-- Looking for fork - found
-- Looking for getenv
-- Looking for getenv - found
-- Looking for malloc
-- Looking for malloc - found
-- Looking for memset
-- Looking for memset - found
-- Looking for realloc
-- Looking for realloc - found
-- Looking for socket
-- Looking for socket - found
-- Looking for strerror
-- Looking for strerror - found
-- Looking for vfork
-- Looking for vfork - found
-- Looking for getifaddrs
-- Looking for getifaddrs - found
-- Looking for dlfcn.h
-- Looking for dlfcn.h - not found
-- Looking for fcntl.h
-- Looking for fcntl.h - found
-- Looking for in6addr.h
-- Looking for in6addr.h - not found
-- Looking for inttypes.h
-- Looking for inttypes.h - found
-- Looking for memory.h
-- Looking for memory.h - found
-- Looking for netinet/in.h
-- Looking for netinet/in.h - found
-- Looking for stdint.h
-- Looking for stdint.h - found
-- Looking for stdlib.h
-- Looking for stdlib.h - found
-- Looking for strings.h
-- Looking for strings.h - found
-- Looking for string.h
-- Looking for string.h - found
-- Looking for sys/prctl.h
-- Looking for sys/prctl.h - found
-- Looking for sys/socket.h
-- Looking for sys/socket.h - found
-- Looking for sys/stat.h
-- Looking for sys/stat.h - found
-- Looking for sys/types.h
-- Looking for sys/types.h - found
-- Looking for unistd.h
-- Looking for unistd.h - found
-- Looking for vfork.h
-- Looking for vfork.h - not found
-- Looking for zlib.h
-- Looking for zlib.h - found
-- Looking for 4 include files stdlib.h, ..., float.h
-- Looking for 4 include files stdlib.h, ..., float.h - found
-- Performing Test LWS_HAVE_VISIBILITY
-- Performing Test LWS_HAVE_VISIBILITY - Success
-- Found ZLIB: 
/gitrepos/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/libz.a 
(found version "1.2.8")
zlib include dirs: 
/gitrepos/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include
zlib libraries: 
/gitrepos/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/libz.a
Compiling with SSL support
-- Found OpenSSL: 
/gitrepos/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/libssl.a;/gitrepos/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/libcrypto.a 
(found version "1.0.2g")
OpenSSL include dir: 
/gitrepos/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include
OpenSSL libraries: 
/gitrepos/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/libssl.a;/gitrepos/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/libcrypto.a
Generating API documentation
-- Looking for RPMTools... - rpmbuild NOT FOUND
---------------------------------------------------------------------
   Settings:  (For more help do cmake -LH <srcpath>)
---------------------------------------------------------------------
  LWS_WITH_STATIC = ON
  LWS_WITH_SHARED = ON
  LWS_WITH_SSL = ON (SSL Support)
  LWS_SSL_CLIENT_USE_OS_CA_CERTS = 1
  LWS_USE_WOLFSSL = OFF (wolfSSL/CyaSSL replacement for OpenSSL)
  LWS_WITHOUT_BUILTIN_SHA1 = OFF
  LWS_WITHOUT_BUILTIN_GETIFADDRS = OFF
  LWS_WITHOUT_CLIENT = OFF
  LWS_WITHOUT_SERVER = OFF
  LWS_LINK_TESTAPPS_DYNAMIC = OFF
  LWS_WITHOUT_TESTAPPS = ON
  LWS_WITHOUT_TEST_SERVER = OFF
  LWS_WITHOUT_TEST_SERVER_EXTPOLL = OFF
  LWS_WITHOUT_TEST_PING = OFF
  LWS_WITHOUT_TEST_ECHO = OFF
  LWS_WITHOUT_TEST_CLIENT = OFF
  LWS_WITHOUT_TEST_FRAGGLE = OFF
  LWS_WITHOUT_EXTENSIONS = OFF
  LWS_WITH_LATENCY = OFF
  LWS_WITHOUT_DAEMONIZE = ON
  LWS_USE_LIBEV =
  LWS_USE_LIBUV =
  LWS_IPV6 = ON
  LWS_WITH_HTTP2 = OFF
  LWS_MBED3 = OFF
  LWS_SSL_SERVER_WITH_ECDH_CERT = OFF
  LWS_MAX_SMP = 32
---------------------------------------------------------------------
-- Configuring done
-- Generating done
CMake Warning:
   Manually-specified variables were not used by the project:

     BUILD_DOC
     BUILD_DOCS
     BUILD_EXAMPLE
     BUILD_EXAMPLES
     BUILD_TEST
     BUILD_TESTING
     BUILD_TESTS


-- Build files have been written to: 
/gitrepos/buildroot/output/build/libwebsockets-v1.7.2
 >>> libwebsockets v1.7.2 Building
PATH="/gitrepos/buildroot/output/host/bin:/gitrepos/buildroot/output/host/sbin:/gitrepos/buildroot/output/host/usr/bin:/gitrepos/buildroot/output/host/usr/sbin:/root/google-cloud-sdk/bin:/home/buildroot12git/output/host/usr/bin:/home/buildroot12git/output/build/host-cmake-3.1.3/bin:/root/google-cloud-sdk/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" 
/usr/bin/make -j5  -C /gitrepos/buildroot/output/build/libwebsockets-v1.7.2/
make[1]: Entering directory 
`/gitrepos/buildroot/output/build/libwebsockets-v1.7.2'
make[2]: Entering directory 
`/gitrepos/buildroot/output/build/libwebsockets-v1.7.2'
make[3]: Entering directory 
`/gitrepos/buildroot/output/build/libwebsockets-v1.7.2'
make[3]: Entering directory 
`/gitrepos/buildroot/output/build/libwebsockets-v1.7.2'
Scanning dependencies of target websockets
Scanning dependencies of target websockets_shared
make[3]: Leaving directory 
`/gitrepos/buildroot/output/build/libwebsockets-v1.7.2'
make[3]: Leaving directory 
`/gitrepos/buildroot/output/build/libwebsockets-v1.7.2'
make[3]: Entering directory 
`/gitrepos/buildroot/output/build/libwebsockets-v1.7.2'
[  2%] Building C object CMakeFiles/websockets.dir/lib/base64-decode.c.o
[  4%] Building C object CMakeFiles/websockets.dir/lib/handshake.c.o
make[3]: Entering directory 
`/gitrepos/buildroot/output/build/libwebsockets-v1.7.2'
[  7%] Building C object CMakeFiles/websockets.dir/lib/libwebsockets.c.o
[  9%] Building C object CMakeFiles/websockets.dir/lib/service.c.o
[ 11%] Building C object 
CMakeFiles/websockets_shared.dir/lib/base64-decode.c.o
[ 14%] Building C object CMakeFiles/websockets.dir/lib/pollfd.c.o
[ 16%] Building C object CMakeFiles/websockets_shared.dir/lib/handshake.c.o
[ 19%] Building C object CMakeFiles/websockets.dir/lib/output.c.o
[ 21%] Building C object 
CMakeFiles/websockets_shared.dir/lib/libwebsockets.c.o
[ 23%] Building C object CMakeFiles/websockets.dir/lib/parsers.c.o
[ 26%] Building C object CMakeFiles/websockets_shared.dir/lib/service.c.o
[ 28%] Building C object CMakeFiles/websockets.dir/lib/context.c.o
[ 30%] Building C object CMakeFiles/websockets.dir/lib/alloc.c.o
[ 33%] Building C object CMakeFiles/websockets_shared.dir/lib/pollfd.c.o
[ 35%] Building C object CMakeFiles/websockets.dir/lib/header.c.o
[ 38%] Building C object CMakeFiles/websockets.dir/lib/client.c.o
[ 40%] Building C object CMakeFiles/websockets_shared.dir/lib/output.c.o
[ 42%] Building C object CMakeFiles/websockets_shared.dir/lib/parsers.c.o
[ 45%] Building C object CMakeFiles/websockets_shared.dir/lib/context.c.o
[ 47%] Building C object CMakeFiles/websockets_shared.dir/lib/alloc.c.o
[ 50%] Building C object CMakeFiles/websockets.dir/lib/client-handshake.c.o
[ 52%] Building C object CMakeFiles/websockets_shared.dir/lib/header.c.o
[ 54%] Building C object CMakeFiles/websockets_shared.dir/lib/client.c.o
[ 57%] Building C object 
CMakeFiles/websockets_shared.dir/lib/client-handshake.c.o
[ 59%] Building C object 
CMakeFiles/websockets_shared.dir/lib/client-parser.c.o
[ 61%] Building C object CMakeFiles/websockets.dir/lib/client-parser.c.o
[ 64%] Building C object CMakeFiles/websockets_shared.dir/lib/ssl.c.o
[ 66%] Building C object CMakeFiles/websockets_shared.dir/lib/sha-1.c.o
[ 69%] Building C object 
CMakeFiles/websockets_shared.dir/lib/lws-plat-unix.c.o
[ 71%] Building C object CMakeFiles/websockets.dir/lib/ssl.c.o
[ 73%] Building C object CMakeFiles/websockets_shared.dir/lib/server.c.o
[ 76%] Building C object 
CMakeFiles/websockets_shared.dir/lib/server-handshake.c.o
[ 78%] Building C object CMakeFiles/websockets_shared.dir/lib/extension.c.o
[ 80%] Building C object 
CMakeFiles/websockets_shared.dir/lib/extension-permessage-deflate.c.o
[ 83%] Building C object CMakeFiles/websockets.dir/lib/sha-1.c.o
[ 85%] Building C object CMakeFiles/websockets.dir/lib/lws-plat-unix.c.o
[ 88%] Building C object CMakeFiles/websockets.dir/lib/server.c.o
[ 92%] Linking C shared library lib/libwebsockets.so
[ 92%] Building C object CMakeFiles/websockets.dir/lib/server-handshake.c.o
[ 95%] Building C object CMakeFiles/websockets.dir/lib/extension.c.o
[ 97%] Building C object 
CMakeFiles/websockets.dir/lib/extension-permessage-deflate.c.o
/gitrepos/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/libc.a(__uClibc_main.os): 
In function `__uClibc_fini':
__uClibc_main.c:(.text+0x12c): undefined reference to `__fini_array_end'
__uClibc_main.c:(.text+0x130): undefined reference to `__fini_array_start'
__uClibc_main.c:(.text+0x134): undefined reference to `__fini_array_start'
/gitrepos/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/libc.a(__uClibc_main.os): 
In function `__uClibc_main':
__uClibc_main.c:(.text+0x544): undefined reference to 
`__preinit_array_start'
__uClibc_main.c:(.text+0x548): undefined reference to `__preinit_array_end'
__uClibc_main.c:(.text+0x54c): undefined reference to 
`__preinit_array_start'
__uClibc_main.c:(.text+0x550): undefined reference to `__init_array_start'
__uClibc_main.c:(.text+0x554): undefined reference to `__init_array_end'
__uClibc_main.c:(.text+0x558): undefined reference to `__init_array_start'
/gitrepos/buildroot/output/host/usr/lib/gcc/arm-buildroot-linux-uclibcgnueabihf/4.9.3/../../../../arm-buildroot-linux-uclibcgnueabihf/bin/ld: 
lib/libwebsockets.so.7: hidden symbol `__init_array_end' isn't defined
/gitrepos/buildroot/output/host/usr/lib/gcc/arm-buildroot-linux-uclibcgnueabihf/4.9.3/../../../../arm-buildroot-linux-uclibcgnueabihf/bin/ld: 
final link failed: Bad value
collect2: error: ld returned 1 exit status
make[3]: *** [lib/libwebsockets.so.7] Error 1
make[3]: Leaving directory 
`/gitrepos/buildroot/output/build/libwebsockets-v1.7.2'
make[2]: *** [CMakeFiles/websockets_shared.dir/all] Error 2
make[2]: *** Waiting for unfinished jobs....
[100%] Linking C static library lib/libwebsockets.a
make[3]: Leaving directory 
`/gitrepos/buildroot/output/build/libwebsockets-v1.7.2'
[100%] Built target websockets
make[2]: Leaving directory 
`/gitrepos/buildroot/output/build/libwebsockets-v1.7.2'
make[1]: *** [all] Error 2
make[1]: Leaving directory 
`/gitrepos/buildroot/output/build/libwebsockets-v1.7.2'
make: *** 
[/gitrepos/buildroot/output/build/libwebsockets-v1.7.2/.stamp_built] Error 2
root at debian605:/gitrepos/buildroot#
