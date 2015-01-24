From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 24 Jan 2015 18:02:31 +0100
Subject: [Buildroot] [RFC 0/4] Try to clean up proprietary OpenGL drivers
In-Reply-To: <20150123105742.GB8089@free.fr>
References: <1421839408-15839-1-git-send-email-jezz@sysmic.org>
 <20150123105742.GB8089@free.fr>
Message-ID: <20150124170231.GA4001@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?me, All,

On 2015-01-23 11:57 +0100, Yann E. MORIN spake thusly:
> On 2015-01-21 12:23 +0100, J?r?me Pouiller spake thusly:
> > Until now, xorg-xserver depends on mesa3d to compile with GLX/DRI support.
> > However, there was problem with proprietary OpenGL drivers. These ones depends
> > on GLX/DRI support (so, they depends on mesa3d) and overwrite files provided by
> > mesa3d (so, they conflict with mesa3d).
> > 
> > Thanks to opengl-registry, it is possible to change proprietary OpenGL drivers
> > in real LibGL provider and compile GLX/DRI support using proprietary drivers
> > instead of mesa3d.
> > 
> > Notice this series aim to highlight the problem described above. It does not
> > aim to be upstreamed. It apply on top of Yann series about nvidia driver and
> > my series about imx6 gpu driver.
> > 
> > J?r?me Pouiller (4):
> >   nvidia-driver: Add gl.pc
> >   gpu-viv-bin-mx6q: is a libgl provider
> >   opengl-registry: Also provide DRI interface
> >   xorg-server: Depends on libgl to enable DRI/GLX
[--SNIP--]
> Finally, I am not too fond of bundling the dri header, neither in the
> OpenGL registry package, nor in any other package.
[--SNIP--]
> An alternative would be to provide a prompt-less, stripped mesa3d
> package that woudl install only headers; [...]

So, I've pushed an updated series that does exactly that: add a
mesa3d-headers package, which is responsible for providing gl.h
(un-bundled from a previous series), dir_interface.h and dri.pc.

Thanks for the input! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
