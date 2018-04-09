From: Asaf Kahlon <asafka7@gmail.com>
Date: Mon, 9 Apr 2018 21:02:59 +0300
Subject: [Buildroot] [PATCH 1/1] python-fastentrypoints: new package
In-Reply-To: <CAGm1_kvM_j0Vz87ZLCO4ekFcv02vwPrYh2V7=sDvdjuYe0qSrQ@mail.gmail.com>
References: <20180408174859.19679-1-asafka7@gmail.com>
 <CAGm1_kvpoR7by7W_UtNuSeBGGcNedBrdU+VQaqM82J-CVfk7sA@mail.gmail.com>
 <20180409091406.70f4fd06@windsurf>
 <CALFsTFXN44UNogyWwaYOGO-v7AHdOxhLgELH6w2jiDFrCc3yXw@mail.gmail.com>
 <CAGm1_kvM_j0Vz87ZLCO4ekFcv02vwPrYh2V7=sDvdjuYe0qSrQ@mail.gmail.com>
Message-ID: <CALFsTFUaV3BngRXn9zYJFvdAycB+y_uSLO3VR1bXTN7_F+da2w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

OK, I'll keep an eye on this package and when it updates I'll send a patch.
Meantime, I'll put fastentrypoints.py as license file.

Thanks!

On Mon, Apr 9, 2018 at 7:47 PM, Yegor Yefremov <yegorslists@googlemail.com>
wrote:

> Hi Asaf,
>
> On Mon, Apr 9, 2018 at 5:54 PM, Asaf Kahlon <asafka7@gmail.com> wrote:
> > Yegor, Thomas,
> >
> > Indeed this is a host package. After you compile it, it can be used to
> speed
> > up entry points.
> > I now see Buildroot uses Config.in.host for this kind of packages, so I
> can
> > fix this on a new patch.
> >
> > About the license - I saw the license file on the Github repository, but
> > this license is not provided on the tar.gz archive downloaded from pypi,
> so
> > how can I add the licence information?
>
> Just use fastentrypoints.py as license file. I've asked maintainer to
> add license file to the PyPI's archive. So perhaps the new version
> would already have it.
>
> Yegor
>
> > On Mon, Apr 9, 2018, 10:14 Thomas Petazzoni <
> thomas.petazzoni at bootlin.com>
> > wrote:
> >>
> >> Hello,
> >>
> >> On Sun, 8 Apr 2018 22:59:32 +0200, Yegor Yefremov wrote:
> >>
> >> > On Sun, Apr 8, 2018 at 7:48 PM, Asaf Kahlon <asafka7@gmail.com>
> wrote:
> >> > > host-package that is able to shorten the load time of entry_points
> >> > > declared
> >> > > in setup.py of python packages.
> >> > >
> >> > > Unfortunately, license file was not found.
> >> >
> >> > This comment shouldn't be part of the commit log.
> >>
> >> I disagree, this comment makes sense in a commit log.
> >>
> >>
> >> > > diff --git a/package/python-fastentrypoints/Config.in
> >> > > b/package/python-fastentrypoints/Config.in
> >> > > new file mode 100644
> >> > > index 0000000000..d2c86dbc5e
> >> > > --- /dev/null
> >> > > +++ b/package/python-fastentrypoints/Config.in
> >> > > @@ -0,0 +1,6 @@
> >> > > +config BR2_PACKAGE_PYTHON_FASTENTRYPOINTS
> >> > > +       bool "python-fastentrypoints"
> >> > > +       help
> >> > > +         Makes entry_points specified in setup.py load more
> quickly.
> >> > > +
> >> > > +         https://github.com/ninjaaron/fast-entry_points
> >>
> >> So we have a Config.in option for a target package.
> >>
> >> > > +PYTHON_FASTENTRYPOINTS_VERSION = 0.10
> >> > > +PYTHON_FASTENTRYPOINTS_SOURCE =
> >> > > fastentrypoints-$(PYTHON_FASTENTRYPOINTS_VERSION).tar.gz
> >> > > +PYTHON_FASTENTRYPOINTS_SITE =
> >> > > https://pypi.python.org/packages/e8/c8/
> c2902c9c9da43d8be8c75a730f15f0c51933c42c39b91d1d7b605a88e907
> >> > > +PYTHON_FASTENTRYPOINTS_SETUP_TYPE = setuptools
> >> >
> >> > The license file can be found on github and seems to be BSD-2c [1]
> >> >
> >> > With these changes applied you can add my: Reviewed-by: Yegor Yefremov
> >> > <yegorslists@googlemail.com>
> >> >
> >> > [1] https://github.com/ninjaaron/fast-entry_points/blob/master/
> LICENSE
> >> >
> >> > Yegor
> >> >
> >> > > +
> >> > > +$(eval $(host-python-package))
> >>
> >> But this is a host only package ?
> >>
> >> I don't see how this can work. Am I missing something ?
> >>
> >> Best regards,
> >>
> >> Thomas
> >> --
> >> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> >> Embedded Linux and Kernel engineering
> >> https://bootlin.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180409/81a46784/attachment.html>
