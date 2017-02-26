From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Feb 2017 14:57:32 +0100
Subject: [Buildroot] [PATCH v2 1/3] package/sdl2: enable opengl support
In-Reply-To: <20170225133600.15637-1-romain.naour@gmail.com>
References: <20170225133600.15637-1-romain.naour@gmail.com>
Message-ID: <20170226145732.00e59efb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 25 Feb 2017 14:35:58 +0100, Romain Naour wrote:

> +config BR2_PACKAGE_SDL2_OPENGL
> +	bool "OpenGL (GLX)"
> +	depends on BR2_PACKAGE_HAS_LIBGL
> +	depends on BR2_PACKAGE_XORG7

Are you sure this doesn't need BR2_PACKAGE_SDL2_X11 ? I.e what happens
if you build SDL2 with BR2_PACKAGE_SDL2_OPENGL=y but
BR2_PACKAGE_SDL2_X11 disabled ?

> +ifeq ($(BR2_PACKAGE_SDL2_OPENGL),y)
> +SDL2_CONF_OPTS += --enable-video-opengl
> +SDL2_DEPENDENCIES += libgl

Also, is libgl sufficient here? What happens if you select
nvidia-driver as the OpenGL provider for example? It doesn't depend on
any X.org package, so are you sure by the time SDL2 runs its configure
script, enough things have been built?

Can you verify by enabling nvidia-driver, and then running "make sdl2" ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
