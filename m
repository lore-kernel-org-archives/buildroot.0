From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 21 Feb 2015 12:13:40 +0100
Subject: [Buildroot] [PATCH] package/x11r7/libxcb: really disable docs
In-Reply-To: <1424516137-5016-1-git-send-email-romain.naour@openwide.fr>
References: <1424516137-5016-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <54E86864.5010707@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Le 21/02/2015 11:55, Romain Naour a ?crit :
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  package/x11r7/libxcb/libxcb.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/x11r7/libxcb/libxcb.mk b/package/x11r7/libxcb/libxcb.mk
> index da2f192..f4a3aa9 100644
> --- a/package/x11r7/libxcb/libxcb.mk
> +++ b/package/x11r7/libxcb/libxcb.mk
> @@ -16,8 +16,8 @@ LIBXCB_DEPENDENCIES = \
>  	host-libxslt libpthread-stubs xcb-proto xlib_libXdmcp xlib_libXau \
>  	host-xcb-proto host-python host-pkgconf
>  
> -LIBXCB_CONF_OPTS = --disable-build-docs
> -HOST_LIBXCB_CONF_OPTS = --disable-build-docs
> +LIBXCB_CONF_OPTS = --with-doxygen=no
> +HOST_LIBXCB_CONF_OPTS = --with-doxygen=no
>  

Can we add --with-doxygen=no to pkg-autotools.mk instead ?

Best regard,
Romain
