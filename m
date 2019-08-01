From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Aug 2019 18:09:19 +0200
Subject: [Buildroot] [PATCH 1/1] support/kconfig: fix compiler warnings
 by increasing buffer sizes
In-Reply-To: <20190801152005.12285-1-mark.corbin@embecosm.com>
References: <20190801152005.12285-1-mark.corbin@embecosm.com>
Message-ID: <20190801180919.744284f3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  1 Aug 2019 16:20:05 +0100
Mark Corbin <mark.corbin@embecosm.com> wrote:

> When compiling kconfig with host gcc 8.3.0 several compiler
> '-Wformat-overflow=' warnings are generated. This is due to a
> number of temporary buffers used by sprintf being too small.
> The sizes of these buffers have been increased to remove the
> warnings.
> 
> Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
> ---
>  support/kconfig/confdata.c | 4 ++--
>  support/kconfig/util.c     | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

This was fixed in upstream Linux by commit
2ae89c7a82ea9d81a19b4fc2df23bef4b112f24e, which is part of Linux since
4.18. Our kconfig code base is based on 4.17-rc2, so the best thing is
to update our kconfig code base, to re-use the fixes from the kernel.

Could you do this ? Be careful that patches in support/kconfig/patches/
need to be refreshed and re-applied on top of the kernel kconfig code
base.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
