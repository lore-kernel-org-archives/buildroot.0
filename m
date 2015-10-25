From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Oct 2015 13:33:53 +0100
Subject: [Buildroot] [PATCH v5 01/36] package/expedite: move to package
 directory
In-Reply-To: <1445720476-21517-2-git-send-email-romain.naour@openwide.fr>
References: <1445720476-21517-1-git-send-email-romain.naour@openwide.fr>
 <1445720476-21517-2-git-send-email-romain.naour@openwide.fr>
Message-ID: <20151025123353.GC3665@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2015-10-24 23:00 +0200, Romain Naour spake thusly:
> There is no advantage for efl related packages to share the same version
> number anymore (except for Efl and Elementary).
> 
> Here are the version number used for the 1.15 stable release:
> EFL                     1.15.2
> Elementary              1.15.2
> Emotion Generic Players 1.15.0
> Evas Generic Loaders    1.15.0
> Python-EFL              1.15.0
> 
> Also, we usually do not have a sub-directory for a family of related
> packages which don't share the same version number, so move expedite
> to the package directory. Expedite now appears in the
> "Graphic libraries and applications (graphic/text)" in the Kconfig menu.
> 
> In a followup patch, expedite will be downloaded directly from the 1.15
> branch in the git repository since there is no new tarball release after
> 1.7.0.
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

And now, I'm sure this is the correct patch I wanted to review... :-)

Regards,
Yann E. MORIN.

> ---
> v5: fixes typos (ThomasP)
>     Use depends on BR2_PACKAGE_EFL instead of select (ThomasP)
> v4: improve the commit log (ThomasP)
>     move expedite to "Graphic applications" under
>     "Graphic libraries and applications" menu (ThomasP)
>     fix package comment dependency on BR2_USE_MMU
> ---
>  package/Config.in                      | 1 +
>  package/efl/Config.in                  | 1 -
>  package/{efl => }/expedite/Config.in   | 1 +
>  package/{efl => }/expedite/expedite.mk | 0
>  4 files changed, 2 insertions(+), 1 deletion(-)
>  rename package/{efl => }/expedite/Config.in (95%)
>  rename package/{efl => }/expedite/expedite.mk (100%)
> 
> diff --git a/package/Config.in b/package/Config.in
> index 2f74439..c3b9a7a 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -219,6 +219,7 @@ endmenu
>  menu "Graphic libraries and applications (graphic/text)"
>  
>  comment "Graphic applications"
> +	source "package/expedite/Config.in"
>  	source "package/fswebcam/Config.in"
>  	source "package/glmark2/Config.in"
>  	source "package/gnuplot/Config.in"
> diff --git a/package/efl/Config.in b/package/efl/Config.in
> index 3d31a26..cb91660 100644
> --- a/package/efl/Config.in
> +++ b/package/efl/Config.in
> @@ -10,7 +10,6 @@ menuconfig BR2_PACKAGE_EFL
>  
>  if BR2_PACKAGE_EFL
>  
> -source "package/efl/expedite/Config.in"
>  source "package/efl/libeina/Config.in"
>  source "package/efl/libecore/Config.in"
>  source "package/efl/libeet/Config.in"
> diff --git a/package/efl/expedite/Config.in b/package/expedite/Config.in
> similarity index 95%
> rename from package/efl/expedite/Config.in
> rename to package/expedite/Config.in
> index 1e12108..de6a056 100644
> --- a/package/efl/expedite/Config.in
> +++ b/package/expedite/Config.in
> @@ -3,6 +3,7 @@ config BR2_PACKAGE_EXPEDITE
>  	select BR2_PACKAGE_LIBEINA
>  	select BR2_PACKAGE_LIBEVAS
>  	select BR2_PACKAGE_LIBEET
> +	depends on BR2_PACKAGE_EFL
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libevas
>  	help
> diff --git a/package/efl/expedite/expedite.mk b/package/expedite/expedite.mk
> similarity index 100%
> rename from package/efl/expedite/expedite.mk
> rename to package/expedite/expedite.mk
> -- 
> 2.4.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
