From: Vadim Kochan <vadim4j@gmail.com>
Date: Fri, 4 Jan 2019 15:58:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/wine: Add gettext dependency
 for host-wine only with NLS enabled
In-Reply-To: <20190104134238.484d60b2@windsurf>
References: <20190104114909.14166-1-vadim4j@gmail.com>
 <20190104134238.484d60b2@windsurf>
Message-ID: <CAMw6YJJPDDhOgtJg3QiHqnQ29P3Fvv3kv9RfZPoGkrSckyyuUw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, Jan 4, 2019 at 2:42 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Fri,  4 Jan 2019 13:49:09 +0200, Vadim Kochan wrote:
> > Checked that host-wine compiles ok without host-gettext, so no
> > needs to specify this dependency.
> >
> > libgettextpo is required by tools/wrc (https://linux.die.net/man/1/wrc)
> > which allows to convert windows resources also to *.po format, which is
> > not needed if NLS is disabled.
> >
> > Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
> > ---
> >  package/wine/wine.mk | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/package/wine/wine.mk b/package/wine/wine.mk
> > index 78c8e6ab63..ef70b6276c 100644
> > --- a/package/wine/wine.mk
> > +++ b/package/wine/wine.mk
> > @@ -307,8 +307,10 @@ WINE_CONF_OPTS += --without-zlib
> >  endif
> >
> >  # host-gettext is essential for .po file support in host-wine wrc
> > +ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
> >  HOST_WINE_DEPENDENCIES += host-gettext
> >  HOST_WINE_CONF_OPTS += --with-gettext --with-gettextpo
> > +endif
>
> It probably needs a "else" clause, to pass --without-gettext
> --without-gettextpo.

Emm, I will include this patch (with your suggestion) into gettext-tiny series.

Thanks,
Vadim Kochan
