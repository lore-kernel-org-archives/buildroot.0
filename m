From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Apr 2017 23:46:17 +0200
Subject: [Buildroot] [PATCH 3/3] package/libva-utils: new package
In-Reply-To: <20170402081327.2195-3-bernd.kuhls@t-online.de>
References: <20170402081327.2195-1-bernd.kuhls@t-online.de>
 <20170402081327.2195-3-bernd.kuhls@t-online.de>
Message-ID: <20170402234617.5ff597dd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  2 Apr 2017 10:13:27 +0200, Bernd Kuhls wrote:
> The utils provided by this package were formerly packaged with libva.
> Libva contained a patch not to compile mpeg2vldemo to reduce
> dependencies by avoiding C++, this patch is not moved to this package.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/Config.in                    |  1 +
>  package/libva-utils/Config.in        | 15 +++++++++++++++
>  package/libva-utils/libva-utils.hash |  4 ++++
>  package/libva-utils/libva-utils.mk   | 14 ++++++++++++++

Entry to DEVELOPERS file is missing.

> diff --git a/package/Config.in b/package/Config.in
> index d6d134d0c..364766e37 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1049,6 +1049,7 @@ menu "Graphics"
>  	source "package/libsvgtiny/Config.in"
>  	source "package/libva/Config.in"
>  	source "package/libva-intel-driver/Config.in"
> +	source "package/libva-utils/Config.in"

Does it really makes sense to have this package in Libraries->Graphics
when it is in fact not a library at all?

> diff --git a/package/libva-utils/Config.in b/package/libva-utils/Config.in
> new file mode 100644
> index 000000000..89615cad3
> --- /dev/null
> +++ b/package/libva-utils/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_LIBVA_UTILS
> +	bool "libva-utils"
> +	select BR2_PACKAGE_LIBVA
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libva
> +	depends on !BR2_STATIC_LIBS # libva

Perhaps this can be summarized as:

	depends on BR2_PACKAGE_LIBVA

indeed, someone wanting the libva tests will surely realize that he
needs to enable libva in the first place, no?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
