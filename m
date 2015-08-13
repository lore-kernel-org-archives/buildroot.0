From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 13 Aug 2015 22:02:49 +0300
Subject: [Buildroot] [PATCH] [autobuild] package/libiio: tests need
 threads
In-Reply-To: <1439475103-2013-1-git-send-email-yann.morin.1998@free.fr>
References: <1439475103-2013-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150813190249.GZ25261@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Thu, Aug 13, 2015 at 04:11:43PM +0200, Yann E. MORIN wrote:
> Fixes:
>     http://autobuild.buildroot.org/results/4bb/4bbd2d6927ca75517c2bd37eca83a9d98f1cca01/
>     http://autobuild.buildroot.org/results/949/949314b57f5a396b4bb03e422094b754dcf87e20/
>     ...
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

I sent an almost identical patch two days ago: 
http://patchwork.ozlabs.org/patch/505866/.

> ---
>  package/libiio/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/libiio/Config.in b/package/libiio/Config.in
> index 21496ed..c77583d 100644
> --- a/package/libiio/Config.in
> +++ b/package/libiio/Config.in
> @@ -35,11 +35,15 @@ comment "IIO Daemon needs a toolchain w/ threads"
>  
>  config BR2_PACKAGE_LIBIIO_TESTS
>  	bool "Install test programs"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_PACKAGE_LIBIIO_LOCAL_BACKEND
>  	select BR2_PACKAGE_LIBIIO_NETWORK_BACKEND
>  	help
>  	  Install the test programs (iio_info, iio_genxml, iio_readdev).
>  
> +comment "IIO tests needs a toolchain w/ threads"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS
> +
>  config BR2_PACKAGE_LIBIIO_BINDINGS_CSHARP
>  	bool "Install C# bindings"
>  	depends on BR2_PACKAGE_MONO

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
