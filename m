From: Adrian Perez de Castro <aperez@igalia.com>
Date: Fri, 18 Sep 2020 17:06:42 +0300
Subject: [Buildroot] [PATCH 3/6] package/wpebackend-fdo: bump to version
 1.8.0
In-Reply-To: <20200917224452.6e856078@windsurf.hq.k.grp>
References: <20200915223053.3090447-1-aperez@igalia.com>
 <20200915223053.3090447-4-aperez@igalia.com>
 <20200917224452.6e856078@windsurf.hq.k.grp>
Message-ID: <20200918170642.GB889680@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Thu, 17 Sep 2020 22:44:52 +0200 Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> On Wed, 16 Sep 2020 01:30:50 +0300
> Adrian Perez de Castro <aperez@igalia.com> wrote:
> 
> >  comment "wpebackend-fdo needs a toolchain w/ C++, wchar, threads, dynamic library and an OpenEGL-capable Wayland backend"
> >  	depends on !BR2_PACKAGE_HAS_LIBEGL_WAYLAND || !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
> > -		|| !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> > +		|| !BR2_PACKAGE_HAS_LIBGL || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> 
> This is not longer really in sync with the comment that says "an OpenGL
> capable Wayland backend".
> 
> >  config BR2_PACKAGE_WPEBACKEND_FDO
> >  	bool "wpebackend-fdo"
> >  	depends on !BR2_STATIC_LIBS # wayland
> >  	depends on BR2_INSTALL_LIBSTDCPP
> > +	depends on BR2_PACKAGE_HAS_LIBGL # libepoxy
> 
> This looks really odd as:
> 
>  (1) Requiring full OpenGL means that no OpenGL ES platform can use
>      wpebakend-fdo. Remember that libgl == full/desktop OpenGL, while
>      libgles = OpenGL ES.
> 
>  (2) libepoxy does not depned on HAS_LIBGL, but HAS_LIBGL || HAS_LIBEGL
> 
>  (3) You have a dependency on HAS_LIBEGL_WAYLAND... so it kind of
>      implies that an EGL/OpenGL ES configuration should work ?
> 
> Could you revisit this ?

You are right, any EGL + GLES implementation should do, and actually ?desktop
GL? (libgl) is not even supported by WPE. I'll update this patch later on and
submit an updated version.

Thanks for the review,
?Adri?n
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200918/4f42ad63/attachment.asc>
