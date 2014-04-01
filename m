From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Apr 2014 14:40:06 +0200
Subject: [Buildroot] qt5, eglfs and xcb
In-Reply-To: <533A8F6C.1010606@gmail.com>
References: <5338207F.9010807@gmail.com> <20140330172128.06f1d5d2@skate>
 <533A8F6C.1010606@gmail.com>
Message-ID: <20140401144006.5ea3dfc4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Marco Trapanese,

On Tue, 01 Apr 2014 12:05:32 +0200, Marco Trapanese wrote:

> Il 30/03/2014 17:21, Thomas Petazzoni ha scritto:
> > As explained above, this requires more than just XCB, contrary to what 
> > the company you requested support from is claiming. You need an OpenGL 
> > implementation that works under X.org, and this implementation is 
> > usually Mesa. And the support for making Mesa recognized as a proper 
> > OpenGL implementation has only been merged since yesterday, and is not 
> > yet completely ready. It would certainly be interesting to fix this in 
> > Buildroot and allow Qt5 to build for X.org with OpenGL support. 
> 
> Ok, as far as I understand it means nobody has successfully compiled Qt5 
> + webkit + xcb + mesa yet.
> Perhaps, people use only the framebuffer with buildroot.

Yes, on most embedded platforms, people use framebuffer + EGL + OpenGL
ES I believe.


> > BTW, what is your hardware platform? What type of graphics hardware 
> > are you using? What X.org driver are you using? Anyway, thanks for the 
> > report, this is definitely something that should be improved. Thomas 
> 
> We're using a Freescale iMX6 MARS board, with the modular X.org server.
> As drivers, I selected:

On i.MX6 you will clearly not want to use Mesa, as I believe there is
no support for the i.MX6 GPU in the mainline Mesa (even though the
etnaviv project has been making some interesting progress). So for the
time being, you will have to use the OpenGL implementation available in
the gpu-viv-bin-mx6q package. It has an X11 variant of the OpenGL
implementation, so it should work with X.org. The only thing that
remains is indeed fixing the Qt5 package to be able to build its X.org
support with OpenGL support.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
