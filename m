From: Andrew Pham <andrew2007vn@yahoo.com>
Date: Thu, 10 May 2007 14:35:06 -0700 (PDT)
Subject: [Buildroot] Could not compile buildroot
Message-ID: <945223.44926.qm@web57415.mail.re1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello everybody,

I was trying to compile buildroot packages but it failed with error messages as below:

which: no sed in (/usr/bin)
which: no sed in (/usr/bin)
which: no sed in (/usr/bin)
if [ ! -e "/Development/buildroot/toolchain_build_arm_nofpu/bin/sed" ] ; then \
        mkdir -p "/Development/buildroot/toolchain_build_arm_nofpu/bin"; \
        rm -f "/Development/buildroot/toolchain_build_arm_nofpu/bin/sed"; \
        ln -sf "/bin/sed" "/Development/buildroot/toolchain_build_arm_nofpu/bin/sed"; \
fi

Checking build system dependencies:
CC clean:                                       Ok
CXX clean:                                      Ok
CPP clean:                                      Ok
CFLAGS clean:                                   Ok
INCLUDES clean:                                 Ok
CXXFLAGS clean:                                 Ok
which installed:                                Ok
which: no sed in (/usr/bin)
sed works:                                      Ok (/bin/sed)
GNU make version '3.80':                        Ok
C compiler '/usr/bin/gcc'
C compiler version '4.1.0':                     Ok
C++ compiler '/usr/bin/c++'
C++ compiler version '4.1.0':                   Ok
bison installed:                                Ok
flex installed:                                 Ok
gettext installed:                              Ok
makeinfo installed:                             Ok
Build system dependencies:                      Ok

make MAKE="make -j1" -C /Development/buildroot/toolchain_build_arm_nofpu/uClibc \
        PREFIX= \
        DEVEL_PREFIX=/ \
        RUNTIME_PREFIX=/ \
        HOSTCC="gcc" \
        all
arm-linux-uclibc-gcc: Y: No such file or directory
make[1]: Entering directory `/Development/buildroot/toolchain_build_arm_nofpu/uClibc'
arm-linux-uclibc-gcc: Y: No such file or directory
make[2]: `conf' is up to date.
arm-linux-uclibc-gcc: Y: No such file or directory
  AS ldso/ldso/arm/resolve.oS
arm-linux-uclibc-gcc: Y: No such file or directory
make[1]: *** [ldso/ldso/arm/resolve.oS] Error 1
make[1]: Leaving directory `/Development/buildroot/toolchain_build_arm_nofpu/uClibc'
make: *** [/Development/buildroot/toolchain_build_arm_nofpu/uClibc/lib/libc.a] Error 2

Have any of you seen this before? What should I do to fix it?

Thanks,
Andrew.

       
---------------------------------
Ahhh...imagining that irresistible "new car" smell?
 Check outnew cars at Yahoo! Autos.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070510/ffda3a72/attachment.htm 
