From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 16:05:55 +0200
Subject: [Buildroot] [PATCH] board/ci20: Fix U-Boot build failure
In-Reply-To: <20180401135035.29655-1-ezequiel@collabora.com>
References: <20180401135035.29655-1-ezequiel@collabora.com>
Message-ID: <20180401160555.36587bd1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  1 Apr 2018 10:50:35 -0300, Ezequiel Garcia wrote:
> Given there is no upstream U-Boot for CI20, the defconfig
> sets an ancient version, with old libfdt headers.
> 
> Enable DTC, so U-Boot can pick Buildroot's libfdt headers
> instead of those installed by the host.
> 
> Fixes multiple errors looking like this:
> 
> In file included from ../include/libfdt.h:54:0,
>                  from fdt_host.h:11,
>                  from mkimage.h:22,
>                  from aisimage.c:8:
> /usr/include/libfdt_env.h:70:30: error: conflicting types for ?fdt64_t?
>  typedef uint64_t FDT_BITWISE fdt64_t;

Which Buildroot version are you using ? We fixed errors like that
recently, and I built ci20_defconfig yesterday, and it worked fine for
me.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
