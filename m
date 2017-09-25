From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 25 Sep 2017 11:30:26 +0300
Subject: [Buildroot] [PATCH 1/1] package/poco: needs NPTL
In-Reply-To: <20170925082759.2237-1-bernd.kuhls@t-online.de>
References: <20170925082759.2237-1-bernd.kuhls@t-online.de>
Message-ID: <20170925083026.dycg6eo37wea2oon@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

H Bernd,

On Mon, Sep 25, 2017 at 10:27:59AM +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/609/6090f5a0f4bf96b9dc2b3e48eb2e33c83d2ba7d2/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/poco/Config.in | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/poco/Config.in b/package/poco/Config.in
> index b3b247f906..8e5209e786 100644
> --- a/package/poco/Config.in
> +++ b/package/poco/Config.in
> @@ -2,7 +2,8 @@ config BR2_PACKAGE_POCO
>  	bool "poco"
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_USE_WCHAR
> -	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	# pthread_condattr_setclock
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL

Please update the comment dependency as well.

>  	depends on !BR2_STATIC_LIBS # dlopen()
>  	depends on !(BR2_arc || BR2_bfin || BR2_microblaze || BR2_mipsel \
>  		|| BR2_or1k || BR2_xtensa)

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
