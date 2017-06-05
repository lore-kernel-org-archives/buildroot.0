From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 5 Jun 2017 20:08:42 +0300
Subject: [Buildroot] [PATCH 1/1] package/icu: needs host gcc >= 4.8
In-Reply-To: <20170605160317.28701-1-bernd.kuhls@t-online.de>
References: <20170605160317.28701-1-bernd.kuhls@t-online.de>
Message-ID: <20170605170842.cjhvqqbxyfxel7vh@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

On Mon, Jun 05, 2017 at 06:03:17PM +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/2b3/2b3a9be1780857db8827ea70df9d8699116a5df7/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/icu/Config.in | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/icu/Config.in b/package/icu/Config.in
> index 32f35b9d9..4eb0df5a2 100644
> --- a/package/icu/Config.in
> +++ b/package/icu/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_ICU
>  	bool "icu"
> +	depends on BR2_HOST_GCC_AT_LEAST_4_8
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_USE_WCHAR
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> @@ -30,4 +31,5 @@ comment "icu needs a toolchain w/ C++, wchar, threads, gcc >= 4.8"
>  	depends on !BR2_BINFMT_FLAT
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
>  		!BR2_TOOLCHAIN_HAS_THREADS || \
> -		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
> +		!BR2_HOST_GCC_AT_LEAST_4_8

Please update the comment text as well. The kodi dependencies comment, for 
example, mentions both the gcc and the host gcc version requirements.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
