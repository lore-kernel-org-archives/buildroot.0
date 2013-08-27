From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Aug 2013 22:48:15 +0200
Subject: [Buildroot] [PATCH 6/6] glmark2: new package
In-Reply-To: <1377373321-29732-7-git-send-email-spenser@gillilanding.com>
References: <1377373321-29732-1-git-send-email-spenser@gillilanding.com>
 <1377373321-29732-7-git-send-email-spenser@gillilanding.com>
Message-ID: <20130827224815.7a21e42f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Sat, 24 Aug 2013 14:42:01 -0500, Spenser Gilliland wrote:

> diff --git a/package/glmark2/Config.in b/package/glmark2/Config.in
> new file mode 100644
> index 0000000..47ed221
> --- /dev/null
> +++ b/package/glmark2/Config.in
> @@ -0,0 +1,49 @@
> +config BR2_PACKAGE_GLMARK2
> +	bool "glmark2"
> +	depends on BR2_PACKAGE_MESA3D
> +	depends on BR2_PACKAGE_MESA3D_GBM
> +	depends on BR2_LARGEFILE
> +	depends on BR2_PACKAGE_HAS_OPENGL || \
> +		(BR2_PACKAGE_HAS_OPENGL_EGL && BR2_PACKAGE_HAS_OPENGL_ES)

It's probably me not having enough OpenGL/Mesa knowledge, but my
understanding was that Mesa was the OpenGL/EGL/OpenVG implementations
for "desktop" graphics cards, and that therefore Mesa was equivalent to
the OpenGL implementations provided by ARM SoC vendors, so that OpenGL
applications such as glmark2 would only have to depends on HAS_OPENGL
|| (HAS_OPENGL_EGL && HAS_OPENGL_ES), and not depend on Mesa in
addition to this.

With the dependencies you've listed, on a TI OMAP3 platform, we would
need both Mesa *and* the ti-gfx package. Is this expected? I suppose
that this means Mesa provides more stuff that just GL/GLES/EGL/VG. If
that's the case, do you have a few more details?

> +	select BR2_PACKAGE_JPEG
> +	select BR2_PACKAGE_LIBPNG12
> +	select BR2_PACKAGE_XLIB_LIBPCIACCESS if BR2_i386 || BR2_x86_64 # libdrm
> +	select BR2_PACKAGE_XLIB_LIBPTHREAD_STUBS # libdrm

glmark2 is directly using libpciaccess and libpthread-stubs?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
