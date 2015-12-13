From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Dec 2015 14:46:26 +0100
Subject: [Buildroot] [PATCH 7/8] package/libfreeglut: new package
In-Reply-To: <1449945103-23715-7-git-send-email-bernd.kuhls@t-online.de>
References: <1449945103-23715-1-git-send-email-bernd.kuhls@t-online.de>
 <1449945103-23715-7-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151213144626.5a7db29f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd,

On Sat, 12 Dec 2015 19:31:42 +0100, Bernd Kuhls wrote:

> diff --git a/package/libfreeglut/Config.in b/package/libfreeglut/Config.in
> new file mode 100644
> index 0000000..e67fdae
> --- /dev/null
> +++ b/package/libfreeglut/Config.in
> @@ -0,0 +1,19 @@
> +config BR2_PACKAGE_LIBFREEGLUT
> +	bool "libfreeglut"
> +	select BR2_PACKAGE_LIBGLU
> +	select BR2_PACKAGE_XLIB_LIBXI

Are you sure about this dependency? I don't see any reference to libXi
in the libfreeglut source code? However, I do see a reference to
libXxf86vm:

  SET(PC_LIBS_PRIVATE "-lX11 -lXxf86vm -lXrandr -lGL -lm")

> +	select BR2_PACKAGE_XLIB_LIBXRANDR
> +	depends on BR2_PACKAGE_HAS_LIBGL

There seems to be provisions for using OpenGLES and not only full
OpenGL:

# OpenGL ES support
OPTION(FREEGLUT_GLES "Use OpenGL ES (requires EGL)" OFF)

Also, have you test static/shared build ? There are some options to
control this:

OPTION(FREEGLUT_BUILD_SHARED_LIBS "Build FreeGLUT shared library." ON)
OPTION(FREEGLUT_BUILD_STATIC_LIBS "Build FreeGLUT static library." ON)

But it's true you depend on BR2_PACKAGE_XORG7, so a pure static lib
build is not possible. But what about BR2_STATIC_SHARED_LIBS vs.
BR2_SHARED_LIBS ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
