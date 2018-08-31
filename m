From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 31 Aug 2018 23:31:28 +0200
Subject: [Buildroot] [PATCH 1/1] swig: Add Config.in.host
In-Reply-To: <20180831003757.19520-1-flatmax@flatmax.org>
References: <20180831003757.19520-1-flatmax@flatmax.org>
Message-ID: <20180831233128.613d3ec1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 31 Aug 2018 10:37:57 +1000, Matt Flax wrote:
> This patch make select BR2_PACKAGE_HOST_SWIG work.

Actually, "select BR2_PACKAGE_HOST_SWIG" does not need to work. If you
need host-swig from another package, add "host-swig" to this package
<pkg>_DEPENDENCIES variable. Doing a "select BR2_PACKAGE_HOST_SWIG"
will not give you anything, because it won't guarantee that host-swig
is built before your package.

But anyway, I believe that swig may be needed when doing application
development around Buildroot, so I'm fine with having a visible
menuconfig option for this. I applied your patch with a reworked commit
log.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
