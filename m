From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 14 May 2018 08:02:57 +0000
Subject: [Buildroot] [Bug 11016] New: Wrong compiler used for external user
 host packages
Message-ID: <bug-11016-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11016

            Bug ID: 11016
           Summary: Wrong compiler used for external user host packages
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: ian_ormshaw at waters.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

I am building on CentOs from the head of master.

I have a number of packages in the BR2_EXTERNAL file structure that require
c++14 to compile.  I have configured buildroot to use gcc 7.  However for host
packages the native compiler is being used not the one built as a part of
buildroot.  The build output and package config files are included below.

>>> host-amstParseSharedLibraries custom Configuring
(mkdir -p
/home/ian/build/silverstone/x86_64/1c622ae/buildroot/build/host-amstParseSharedLibraries-custom/
&& cd
/home/ian/build/silverstone/x86_64/1c622ae/buildroot/build/host-amstParseSharedLibraries-custom/
&& rm -f CMakeCache.txt &&
PATH="/home/ian/build/silverstone/x86_64/1c622ae/buildroot/host/bin:/home/ian/build/silverstone/x86_64/1c622ae/buildroot/host/sbin:/usr/lib64/qt-3.3/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/home/ian/.local/bin:/home/ian/bin"
PKG_CONFIG="/home/ian/build/silverstone/x86_64/1c622ae/buildroot/host/bin/pkg-config"
PKG_CONFIG_SYSROOT_DIR="/"
PKG_CONFIG_LIBDIR="/home/ian/build/silverstone/x86_64/1c622ae/buildroot/host/lib/pkgconfig:/home/ian/build/silverstone/x86_64/1c622ae/buildroot/host/share/pkgconfig"
PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 
/home/ian/build/silverstone/x86_64/1c622ae/buildroot/host/bin/cmake
/home/ian/build/silverstone/x86_64/1c622ae/buildroot/build/host-amstParseSharedLibraries-custom/
-DCMAKE_INSTALL_SO_NO_EXE=0
-DCMAKE_FIND_ROOT_PATH="/home/ian/build/silverstone/x86_64/1c622ae/buildroot/host"
-DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM="BOTH"
-DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY="BOTH"
-DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE="BOTH"
-DCMAKE_INSTALL_PREFIX="/home/ian/build/silverstone/x86_64/1c622ae/buildroot/host"
-DCMAKE_C_FLAGS="-O2
-I/home/ian/build/silverstone/x86_64/1c622ae/buildroot/host/include"
-DCMAKE_CXX_FLAGS="-O2
-I/home/ian/build/silverstone/x86_64/1c622ae/buildroot/host/include"
-DCMAKE_EXE_LINKER_FLAGS="-L/home/ian/build/silverstone/x86_64/1c622ae/buildroot/host/lib
-Wl,-rpath,/home/ian/build/silverstone/x86_64/1c622ae/buildroot/host/lib"
-DCMAKE_SHARED_LINKER_FLAGS="-L/home/ian/build/silverstone/x86_64/1c622ae/buildroot/host/lib
-Wl,-rpath,/home/ian/build/silverstone/x86_64/1c622ae/buildroot/host/lib"
-DCMAKE_ASM_COMPILER="/usr/bin/as" -DCMAKE_C_COMPILER="/usr/bin/gcc"
-DCMAKE_CXX_COMPILER="/usr/bin/g++"  -DCMAKE_C_COMPILER_ARG1=""
-DCMAKE_CXX_COMPILER_ARG1=""  -DCMAKE_COLOR_MAKEFILE=OFF -DBUILD_DOC=OFF
-DBUILD_DOCS=OFF -DBUILD_EXAMPLE=OFF -DBUILD_EXAMPLES=OFF -DBUILD_TEST=OFF
-DBUILD_TESTS=OFF -DBUILD_TESTING=OFF  -DCMAKE_CXX_FLAGS="-fPIC -Wall -Wextra
-Wpedantic -Werror -std=gnu++14" -DAMSTPARSESHAREDLIBRARIES=On )
-- The C compiler identification is GNU 4.8.5
-- The CXX compiler identification is unknown
-- Check for working C compiler: /usr/bin/gcc
-- Check for working C compiler: /usr/bin/gcc -- works
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Detecting C compile features
-- Detecting C compile features - done
-- Check for working CXX compiler: /usr/bin/g++
-- Check for working CXX compiler: /usr/bin/g++ -- broken
CMake Error at
/home/ian/build/silverstone/x86_64/1c622ae/buildroot/host/share/cmake-3.8/Modules/CMakeTestCXXCompiler.cmake:44
(message):
  The C++ compiler "/usr/bin/g++" is not able to compile a simple test
  program.

  It fails with the following output:

   Change Dir:
/home/ian/build/silverstone/x86_64/1c622ae/buildroot/build/host-amstParseSharedLibraries-custom/CMakeFiles/CMakeTmp



  Run Build Command:"/usr/bin/gmake" "cmTC_e7a5c/fast"

  gmake[3]: Entering directory
 
`/home/ian/build/silverstone/x86_64/1c622ae/buildroot/build/host-amstParseSharedLibraries-custom/CMakeFiles/CMakeTmp'


  /usr/bin/gmake -f CMakeFiles/cmTC_e7a5c.dir/build.make
  CMakeFiles/cmTC_e7a5c.dir/build

  gmake[4]: Entering directory
 
`/home/ian/build/silverstone/x86_64/1c622ae/buildroot/build/host-amstParseSharedLibraries-custom/CMakeFiles/CMakeTmp'


  Building CXX object CMakeFiles/cmTC_e7a5c.dir/testCXXCompiler.cxx.o

  /usr/bin/g++ -fPIC -Wall -Wextra -Wpedantic -Werror -std=gnu++14 -o
  CMakeFiles/cmTC_e7a5c.dir/testCXXCompiler.cxx.o -c
 
/home/ian/build/silverstone/x86_64/1c622ae/buildroot/build/host-amstParseSharedLibraries-custom/CMakeFiles/CMakeTmp/testCXXCompiler.cxx


  g++: error: unrecognized command line option ?-std=gnu++14?

  gmake[4]: *** [CMakeFiles/cmTC_e7a5c.dir/testCXXCompiler.cxx.o] Error 1

  gmake[4]: Leaving directory
 
`/home/ian/build/silverstone/x86_64/1c622ae/buildroot/build/host-amstParseSharedLibraries-custom/CMakeFiles/CMakeTmp'


  gmake[3]: *** [cmTC_e7a5c/fast] Error 2

  gmake[3]: Leaving directory
 
`/home/ian/build/silverstone/x86_64/1c622ae/buildroot/build/host-amstParseSharedLibraries-custom/CMakeFiles/CMakeTmp'






  CMake will not be able to correctly generate this project.
Call Stack (most recent call first):
  CMakeLists.txt:2 (project)


-- Configuring incomplete, errors occurred!
See also
"/home/ian/build/silverstone/x86_64/1c622ae/buildroot/build/host-amstParseSharedLibraries-custom/CMakeFiles/CMakeOutput.log".
See also
"/home/ian/build/silverstone/x86_64/1c622ae/buildroot/build/host-amstParseSharedLibraries-custom/CMakeFiles/CMakeError.log".
make[2]: ***
[/home/ian/build/silverstone/x86_64/1c622ae/buildroot/build/host-amstParseSharedLibraries-custom/.stamp_configured]
Error 1
make[1]: *** [_all] Error 2
make[1]: Leaving directory `/home/ian/amst/buildroot'
make: *** [buildroot] Error 2

#########
Config.in
#########

config BR2_PACKAGE_AMSTLINUXLIBRARIES
    bool "Linux Libraries"
    depends on BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS

comment "Linux Libraries needs a toolchain with glibc"
        depends on !BR2_TOOLCHAIN_BUILDROOT_GLIBC

comment "Linux Libraries needs a toolchain with threading support"
        depends on !BR2_TOOLCHAIN_HAS_THREADS


################################################################################
#
# amstLinuxLibraries.mk
#
################################################################################

AMSTLINUXLIBRARIES_VERSION           = 0.0.1
AMSTLINUXLIBRARIES_SITE              = $(BR2_EXTERNAL)/source/libraries
AMSTLINUXLIBRARIES_SITE_METHOD       = local
AMSTLINUXLIBRARIES_DEPENDENCIES      = host-amstLinuxLibraries
AMSTLINUXLIBRARIES_INSTALL_TARGET    = YES
AMSTLINUXLIBRARIES_INSTALL_STAGING   = YES
AMSTLINUXLIBRARIES_CONF_OPTS         =
-DCMAKE_CXX_FLAGS="$(AMSTLINUXLIBRARIES_COMMON_CXX_FLAGS)"
-DAMSTLINUXLIBRARIES=On
HOST_AMSTLINUXLIBRARIES_CONF_OPTS    =
-DCMAKE_CXX_COMPILER=$(HOST_DIR)/bin/x86_64-linux-g++
-DCMAKE_CXX_FLAGS="$(HOST_CPPFLAGS) $(AMSTLINUXLIBRARIES_COMMON_CXX_FLAGS)"
-DAMSTLINUXLIBRARIES=On

$(eval $(cmake-package))
$(eval $(host-cmake-package))

-- 
You are receiving this mail because:
You are on the CC list for the bug.
