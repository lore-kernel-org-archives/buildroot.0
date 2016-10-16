From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Oct 2016 16:33:27 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/libarchive: fix static
 linking against libpthread
In-Reply-To: <20160828102121.13601-1-bernd.kuhls@t-online.de>
References: <20160828102121.13601-1-bernd.kuhls@t-online.de>
Message-ID: <20161016163327.64042dbe@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 28 Aug 2016 12:21:21 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/e94/e943ee5abc06b1812d7b34976e3a807859958935/
> 
> This commit also fixes fwup:
> http://autobuild.buildroot.net/results/36b/36b0c6b68209ddd1b0f2db8449392af36876411f/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: Changed LIBARCHIVE_CONF_ENV from using LDFLAGS to using LIBS, this
>     way -lpthread is included in libarchive.pc fixing linking problems
>     in other packages using libarchive
>     This patch follows the advice from Khem Raj:
>     http://lists.busybox.net/pipermail/buildroot/2016-August/169712.html

With the recent change in uClibc-ng merging libpthread in libc, this
patch is no longer needed, so I've marked it as rejected in patchwork.
I tested with fwup, and the problem is indeed fixed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
