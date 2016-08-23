From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 24 Aug 2016 00:06:12 +0200
Subject: [Buildroot] [PATCH 1/4] package/libegl: add option for wayland
 extensions
In-Reply-To: <20160823235801.57c65bd0@free-electrons.com>
References: <cover.1471968455.git.yann.morin.1998@free.fr>
 <6d4c564432948310ca9502dc94c2d50a7c97f460.1471968455.git.yann.morin.1998@free.fr>
 <20160823220245.49e1b6e7@free-electrons.com>
 <20160823214351.GE5749@free.fr>
 <20160823235801.57c65bd0@free-electrons.com>
Message-ID: <20160823220612.GF5749@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-08-23 23:58 +0200, Thomas Petazzoni spake thusly:
> On Tue, 23 Aug 2016 23:43:51 +0200, Yann E. MORIN wrote:
> 
> > > One thing that surprises me though is that weston itself doesn't use
> > > this new option, and still has:
> > > 
> > > config BR2_PACKAGE_WESTON_DRM
> > >         bool "DRM compositor"
> > >         depends on BR2_PACKAGE_MESA3D_OPENGL_EGL
> > >         select BR2_PACKAGE_LIBDRM
> > >         select BR2_PACKAGE_WESTON_HAS_COMPOSITOR
> > > 
> > > # Uses libgbm from mesa3d
> > > comment "DRM compositor needs an OpenGL EGL backend provided by mesa3d"
> > >         depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL
> > > 
> > > So it's weird to have a new OpenGL implementation that is said to be
> > > Wayland capable, but doesn't allow to build the reference Wayland
> > > implementation.  
> > 
> > That's because not everything was converted. Yet.
> 
> OK, this is definitely a good explanation. So I should take it that you
> expect Weston to build and work with the latest version of the NVidia
> driver?

Eventually. Eventually... ;-)

To be honest, this is not my highest priority for 2016.11; I have multi
br2-external and systemd skeleton to handle first.

This quick egl-wayland series (which I did not expect would be applied
so fast!) was just a little distraction along the way. ;-) But at least,
it paves the way toward more egl-wayland providers and users.

As for Weston and the DRM compositor, I guess Gustavo did with what we
had at the time... And I'm not totally up-to-speed with all the
complexity of the graphics stack...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
