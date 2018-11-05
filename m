From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 5 Nov 2018 21:19:31 +0100
Subject: [Buildroot] qt-webkit-kiosk on Raspberry Pi
In-Reply-To: <CAHS=Uo_N6w84weSWBXMBZG1t4kFduSFREy-2h9RWujY6TOS3EQ@mail.gmail.com>
References: <CAHS=Uo8ra0EvLoVoRys_F=5Qq=J-8vaJ9e60jL97dwx+zP2oRQ@mail.gmail.com>
 <20181104222006.6ca268bc@gmx.net>
 <CAHS=Uo_N6w84weSWBXMBZG1t4kFduSFREy-2h9RWujY6TOS3EQ@mail.gmail.com>
Message-ID: <20181105211931.164a695e@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Michael,

On Mon, 5 Nov 2018 08:59:29 +0100, Michael Toldo <michael.toldo@gmail.com> wrote:

> Hi Peter,
> 
> Thank you for your reply! I enabled the BR2_PACKAGE_QT5BASE_EGLFS and did a
> full rebuild again. It's working now!
> 

This is good news ;-), thanks for the feedback...

Regards,
Peter
 
> Regards,
> Michael
> 
> Am So., 4. Nov. 2018 um 22:20 Uhr schrieb Peter Seiderer <ps.report@gmx.net
> >:  
> 
> > Hello Michael,
> >
> > On Wed, 31 Oct 2018 18:28:27 +0100, Michael Toldo <michael.toldo@gmail.com>
> > wrote:
> >  
> > > Hi,
> > >
> > > I just tried to compile the master buildroot for the Raspberry Pi 0 W.
> > > Everything worked well an I was able to boot the image. I wanted to start
> > > the qt-webkit-kiosk but this error occured:
> > >
> > >
> > >
> > >
> > >
> > >
> > > *qt.qpa.plugin: Could not find the Qt platform plugin "eglfs" in ""This
> > > application failed to start because no Qt platform plugin could be
> > > initialized. Reinstalling the application may fix this problem.Available
> > > platform plugins are: linuxfb, minimal, offscreen, vnc.Aborted*
> > >
> > > The .config tells me "*eglfs backend available if OpenGL and EGL are
> > > enabled*" but I guess OpenGL and EGL is already supported by the
> > > rpi-userland.  
> >
> > Seems your have set BR2_PACKAGE_QT5BASE_DEFAULT_QPA=eglfs without
> > setting BR2_PACKAGE_QT5BASE_EGLFS=y (maybe disabled because of
> > missing dependencies)? Or you need to do a complete re-build
> > (after changing some options, see [1])?
> >
> > Mind to share your .config file?
> >
> > Regards,
> > Peter
> >
> > [1] http://nightly.buildroot.org/manual.html#full-rebuild
> >  
> > >
> > > Can somebody please give me a hint?
> > >
> > > Regards  
> >
> >  
