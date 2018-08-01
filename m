From: Daniel Nicoletti <dantti12@gmail.com>
Date: Wed, 1 Aug 2018 10:11:02 -0300
Subject: [Buildroot] [PATCH] package/cutelyst: Fix build dependencies
In-Reply-To: <20180801150637.3e3403b1@windsurf>
References: <20180801114738.5044-1-dantti12@gmail.com>
 <20180801142712.5281ca21@windsurf>
 <CACo8zOf7ukrnVpS0QUCA_YpmX7ApxApqGdadyTJn4yocF+juTg@mail.gmail.com>
 <20180801150637.3e3403b1@windsurf>
Message-ID: <CACo8zOcanOG0KkHPa9Cq7zdpVjTbsmL_mwTs6MRv4dSiTJu+OQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Em qua, 1 de ago de 2018 ?s 10:06, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> escreveu:
>
> Hello,
>
> On Wed, 1 Aug 2018 09:55:43 -0300, Daniel Nicoletti wrote:
>
> > > However, there are other build issues of the cutelyst package which
> > > don't seem to be related:
> > >
> > >  - http://autobuild.buildroot.net/results/b4b/b4bd0807fed721d8f553f1392e7d1fa51545d046/build-end.log
> > >
> > >    Lots of Qt/C++ errors.
> > Yeah, I have fixed a few right after the release, as they usually build fine
> > when warnings are not enabled...
>
> I'm not sure what you mean here. These errors still occur in the
> autobuilders. Do we need to bump the cutelyst version ?
Yes, I'll probably do a point release due that error, it's just one
besides the huge g++ output...

>
> > >  - http://autobuild.buildroot.net/results/555/555cf0cd59c9c832b15c604dae5bad3640f8b450/build-end.log
> > >
> > >    Doxygen missing. We have a host-doxygen package in Buildroot, but it
> > >    would be a lot nicer of Cutelyst would not require Doxygen. Any
> > >    chance to make this optional ? We don't really care about building
> > >    documentation in the context of Buildroot.
> > It does not require, it only uses if found and if make docs, I could
> > add a BUILD_DOCS option but it's not very important IMO.
>
> So according to your next e-mail, this failure is not due to
> lrelease/doxygen missing, but only because libpwquality could not be
> found ?
yes, otherwise the other link wouldn't had issues at compilation time.

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com



-- 
Daniel Nicoletti

KDE Developer - http://dantti.wordpress.com
