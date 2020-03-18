From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 18 Mar 2020 19:06:38 +0530
Subject: [Buildroot] [PATCH v6 4/4] package/python-scipy: Add new package
In-Reply-To: <CAGm1_ksuFkkQQTHxhU7kKKjCjckcQB30+OWgif+3spBCcqZkbA@mail.gmail.com>
References: <20200318090740.4973-1-jagan@amarulasolutions.com>
 <20200318090740.4973-5-jagan@amarulasolutions.com>
 <CAGm1_ksuFkkQQTHxhU7kKKjCjckcQB30+OWgif+3spBCcqZkbA@mail.gmail.com>
Message-ID: <CAMty3ZCw9NhEL_Hes-=aBE6L4L_Rn4azqzbmsEoVRUxYBcQ_vQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yegor,

On Wed, Mar 18, 2020 at 4:08 PM Yegor Yefremov
<yegorslists@googlemail.com> wrote:
>
> Hi Jagan,
>
> the commit title should be:
>
> package/python-scipy: new package

Sure.

>
> On Wed, Mar 18, 2020 at 10:15 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
> >
> > Add python-scipy with 1.4.1 release version.
> >
> > Cc: Esben Haabendal <esben@geanix.com>
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> > Changes for v6:
> > - update to latest scipy version
> >
> >  DEVELOPERS                             |  1 +
> >  package/Config.in                      |  1 +
> >  package/python-scipy/Config.in         | 23 +++++++++++++
> >  package/python-scipy/python-scipy.hash |  9 +++++
> >  package/python-scipy/python-scipy.mk   | 46 ++++++++++++++++++++++++++
> >  5 files changed, 80 insertions(+)
> >  create mode 100644 package/python-scipy/Config.in
> >  create mode 100644 package/python-scipy/python-scipy.hash
> >  create mode 100644 package/python-scipy/python-scipy.mk
> >
> > diff --git a/DEVELOPERS b/DEVELOPERS
> > index 308a59b264..9340ae2815 100644
> > --- a/DEVELOPERS
> > +++ b/DEVELOPERS
> > @@ -1152,6 +1152,7 @@ F:        configs/orangepi_zero_plus2_defconfig
> >  F:     configs/pine64_defconfig
> >  F:     configs/pine64_sopine_defconfig
> >  F:     package/python-pybind11
> > +F:     package/python-scipy
> >
> >  N:     James Hilliard <james.hilliard1@gmail.com>
> >  F:     package/gensio/
> > diff --git a/package/Config.in b/package/Config.in
> > index afe32f52b4..f5af9b07ea 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -1120,6 +1120,7 @@ menu "External python modules"
> >         source "package/python-scandir/Config.in"
> >         source "package/python-scapy/Config.in"
> >         source "package/python-schedule/Config.in"
> > +       source "package/python-scipy/Config.in"
> >         source "package/python-sdnotify/Config.in"
> >         source "package/python-secretstorage/Config.in"
> >         source "package/python-see/Config.in"
> > diff --git a/package/python-scipy/Config.in b/package/python-scipy/Config.in
> > new file mode 100644
> > index 0000000000..bacb8f8f8c
> > --- /dev/null
> > +++ b/package/python-scipy/Config.in
> > @@ -0,0 +1,23 @@
> > +config BR2_PACKAGE_PYTHON_SCIPY
> > +       bool "python-scipy"
> > +       depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
> > +       depends on BR2_TOOLCHAIN_HAS_FORTRAN
> > +       depends on BR2_TOOLCHAIN_BUILDROOT_CXX
> > +       depends on BR2_PACKAGE_PYTHON3
> > +       select BR2_PACKAGE_PYTHON_NUMPY
> > +       select BR2_PACKAGE_HOST_PYTHON_PYBIND11
>
> can this line be dropped?

is it because the dependency pick the pybind11 automatically for the build?
