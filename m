From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Jan 2013 11:55:15 +0100
Subject: [Buildroot] x86-64 toolchain without threads does not build
Message-ID: <20130114115515.106bce7e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

For some reason, it seems that building a x86-64 toolchain without
thread support is not possible. Trying to build the following
defconfig:

BR2_x86_64=y
BR2_x86_atom=y
BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PTHREADS_NONE=y
BR2_INIT_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
# BR2_TARGET_ROOTFS_TAR is not set

leads to:

/opt/toolchain-build/toolchain/gcc-4.6.3/libgcc/generic-morestack-thread.c:39:21: fatal error: pthread.h: No such file or directory
compilation terminated.
make[2]: *** [generic-morestack-thread.o] Error 1
make[2]: *** Waiting for unfinished jobs....
make[2]: Leaving directory `/opt/toolchain-build/toolchain/gcc-4.6.3-intermediate/x86_64-buildroot-linux-uclibc/libgcc'
make[1]: *** [all-target-libgcc] Error 2
make[1]: Leaving directory `/opt/toolchain-build/toolchain/gcc-4.6.3-intermediate'

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
