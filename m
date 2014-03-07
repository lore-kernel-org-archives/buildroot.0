From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Fri, 7 Mar 2014 15:00:54 +0100
Subject: [Buildroot] [PATCH 0/17 v2] Add new virtual-package
 infrastructure
In-Reply-To: <20140301235618.04b363a8@skate>
References: <cover.1393695127.git.yann.morin.1998@free.fr>
 <20140301235618.04b363a8@skate>
Message-ID: <20140307140052.GA5226@pc-eric>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On Sat, Mar 01, 2014 at 11:56:18PM +0100, Thomas Petazzoni wrote:
> Dear Yann E. MORIN,
>
> On Sat,  1 Mar 2014 18:32:43 +0100, Yann E. MORIN wrote:
>
> >       package/libgles: rename the _HAS and _PROVIDES variables
> >       package/libegl: rename the _HAS and _PROVIDES variables
> >       package/libopenmax: rename the _HAS and _PROVIDES variables
> >       package/libopenvg: rename the _HAS and _PROVIDES variables
> >       package/luainterpreter: rename the _HAS and _PROVIDES variables
>
> I certainly agree to ensure that the kconfig symbol matches the package
> name. However, I am not sure the renaming of BR2_PACKAGE_HAS_OPENGL_ES
> to BR2_PACKAGE_HAS_LIBGLES is really nice. BR2_PACKAGE_HAS_OPENGL_ES
> had the merit of explicitly containing the word "OpenGL", while LIBGLES
> makes that a bit more cryptic. Do we want to instead rename the package
> to libopengl-es or some other variation on this?
>
> A similar reflexion could be made on the naming of the libegl package.
The names defined by Khronos Group are "OpenGL ES" and "EGL". That would
logically lead to:

- libopengl-es/BR2_PACKAGE_HAS_OPENGL_ES
- libegl/BR2_PACKAGE_HAS_EGL

But the names used for the libraries are libGLES and libEGL. Googling them
leads to OpenGL related pages. Some GNU/Linux distros (Arch Linux, Debian)
use them in package names.

IMHO, BR2_PACKAGE_HAS_LIBGLES and BR2_PACKAGE_HAS_LIBEGL, though not sticking
with the official names, are not *that* cryptic.

Best regards,
ELB
