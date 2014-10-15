From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 15 Oct 2014 13:53:16 +0300
Subject: [Buildroot] [PATCH 1/8] package/mpd: bump to version 0.19
In-Reply-To: <1413369564-22124-1-git-send-email-jkrause@posteo.de>
References: <1413369564-22124-1-git-send-email-jkrause@posteo.de>
Message-ID: <20141015105316.GL3500@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi J?rg,

On Wed, Oct 15, 2014 at 12:39:17PM +0200, J?rg Krause wrote:
> * Bump to version 0.19
> * Add boost as dependency
> * Add support for libicu
> 
> Signed-off-by: J?rg Krause <jkrause@posteo.de>
> ---
>  package/mpd/Config.in |  3 ++-
>  package/mpd/mpd.mk    | 14 +++++++++++---
>  2 files changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/package/mpd/Config.in b/package/mpd/Config.in
> index 8884464..cd7bbfd 100644
> --- a/package/mpd/Config.in
> +++ b/package/mpd/Config.in
> @@ -1,6 +1,7 @@
>  menuconfig BR2_PACKAGE_MPD
>  	bool "mpd"
>  	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_LARGEFILE # boost

You also need to add 'select BR2_PACKAGE_BOOST' to make sure boost gets built.

baruch

>  	depends on BR2_USE_WCHAR # libglib2, flac
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
>  	depends on BR2_USE_MMU # libglib2
> @@ -211,4 +212,4 @@ comment "mpd needs a toolchain w/ C++, threads, wchar"
>  	depends on BR2_USE_MMU
>  	depends on !(BR2_avr32 || BR2_sparc)
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
> -		!BR2_TOOLCHAIN_HAS_THREADS
> +		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
