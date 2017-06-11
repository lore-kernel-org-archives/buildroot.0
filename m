From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Jun 2017 14:06:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: fix --with-egl-platforms
In-Reply-To: <20170611115128.8662-1-bernd.kuhls@t-online.de>
References: <20170611115128.8662-1-bernd.kuhls@t-online.de>
Message-ID: <20170611140646.61e12638@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 11 Jun 2017 13:51:28 +0200, Bernd Kuhls wrote:

> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index c720ce2f9..a41427619 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -161,13 +161,15 @@ MESA3D_EGL_PLATFORMS += x11
>  endif
>  MESA3D_CONF_OPTS += \
>  	--enable-gbm \
> -	--enable-egl \
> -	--with-egl-platforms=$(subst $(space),$(comma),$(MESA3D_EGL_PLATFORMS))
> +	--enable-egl
>  else
>  MESA3D_CONF_OPTS += \
>  	--disable-egl
>  endif
>  
> +MESA3D_CONF_OPTS += \
> +	--with-platforms=$(subst $(space),$(comma),$(MESA3D_EGL_PLATFORMS))

Then we should rename the variable to just MESA_PLATFORMS.

Also, this variable is going to be empty when
BR2_PACKAGE_MESA3D_OPENGL_EGL is disabled, so we will be passing
--with-platforms=

Is this correct ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
