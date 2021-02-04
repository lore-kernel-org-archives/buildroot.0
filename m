From: Adrian Perez de Castro <aperez@igalia.com>
Date: Thu, 4 Feb 2021 22:33:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/cog: add
 BR2_PACKAGE_COG_USE_SYSTEM_DBUS
In-Reply-To: <20210202115721.4136447-1-asweet@thegoodpenguin.co.uk>
References: <20210202115721.4136447-1-asweet@thegoodpenguin.co.uk>
Message-ID: <20210204223323.GB441747@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Adrian,

Thanks for the patch, I think adding the option is fine given that there
are people around who would use it?which seems to be the case.

Unless somebody else has an opinion against, I think we could merge this
change =]

On Tue, 02 Feb 2021 11:57:21 +0000 Adrian Sweet <asweet@thegoodpenguin.co.uk> wrote:
> Added config option to expose browser remote control on the D-Bus system bus
> 
> Signed-off-by: Adrian Sweet <asweet@thegoodpenguin.co.uk>

Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>

> ---
>  package/cog/Config.in | 6 ++++++
>  package/cog/cog.mk    | 6 ++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/package/cog/Config.in b/package/cog/Config.in
> index a9ca7473a9..c19f1c200e 100644
> --- a/package/cog/Config.in
> +++ b/package/cog/Config.in
> @@ -47,6 +47,12 @@ config BR2_PACKAGE_COG_PLATFORM_DRM
>  	  with video drivers that support kernel mode-setting (KMS)
>  	  via the DRM user-space API.
>  
> +config BR2_PACKAGE_COG_USE_SYSTEM_DBUS
> +	bool "Use D-Bus system bus"
> +	default n
> +	help
> +	  Expose remote control interface on system bus
> +
>  comment "DRM platform needs mesa3d w/ EGL driver and GBM"
>  	depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL
>  
> diff --git a/package/cog/cog.mk b/package/cog/cog.mk
> index 47a5573dda..c5a1cc0df2 100644
> --- a/package/cog/cog.mk
> +++ b/package/cog/cog.mk
> @@ -31,4 +31,10 @@ else
>  COG_CONF_OPTS += -DCOG_PLATFORM_DRM=OFF
>  endif
>  
> +ifeq ($(BR2_PACKAGE_COG_USE_SYSTEM_DBUS),y)
> +COG_CONF_OPTS += -DCOG_DBUS_SYSTEM_BUS=ON
> +else
> +COG_CONF_OPTS += -DCOG_DBUS_SYSTEM_BUS=OFF
> +endif
> +
>  $(eval $(cmake-package))
> -- 
> 2.25.1
> 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210204/7d0f72a4/attachment.asc>
