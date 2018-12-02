From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 02 Dec 2018 12:32:15 +0200
Subject: [Buildroot] [PATCH 1/1] minizip: fix display of comment
In-Reply-To: <20181202102427.16747-1-fontaine.fabrice@gmail.com>
References: <20181202102427.16747-1-fontaine.fabrice@gmail.com>
Message-ID: <875zwckymo.fsf@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

Fabrice Fontaine writes:
> Commit e13855c48f21eaee07a81f8b02678839be274a45 wrongly added
> depends on BR2_TOOLCHAIN_USES_UCLIBC && !BR2_USE_MMU
> to display the comment "minizip needs a toolchain w/ threads, wchar"

Why is it wrong? This dependency is meant to hide the comment in the
!(BR2_TOOLCHAIN_USES_UCLIBC && !BR2_USE_MMU) case.

> Set the correct dependency:
> depends on !(BR2_TOOLCHAIN_USES_UCLIBC && !BR2_USE_MMU)
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/minizip/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/minizip/Config.in b/package/minizip/Config.in
> index 4bc12a0d7e..ff8b5b209a 100644
> --- a/package/minizip/Config.in
> +++ b/package/minizip/Config.in
> @@ -20,5 +20,5 @@ config BR2_PACKAGE_MINIZIP_DEMOS
>  
>  comment "minizip needs a toolchain w/ threads, wchar"
>  	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
> -	depends on BR2_TOOLCHAIN_USES_UCLIBC && !BR2_USE_MMU
> +	depends on !(BR2_TOOLCHAIN_USES_UCLIBC && !BR2_USE_MMU)
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
