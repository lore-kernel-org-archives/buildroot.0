From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Jun 2016 08:47:29 +0200
Subject: [Buildroot] [PATCH 1/1] mesa3d: don't remove OpenGL pc when
 installing Gallium
In-Reply-To: <20160601033811.6031-1-akihiko.odaki.4i@stu.hosei.ac.jp>
References: <20160601033811.6031-1-akihiko.odaki.4i@stu.hosei.ac.jp>
Message-ID: <20160601084729.1e81ebd6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this patch! Bernd, Gustavo, could you comment on the part
that changes in what condition the .pc files are removed?

Also, rather than having this hack in Buildroot, what about fixing the
issue upstream? mesa3d should not install the .pc file if it is not
configured to build/install the corresponding libraries.

Akihiko, I also have a comment for you below.

On Wed,  1 Jun 2016 12:38:08 +0900, Akihiko Odaki wrote:

>  ifeq ($(BR2_PACKAGE_MESA3D_OSMESA),y)
> @@ -137,6 +140,8 @@ ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
>  MESA3D_PROVIDES += libegl
>  ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),y)
>  MESA3D_EGL_PLATFORMS = drm
> +else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4),y)
> +MESA3D_EGL_PLATFORMS = drm

This change is unrelated, so it should be part of a separate patch.

>  else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL),y)
>  MESA3D_EGL_PLATFORMS = drm
>  endif

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
