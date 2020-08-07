From: Vijay <techvd@gmail.com>
Date: Thu, 6 Aug 2020 19:44:53 -0700
Subject: [Buildroot] Having trouble getting a simple cmake based custom
 package to wok
Message-ID: <CAOnXkYtSxw2+0VKtNTVsD8Eb36nGfAdBNY3hnSWg2tFtM_wwAg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm trying to add a simple, custom cmake based package to my buildroot
build. It's just a simple hello world program so that's not very
interesting. Here is my .mk file, which is the minimum version required I
believe.

MYTOOLS_VERSION=1.0
MYTOOLS_SITE=$(HOME)/Work/mytools
MYTOOLS_SITE_METHOD=local

$(eval $(cmake-package))

When I configure this and kick off the build, Cmake seems to be having
trouble with the cross compiler. Below is the output: Is there any
additional configuration that I need to do?

I'm using the latest 2020.05.01 version of buildroot.

Any help is appreciated.

Thanks,
Vijay

>>> mytools 1.0 Configuring
(mkdir -p /home/foo/buildroot/output/build/mytools-1.0/ && cd
/home/foo/buildroot/output/build/mytools-1.0/ && rm -f CMakeCache.txt &&
PATH="/home/foo/buildroot/output/host/bin:/home/foo/buildroot/output/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
 /home/foo/buildroot/output/host/bin/cmake
/home/foo/buildroot/output/build/mytools-1.0/
-DCMAKE_TOOLCHAIN_FILE="/home/foo/buildroot/output/host/share/buildroot/toolchainfile.cmake"
-DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_COLOR_MAKEFILE=OFF -DBUILD_DOC=OFF
-DBUILD_DOCS=OFF -DBUILD_EXAMPLE=OFF -DBUILD_EXAMPLES=OFF -DBUILD_TEST=OFF
-DBUILD_TESTS=OFF -DBUILD_TESTING=OFF -DBUILD_SHARED_LIBS=ON   )
-- The C compiler identification is GNU 8.4.0
-- The CXX compiler identification is unknown
-- Check for working C compiler:
/home/foo/buildroot/output/host/bin/x86_64-buildroot-linux-uclibc-gcc
-- Check for working C compiler:
/home/foo/buildroot/output/host/bin/x86_64-buildroot-linux-uclibc-gcc --
works
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Detecting C compile features
-- Detecting C compile features - done
CMake Error at CMakeLists.txt:3 (project):
  The CMAKE_CXX_COMPILER:

    /home/foo/buildroot/output/host/bin/x86_64-buildroot-linux-uclibc-g++

  is not a full path to an existing compiler tool.

  Tell CMake where to find the compiler by setting either the environment
  variable "CXX" or the CMake cache entry CMAKE_CXX_COMPILER to the full
path
  to the compiler, or to the compiler name if it is in the PATH.


-- Configuring incomplete, errors occurred!
See also
"/home/foo/buildroot/output/build/mytools-1.0/CMakeFiles/CMakeOutput.log".
See also
"/home/foo/buildroot/output/build/mytools-1.0/CMakeFiles/CMakeError.log".
make[1]: *** [package/pkg-generic.mk:259:
/home/foo/buildroot/output/build/mytools-1.0/.stamp_configured] Error 1
make: *** [Makefile:84: _all] Error 2
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200806/8af56c9a/attachment.html>
