From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 15 Sep 2018 15:35:43 +0200
Subject: [Buildroot] [arc-buildroot] blktrace fails to build on ARC
In-Reply-To: <28CDE50B11B27541A655A517CC37BFF38DDDAA@de02wembxa.internal.synopsys.com>
References: <20180913095013.5f9ae2da@windsurf>
 <28CDE50B11B27541A655A517CC37BFF38DDDAA@de02wembxa.internal.synopsys.com>
Message-ID: <20180915153543.7418ad90@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Evgeniy,

On Sat, 15 Sep 2018 13:23:42 +0000, Evgeniy Didin wrote:

> Recently due to a patch
> https://git.busybox.net/buildroot/commit/?id=5a3f78c9191595f7ea9fab49360dfc18a743d28b
> some packages were enabled for ARC. Four of them (blktrace, lvm2,
> gadgetfs-test and libioo) are building with error, which points to
> some issues with "millicode" optimizations in toolchain, which had
> not occurred before. Currently we are studying this problem.

OK, thanks!

>  As a temporal solution until the issue is not resolved these
> packages can be disabled for ARC or millicode optimizations can be
> disabled for ARC by adding such lines in package/Makefile.in:
>
> --------------------------8<-------------------------------
> ifeq ($(BR2_arc),y)
> TARGET_ABI += -mno-millicode
> endif
> -------------------------->8----------------------------  
> What  will be the best solution?

Do we really want to pass -mno-millicode to all packages? If only four
packages are affected, what about adding this workaround to just those
four packages?

Also, will you remember to remove this workaround in the future when the
toolchain issue is fixed ? :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
