From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 15 Feb 2014 08:15:07 +0100
Subject: [Buildroot] enable eglfs
In-Reply-To: <52FF0E04.6030800@gmail.com>
References: <52FF0E04.6030800@gmail.com>
Message-ID: <CAAXf6LVZ2i6XhV+3uVV86ru=adVjS9NkC1S873+wbL+-0VtUng@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Marco,

On Sat, Feb 15, 2014 at 7:49 AM, Marco Trapanese
<marcotrapanese@gmail.com> wrote:
> Hello,
> I'm trying to add the Qt5/webkit support to the raspberryrpi_defconfig.
> In the ncurses configuration window I see this message:
>
> "eglfs backend available if OpenGLES and EGL are enabled"
>
> I searched for OpenGLES symbol (F8) but it found nothing. I don't understand
> how to enable the OpenGLES and EGL in order to allow the eglfs backend.

You need to enable a provider of opengl. In your case, you need
rpi-userland, but in general these are the current choices:

grep -rn 'select BR2_PACKAGE_HAS_OPENGL_' package/
package/freescale-imx/gpu-viv-bin-mx6q/Config.in:7:     select
BR2_PACKAGE_HAS_OPENGL_EGL
package/freescale-imx/gpu-viv-bin-mx6q/Config.in:8:     select
BR2_PACKAGE_HAS_OPENGL_ES
package/ti-gfx/Config.in:3:     select BR2_PACKAGE_HAS_OPENGL_EGL
package/ti-gfx/Config.in:4:     select BR2_PACKAGE_HAS_OPENGL_ES
package/rpi-userland/Config.in:7:       select BR2_PACKAGE_HAS_OPENGL_EGL
package/rpi-userland/Config.in:8:       select BR2_PACKAGE_HAS_OPENGL_ES
package/sunxi-mali/Config.in:3: select BR2_PACKAGE_HAS_OPENGL_EGL
package/sunxi-mali/Config.in:4: select BR2_PACKAGE_HAS_OPENGL_ES

To know which symbol to grep for, I looked at the help of the comment
you mentioned, to see what it depended on.

Best regards,
Thomas
