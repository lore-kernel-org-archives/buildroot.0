From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 15 Nov 2013 13:12:29 +0100
Subject: [Buildroot] [PATCH v2] uclibc: patch 0.9.31 for avr32,
	to add __kernel_long_t and __kernel_ulong_t data types
In-Reply-To: <1384508285-24489-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Fri, 15 Nov 2013 09:38:05 +0000")
References: <1384508285-24489-1-git-send-email-spdawson@gmail.com>
Message-ID: <874n7d279u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 > From: Simon Dawson <spdawson@gmail.com>
 > As reported by Thomas Petazzoni, the uclibc 0.9.31 build fails for avr32:

 > In file included from /opt/br-avr32-full-2013.11-rc1/usr/avr32-buildroot-linux-uclibc/sysroot/usr/include/linux/kernel.h:4,
 >                  from /opt/br-avr32-full-2013.11-rc1/usr/avr32-buildroot-linux-uclibc/sysroot/usr/include/linux/netlink.h:4,
 >                  from /opt/br-avr32-full-2013.11-rc1/usr/avr32-buildroot-linux-uclibc/sysroot/usr/include/linux/rtnetlink.h:5,
 >                  from libc/inet/netlinkaccess.h:27,
 >                  from libc/inet/if_index.c:36:
 > /opt/br-avr32-full-2013.11-rc1/usr/avr32-buildroot-linux-uclibc/sysroot/usr/include/linux/sysinfo.h:8: error: expected specifier-qualifier-list before '__kernel_long_t'
 > make[1]: *** [libc/inet/if_index.os] Error 1
 > make[1]: Leaving directory `/opt/toolchain-build/build/uclibc-0.9.31.1'

 > The problem is reported at:

 >   https://lkml.org/lkml/2013/5/18/1

Committed, thanks.

-- 
Bye, Peter Korsgaard
