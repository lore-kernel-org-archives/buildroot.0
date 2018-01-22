From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 22 Jan 2018 08:02:17 +0200
Subject: [Buildroot] [PATCH 1/1] gconf: add dependency on toolchain w/
 dynamic lib
In-Reply-To: <20180122055702.6740-1-joseph.kogut@gmail.com>
References: <20180122055702.6740-1-joseph.kogut@gmail.com>
Message-ID: <20180122060216.pmi3l63cmtboingq@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Josef,

On Sun, Jan 21, 2018 at 09:57:02PM -0800, Joseph Kogut wrote:
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> ---
> 
> This patch fixes some recent build issues caused by BR2_STATIC_LIBS=y.

Please add a reference in the commit log to the fixed build failure. Here is 
one:

  http://autobuild.buildroot.net/results/153/153fd72832399e353d1db2c3adde68d45197ada5/

You can find more at

  http://autobuild.buildroot.net/?reason=gconf-3.2.6

baruch

>  package/gconf/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/gconf/Config.in b/package/gconf/Config.in
> index a68287525b..a967d61644 100644
> --- a/package/gconf/Config.in
> +++ b/package/gconf/Config.in
> @@ -3,6 +3,7 @@ config BR2_PACKAGE_GCONF
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
>  	depends on BR2_USE_MMU # dbus, libglib2
>  	depends on BR2_USE_WCHAR # libglib2
> +	depends on !BR2_STATIC_LIBS
>  	select BR2_PACKAGE_DBUS
>  	select BR2_PACKAGE_DBUS_GLIB
>  	select BR2_PACKAGE_LIBGLIB2
> @@ -14,6 +15,7 @@ config BR2_PACKAGE_GCONF
>  
>  	  https://projects.gnome.org/gconf/
>  
> -comment "gconf needs a toolchain w/ threads, wchar"
> +comment "gconf needs a toolchain w/ threads, wchar, dynamic library"
>  	depends on BR2_USE_MMU
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR \
> +		|| BR2_STATIC_LIBS

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
