From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 19 Feb 2019 20:53:42 +0100
Subject: [Buildroot] [PATCH] package/poco: disable build for riscv
In-Reply-To: <819bf05bad9c9dee941a5ea54af1694cf8b5f857.1550602232.git.baruch@tkos.co.il>
References: <819bf05bad9c9dee941a5ea54af1694cf8b5f857.1550602232.git.baruch@tkos.co.il>
Message-ID: <20190219205342.7c947256@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Baruch,

On Tue, 19 Feb 2019 20:50:32 +0200, Baruch Siach <baruch@tkos.co.il> wrote:

> poco does not support the riscv target.

Time for an poco update? Version 1.9.1 seems to support riscv64, see [1]....

Regards,
Peter

[1] https://github.com/pocoproject/poco/blob/poco-1.9.1/Foundation/include/Poco/Platform.h#L137

> 
> Fixes:
> http://autobuild.buildroot.net/results/9a8/9a8213c502df53222eafc3ecd2fcfa36db20950b/
> http://autobuild.buildroot.net/results/dd4/dd48cac70e8cb697b42ee51561902df81edcea40/
> http://autobuild.buildroot.net/results/030/030c6cc8e2a59b015f8f3793d76234a2ef4ab772/
> 
> Cc: Yegor Yefremov <yegorslists@googlemail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/poco/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/poco/Config.in b/package/poco/Config.in
> index 75e31b7e1e7d..7e1257146c81 100644
> --- a/package/poco/Config.in
> +++ b/package/poco/Config.in
> @@ -6,7 +6,7 @@ config BR2_PACKAGE_POCO
>  	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	depends on !BR2_STATIC_LIBS # dlopen()
>  	depends on !(BR2_arc || BR2_microblaze || BR2_mipsel \
> -		|| BR2_or1k || BR2_xtensa)
> +		|| BR2_or1k || BR2_riscv || BR2_xtensa)
>  	select BR2_PACKAGE_ZLIB
>  	select BR2_PACKAGE_PCRE
>  	help
