From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 2 Apr 2017 20:01:49 +0200
Subject: [Buildroot] [PATCH] package/libdrm: fix autoreconf
In-Reply-To: <20170402175029.25526-1-yann.morin.1998@free.fr>
References: <20170402175029.25526-1-yann.morin.1998@free.fr>
Message-ID: <02eab99b-39c4-5ac1-a0d5-2a0758289a01@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, All,

Le 02/04/2017 ? 19:50, Yann E. MORIN a ?crit :
> To properly autoreconf, the xorg macros, from host-xutil_util-macros,
> are needed.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/2e8/2e887c25b22bd36eab36ff361645306c8ddb79aa/
>     http://autobuild.buildroot.org/results/7c0/7c0050d63a1d34eecb6d16e2654369cea561707a/
>     http://autobuild.buildroot.org/results/2ef/2ef3d6d74c56632c012b85e05af6eaf0259b72c9/
>     [...]
> 
> (Thanks Romain for confirming the fix on IRC! ;-) )

Actually, I really used the target variant xutil_util-macros-1.19.1.
I don't even have the host variant in my build directory.

Best regards,
Romain

> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> Cc: Romain Naour <romain.naour@openwide.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/libdrm/libdrm.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
> index 875d3cc..8223262 100644
> --- a/package/libdrm/libdrm.mk
> +++ b/package/libdrm/libdrm.mk
> @@ -15,7 +15,8 @@ LIBDRM_INSTALL_STAGING = YES
>  
>  LIBDRM_DEPENDENCIES = \
>  	libpthread-stubs \
> -	host-pkgconf
> +	host-pkgconf \
> +	host-xutil_util-macros
>  
>  LIBDRM_CONF_OPTS = \
>  	--disable-cairo-tests \
> 
