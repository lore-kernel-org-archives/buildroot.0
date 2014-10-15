From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 15 Oct 2014 13:56:02 +0300
Subject: [Buildroot] [PATCH 2/8] package/mpd: sort plugins by type in
 Config.in
In-Reply-To: <1413369564-22124-2-git-send-email-jkrause@posteo.de>
References: <1413369564-22124-1-git-send-email-jkrause@posteo.de>
 <1413369564-22124-2-git-send-email-jkrause@posteo.de>
Message-ID: <20141015105602.GM3500@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi J?rg,

On Wed, Oct 15, 2014 at 12:39:18PM +0200, J?rg Krause wrote:
> Signed-off-by: J?rg Krause <jkrause@posteo.de>
> ---
>  package/mpd/Config.in | 218 ++++++++++++++++++++++++++------------------------
>  1 file changed, 115 insertions(+), 103 deletions(-)
> 
> diff --git a/package/mpd/Config.in b/package/mpd/Config.in
> index cd7bbfd..e170b26 100644
> --- a/package/mpd/Config.in
> +++ b/package/mpd/Config.in
> @@ -1,7 +1,6 @@
>  menuconfig BR2_PACKAGE_MPD
>  	bool "mpd"
>  	depends on BR2_INSTALL_LIBSTDCPP
> -	depends on BR2_LARGEFILE # boost

You have just added this line in the previous patch. Why do you remove it now?

[snip]

>  	depends on BR2_USE_WCHAR # libglib2, flac
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
>  	depends on BR2_USE_MMU # libglib2
>  comment "mpd needs a toolchain w/ C++, threads, wchar"
>  	depends on BR2_USE_MMU
>  	depends on !(BR2_avr32 || BR2_sparc)
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
> -		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE
> +		!BR2_TOOLCHAIN_HAS_THREADS

Same here.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
