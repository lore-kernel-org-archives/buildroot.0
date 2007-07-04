From: Julien Letessier <julien.letessier@technosens.fr>
Date: Wed, 4 Jul 2007 17:32:45 +0200
Subject: [Buildroot] X11R7 packages available
In-Reply-To: <1c5a01c7be32$3adaf9a0$2311a8c0@OneWorld.local>
References: <f0528b5b0707040129j262b9e24i774fd06d8d579a2a@mail.gmail.com>
	<1c2701c7be1c$3af895c0$2311a8c0@OneWorld.local>
	<1c5a01c7be32$3adaf9a0$2311a8c0@OneWorld.local>
Message-ID: <f0528b5b0707040832j7ae99465hd987b10fc6c85476@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Did you apply the autotools4 patch (first mail in this thread, also at
http://bazaar.mezis.net/buildroot_autotools4.patch.bz2)?
All my X11R7 packages use it.

Else it's hard to diagnose...
You can try to "make xlib_libX11" manually, for instance. If this doesn't
work you have a make or makefile problem. Are you using GNU make?

If it works its a different problem. If you have applied my show-var patch (
http://bazaar.mezis.net/buildroot_show-var.patch) you can "make show-var
VARNAME=TARGETS" and check if the X packages are in the TARGETS.

2007/7/4, Nuno da Costa Ferro <nferro@nfive.com>:
>
> Maybe I'm doing something wrong, but after selecting some X11R7 packets
> they
> are not being compiled when I run make.
>
>
> Kind regards,
>
> Nuno da Costa Ferro
> ---------------------------
> Number Five Software, S.A.
> Development & IT Management
> Email: nferro at nfive.com
> DDI: +351 261 860 472
> ----- Original Message -----
> From: "Nuno da Costa Ferro" <nferro@nfive.com>
> To: "Julien Letessier" <julien.letessier@technosens.fr>; "Buildroot
> mailing
> list" <buildroot@uclibc.org>
> Sent: Wednesday, July 04, 2007 10:18 AM
> Subject: Re: [Buildroot] X11R7 packages available
>
>
> > Hi Julien.
> >
> > I'm getting this error when trying to go "make menuconfig":
> > package/Config.xorg7.in:20: can't open file
> > "package/pthread-stubs/Config.in"
> >
> > Then I comment that line and get:
> > package/Config.xorg7.in:156: can't open file
> > "package/openchrome/Config.in"
> >
> > After commenting that I am now compiling.
> >
> >
> > Kind regards,
> >
> > Nuno da Costa Ferro
> > ---------------------------
> > Number Five Software, S.A.
> > Development & IT Management
> > Email: nferro at nfive.com
> > DDI: +351 261 860 472
> >
> >
> > ----- Original Message -----
> > From: Julien Letessier
> > To: Buildroot mailing list
> > Sent: Wednesday, July 04, 2007 9:29 AM
> > Subject: [Buildroot] X11R7 packages available
> >
> >
> > Hi list,
> >
> > As promised, here is
> > - a full set of X11R7 and support packages (including Mesa3D OpenGL, 2D
> > and
> > 3D drivers, Xv support)
> > - an updated version (release 4) of the autotools patch
> >
> > The files are available from:
> >   http://bazaar.mezis.net/buildroot_autotools4.patch.bz2
> >   http://bazaar.mezis.net/buildroot_x11r7_v1.tar.bz2
> > [because mailman won't let me attach them]
> >
> > Extract the archive, move packages to your buildroot package directory,
> > and
> > remember to add
> >   source "package/Config.xorg7.in"
> > to your package/Config.in
> >
> > Hopefully I didn't forget a dependancy package.
> >
> > Any feedback is welcome... once this is tested I think it would be a
> good
> > idea to add the whole thing to Buildroot.
> >
> > Cheers,
> > --
> > Julien Letessier
> > <julien.letessier@technosens.fr>
> >
> >
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at uclibc.org
> > http://busybox.net/mailman/listinfo/buildroot
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at uclibc.org
> > http://busybox.net/mailman/listinfo/buildroot
> >
>
>


-- 
Julien Letessier
<julien.letessier@technosens.fr>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070704/832bf0dc/attachment-0001.htm 
