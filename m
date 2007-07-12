From: Francois Visconte <fv@kh3.org>
Date: Thu, 12 Jul 2007 11:44:18 +0200
Subject: [Buildroot] Problem building buildroot SVN under ia64
Message-ID: <4695F7F2.6080208@kh3.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'm trying to compile buildroot SVN (from today) from amd64 to ia64
(itanium2).
The problem occures when compiling the gcc cross compiler (same error on
gcc 3.4/4.1.2/4.2.0)
The problem seems to come from
"toolchain_build_ia64/gcc-4.2.0/gcc/config.gcc" where
the variable "supported_defaults"  is not set for ia64. The result is
the following error during gcc compile:


-------------------------------
Checking build system dependencies:
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
C compiler version '4.1.2':                     Ok
C++ compiler '/usr/bin/g++'
C++ compiler version '4.1.2':                   Ok
bison installed:                                Ok
flex installed:                                 Ok
gettext installed:                              Ok
makeinfo installed:                             Ok
Build system dependencies:                      Ok

make -j1 -C
/home/users/admin/visconte/pipol-deploy/tests/buildroot/toolchain_build_ia64/gcc-4.2.0-initial 

all-gcc
make[1]: Entering directory
`/home/users/admin/visconte/pipol-deploy/tests/buildroot/toolchain_build_ia64/gcc-4.2.0-initial'
Configuring in ./gcc
configure: loading cache ./config.cache
checking build system type... x86_64-pc-linux-gnu
[...]
checking whether sigaltstack is declared... yes
checking for struct tms... yes
checking for clock_t... yes
checking for .preinit_array/.init_array/.fini_array support... yes
checking if mkdir takes one argument... no
This target does not support --with-tune.
Valid --with options are:
make[1]: *** [configure-gcc] Error 1
make[1]: Leaving directory
`/home/users/admin/visconte/pipol-deploy/tests/buildroot/toolchain_build_ia64/gcc-4.2.0-initial'
make: ***
[/home/users/admin/visconte/pipol-deploy/tests/buildroot/toolchain_build_ia64/gcc-4.2.0-initial/.compiled] 

Error 2
---------------------------------------------------


Cheers,
Fran?ois VISCONTE
