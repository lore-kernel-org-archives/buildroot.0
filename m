From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 8 Nov 2013 08:22:43 +0100
Subject: [Buildroot] [PATCH] avr32: disable kernel headers
In-Reply-To: <1383859843-3549-1-git-send-email-spdawson@gmail.com>
References: <1383859843-3549-1-git-send-email-spdawson@gmail.com>
Message-ID: <20131108082243.1a889fee@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Simon,

On Thu,  7 Nov 2013 21:30:43 +0000, spdawson at gmail.com wrote:
> From: Simon Dawson <spdawson@gmail.com>
> 
> Using kernel headers newer than 3.6.x, uclibc fails to build:
> 
>   In file included from output/host/usr/avr32-buildroot-linux-uclibc/sysroot/usr/include/linux/rtnetlink.h:6,
>                  from libc/inet/netlinkaccess.h:34,
>                  from libc/inet/if_index.c:36:
>   output/host/usr/avr32-buildroot-linux-uclibc/sysroot/usr/include/linux/if_link.h:314: error: expected specifier-qualifier-list before '__be16'
>   make[1]: *** [libc/inet/if_index.os] Error 1
>   make[1]: Leaving directory `output/build/uclibc-0.9.31.1'
>   make: *** [output/build/uclibc-0.9.31.1/.stamp_built] Error 2
> 
> Disable kernel headers newer than 3.6.x on avr32, and update atngw100 and
> atstk100x defconfigs to use kernel headers that avoid the uclibc build
> problem.

How much effort is it to instead fix uClibc to not break with more
recent kernel headers? It seems a little bit annoying to me that we
need to carry this !BR2_avr32 dependency for all new kernel headers
version. If the fix is one or two simple patches for uClibc 0.9.31, it
might be worthwhile.

And if it's not the case, I believe I'd prefer the dependency to be on
the uClibc version (i.e 'depends on !BR2_PACKAGE_UCLIBC_0_9_31')
instead of on the architecture, because the problem seem more related
to the uClibc version rather than the architecture.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
