From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 31 Dec 2015 01:03:09 +0100
Subject: [Buildroot] [PATCH 29/84 RFC] package/tcl: use 'menuconfig'
 instad of 'config'+'menu'
In-Reply-To: <647ce3d24f32a353382c1de643fef55f1e336e52.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
 <647ce3d24f32a353382c1de643fef55f1e336e52.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <568470BD.1020304@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25-12-15 22:24, Yann E. MORIN wrote:
> Move inclusion of Tcl libraries/modules to Tcl's Config.in so that they
> appear in Tcl's sub-menu.

 One more NACK :-)

 Regards,
 Arnout

> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/Config.in     | 6 ------
>  package/tcl/Config.in | 7 ++++++-
>  2 files changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/package/Config.in b/package/Config.in
> index 94ea060..a191f43 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -546,12 +546,6 @@ endif
>  	source "package/python3/Config.in"
>  	source "package/ruby/Config.in"
>  	source "package/tcl/Config.in"
> -if BR2_PACKAGE_TCL
> -menu "Tcl libraries/modules"
> -	source "package/expect/Config.in"
> -	source "package/tcllib/Config.in"
> -endmenu
> -endif
>  endmenu
>  
>  menu "Libraries"
> diff --git a/package/tcl/Config.in b/package/tcl/Config.in
> index f1fa054..dacd1a8 100644
> --- a/package/tcl/Config.in
> +++ b/package/tcl/Config.in
> @@ -2,7 +2,7 @@ comment "tcl needs a toolchain w/ threads, dynamic library"
>  	depends on BR2_USE_MMU
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
>  
> -config BR2_PACKAGE_TCL
> +menuconfig BR2_PACKAGE_TCL
>  	bool "tcl"
>  	# fork()
>  	depends on BR2_USE_MMU
> @@ -36,4 +36,9 @@ config BR2_PACKAGE_TCL_SHLIB_ONLY
>  
>  	  Saves ~14kb.
>  
> +comment "Tcl libraries/modules"
> +
> +source "package/expect/Config.in"
> +source "package/tcllib/Config.in"
> +
>  endif
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
