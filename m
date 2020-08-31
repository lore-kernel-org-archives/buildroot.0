From: Joachim Nilsson <troglobit@gmail.com>
Date: Mon, 31 Aug 2020 21:45:58 +0200
Subject: [Buildroot] [PATCH] package/mg: new package
In-Reply-To: <CAKcgs2wo8X9Z6Veso26QK8GAkKUPdA19TUarOvsmmMTdjXwaCQ@mail.gmail.com>
Message-ID: <C5BFV6KD7OUC.1DRR2ATFRPA5P@luthien>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun Aug 30, 2020 at 5:27 PM CEST, Gilles Talis wrote:
> Hello Joachim,

Hi Gilles!

> thanks for your contribution.
> Please find a few comments below.

Thank you for taking the time to review :)

> Le dim. 30 ao?t 2020 ? 11:01, Joachim Wiberg <troglobit@gmail.com> a
> You need to add an entry to the DEVELOPERS file with your name and
> package, so that you are identified as the maintainer for this
> package. Please take a look at the DEVELOPERS file.

Didn't know that was mandatory, fixing

> > +# From https://sourceforge.net/projects/joe-editor/files/JOE%20sources/joe-4.6/
> I assume you meant: "from:
> https://github.com/troglobit/mg/releases/download/v3.4/mg-3.4.tar.gz.md5"

Yeah, copy-paste error.  I actually managed to b0rk that whole file,
sorry about that.

> > +md5 6b79855d54770bcb23e5457ebde8296c  mg-3.4.tar.gz
> It should be two spaces after "md5"
> > +# Locally computed:
> > +sha256 1a620cf5b2dd4b00006d6c929ac8e2a70eeab5f807a0d6e5334b878aa182b713  mg-3.4.tar.gz
> > +sha256 7e12e5df4bae12cb21581ba157ced20e1986a0508dd10d0e8a4ab9a4cf94e85c  UNLICENSE
> For the two lines above, it should be two spaces after "sha256"

You mean after the hash, right?  The joe.hash and busybox.hash files don't have
double spaces after the leading keyword (md5/sha256).

> > +ifeq ($(BR2_PACKAGE_NCURSES),y)
> > +MG_DEPENDENCIES += ncurses
> We prefer to force the options, so you should have a "MG_CONF_OPTS =
> --with-curses" here

Odd, but OK, fixing

> > +define MG_INSTALL_TARGET_CMDS
> > +       $(INSTALL) -m 0755 -D $(@D)/tutorial $(TARGET_DIR)/usr/share/doc/tutorial
> > +       gzip -9 $(TARGET_DIR)/usr/share/doc/tutorial
> We prefer not to install documentation on the target to keep the
> footprint small. Can you please remove the two lines above?

I realized the whole usr/share/doc directory is pruned from the target
dir anyway.  The intention was to keep the built-in `C-h t` tutorial,
but I guess the *quick* help will have to do.

Thanks, fixing

> One last comment: did you run the the test-pkg script to check for any
> potential issues with some architectures and build options?

Did not know about that, will try it out, thanks! :)

> Can you please send a v2 with the fixes proposed above?

Will do!

Best regards
 /Joachim
