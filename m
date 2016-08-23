From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Aug 2016 23:58:01 +0200
Subject: [Buildroot] [PATCH 1/4] package/libegl: add option for wayland
 extensions
In-Reply-To: <20160823214351.GE5749@free.fr>
References: <cover.1471968455.git.yann.morin.1998@free.fr>
 <6d4c564432948310ca9502dc94c2d50a7c97f460.1471968455.git.yann.morin.1998@free.fr>
 <20160823220245.49e1b6e7@free-electrons.com>
 <20160823214351.GE5749@free.fr>
Message-ID: <20160823235801.57c65bd0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 23 Aug 2016 23:43:51 +0200, Yann E. MORIN wrote:

> > One thing that surprises me though is that weston itself doesn't use
> > this new option, and still has:
> > 
> > config BR2_PACKAGE_WESTON_DRM
> >         bool "DRM compositor"
> >         depends on BR2_PACKAGE_MESA3D_OPENGL_EGL
> >         select BR2_PACKAGE_LIBDRM
> >         select BR2_PACKAGE_WESTON_HAS_COMPOSITOR
> > 
> > # Uses libgbm from mesa3d
> > comment "DRM compositor needs an OpenGL EGL backend provided by mesa3d"
> >         depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL
> > 
> > So it's weird to have a new OpenGL implementation that is said to be
> > Wayland capable, but doesn't allow to build the reference Wayland
> > implementation.  
> 
> That's because not everything was converted. Yet.

OK, this is definitely a good explanation. So I should take it that you
expect Weston to build and work with the latest version of the NVidia
driver?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
