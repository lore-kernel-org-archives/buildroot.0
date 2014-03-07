From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 7 Mar 2014 18:12:23 +0100
Subject: [Buildroot] [PATCH 0/17 v2] Add new virtual-package
 infrastructure
In-Reply-To: <20140307140052.GA5226@pc-eric>
References: <cover.1393695127.git.yann.morin.1998@free.fr>
 <20140301235618.04b363a8@skate> <20140307140052.GA5226@pc-eric>
Message-ID: <20140307171223.GB3384@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Eric, All,

On 2014-03-07 15:00 +0100, Eric Le Bihan spake thusly:
> On Sat, Mar 01, 2014 at 11:56:18PM +0100, Thomas Petazzoni wrote:
> > On Sat,  1 Mar 2014 18:32:43 +0100, Yann E. MORIN wrote:
> >
> > >       package/libgles: rename the _HAS and _PROVIDES variables
> > >       package/libegl: rename the _HAS and _PROVIDES variables
> > >       package/libopenmax: rename the _HAS and _PROVIDES variables
> > >       package/libopenvg: rename the _HAS and _PROVIDES variables
> > >       package/luainterpreter: rename the _HAS and _PROVIDES variables
> >
> > I certainly agree to ensure that the kconfig symbol matches the package
> > name. However, I am not sure the renaming of BR2_PACKAGE_HAS_OPENGL_ES
> > to BR2_PACKAGE_HAS_LIBGLES is really nice. BR2_PACKAGE_HAS_OPENGL_ES
> > had the merit of explicitly containing the word "OpenGL", while LIBGLES
> > makes that a bit more cryptic. Do we want to instead rename the package
> > to libopengl-es or some other variation on this?
> >
> > A similar reflexion could be made on the naming of the libegl package.
> The names defined by Khronos Group are "OpenGL ES" and "EGL". That would
> logically lead to:
> 
> - libopengl-es/BR2_PACKAGE_HAS_OPENGL_ES
> - libegl/BR2_PACKAGE_HAS_EGL

With the virtual-package infrastructure, there should be corespondence
between the package name and the option name, e.g.:
    libopengl-es  -> BR2_PACKAGE_HAS_LIBOPENGL_ES
    libegl        -> BR2_PACKAGE_HAS_LIBEGL

because the package infrastructure (virtual or otherwise) needs to match
option names from package names.

> But the names used for the libraries are libGLES and libEGL. Googling them
> leads to OpenGL related pages. Some GNU/Linux distros (Arch Linux, Debian)
> use them in package names.
> 
> IMHO, BR2_PACKAGE_HAS_LIBGLES and BR2_PACKAGE_HAS_LIBEGL, though not sticking
> with the official names, are not *that* cryptic.

I agree that the rather-shoer libegl and libgles are meaningful-enough
that a user should find them quite easily.

So, before I repost the virtual-package series, I'd like we settle on
the names of the packages. Note that for now, I've named them (and I'm
willing to rename them again!):
    package/opengl/opengl-libegl
    package/opengl/opengl-libgles

I find those names a bit strange, as it denotes from the other two
packages:
    package/opengl/libopenmax
    package/opengl/libopenvg

So, libegl and libgles would still match this naming scheme.

OTOH, we could just move those packages out of package/opengl/ directly
into package/ so we would no longer care about any similarity or
dissimilarity between those packages names.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
