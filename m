From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sat, 6 Oct 2018 17:03:32 +0200
Subject: [Buildroot] [PATCH 21/23] python-pyhamcrest: new package
In-Reply-To: <CALFsTFXnJTAm8A7cbDzHS_FsTfQ4dv6UQjj30n61ZLuZFPmL4g@mail.gmail.com>
References: <20180926153505.3411-1-asafka7@gmail.com>
 <20180926153505.3411-22-asafka7@gmail.com>
 <20181004140218.3f5cd4bc@windsurf>
 <CALFsTFXnJTAm8A7cbDzHS_FsTfQ4dv6UQjj30n61ZLuZFPmL4g@mail.gmail.com>
Message-ID: <CAGm1_ksF2wuJAbFXKM9d+iMz5nebtmehHJRjb3NU4Ci+72LmpA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Oct 4, 2018 at 9:30 PM Asaf Kahlon <asafka7@gmail.com> wrote:
>
> Thomas, Yegor,
>
> On Thu, Oct 4, 2018 at 3:02 PM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> >
> > Hello,
> >
> > On Wed, 26 Sep 2018 18:35:03 +0300, Asaf Kahlon wrote:
> > > Hamcrest framework for matcher objects.
> > >
> > > Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> > > ---
> > >  DEVELOPERS                                       |  1 +
> > >  package/Config.in                                |  1 +
> > >  package/python-pyhamcrest/Config.in              |  8 ++++++++
> > >  package/python-pyhamcrest/python-pyhamcrest.hash |  5 +++++
> > >  package/python-pyhamcrest/python-pyhamcrest.mk   | 14 ++++++++++++++
> > >  5 files changed, 29 insertions(+)
> > >  create mode 100644 package/python-pyhamcrest/Config.in
> > >  create mode 100644 package/python-pyhamcrest/python-pyhamcrest.hash
> > >  create mode 100644 package/python-pyhamcrest/python-pyhamcrest.mk
> >
> > I've applied to master with Yegor Reviewed-by. However, I have a
> > question, see below.
> >
> > > +config BR2_PACKAGE_PYTHON_PYHAMCREST
> > > +     bool "python-pyhamcrest"
> > > +     select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
> >
> > How do you know, or how does scanpypi knows when setuptools is needed
> > on the target vs. when it's only needed at build time on the build
> > machine ?
>
> As far as I know, there's no special treatment for setuptools in
> scanpypi. For pyhamcrest, setuptools was added since it was explicitly
> mentioned under install_requires.
> Generally, not adding setuptools to install_requires is much like not
> adding any other package and scanpypi won't catch this. (Yegor,
> correct me if I am wrong).
> Most of the times, I try to run python and import the package for
> sanity check, but (at least from a first glance) I don't think there's
> a way to know exactly if setuptools is needed on target although not
> specified in install_requires.

This is my point of view too. In most cases setuotools is not needed
for the module itself, but for the installed scripts.

Yegor
