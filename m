From: John Voltz <john.voltz@gmail.com>
Date: Thu, 24 Apr 2008 09:38:12 -0400
Subject: [Buildroot] svn commit: trunk/buildroot/package/expat
In-Reply-To: <1209043113.31234.2.camel@localhost>
References: <20080424131530.9388D3C832@busybox.net>
	<1209043113.31234.2.camel@localhost>
Message-ID: <46a136670804240638k64424859jbbc71ba30b06c1bd@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm attempting to sync up our Google Code buildroot changes with the uClibc
buildroot. I'm having a little difficulty determining who's changes are the
"best" changes. A lot of stuff has changed or been added to both in the last
few weeks. Do you recommend that I revert this expat commit? I think I'll
start pulling the commit logs and looking them over now before I continue.

John


On Thu, Apr 24, 2008 at 9:18 AM, Hans-Christian Egtvedt <
hans-christian.egtvedt@atmel.com> wrote:

> On Thu, 2008-04-24 at 06:15 -0700, ninevoltz at uclibc.org wrote:
> > Author: ninevoltz
> > Date: 2008-04-24 06:15:30 -0700 (Thu, 24 Apr 2008)
> > New Revision: 21832
> >
> > Log:
> > more options for expat, move install to /usr
> >
>
> >From what I can see, that was the default before this patch.
>
> > Modified:
> >    trunk/buildroot/package/expat/expat.mk
> >
> >
> > Changeset:
> > Modified: trunk/buildroot/package/expat/expat.mk
> > ===================================================================
> > --- trunk/buildroot/package/expat/expat.mk    2008-04-24 13:14:25 UTC
> (rev 21831)
> > +++ trunk/buildroot/package/expat/expat.mk    2008-04-24 13:15:30 UTC
> (rev 21832)
> > @@ -35,8 +35,16 @@
> >               --build=$(GNU_HOST_NAME) \
> >               --prefix=/usr \
> >               --exec-prefix=/usr \
> > +             --bindir=/bin \
> > +             --sbindir=/sbin \
> > +             --libdir=/lib \
> > +             --libexecdir=/lib \
> >               --sysconfdir=/etc \
> > +             --datadir=/share \
> >               --localstatedir=/var \
> > +             --includedir=/include \
> > +             --mandir=/man \
> > +             --infodir=/info \
>
> These +'s seems very wrong, the --prefix should take care of that.
>
> >               --enable-shared \
> >       )
> >       touch $@
> > @@ -46,7 +54,7 @@
> >       touch -c $@
> >
> >  $(STAGING_DIR)/$(EXPAT_TARGET_BINARY): $(EXPAT_DIR)/$(EXPAT_BINARY)
> > -     $(MAKE) DESTDIR=$(STAGING_DIR) -C $(EXPAT_DIR) install
> > +     $(MAKE) DESTDIR=$(STAGING_DIR)/usr -C $(EXPAT_DIR) install
>
> This is due to you override the prefix during configure.
>
> Did the ./configure --prefix stuff not work? I usually only specify
> --prefix=/usr, --sysconfdir=/etc and -localstatedir=/var.
>
> then do make DESTDIR=$(STAGING_DIR) install.
>
> >       $(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" \
> >               $(STAGING_DIR)/usr/lib/libexpat.la
> >       touch -c $@
>
> --
> With kind regards,
> Hans-Christian Egtvedt, Applications Engineer
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080424/db9fd414/attachment.htm 
