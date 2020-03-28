From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sat, 28 Mar 2020 07:10:18 +0100
Subject: [Buildroot] [PATCH] package/python-markdown: fix Python version
 dependency
In-Reply-To: <20200325165309.6a71778d@x230_1.trabucayre.com>
References: <20200310114101.6726-1-yegorslists@googlemail.com>
 <20200325165309.6a71778d@x230_1.trabucayre.com>
Message-ID: <CAGm1_ku7v6MJZNFAoTG0SHy5FAFsk9igJ9mc4La0vw7FnyRdzw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Mar 25, 2020 at 4:54 PM Gwenhael Goavec-Merou
<gwenj@trabucayre.com> wrote:
>
> Hi,
> On Tue, 10 Mar 2020 12:41:01 +0100
> yegorslists at googlemail.com wrote:
>
> > From: Yegor Yefremov <yegorslists@googlemail.com>
> >
> > The latest version has dropped Python 2 support.
> >
> > Fixes:
> > http://autobuild.buildroot.net/results/6d1e796f6658accb3eafef265935db5e464638fe
> >
> > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> > ---
> >  package/python-markdown/Config.in | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/package/python-markdown/Config.in
> > b/package/python-markdown/Config.in index 6706684142..454c2729bd 100644
> > --- a/package/python-markdown/Config.in
> > +++ b/package/python-markdown/Config.in
> > @@ -1,8 +1,8 @@
> >  config BR2_PACKAGE_PYTHON_MARKDOWN
> >       bool "python-markdown"
> > +     depends on BR2_PACKAGE_PYTHON3
> >       # runtime dependency on Python's xml module
> > -     select BR2_PACKAGE_PYTHON_PYEXPAT if BR2_PACKAGE_PYTHON
> > -     select BR2_PACKAGE_PYTHON3_PYEXPAT if BR2_PACKAGE_PYTHON3
> > +     select BR2_PACKAGE_PYTHON3_PYEXPAT
> >       help
> >         This is a Python implementation of John Gruber's Markdown
> >
> > --
> > 2.17.0
> >
>
> Tested-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

It is now safe to merge this patch as python-cheetah doesn't depend on
it anymore and also supports both Py2 and Py3.

Yegor
