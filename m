From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon, 10 Mar 2014 19:20:32 +0100
Subject: [Buildroot] [PATCH v4 1/5] mesa3d: pull out from x11
In-Reply-To: <20140310173941.GA3282@free.fr>
References: <BLU0-SMTP4083C56CA0B43BBAC9B3616D9750@phx.gbl>
 <20140310173941.GA3282@free.fr>
Message-ID: <20140310182030.GB18832@pc-eric>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann E., All
On Mon, Mar 10, 2014 at 06:39:41PM +0100, Yann E. MORIN wrote:

> > diff --git a/package/Config.in b/package/Config.in
> > index 70e5a7f..b0da653 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -188,6 +188,7 @@ source "package/fbv/Config.in"
> >  source "package/imagemagick/Config.in"
> >  source "package/linux-fusion/Config.in"
> >  source "package/lite/Config.in"
> > +source "package/mesa3d/Config.in"
>
> If I understand correctly, mesa3d is an implementation of OpenGL. So,
> *maybe* it would make sense to move it along the other OpenGL packages,
> into package/opengl/.
Some quick thoughts:

1. As Mesa3D is an implementation of OpenGL, it will be a provider for the
   virtual packages libegl, libgles and libopenvg.

2. Mesa3D also provides libgl, but:

  - no package in Buildroot requires full OpenGL.
  - Buildroot is unlikely to include packages for AMD/NVidia/Intel drivers
    (providers for libgl).

  So there is no need for a libgl virtual package.

3. IMHO package/opengl should only contain the definitions of the virtual
   packages, not the providers (otherwise sunxi-mali should be moved to
   package/opengl too!).

Best regards,
ELB
