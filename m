From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Sep 2016 19:14:42 +0200
Subject: [Buildroot] [PATCH 4/4] package/efl: add Evas GL DRM Engine
 support
In-Reply-To: <1473282523-12796-4-git-send-email-romain.naour@gmail.com>
References: <1473282523-12796-1-git-send-email-romain.naour@gmail.com>
 <1473282523-12796-4-git-send-email-romain.naour@gmail.com>
Message-ID: <20160917191442.7ea32f90@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  7 Sep 2016 23:08:43 +0200, Romain Naour wrote:

> diff --git a/package/efl/Config.in b/package/efl/Config.in
> index 6171b29..c6c26d8 100644
> --- a/package/efl/Config.in
> +++ b/package/efl/Config.in
> @@ -208,6 +208,16 @@ comment "Evas DRM Engine needs mesa3d w/ EGL support, threads"
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_MESA3D_OPENGL_EGL
>  	depends on BR2_PACKAGE_EFL_ELPUT
>  
> +config BR2_PACKAGE_EFL_GL_DRM

Is it useful to have it as a separate option from BR2_PACKAGE_EFL_DRM ?
In which case can BR2_PACKAGE_EFL_DRM without BR2_PACKAGE_EFL_GL_DRM be
useful ?

> +	bool "Evas GL DRM Engine"
> +	depends on BR2_PACKAGE_EFL_DRM
> +	depends on BR2_PACKAGE_EFL_OPENGLES # OpenGL ES with EGL support only

So perhaps "BR2_PAKCAGE_EFL_GLES_DRM" is a better name? "GL" usually
refers to "full OpenGL", as opposed to OpenGL ES.

> +	help
> +	  This option enable building support for the Evas DRM Engine.

This help text is wrong, as it is just a copy/paste of the one of
BR2_PACKAGE_EFL_DRM.

> +
> +comment "Evas GL DRM Engine needs Evas DRM Engine, OpenGL ES w/ EGL"
> +	depends on BR2_PACKAGE_EFL_DRM && !BR2_PACKAGE_EFL_OPENGLES

I find all those DRM/OpenGLES options in the efl package very
confusing. Are all those options needed? What are the use cases for the
different possible cases?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
