From: Ramon Fried <rfried.dev@gmail.com>
Date: Mon, 6 Jul 2020 12:38:09 +0300
Subject: [Buildroot] [PATCH v2] package/bitwise: new package
In-Reply-To: <87wo3hkpq4.fsf@tarshish>
References: <20200706082555.1651841-1-rfried.dev@gmail.com>
 <87wo3hkpq4.fsf@tarshish>
Message-ID: <CAGi-RULL6XONE_XZx2pp=h6HhBRu7j4DDijB4+neGyQe9Rdx1Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 6, 2020 at 11:33 AM Baruch Siach <baruch@tkos.co.il> wrote:
>
> Hi Ramon,
>
> On Mon, Jul 06 2020, Ramon Fried wrote:
> > Bitwise is multi base interactive calculator supporting dynamic
> > base conversion and bit manipulation.
> > It's a handy tool for low level hackers,
> > kernel developers and device drivers developers.
> >
> > Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
> > ---
> > v2:
> > * Fixed commit message.
> > * Added Developers entry
> > * Fixed "make check-package" errors
> > * Fixed versioning.
> >
> >  DEVELOPERS                   |  3 +++
> >  package/Config.in            |  1 +
> >  package/bitwise/Config.in    | 11 +++++++++++
> >  package/bitwise/bitwise.hash |  1 +
> >  package/bitwise/bitwise.mk   | 14 ++++++++++++++
> >  5 files changed, 30 insertions(+)
> >  create mode 100644 package/bitwise/Config.in
> >  create mode 100644 package/bitwise/bitwise.hash
> >  create mode 100644 package/bitwise/bitwise.mk
> >
> > diff --git a/DEVELOPERS b/DEVELOPERS
> > index d67c75033f..a56f2d0165 100644
> > --- a/DEVELOPERS
> > +++ b/DEVELOPERS
> > @@ -2132,6 +2132,9 @@ N:      Refik Tuzakli <tuzakli.refik@gmail.com>
> >  F:   package/freescale-imx/
> >  F:   package/paho-mqtt-cpp/
> >
> > +N:  Ramon Fried <rfried.dev@gmail.com>
> > +F:  package/bitwise/
>
> Wrong indentation.
>
> > +
> >  N:   Rapha?l M?lotte <raphael.melotte@essensium.com>
> >  F:   package/jbig2dec/
> >
> > diff --git a/package/Config.in b/package/Config.in
> > index 6a34a895af..b4b2a86a67 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -148,6 +148,7 @@ endmenu
> >  menu "Development tools"
> >       source "package/bats-core/Config.in"
> >       source "package/binutils/Config.in"
> > +     source "package/bitwise/Config.in"
> >       source "package/bsdiff/Config.in"
> >       source "package/bustle/Config.in"
> >       source "package/check/Config.in"
> > diff --git a/package/bitwise/Config.in b/package/bitwise/Config.in
> > new file mode 100644
> > index 0000000000..e955da374b
> > --- /dev/null
> > +++ b/package/bitwise/Config.in
> > @@ -0,0 +1,11 @@
> > +config BR2_PACKAGE_BITWISE
> > +     bool "bitwise"
> > +     select BR2_PACKAGE_NCURSES
> > +     select BR2_PACKAGE_READLINE
> > +     help
> > +       Bitwise is multi base interactive calculator
> > +       supporting dynamic base conversion and bit manipulation.
> > +       It's a handy tool for low level hackers,
> > +       kernel developers and device drivers developers.
> > +
> > +       https://github.com/mellowcandle/bitwise
> > diff --git a/package/bitwise/bitwise.hash b/package/bitwise/bitwise.hash
> > new file mode 100644
> > index 0000000000..35a1109b93
> > --- /dev/null
> > +++ b/package/bitwise/bitwise.hash
> > @@ -0,0 +1 @@
> > +sha256 33ce934fb99dadf7652224152cc135a0abf6a211adde53d96e9be7067567749c  bitwise-v0.41.tar.gz
>
> Missing license file hash.
>
> Also, fields delimiter should be two spaces.
>
> > diff --git a/package/bitwise/bitwise.mk b/package/bitwise/bitwise.mk
> > new file mode 100644
> > index 0000000000..bd3adc6ec5
> > --- /dev/null
> > +++ b/package/bitwise/bitwise.mk
> > @@ -0,0 +1,14 @@
> > +################################################################################
> > +#
> > +# bitwise
> > +#
> > +################################################################################
> > +
> > +BITWISE_VERSION = 0.41
> > +BITWISE_SITE = https://github.com/mellowcandle/bitwise/releases/download/$(BITWISE_VERSION)
>
> Missing 'v' before $(BITWISE_VERSION).
>
> baruch
>
> > +BITWISE_SOURCE = bitwise-v$(BITWISE_VERSION).tar.gz
> > +BITWISE_DEPENDENCIES = ncurses readline
> > +BITWISE_LICENSE = GPL-2.0
> > +BITWISE_LICENSE_FILES = COPYING
> > +
> > +$(eval $(autotools-package))
>
>
> --
>                                                      ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
Thanks Baruch,
Sending v3.
