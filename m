From: Joachim Nilsson <troglobit@gmail.com>
Date: Mon, 31 Aug 2020 21:53:22 +0200
Subject: [Buildroot] [PATCH] package/mg: new package
In-Reply-To: <20200830220658.1d134652@windsurf.home>
Message-ID: <C5BG0UJH3751.24ZB7SQO3W52W@luthien>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun Aug 30, 2020 at 10:06 PM CEST, Thomas Petazzoni wrote:
> Thanks for your contribution!

Thanks, and thank you for the review!

> On Sun, 30 Aug 2020 11:00:51 +0200 Joachim Wiberg <troglobit@gmail.com> wrote:
> > +# From https://sourceforge.net/projects/joe-editor/files/JOE%20sources/joe-4.6/
> Is this a bad copy paste ?

Indeed.

> > +# mg2a
> Should be just "mg"

OK, fixing

> > +ifeq ($(BR2_PACKAGE_NCURSES),y)
> > +MG_DEPENDENCIES += ncurses
> Could you add:
> MG_CONF_OPTS += --with-curses
> or whatever is needed to explicitly enable ncurses support ?

It's auto-detected, but will do.

> > +define MG_INSTALL_TARGET_CMDS
> > +	$(INSTALL) -m 0755 -D $(@D)/tutorial $(TARGET_DIR)/usr/share/doc/tutorial
> > +	gzip -9 $(TARGET_DIR)/usr/share/doc/tutorial
> /usr/share/doc gets dropped from $(TARGET_DIR) during the
> target-finalize step, so installing documentation there is not useful.

Yeah I realized.  It's actually referenced from withing Mg using C-h t,
should that be patched out then?

Best regards
 /Joachim
