From: John Voltz <john.voltz@gmail.com>
Date: Tue, 12 Feb 2008 11:38:11 -0500
Subject: [Buildroot] Libtool relinking problem
In-Reply-To: <1202796713.26099.5.camel@localhost>
References: <46a136670802111753w4b6a7fbar93030a13b101eb28@mail.gmail.com>
	<1202796713.26099.5.camel@localhost>
Message-ID: <46a136670802120838x3efe85a9ied2a0d006d7f7f37@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The sed command in Makefile.autotools.in is not terminated with the
letter g. So it only fixes one problem in the line!

John

On Feb 12, 2008 1:11 AM, Hans-Christian Egtvedt <hcegtvedt@atmel.com> wrote:
> On Mon, 2008-02-11 at 20:53 -0500, John Voltz wrote:
> > I'm wondering if anyone else has noticed problems when installing some
> > libraries to the staging_dir, sometimes libtool will place a  random
> > dependency reference as /usr/lib/xxx.la instead of
> > $(STAGING_DIR)/usr/lib/xxx.la.
> >
>
> Unsure why some libraries fail to install with correct path while others
> manage to do $(DESTDIR)/$(PREFIX)/lib/libxxx.la.
>
> I usually add a $(SED) to the Buildroot Makefile to correct the
> libxxx.la file.
>
> $(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libxxx.la
>
> > This appears to be caused by the libtool re-linking during install.
> > Anybody know what to do to fix this? I tried adding
> > LDFLAGS="-L$(STAGING_DIR)/usr/lib" to make install, but it didn't
> > help.
> >
>
> Fiddling with LDFLAGS, CFLAGS, etc to solve an issue is seldom the right
> solution.
>
> --
> With kind regards,
> Hans-Christian Egtvedt, Applications Engineer
>
>
