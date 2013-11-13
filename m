From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Nov 2013 22:36:46 +0100
Subject: [Buildroot] AVR32 toolchain build failure
Message-ID: <20131113223646.66a7a61b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Simon,

I've tried to build an AVR32 toolchain with 2013.11-rc1, with the
following defconfig:

BR2_avr32=y
BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_INIT_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
# BR2_TARGET_ROOTFS_TAR is not set

and the build failed with:

In file included from /opt/br-avr32-full-2013.11-rc1/usr/avr32-buildroot-linux-uclibc/sysroot/usr/include/linux/kernel.h:4,
                 from /opt/br-avr32-full-2013.11-rc1/usr/avr32-buildroot-linux-uclibc/sysroot/usr/include/linux/netlink.h:4,
                 from /opt/br-avr32-full-2013.11-rc1/usr/avr32-buildroot-linux-uclibc/sysroot/usr/include/linux/rtnetlink.h:5,
                 from libc/inet/netlinkaccess.h:27,
                 from libc/inet/if_index.c:36:
/opt/br-avr32-full-2013.11-rc1/usr/avr32-buildroot-linux-uclibc/sysroot/usr/include/linux/sysinfo.h:8: error: expected specifier-qualifier-list before '__kernel_long_t'
make[1]: *** [libc/inet/if_index.os] Error 1
make[1]: Leaving directory `/opt/toolchain-build/build/uclibc-0.9.31.1'

It is apparently reported at:

  https://lkml.org/lkml/2013/5/18/1

However, I've also built several other toolchains with the same
Buildroot version and haven't had any problem.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
