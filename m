From: Hamish Moffatt <hamish@cloud.net.au>
Date: Mon, 17 Nov 2008 10:46:22 +1100
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
In-Reply-To: <20081116172209.0137E3C6D4@busybox.net>
References: <20081116172209.0137E3C6D4@busybox.net>
Message-ID: <20081116234622.GG16858@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Nov 16, 2008 at 09:22:08AM -0800, jacmet at uclibc.org wrote:
> Author: jacmet
> Date: 2008-11-16 09:22:08 -0800 (Sun, 16 Nov 2008)
> New Revision: 24061
> 
> Log:
> busybox: 1.13.0 id patch (check)
> 
> Added:
>    trunk/buildroot/package/busybox/busybox-1.13.0-id.patch
> 
> 
> Changeset:
> Added: trunk/buildroot/package/busybox/busybox-1.13.0-id.patch
> ===================================================================
> --- trunk/buildroot/package/busybox/busybox-1.13.0-id.patch	                        (rev 0)
> +++ trunk/buildroot/package/busybox/busybox-1.13.0-id.patch	2008-11-16 17:22:08 UTC (rev 24061)
> @@ -0,0 +1,15 @@
> +--- busybox-1.13.0/coreutils/id.c	Wed Nov  5 22:39:54 2008
> ++++ busybox-1.13.0-id/coreutils/id.c	Sun Nov 16 15:59:46 2008
> +@@ -17,6 +17,12 @@
> + 
> + #include "libbb.h"
> + 
> ++#if defined(__UCLIBC_MAJOR__) && (__UCLIBC_MAJOR__ == 0)
> ++#if (__UCLIBC_MINOR__ < 9) || (__UCLIBC_MINOR__ == 9 &&  __UCLIBC_SUBLEVEL__ < 30)
> ++#error "Sorry, you need at least uClibc version 0.9.30 for id applet to build"
> ++#endif
> ++#endif
> ++
> + enum {
> + 	PRINT_REAL      = (1 << 0),
> + 	NAME_NOT_NUMBER = (1 << 1),

This patch isn't right, id builds if CONFIG_USE_BB_PWD_GRP=y.


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
