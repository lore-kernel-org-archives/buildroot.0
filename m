From: thomas.luo <thomas.luo@ieee.org>
Date: Wed, 17 Jan 2007 09:03:13 +0800
Subject: [Buildroot] build root error with nofpu
Message-ID: <005501c739d4$a189ef90$0696a8c0@Thomas>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[root at localhost buildroot]# make

Checking build system dependencies:
CC clean:                                       Ok
CXX clean:                                      Ok
CPP clean:                                      Ok
CFLAGS clean:                                   Ok
CXXFLAGS clean:                                 Ok
sed works:                                      Ok
which installed:                                Ok
GNU make version '3.80':                        Ok
C compiler '/usr/bin/gcc'
C compiler version '3.4.6':                     Ok
bison installed:                                Ok
flex installed:                                 Ok
gettext installed:                              Ok
Build system dependencies:                      Ok

make -C /mnt/rootbb/buildroot/toolchain_build_arm_nofpu/uClibc \
        PREFIX= \
        DEVEL_PREFIX=/mnt/rootbb/buildroot/build_arm_nofpu/staging_dir/ \
        RUNTIME_PREFIX=/mnt/rootbb/buildroot/build_arm_nofpu/staging_dir/ \
        install_runtime install_dev
make[1]: Entering directory `/mnt/rootbb/buildroot/toolchain_build_arm_nofpu/uClibc'
install -d /mnt/rootbb/buildroot/build_arm_nofpu/staging_dir/lib
install -m 644 lib/lib*-0.9.29.so \
        /mnt/rootbb/buildroot/build_arm_nofpu/staging_dir/lib
install: cannot stat `lib/lib*-0.9.29.so': No such file or directory
make[1]: *** [install_runtime] ?????? 1
make[1]: Leaving directory `/mnt/rootbb/buildroot/toolchain_build_arm_nofpu/uClibc'
make: *** [/mnt/rootbb/buildroot/build_arm_nofpu/staging_dir/lib/libc.a] ?????? 
