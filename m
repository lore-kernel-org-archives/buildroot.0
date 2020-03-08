From: Carlos Santos <unixmania@gmail.com>
Date: Sun, 8 Mar 2020 12:11:41 -0300
Subject: [Buildroot] [PATCH] package/spidermonkey: do not build the
 JavaScript shell, by default
In-Reply-To: <20200308145258.44d80049@windsurf.home>
References: <20200308032128.306-1-unixmania@gmail.com>
 <20200308145258.44d80049@windsurf.home>
Message-ID: <CAJ4jsado7Y_iHwtJVNNGta7pez_Zsx_fi_y6+wtrhmA_P0a5Xw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Mar 8, 2020 at 10:53 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Carlos,
>
> On Sun,  8 Mar 2020 00:21:28 -0300
> unixmania at gmail.com wrote:
>
> > From: Carlos Santos <unixmania@gmail.com>
> >
> > Add a configuration to enable the JavaScript shell (default off). So
> > far only libmozjs is required (by polkit) and the shell takes around
> > 24MiB.
> >
> > Signed-off-by: Carlos Santos <unixmania@gmail.com>
> > ---
> >  ....in-install-shell-only-if-it-s-built.patch | 28 +++++++++++++++++++
> >  package/spidermonkey/Config.in                | 11 ++++++++
> >  package/spidermonkey/spidermonkey.mk          |  1 +
> >  3 files changed, 40 insertions(+)
> >  create mode 100644 package/spidermonkey/0001-js-src-Makefile.in-install-shell-only-if-it-s-built.patch
> >
> > diff --git a/package/spidermonkey/0001-js-src-Makefile.in-install-shell-only-if-it-s-built.patch b/package/spidermonkey/0001-js-src-Makefile.in-install-shell-only-if-it-s-built.patch
> > new file mode 100644
> > index 0000000000..f6092af7ef
> > --- /dev/null
> > +++ b/package/spidermonkey/0001-js-src-Makefile.in-install-shell-only-if-it-s-built.patch
>
> We already had a 0001 patch, we actually have 10 patches on
> spidermonkey, so I renamed this one 0011.

Hum, that's the price passing "1" instead of "11" to --start-number. :-(

> Has this patch been submitted upstream ?

Well, "upstream" is Firefox and I don't believe they would care about
an installation error when we compile a code sub-tree taken from a
tarball made for Gentoo with an extra patch to force in-tree builds.
;-)

If the patch annoys you we can just use a post-install-target hook to
remove js60. I didn't follow this approach because I was afraid that
not passing --disable-js-shell would lead to the inclusion of code
that could cause problem at run time.

-- 
Carlos Santos <unixmania@gmail.com>
