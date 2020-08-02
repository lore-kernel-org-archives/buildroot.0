From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 2 Aug 2020 12:51:41 +0200
Subject: [Buildroot] [PATCH v1 1/1] package/rtl8821au: add patch fixing
 sprintf error
In-Reply-To: <CA+h8R2oNMYLqgfcgMZ4g-Vt-W6ip3Hxie-qnXtz8Kg63yXVWeg@mail.gmail.com>
References: <20200801203749.424827-1-christian@paral.in>
 <20200801233410.6ec574ce@gmx.net> <20200801234043.2daaf5ff@gmx.net>
 <CA+h8R2oNMYLqgfcgMZ4g-Vt-W6ip3Hxie-qnXtz8Kg63yXVWeg@mail.gmail.com>
Message-ID: <20200802125141.08c7ea4a@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Christian,

On Sat, 1 Aug 2020 14:43:32 -0700, Christian Stewart <christian@paral.in> wrote:

> Hi Peter,
>
>
>
> On Sat, Aug 1, 2020, 2:40 PM Peter Seiderer <ps.report@gmx.net> wrote:
>
> > Hello Christian,
> >
> > On Sat, 1 Aug 2020 23:34:10 +0200, Peter Seiderer <ps.report@gmx.net>
> > wrote:
> >
> > > Hello Christian,
> > >
> > >
> > > thanks for the patch, but...
> > >
> > > On Sat,  1 Aug 2020 13:37:49 -0700, Christian Stewart <
> > christian at paral.in> wrote:
> > >
> > > > Fixes compile errors against certain kernels.
> > > >
> > > > Signed-off-by: Christian Stewart <christian@paral.in>
> > > > ---
> > > >  ...f-for-extending-string-which-causes-.patch | 336 ++++++++++++++++++
> > > >  1 file changed, 336 insertions(+)
> > > >  create mode 100644
> > package/rtl8821au/0003-Fix-using-sprintf-for-extending-string-which-causes-.patch
> > > >
> > > > diff --git
> > a/package/rtl8821au/0003-Fix-using-sprintf-for-extending-string-which-causes-.patch
> > b/package/rtl8821au/0003-Fix-using-sprintf-for-extending-string-which-causes-.patch
> > > > new file mode 100644
> > > > index 0000000000..6753eefdd9
> > > > --- /dev/null
> > > > +++
> > b/package/rtl8821au/0003-Fix-using-sprintf-for-extending-string-which-causes-.patch
> > > > @@ -0,0 +1,336 @@
> > > > +From cc3262a32ce326d89d597bb8557ce0da05240e98 Mon Sep 17 00:00:00 2001
> > > > +From: Coleman <omegacoleman@gmail.com>
> > > > +Date: Fri, 17 Jul 2020 08:53:00 +0800
> > > > +Subject: [PATCH 3/3] Fix using sprintf for extending string, which
> > causes
> > > > + undefined behavior. (#334)
> > > > +
> > >
> > > The patch should have an note about the upstream source (see [1]), I
> > suspect you
> > > toke the patch from [2]?
> >
> > Or instead simple bump the package source version to the latest git commit
> > (as the patch is upstream committed)... ;-)
> >
>
> Can't do. The upstream has a commit that we don't follow. Apparently it has
> issues. Look at the PR on the repo.

Yes, your are right (and thanks for remind me of that point), maybe worth
a short remark at the commit log...

Regards,
Peter

>
> Thanks,
> christian
