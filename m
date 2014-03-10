From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 10 Mar 2014 19:41:19 +0100
Subject: [Buildroot] [PATCH v4 1/5] mesa3d: pull out from x11
In-Reply-To: <20140310182030.GB18832@pc-eric>
References: <BLU0-SMTP4083C56CA0B43BBAC9B3616D9750@phx.gbl>
 <20140310173941.GA3282@free.fr> <20140310182030.GB18832@pc-eric>
Message-ID: <20140310184119.GC3282@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Eric, All,

On 2014-03-10 19:20 +0100, Eric Le Bihan spake thusly:
> Yann E., All
> On Mon, Mar 10, 2014 at 06:39:41PM +0100, Yann E. MORIN wrote:
> 
> > > diff --git a/package/Config.in b/package/Config.in
> > > index 70e5a7f..b0da653 100644
> > > --- a/package/Config.in
> > > +++ b/package/Config.in
> > > @@ -188,6 +188,7 @@ source "package/fbv/Config.in"
> > >  source "package/imagemagick/Config.in"
> > >  source "package/linux-fusion/Config.in"
> > >  source "package/lite/Config.in"
> > > +source "package/mesa3d/Config.in"
> >
> > If I understand correctly, mesa3d is an implementation of OpenGL. So,
> > *maybe* it would make sense to move it along the other OpenGL packages,
> > into package/opengl/.
> Some quick thoughts:
> 
> 1. As Mesa3D is an implementation of OpenGL, it will be a provider for the
>    virtual packages libegl, libgles and libopenvg.

I've looked on my distro, and mesa3d does not provide any file named
libegl*.so or ligles*.so or libopenvg*.so. So I don't think it should
be, *as is*, a provider for libegl, libgles or libopenvg.

> 2. Mesa3D also provides libgl, but:

libgl or libglx ?

On my distro (Ubuntu 13.10), there's no libgl.so, only libglx.so which
is provided by a bumch of different packages, of which the nvidia blobs.

All I have that looks to be from mesa3d if libglapi.so.

>   - no package in Buildroot requires full OpenGL.
>   - Buildroot is unlikely to include packages for AMD/NVidia/Intel drivers
>     (providers for libgl).

Unlikely, but what about a powerfull, game-console-class device using a
NVidia (or Intel, AMD) GPU?

>   So there is no need for a libgl virtual package.

Indeed, so no need to provide a virtul package for that as long as we do
not have a real user. It will always be time to add it later. And it's
not like it would be rocket-science to do it! :-)

> 3. IMHO package/opengl should only contain the definitions of the virtual
>    packages, not the providers (otherwise sunxi-mali should be moved to
>    package/opengl too!).

Yes, I already replied to Bernd in this direction: mesa3d treads on the
provider side. So like other GL providers, it does not really belong to
package/opengl.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
