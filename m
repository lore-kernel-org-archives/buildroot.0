From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 8 Apr 2019 09:04:26 +0200
Subject: [Buildroot] [git commit] package/gettext: turn into virtual
 package
In-Reply-To: <CAMw6YJ+Npy6M8z+WHF3tQETZSjrjzchV8WGWU5ojY9+sznsMhQ@mail.gmail.com>
References: <20190331121707.C1C2D86602@busybox.osuosl.org>
 <e1d4694d-420f-c479-7595-a1ccebed4f2e@gmail.com>
 <CAMw6YJLmW_FvHER3pjgH=4pD+rJB9zs9Lx394-G7XA1e+KLK+g@mail.gmail.com>
 <CAMw6YJ+Npy6M8z+WHF3tQETZSjrjzchV8WGWU5ojY9+sznsMhQ@mail.gmail.com>
Message-ID: <CANLo3Jip2TuG7nqY5v4NS5mWWU8FpdZZp7BqdWTL=6PU0-wMKw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vadim,

Le lun. 8 avr. 2019 ? 02:23, Vadim Kochan <vadim4j@gmail.com> a ?crit :

> On Mon, Apr 8, 2019 at 2:04 AM Vadim Kochan <vadim4j@gmail.com> wrote:
> >
> > Hi Romain, All
> >
> > On Mon, Apr 8, 2019 at 12:33 AM Romain Naour <romain.naour@gmail.com>
> wrote:
> > >
> > > Hi All,
> > >
> > > Le 31/03/2019 ? 14:04, Thomas Petazzoni a ?crit :
> > > > commit:
> https://git.buildroot.net/buildroot/commit/?id=ea1e7ee6068265d3f8ade97a387d77c77335b38e
> > > > branch:
> https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> [..]
>
> > >
> > > [...]
> > >
> > > >
> > > > -config BR2_PACKAGE_GETTEXT_PROVIDES_LIBINTL
> > > > -     bool
> > > > -     default y if BR2_SYSTEM_ENABLE_NLS
> > > > -     depends on !BR2_TOOLCHAIN_HAS_FULL_GETTEXT
> > > > +config BR2_PACKAGE_PROVIDES_GETTEXT
> > > > +     default "gettext-gnu"
> > > >
> > > >  endif
> > > >
> > >
> > > [...]
> > >
> > > > diff --git a/package/gettext/gettext.mk b/package/gettext-gnu/
> gettext-gnu.mk
> > > > similarity index 57%
> > > > copy from package/gettext/gettext.mk
> > > > copy to package/gettext-gnu/gettext-gnu.mk
> > > > index ec9588f8ad..61adf72738 100644
> > > > --- a/package/gettext/gettext.mk
> > > > +++ b/package/gettext-gnu/gettext-gnu.mk
> > > > @@ -1,23 +1,24 @@
> > > >
> ################################################################################
> > > >  #
> > > > -# gettext
> > > > +# gettext-gnu
> > > >  #
> > > >
> ################################################################################
> > > >
> > > > -GETTEXT_VERSION = 0.19.8.1
> > > > -GETTEXT_SITE = $(BR2_GNU_MIRROR)/gettext
> > > > -GETTEXT_SOURCE = gettext-$(GETTEXT_VERSION).tar.xz
> > > > -GETTEXT_INSTALL_STAGING = YES
> > > > -GETTEXT_LICENSE = LGPL-2.1+ (libintl), GPL-3.0+ (the rest)
> > > > -GETTEXT_LICENSE_FILES = COPYING gettext-runtime/intl/COPYING.LIB
> > > > +GETTEXT_GNU_VERSION = 0.19.8.1
> > > > +GETTEXT_GNU_SITE = $(BR2_GNU_MIRROR)/gettext
> > > > +GETTEXT_GNU_SOURCE = gettext-$(GETTEXT_GNU_VERSION).tar.xz
> > > > +GETTEXT_GNU_INSTALL_STAGING = YES
> > > > +GETTEXT_GNU_LICENSE = LGPL-2.1+ (libintl), GPL-3.0+ (the rest)
> > > > +GETTEXT_GNU_LICENSE_FILES = COPYING gettext-runtime/intl/COPYING.LIB
> > > >  # 0002-Update-after-gnulib-changed.patch
> > > > -GETTEXT_AUTORECONF = YES
> > > > -GETTEXT_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
> > > > +GETTEXT_GNU_AUTORECONF = YES
> > > > +GETTEXT_GNU_PROVIDES = gettext
> > > > +GETTEXT_GNU_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
> > > >
> > >
> > > [...]
> > >
> > > >
> > > >  # Force the build of libintl, even if the C library provides a stub
> > > >  # gettext implementation
> > > > -ifeq ($(BR2_PACKAGE_GETTEXT_PROVIDES_LIBINTL),y)
> > > > -GETTEXT_CONF_OPTS += --with-included-gettext
> > > > +ifeq ($(BR2_PACKAGE_GETTEXT_GNU_PROVIDES_LIBINTL),y)
> > >
> > > It seems this patch introduced a typo here, There is no
> > > BR2_PACKAGE_GETTEXT_GNU_PROVIDES_LIBINTL option but
> > > BR2_PACKAGE_GETTEXT_PROVIDES_LIBINTL.
> > >
> > > Even with this patch my host-flex build is broken.
> > >
> >
> > Yeah, this is a really typo  but anyway gettext/Config.in (which is a
> > virtual package now) uses
> > the right config option.
> >
>
> Sorry, I just realized that issue exists in gettext-gnu.mk not in
> Config.in,
> I sent patch for this.
>
> Sorry about all these issues with gettext-tiny :(
>

No problem, you're welcome for providing patches :)

I have not followed the gettext-tiny series...

I'll take a look at your patches asap.

Best regards,
Romain


> Regards,
> Vadim Kochan
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190408/728865a3/attachment.html>
