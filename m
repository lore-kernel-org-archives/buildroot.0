From: Nimai Mahajan <nimaim@gmail.com>
Date: Fri, 26 Jun 2015 15:32:52 -0400
Subject: [Buildroot] [PATCH 1/1] libarchive: add hash and enable lzma
	support
In-Reply-To: <20150626212800.60e62745@free-electrons.com>
References: <1435330918-25695-1-git-send-email-nimaim@gmail.com>
 <20150626212800.60e62745@free-electrons.com>
Message-ID: <CALoSW65dVmXMRYcbmLDutTv1ropaYg15i2Vjd1DmGpabs39ABA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Jun 26, 2015 3:28 PM, "Thomas Petazzoni" <
thomas.petazzoni@free-electrons.com> wrote:
>
> Dear Nimai Mahajan,
>
> On Fri, 26 Jun 2015 11:01:58 -0400, Nimai Mahajan wrote:
> > From: Nimai Mahajan <nimaim@gmail.com>
> >
> > Add libarchive hash. Enable lzma support.
> > Both xz and lzma support are provided by the xz library.
> > This maintains consistency with how the other CONF_OPTS are defined.
> >
> > Signed-off-by: Nimai Mahajan <nimaim@gmail.com>
> > ---
> >  package/libarchive/libarchive.hash | 2 ++
> >  package/libarchive/libarchive.mk   | 7 ++++++-
> >  2 files changed, 8 insertions(+), 1 deletion(-)
> >  create mode 100644 package/libarchive/libarchive.hash
> >
> > diff --git a/package/libarchive/libarchive.hash
b/package/libarchive/libarchive.hash
> > new file mode 100644
> > index 0000000..5f96211
> > --- /dev/null
> > +++ b/package/libarchive/libarchive.hash
> > @@ -0,0 +1,2 @@
> > +# Locally computed:
> > +sha256
eb87eacd8fe49e8d90c8fdc189813023ccc319c5e752b01fb6ad0cc7b2c53d5e
libarchive-3.1.2.tar.gz
> > diff --git a/package/libarchive/libarchive.mk b/package/libarchive/
libarchive.mk
> > index 61528d9..18fa8b7 100644
> > --- a/package/libarchive/libarchive.mk
> > +++ b/package/libarchive/libarchive.mk
> > @@ -9,7 +9,6 @@ LIBARCHIVE_SITE = http://www.libarchive.org/downloads
> >  LIBARCHIVE_INSTALL_STAGING = YES
> >  LIBARCHIVE_LICENSE = BSD-2c, BSD-3c
> >  LIBARCHIVE_LICENSE_FILES = COPYING
> > -LIBARCHIVE_CONF_OPTS = --without-lzma
> >
> >  ifeq ($(BR2_PACKAGE_LIBARCHIVE_BSDTAR),y)
> >  ifeq ($(BR2_STATIC_LIBS),y)
> > @@ -86,4 +85,10 @@ else
> >  LIBARCHIVE_CONF_OPTS += --without-zlib
> >  endif
> >
> > +ifeq ($(BR2_PACKAGE_XZ),y)
> > +LIBARCHIVE_DEPENDENCIES += xz
>
> In his review, Arnout asked you to pass --with-lzma in this case, but
> you forgot to do it. So I've that and applied. Thanks!

Thanks, I had seen that actually but I was trying to be consistent with the
other options there, which specified the package dependency (i.e. zlib)
followed by the configure options if it wasnt selected (i.e. without-zlib).
But point taken.

> Also, note that this patch should have been marked as "PATCH v2", by
> using:
>
>         git format-patch --subject-prefix="PATCH v2"

Thanks, noted for next time! Appreciate the help once again.

>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150626/c180f819/attachment.html>
