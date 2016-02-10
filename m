From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 10 Feb 2016 21:34:40 +0100
Subject: [Buildroot] [PATCH 1/3] mali-t76x: add new package
In-Reply-To: <1453478020-311-2-git-send-email-ariel@vanguardiasur.com.ar>
 (Ariel D'Alessandro's message of "Fri, 22 Jan 2016 12:53:38 -0300")
References: <1453478020-311-1-git-send-email-ariel@vanguardiasur.com.ar>
 <1453478020-311-2-git-send-email-ariel@vanguardiasur.com.ar>
Message-ID: <878u2ss3rz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ariel" == Ariel D'Alessandro <ariel@vanguardiasur.com.ar> writes:

 > Package provides the binary user-space components for the ARM Mali
 > Midgard T76X GPU.

 > Note that this package requires a kernel with the ARM Mali Midgard GPU
 > Kernel Drivers enabled.

 > Signed-off-by: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
 > ---
 >  package/Config.in                                  |  1 +
 >  ...latform.h-with-framebuffer-instead-of-X11.patch | 39 +++++++++++++
 >  package/mali-t76x/Config.in                        | 27 +++++++++
 >  package/mali-t76x/egl.pc                           | 12 ++++
 >  package/mali-t76x/glesv2.pc                        | 12 ++++
 >  package/mali-t76x/rockchip-mali.mk                 | 64 ++++++++++++++++++++++
 >  6 files changed, 155 insertions(+)
 >  create mode 100644 package/mali-t76x/0001-use-eglplatform.h-with-framebuffer-instead-of-X11.patch
 >  create mode 100644 package/mali-t76x/Config.in
 >  create mode 100644 package/mali-t76x/egl.pc
 >  create mode 100644 package/mali-t76x/glesv2.pc
 >  create mode 100644 package/mali-t76x/rockchip-mali.mk

 > diff --git a/package/mali-t76x/rockchip-mali.mk b/package/mali-t76x/rockchip-mali.mk
 > new file mode 100644
 > index 0000000..3117864
 > --- /dev/null
 > +++ b/package/mali-t76x/rockchip-mali.mk

This file should be named mali-t76x.mk to match the directory and
variables.

> @@ -0,0 +1,64 @@
 > +################################################################################
 > +#
 > +# mali-t76x
 > +#
 > +################################################################################
 > +
 > +MALI_T76X_VERSION = r5p0-06rel0
 > +MALI_T76X_SOURCE = mali-t76x_$(MALI_T76X_VERSION)_linux_1+fbdev.tar.gz
 > +MALI_T76X_SITE = http://malideveloper.arm.com/downloads/drivers/binary/$(MALI_T76X_VERSION)

A .hash file listing the sha256sum for this would be nice.

> +
 > +MALI_T76X_EXTRA_SITE = https://www.khronos.org/registry
 > +MALI_T76X_EXTRA_DOWNLOADS = \
 > +	$(MALI_T76X_EXTRA_SITE)/egl/api/EGL/egl.h \
 > +	$(MALI_T76X_EXTRA_SITE)/egl/api/EGL/eglext.h \
 > +	$(MALI_T76X_EXTRA_SITE)/egl/api/EGL/eglplatform.h \
 > +	$(MALI_T76X_EXTRA_SITE)/gles/api/GLES/gl.h \
 > +	$(MALI_T76X_EXTRA_SITE)/gles/api/GLES/glext.h \
 > +	$(MALI_T76X_EXTRA_SITE)/gles/api/GLES/glplatform.h \
 > +	$(MALI_T76X_EXTRA_SITE)/gles/api/old/2.0/gl2.h \
 > +	$(MALI_T76X_EXTRA_SITE)/gles/api/old/2.0/gl2ext.h \
 > +	$(MALI_T76X_EXTRA_SITE)/gles/api/old/2.0/gl2platform.h \
 > +	$(MALI_T76X_EXTRA_SITE)/egl/api/KHR/khrplatform.h

Could this use mesa3d-headers like the nvidia drivers do?

Other than that it looks good.

-- 
Bye, Peter Korsgaard
