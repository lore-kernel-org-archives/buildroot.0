From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Aug 2019 00:10:39 +0200
Subject: [Buildroot] [PATCH v6 1/1] python-kivy: new package
In-Reply-To: <20190626211825.27922-1-joseph.kogut@gmail.com>
References: <20190626211825.27922-1-joseph.kogut@gmail.com>
Message-ID: <20190804001033.660c7373@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Joseph,

Thanks for this new version!

On Wed, 26 Jun 2019 14:18:25 -0700
Joseph Kogut <joseph.kogut@gmail.com> wrote:

> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>

First of all, it doesn't build here. The following defconfig:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2019.05.1.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_RPI_USERLAND=y
BR2_PACKAGE_PYTHON3=y
BR2_PACKAGE_PYTHON_KIVY=y
# BR2_TARGET_ROOTFS_TAR is not set

gives the following errors:

>>> python-kivy 1.11.1 Building
(cd /home/thomas/projets/buildroot/output/build/python-kivy-1.11.1//; PATH="/home/thomas/projets/buildroot/output/host/bin:/home/thomas/projets/buildroot/output/host/sbin:/home/thomas/sys/bin/:/usr/libexec/python3-sphinx:/usr/share/Modules/bin:/usr/lib64/ccache:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/home/thomas/.rvm/bin:/home/thomas/sys/bin:/home/thomas/.gem/ruby/2.1.0/bin:/home/thomas/.rvm/bin:/home/thomas/.local/bin" CC="/home/thomas/projets/buildroot/output/host/bin/arm-linux-gcc" CFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  " LDFLAGS="" LDSHARED="/home/thomas/projets/buildroot/output/host/bin/arm-linux-gcc -shared"
PYTHONPATH="/home/thomas/projets/buildroot/output/target/usr/lib/python3.7/" PYTHONNOUSERSITE=1 _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata_m_linux_arm-linux-gnueabi" _python_sysroot=/home/thomas/projets/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot _python_prefix=/usr _python_exec_prefix=/usr USE_OPENGL_ES2=1 USE_OPENGL_MOCK=1 USE_GSTREAMER=0 USE_EGL=1 USE_SDL2=1 KIVY_SDL2_PATH=/home/thomas/projets/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/SDL2 USE_WAYLAND=0 USE_X11=0 /home/thomas/projets/buildroot/output/host/bin/python setup.py build --executable=/usr/bin/python )
Using setuptools
Environ change use_egl -> True
Environ change use_opengl_es2 -> True
Environ change use_opengl_mock -> True
Environ change use_sdl2 -> True
Environ change use_x11 -> False
Environ change use_wayland -> False
Environ change use_gstreamer -> False
Using this graphics system: OpenGL ES 2
SDL2 found via pkg-config
SDL2: found SDL header at /home/thomas/projets/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/SDL2/SDL.h
SDL2: found SDL_mixer header at /home/thomas/projets/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/SDL2/SDL_mixer.h
SDL2: found SDL_ttf header at /home/thomas/projets/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/SDL2/SDL_ttf.h
SDL2: found SDL_image header at /home/thomas/projets/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/SDL2/SDL_image.h
WARNING: A problem occurred while running pkg-config --libs --cflags pangoft2 (code 1)

b"Package pangoft2 was not found in the pkg-config search path.\nPerhaps you should add the directory containing `pangoft2.pc'\nto the PKG_CONFIG_PATH environment variable\nPackage 'pangoft2', required by 'virtual:world', not found\n"

ERROR: Dependency for context.pyx not resolved: config.pxi
ERROR: Dependency for compiler.pyx not resolved: config.pxi
ERROR: Dependency for context_instructions.pyx not resolved: config.pxi
ERROR: Dependency for fbo.pyx not resolved: config.pxi
ERROR: Dependency for gl_instructions.pyx not resolved: config.pxi
ERROR: Dependency for instructions.pyx not resolved: config.pxi
ERROR: Dependency for opengl.pyx not resolved: config.pxi
ERROR: Dependency for opengl_utils.pyx not resolved: config.pxi
ERROR: Dependency for shader.pyx not resolved: config.pxi
ERROR: Dependency for stencil_instructions.pyx not resolved: config.pxi
ERROR: Dependency for scissor_instructions.pyx not resolved: config.pxi
ERROR: Dependency for texture.pyx not resolved: config.pxi
ERROR: Dependency for vbo.pyx not resolved: config.pxi
ERROR: Dependency for vertex.pyx not resolved: config.pxi
ERROR: Dependency for vertex_instructions.pyx not resolved: config.pxi
ERROR: Dependency for cgl.pyx not resolved: config.pxi
ERROR: Dependency for cgl_mock.pyx not resolved: config.pxi
ERROR: Dependency for cgl_gl.pyx not resolved: config.pxi
ERROR: Dependency for cgl_glew.pyx not resolved: config.pxi
ERROR: Dependency for cgl_sdl2.pyx not resolved: config.pxi
ERROR: Dependency for svg.pyx not resolved: config.pxi
 Download error on https://pypi.org/simple/cython/: unknown url type: https -- Some packages may not be found!
 Download error on https://pypi.org/simple/: unknown url type: https -- Some packages may not be found!
 No local packages or working download links found for cython!=0.27,!=0.27.2,<=0.29.10,>=0.24
 Traceback (most recent call last):
   File "setup.py", line 1206, in <module>
     'tuio': ['oscpy']
   File "/home/thomas/projets/buildroot/output/host/lib/python3.7/site-packages/setuptools/__init__.py", line 144, in setup
     _install_setup_requires(attrs)
   File "/home/thomas/projets/buildroot/output/host/lib/python3.7/site-packages/setuptools/__init__.py", line 139, in _install_setup_requires
     dist.fetch_build_eggs(dist.setup_requires)
   File "/home/thomas/projets/buildroot/output/host/lib/python3.7/site-packages/setuptools/dist.py", line 717, in fetch_build_eggs
     replace_conflicting=True,
   File "/home/thomas/projets/buildroot/output/host/lib/python3.7/site-packages/pkg_resources/__init__.py", line 782, in resolve
     replace_conflicting=replace_conflicting
   File "/home/thomas/projets/buildroot/output/host/lib/python3.7/site-packages/pkg_resources/__init__.py", line 1065, in best_match
     return self.obtain(req, installer)
   File "/home/thomas/projets/buildroot/output/host/lib/python3.7/site-packages/pkg_resources/__init__.py", line 1077, in obtain
     return installer(requirement)
   File "/home/thomas/projets/buildroot/output/host/lib/python3.7/site-packages/setuptools/dist.py", line 784, in fetch_build_egg
     return cmd.easy_install(req)
   File "/home/thomas/projets/buildroot/output/host/lib/python3.7/site-packages/setuptools/command/easy_install.py", line 673, in easy_install
     raise DistutilsError(msg)
 distutils.errors.DistutilsError: Could not find suitable distribution for Requirement.parse('cython!=0.27,!=0.27.2,<=0.29.10,>=0.24')
make[1]: *** [package/pkg-generic.mk:241: /home/thomas/projets/buildroot/output/build/python-kivy-1.11.1/.stamp_built] Error 1
make: *** [Makefile:84: _all] Error 2

There are two things that strike out here:

 - It seems to need pango.

 - It seems like it tries to download some stuff, which is really bad,
   it shouldn't download anything.

See below for some more review comments.


> diff --git a/package/python-kivy/Config.in b/package/python-kivy/Config.in
> new file mode 100644
> index 0000000000..521c69e389
> --- /dev/null
> +++ b/package/python-kivy/Config.in
> @@ -0,0 +1,26 @@
> +config BR2_PACKAGE_KIVY_USE_GLES
> +	bool
> +	default y
> +	depends on !BR2_PACKAGE_HAS_LIBGL && BR2_PACKAGE_HAS_LIBGLES

This config option is probably not needed, see below.

> +
> +config BR2_PACKAGE_PYTHON_KIVY
> +	bool "python-kivy"
> +	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES
> +	select BR2_PACKAGE_HOST_PYTHON_CYTHON
> +	select BR2_PACKAGE_LIBPNG # runtime
> +	select BR2_PACKAGE_MTDEV # runtime
> +	select BR2_PACKAGE_PYTHON_DOCUTILS # runtime
> +	select BR2_PACKAGE_PYTHON_PYGMENTS # runtime
> +	select BR2_PACKAGE_SDL2 if BR2_PACKAGE_KIVY_USE_GLES
> +	select BR2_PACKAGE_SDL2_IMAGE if BR2_PACKAGE_KIVY_USE_GLES
> +	select BR2_PACKAGE_SDL2_MIXER if BR2_PACKAGE_KIVY_USE_GLES
> +	select BR2_PACKAGE_SDL2_TTF if BR2_PACKAGE_KIVY_USE_GLES
> +	select BR2_PACKAGE_SDL2_OPENGLES if BR2_PACKAGE_KIVY_USE_GLES # runtime

Here you can simply do:

	select BR2_PACKAGE_SDL2 if !BR2_PACKAGE_HAS_LIBGL

and ditto for all other options. This way BR2_PACKAGE_KIVY_USE_GLES is
not needed.

> diff --git a/package/python-kivy/python-kivy.mk b/package/python-kivy/python-kivy.mk
> new file mode 100644
> index 0000000000..deefa8fd07
> --- /dev/null
> +++ b/package/python-kivy/python-kivy.mk
> @@ -0,0 +1,62 @@
> +################################################################################
> +#
> +# python-kivy
> +#
> +################################################################################
> +
> +PYTHON_KIVY_VERSION = 1.11.1
> +PYTHON_KIVY_SITE = $(call github,kivy,kivy,$(PYTHON_KIVY_VERSION))
> +PYTHON_KIVY_SETUP_TYPE = distutils
> +PYTHON_KIVY_LICENSE = MIT
> +PYTHON_KIVY_LICENSE_FILES = LICENSE
> +PYTHON_KIVY_DEPENDENCIES = host-python-cython libgl

I thought you could use libgl or libgles, but here you unconditionally
depend on libgl, that doesn't look good.

Also, the below dependencies look a bit messy, I think there should be
a clear GL / GLES conditional:

ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
PYTHON_KIVY_DEPENDENCIES += libgl
PYTHON_KIVY_ENV += USE_SDL=0
ifeq ($(BR2_PACKAGE_XLIB_LIBX11)$(BR2_PACKAGE_XLIB_LIBXRENDER),yy)
PYTHON_KIVY_DEPENDENCIES += xlib_libX11 xlib_libXrender
PYTHON_KIVY_ENV += USE_X11=1
else
PYTHON_KIVY_ENV += USE_X11=0
endif
else ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
PYTHON_KIVY_DEPENDENCIES += libgles sdl2 sdl2_image sdl2_mixer sdl2_ttf
PYTHON_KIVY_ENV += \
	USE_OPENGL_ES2=1 \
	USE_OPENGL_MOCK=1 \
	USE_SDL=1 \
	KIVY_SDL2_PATH=$(STAGING_DIR)/usr/include/SDL2
endif

> +define PYTHON_KIVY_REMOVE_EXAMPLES
> +	rm -rf $(TARGET_DIR)/usr/share/kivy-examples
> +endef
> +
> +PYTHON_KIVY_POST_INSTALL_TARGET_HOOKS += PYTHON_KIVY_REMOVE_EXAMPLES

Maybe for a package like this it makes sense to have a sub-option to
keep the examples on the target.

Could you have a look at the above issues, and send an updated patch ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
