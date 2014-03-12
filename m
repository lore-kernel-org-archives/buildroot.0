From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 12 Mar 2014 18:31:41 +0100
Subject: [Buildroot] [PATCH v4 1/5] mesa3d: pull out from x11
In-Reply-To: <531FFD8E.8010209@mind.be>
References: <BLU0-SMTP4083C56CA0B43BBAC9B3616D9750@phx.gbl>
 <20140310173941.GA3282@free.fr> <20140310182030.GB18832@pc-eric>
 <20140310184119.GC3282@free.fr> <531FFD8E.8010209@mind.be>
Message-ID: <20140312173141.GA3389@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2014-03-12 07:24 +0100, Arnout Vandecappelle spake thusly:
> On 03/10/14 19:41, Yann E. MORIN wrote:
> >> > 1. As Mesa3D is an implementation of OpenGL, it will be a provider for the
> >> >    virtual packages libegl, libgles and libopenvg.
> > I've looked on my distro, and mesa3d does not provide any file named
> > libegl*.so or ligles*.so or libopenvg*.so. So I don't think it should
> > be, *as is*, a provider for libegl, libgles or libopenvg.
> 
>  Have you looked at libegl1-mesa, libgles2-mesa, libopenvg1-mesa?

Indeed, I was looking for libegl, not libEGL. And apt-file is not smart
enough to do a case-insensitive search by default, so now:

    $ apt-file search -i libegl |grep -E '\.so'
    [...]
    libegl1-mesa: /usr/lib/x86_64-linux-gnu/mesa-egl/libEGL.so.1.0.0
    [...]

    $ apt-file search -i libgles |grep -E '\.so'
    [...]
    libgles1-mesa: /usr/lib/x86_64-linux-gnu/mesa-egl/libGLESv1_CM.so.1.1.0
    [...]
    libgles2-mesa: /usr/lib/x86_64-linux-gnu/mesa-egl/libGLESv2.so.2.0.0
    [...]

    $ apt-file search -i libopenvg |grep -E '\.so'
    [...]
    libopenvg1-mesa: /usr/lib/x86_64-linux-gnu/mesa-egl/libOpenVG.so.1.0.0
    [...]

OK, good. So mesa3d can be added as a provider for libegl, libgles and
libopenvg, indeed. It can be done in a separate patch, later.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
