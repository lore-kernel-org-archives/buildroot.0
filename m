From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Sep 2018 15:08:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/rtorrent: requires gcc >= 4.9
In-Reply-To: <20180915140150.7426-1-bernd.kuhls@t-online.de>
References: <20180915140150.7426-1-bernd.kuhls@t-online.de>
Message-ID: <20180916150819.4903873c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 15 Sep 2018 16:01:50 +0200, Bernd Kuhls wrote:
> Upstream considers the build error as compiler bug:

Why do you say "considers the build error as a compiler bug"? It
obviously is: the compiler segfaults. It cannot be anything but a
compiler bug.

> https://github.com/rakshasa/rtorrent/issues/223
> 
> Building with gcc 4.9 works, tested with this defconfig:
> 
> BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
> BR2_GCC_VERSION_4_9_X=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_PACKAGE_RTORRENT=y
> 
> Fixes
> http://autobuild.buildroot.net/results/990/990c9d62f3d275bd4e2ffad41bdb6d68c483cbb1/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

I've applied to master, with one minor change, see below.

> ---
>  package/rtorrent/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rtorrent/Config.in b/package/rtorrent/Config.in
> index 190e50fe26..5c5c64d892 100644
> --- a/package/rtorrent/Config.in
> +++ b/package/rtorrent/Config.in
> @@ -4,6 +4,7 @@ config BR2_PACKAGE_RTORRENT
>  	depends on BR2_USE_WCHAR
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_USE_MMU # fork()
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9

I've added a comment above this line that explains why we have this
dependency, otherwise it's not very obvious.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
