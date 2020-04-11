From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Apr 2020 10:12:17 +0200
Subject: [Buildroot] [PATCH v1] package/ell: fix compile with older
 toolchains
In-Reply-To: <20200409203500.18857-1-ps.report@gmx.net>
References: <20200409203500.18857-1-ps.report@gmx.net>
Message-ID: <20200411101217.1237fe4f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  9 Apr 2020 22:35:00 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> Older toolchains need to include sys/types.h and sys/socket.h before
> linux/if.h, RTA_PREF was introduces with linux-4.1.x.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/2d1/2d1a3f82abb8475d39908b22f775c2dac781f330
> 
>   In file included from ell/rtnl.c:28:0:
>   .../host/arm-buildroot-linux-gnueabi/sysroot/usr/include/linux/if.h:185:19: error: field 'ifru_addr' has incomplete type
>   .../host/arm-buildroot-linux-gnueabi/sysroot/usr/include/linux/if.h:186:19: error: field 'ifru_dstaddr' has incomplete type
>   .../host/arm-buildroot-linux-gnueabi/sysroot/usr/include/linux/if.h:187:19: error: field 'ifru_broadaddr' has incomplete type
>   .../host/arm-buildroot-linux-gnueabi/sysroot/usr/include/linux/if.h:188:19: error: field 'ifru_netmask' has incomplete type
>   .../arm-buildroot-linux-gnueabi/sysroot/usr/include/linux/if.h:189:20: error: field 'ifru_hwaddr' has incomplete type
>   ell/rtnl.c: In function 'l_rtnl_route_extract':
>   ell/rtnl.c:120:8: error: 'RTA_PREF' undeclared (first use in this function)
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...nl-fix-compile-with-older-toolchains.patch | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 package/ell/0002-ell-rtnl-fix-compile-with-older-toolchains.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
